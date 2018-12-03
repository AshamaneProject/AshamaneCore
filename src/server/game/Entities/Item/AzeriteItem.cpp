
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

    m_valuesCount = AZERITE_ITEM_END;
    _dynamicValuesCount = AZERITE_ITEM_DYNAMIC_END;

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

    SetUInt64Value(AZERITE_ITEM_FIELD_XP, _experience);
    SetUInt32Value(AZERITE_ITEM_FIELD_KNOWLEDGE_LEVEL, sWorld->getIntConfig(CONFIG_AZERITE_KNOWLEGE));

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

    SetUInt64Value(AZERITE_ITEM_FIELD_XP, _experience);
    SetUInt32Value(AZERITE_ITEM_FIELD_KNOWLEDGE_LEVEL, sWorld->getIntConfig(CONFIG_AZERITE_KNOWLEGE));

    return true;
}

void AzeriteItem::SaveToDB(SQLTransaction& trans)
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

    SetUInt32Value(AZERITE_ITEM_FIELD_LEVEL, _level);
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

    SetUInt64Value(AZERITE_ITEM_FIELD_XP, _experience);
    SetState(ITEM_CHANGED, GetOwner());

    WorldPackets::Artifact::AzeriteXpGain packet;
    packet.AzeriteXPGained = value;
    packet.Item = GetGUID();
    GetOwner()->SendDirectMessage(packet.Write());

    GetOwner()->UpdateCriteria(CRITERIA_TREE_HEART_OF_AZEROTH_ARTIFACT_POWER_EARNED, value);
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

    m_valuesCount = AZERITE_EMPOWERED_ITEM_END;
    _dynamicValuesCount = AZERITE_EMPOWERED_ITEM_DYNAMIC_END;

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

    SetFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_AZERITE_EMPOWERED); // not 100% sure
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
            SetUInt32Value(AZERITE_EMPOWERED_ITEM_FIELD_SELECTIONS + tier, power.PowerId);
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

void AzeriteEmpoweredItem::SaveToDB(SQLTransaction& trans)
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
    SetUInt32Value(AZERITE_EMPOWERED_ITEM_FIELD_SELECTIONS + tier, powerId);
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
