
#include "GameTables.h"
#include "Unit.h"
#include "SpellAuras.h"
#include "SpellAuraEffects.h"
#include "SpellPackets.h"
#include "ArtifactPackets.h"
#include "DatabaseEnv.h"
#include "World.h"
#include "ObjectMgr.h"
#include "Log.h"
#include "Player.h"
#include "AzeriteItem.h"
#include "SpellMgr.h"

AzeriteItem::AzeriteItem()
{
    m_objectType |= TYPEMASK_AZERITE_ITEM;
    m_objectTypeId = TYPEID_AZERITE_ITEM;

    _level = 1;
    _experience = 0;
}

AzeriteItem::~AzeriteItem() = default;

bool AzeriteItem::Create(ObjectGuid::LowType guidlow, uint32 itemid, Player const* owner)
{
    if (!Item::Create(guidlow, itemid, owner))
        return false;

    SetLevel(_level);
    AddBonuses(4929);
    AddBonuses(4930);

    SetUpdateFieldValue(m_values.ModifyValue(&AzeriteItem::m_azeriteItemData).ModifyValue(&UF::AzeriteItemData::Xp), _experience);
    SetUpdateFieldValue(m_values.ModifyValue(&AzeriteItem::m_azeriteItemData).ModifyValue(&UF::AzeriteItemData::KnowledgeLevel), sWorld->getIntConfig(CONFIG_AZERITE_KNOWLEGE));

    return true;
}

bool AzeriteItem::LoadFromDB(ObjectGuid::LowType guid, ObjectGuid ownerGuid, Field* fields, uint32 entry, Player const* owner /*= nullptr*/)
{
    if (!Item::LoadFromDB(guid, ownerGuid, fields, entry, owner))
        return false;

    auto stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_AZERITE_ITEM_XP);
    stmt->setUInt64(0, ownerGuid.GetCounter());
    stmt->setUInt64(1, guid);
    if (auto result = CharacterDatabase.Query(stmt))
    {
        auto fieldsResult = result->Fetch();
        _level = fieldsResult[0].GetUInt32();
        _experience = fieldsResult[1].GetUInt64();
    }

    SetLevel(_level, true);
    AddBonuses(4929);
    AddBonuses(4930);

    SetUpdateFieldValue(m_values.ModifyValue(&AzeriteItem::m_azeriteItemData).ModifyValue(&UF::AzeriteItemData::Xp), _experience);
    SetUpdateFieldValue(m_values.ModifyValue(&AzeriteItem::m_azeriteItemData).ModifyValue(&UF::AzeriteItemData::KnowledgeLevel), sWorld->getIntConfig(CONFIG_AZERITE_KNOWLEGE));

    return true;
}

void AzeriteItem::SaveToDB(CharacterDatabaseTransaction& trans)
{
    Item::SaveToDB(trans);

    auto stmt = CharacterDatabase.GetPreparedStatement(CHAR_REP_AZERITE_ITEM_XP);
    stmt->setUInt64(0, GetOwnerGUID().GetCounter());
    stmt->setUInt64(1, GetGUID().GetCounter());
    stmt->setUInt32(2, _level);
    stmt->setUInt64(3, _experience);
    trans->Append(stmt);
}

void AzeriteItem::SetLevel(uint32 level, bool loading /*= false*/)
{
    if (level > sAzeriteLevelToItemLevelGameTable.GetTableRowCount())
        return;

    auto levelToItemLevelEntry = sAzeriteLevelToItemLevelGameTable[level];
    if (!levelToItemLevelEntry)
        return;

    if (!loading)
    {
        _level = level;
        GetOwner()->UpdateCriteria(CRITERIA_TREE_HEART_OF_AZEROTH_LEVEL_REACHED, _level);

        auto const itemModifiers = sObjectMgr->GetItemBonusTree(GetEntry(), AsUnderlyingType(ItemContext::Quest_Reward), GetOwner()->getLevel(), 0, levelToItemLevelEntry->ItemLevel);
        for (auto const& bonusId : itemModifiers)
            AddBonuses(bonusId);
    }

    SetUpdateFieldValue(m_values.ModifyValue(&AzeriteItem::m_azeriteItemData).ModifyValue(&UF::AzeriteItemData::Level), _level);
}

void AzeriteItem::AddExperience(uint32 value)
{
    auto xpEntry = sAzeriteBaseExperiencePerLevelTable[_level];
    if (!xpEntry)
        return;

    auto baseRequiredValue = xpEntry->BaseExperienceToNextLevel;
    if (auto knowlegeEntry = sAzeriteKnowledgeMultiplierGameTable[sWorld->getIntConfig(CONFIG_AZERITE_KNOWLEGE)])
        baseRequiredValue *= knowlegeEntry->Multiplier;

    auto requiredExperienceForNextLevel = uint32(std::max(baseRequiredValue, xpEntry->MinimumExperienceToNextLevel));

    _experience += value;

    while (_experience >= requiredExperienceForNextLevel)
    {
        SetLevel(_level + 1);
        _experience -= requiredExperienceForNextLevel;
    }

    SetUpdateFieldValue(m_values.ModifyValue(&AzeriteItem::m_azeriteItemData).ModifyValue(&UF::AzeriteItemData::Xp), _experience);
    SetState(ITEM_CHANGED, GetOwner());

    WorldPackets::Artifact::AzeriteXpGain packet;
    packet.AzeriteXPGained = value;
    packet.Item = GetGUID();
    GetOwner()->SendDirectMessage(packet.Write());

    GetOwner()->UpdateCriteria(CRITERIA_TREE_HEART_OF_AZEROTH_ARTIFACT_POWER_EARNED, value);
}

void AzeriteItem::BuildUpdate(UpdateDataMapType& data_map)
{
    if (Player * owner = GetOwner())
        BuildFieldsUpdate(owner, data_map);
    ClearUpdateMask(false);
}

UF::UpdateFieldFlag AzeriteItem::GetUpdateFieldFlagsFor(Player const* target) const
{
    if (target->GetGUID() == GetOwnerGUID())
        return UF::UpdateFieldFlag::Owner;

    return UF::UpdateFieldFlag::None;
}

void AzeriteItem::BuildValuesCreate(ByteBuffer* data, Player const* target) const
{
    UF::UpdateFieldFlag flags = GetUpdateFieldFlagsFor(target);
    std::size_t sizePos = data->wpos();
    *data << uint32(0);
    *data << uint8(flags);
    m_objectData->WriteCreate(*data, flags, this, target);
    m_itemData->WriteCreate(*data, flags, this, target);
    m_azeriteItemData->WriteCreate(*data, flags, this, target);
    data->put<uint32>(sizePos, data->wpos() - sizePos - 4);
}

void AzeriteItem::BuildValuesUpdate(ByteBuffer* data, Player const* target) const
{
    UF::UpdateFieldFlag flags = GetUpdateFieldFlagsFor(target);
    std::size_t sizePos = data->wpos();
    *data << uint32(0);
    *data << uint32(m_values.GetChangedObjectTypeMask());

    if (m_values.HasChanged(TYPEID_OBJECT))
        m_objectData->WriteUpdate(*data, flags, this, target);

    if (m_values.HasChanged(TYPEID_ITEM))
        m_itemData->WriteUpdate(*data, flags, this, target);

    if (m_values.HasChanged(TYPEID_AZERITE_ITEM))
        m_azeriteItemData->WriteUpdate(*data, flags, this, target);

    data->put<uint32>(sizePos, data->wpos() - sizePos - 4);
}

void AzeriteItem::BuildValuesUpdateWithFlag(ByteBuffer* data, UF::UpdateFieldFlag flags, Player const* target) const
{
    UpdateMask<NUM_CLIENT_OBJECT_TYPES> valuesMask;
    valuesMask.Set(TYPEID_AZERITE_ITEM);

    std::size_t sizePos = data->wpos();
    *data << uint32(0);
    *data << uint32(valuesMask.GetBlock(0));

    UF::AzeriteItemData::Mask mask;
    m_azeriteItemData->AppendAllowedFieldsMaskForFlag(mask, flags);
    m_azeriteItemData->WriteUpdate(*data, mask, flags, this, target);

    data->put<uint32>(sizePos, data->wpos() - sizePos - 4);
}

void AzeriteItem::ClearUpdateMask(bool remove)
{
    m_values.ClearChangesMask(&AzeriteItem::m_azeriteItemData);
    Item::ClearUpdateMask(remove);
}

void AzeriteItem::AddToObjectUpdate()
{
    if (Player * owner = GetOwner())
        owner->GetMap()->AddUpdateObject(this);
}

void AzeriteItem::RemoveFromObjectUpdate()
{
    if (Player * owner = GetOwner())
        owner->GetMap()->RemoveUpdateObject(this);
}

PowerData::PowerData(uint32 powerId, uint32 spellId)
{
    PowerId = powerId;
    SpellId = spellId;
}

PowerData::PowerData()
{
    PowerId = 0;
    SpellId = 0;
}

AzeriteEmpoweredItem::AzeriteEmpoweredItem()
{
    m_objectType |= TYPEMASK_AZERITE_EMPOWERED_ITEM;
    m_objectTypeId = TYPEID_AZERITE_EMPOWERED_ITEM;

    _powerIds[0] = PowerData(0, 0);
    _powerIds[1] = PowerData(0, 0);
    _powerIds[2] = PowerData(0, 0);
    _powerIds[3] = PowerData(0, 0);
}

AzeriteEmpoweredItem::~AzeriteEmpoweredItem() = default;

bool AzeriteEmpoweredItem::Create(ObjectGuid::LowType guidlow, uint32 itemid, Player const* owner)
{
    if (!Item::Create(guidlow, itemid, owner))
        return false;

    AddItemFlag(ITEM_FLAG_AZERITE_EMPOWERED); // not 100% sure
    return true;
}

bool AzeriteEmpoweredItem::LoadFromDB(ObjectGuid::LowType guid, ObjectGuid ownerGuid, Field* fields, uint32 entry, Player const* owner /*= nullptr*/)
{
    if (!Item::LoadFromDB(guid, ownerGuid, fields, entry, owner))
        return false;

    auto activePowerData = [this](uint32 tier) -> void
    {
        auto& power = _powerIds[tier];

        if (auto powerEntry = sAzeritePowerStore[power.PowerId])
        {
            power.SpellId = powerEntry->SpellID;
            SetPower(power.SpellId, true);
            SetUpdateFieldValue(m_values.ModifyValue(&AzeriteEmpoweredItem::m_azeriteEmpoweredItemData).ModifyValue(&UF::AzeriteEmpoweredItemData::Selections, tier), power.PowerId);
        }
    };

    auto stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_AZERITE_EMPOWERED_ITEM);
    stmt->setUInt64(0, ownerGuid.GetCounter());
    stmt->setUInt64(1, guid);
    if (auto result = CharacterDatabase.Query(stmt))
    {
        auto fieldsX = result->Fetch();
        for (uint8 i = 0; i < 4; ++i)
        {
            _powerIds[i].PowerId = fieldsX[i].GetUInt32();
            activePowerData(i);
        }
    }

    return true;
}

void AzeriteEmpoweredItem::SaveToDB(CharacterDatabaseTransaction& trans)
{
    if (GetState() == ITEM_REMOVED)
    {
        auto stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_AZERITE_EMPOWERED_ITEM);
        stmt->setUInt64(0, GetGUID().GetCounter());
        trans->Append(stmt);
    }
    else
    {
        uint8 index = 0;
        auto stmt = CharacterDatabase.GetPreparedStatement(CHAR_REP_AZERITE_EMPOWERED_ITEM);
        stmt->setUInt64(index++, GetOwnerGUID().GetCounter());
        stmt->setUInt64(index++, GetGUID().GetCounter());
        stmt->setUInt32(index++, _powerIds[0].PowerId);
        stmt->setUInt32(index++, _powerIds[1].PowerId);
        stmt->setUInt32(index++, _powerIds[2].PowerId);
        stmt->setUInt32(index++, _powerIds[3].PowerId);
        trans->Append(stmt);
    }

    Item::SaveToDB(trans);
}

void AzeriteEmpoweredItem::SelectPower(int32 powerId, int32 tier)
{
    if (!powerId || tier > 3)
        return;

    auto azeritePowerEntry = sAzeritePowerStore[powerId];
    if (!azeritePowerEntry)
        return;

    SetState(ITEM_CHANGED, GetOwner());

    SetPower(_powerIds[tier].SpellId, false);
    _powerIds[tier] = PowerData(powerId, azeritePowerEntry->SpellID);
    SetUpdateFieldValue(m_values.ModifyValue(&AzeriteEmpoweredItem::m_azeriteEmpoweredItemData).ModifyValue(&UF::AzeriteEmpoweredItemData::Selections, tier), powerId);
    SetPower(azeritePowerEntry->SpellID, true);
}

void AzeriteEmpoweredItem::SetPower(uint32 spellId, bool apply, Player* owner /*= nullptr*/)
{
    auto spellInfo = sSpellMgr->GetSpellInfo(spellId);
    if (!spellInfo)
        return;

    auto const& player = owner ? owner : GetOwner();
    if (!player)
        return;

    if (spellInfo->IsPassive())
    {
        if (auto aura = player->GetAuraApplication(spellId, ObjectGuid::Empty, GetGUID()))
        {
            if (apply)
            {
                for (auto auraEffect : aura->GetBase()->GetAuraEffects())
                {
                    if (auraEffect)
                        if (aura->HasEffect(auraEffect->GetEffIndex()))
                            auraEffect->ChangeAmount(auraEffect->GetSpellEffectInfo()->CalcValue());
                }
            }
            else
                player->RemoveAura(aura);
        }
        else
            player->CastSpell(player, spellId, true, this);
    }
    else
    {
        if (apply && !player->HasSpell(spellId))
        {
            player->AddTemporarySpell(spellId);
            WorldPackets::Spells::LearnedSpells learnedSpells;
            learnedSpells.SuppressMessaging = true;
            learnedSpells.SpellID.push_back(spellId);
            player->SendDirectMessage(learnedSpells.Write());
        }
        else if (!apply)
        {
            player->RemoveTemporarySpell(spellId);
            WorldPackets::Spells::UnlearnedSpells unlearnedSpells;
            unlearnedSpells.SuppressMessaging = true;
            unlearnedSpells.SpellID.push_back(spellId);
            player->SendDirectMessage(unlearnedSpells.Write());
        }
    }
}

void AzeriteEmpoweredItem::ApplyPowers(Player* player, bool apply)
{
    for (auto power: _powerIds)
        SetPower(power.second.SpellId, apply, player);
}

void AzeriteEmpoweredItem::BuildUpdate(UpdateDataMapType& data_map)
{
    if (Player * owner = GetOwner())
        BuildFieldsUpdate(owner, data_map);
    ClearUpdateMask(false);
}

UF::UpdateFieldFlag AzeriteEmpoweredItem::GetUpdateFieldFlagsFor(Player const* target) const
{
    if (target->GetGUID() == GetOwnerGUID())
        return UF::UpdateFieldFlag::Owner;

    return UF::UpdateFieldFlag::None;
}

void AzeriteEmpoweredItem::BuildValuesCreate(ByteBuffer* data, Player const* target) const
{
    UF::UpdateFieldFlag flags = GetUpdateFieldFlagsFor(target);
    std::size_t sizePos = data->wpos();
    *data << uint32(0);
    *data << uint8(flags);
    m_objectData->WriteCreate(*data, flags, this, target);
    m_itemData->WriteCreate(*data, flags, this, target);
    m_azeriteEmpoweredItemData->WriteCreate(*data, flags, this, target);
    data->put<uint32>(sizePos, data->wpos() - sizePos - 4);
}

void AzeriteEmpoweredItem::BuildValuesUpdate(ByteBuffer* data, Player const* target) const
{
    UF::UpdateFieldFlag flags = GetUpdateFieldFlagsFor(target);
    std::size_t sizePos = data->wpos();
    *data << uint32(0);
    *data << uint32(m_values.GetChangedObjectTypeMask());

    if (m_values.HasChanged(TYPEID_OBJECT))
        m_objectData->WriteUpdate(*data, flags, this, target);

    if (m_values.HasChanged(TYPEID_ITEM))
        m_itemData->WriteUpdate(*data, flags, this, target);

    if (m_values.HasChanged(TYPEID_AZERITE_ITEM))
        m_azeriteEmpoweredItemData->WriteUpdate(*data, flags, this, target);

    data->put<uint32>(sizePos, data->wpos() - sizePos - 4);
}

void AzeriteEmpoweredItem::ClearUpdateMask(bool remove)
{
    m_values.ClearChangesMask(&AzeriteEmpoweredItem::m_azeriteEmpoweredItemData);
    Item::ClearUpdateMask(remove);
}

void AzeriteEmpoweredItem::AddToObjectUpdate()
{
    if (Player * owner = GetOwner())
        owner->GetMap()->AddUpdateObject(this);
}

void AzeriteEmpoweredItem::RemoveFromObjectUpdate()
{
    if (Player * owner = GetOwner())
        owner->GetMap()->RemoveUpdateObject(this);
}
