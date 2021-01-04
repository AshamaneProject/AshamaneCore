/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Loot.h"
#include "Containers.h"
#include "DatabaseEnv.h"
#include "DB2Stores.h"
#include "Group.h"
#include "ItemTemplate.h"
#include "LFGMgr.h"
#include "Log.h"
#include "LootMgr.h"
#include "LootPackets.h"
#include "Map.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Random.h"
#include "World.h"

//
// --------- LootItem ---------
//

// Constructor, copies most fields from LootStoreItem and generates random count
LootItem::LootItem(LootStoreItem const& li)
{
    itemid      = li.itemid;
    conditions  = li.conditions;
    currency    = li.type == uint8(LootItemType::Currency);

    if (currency)
    {
        freeforall = false;
        needs_quest = false;
        follow_loot_rules = false;
    }
    else
    {
        ItemTemplate const* proto = sObjectMgr->GetItemTemplate(itemid);
        freeforall = proto && (proto->GetFlags() & ITEM_FLAG_MULTI_DROP);
        follow_loot_rules = proto && (proto->FlagsCu & ITEM_FLAGS_CU_FOLLOW_LOOT_RULES);

        needs_quest = li.needs_quest;
    }

    randomBonusListId = GenerateItemRandomBonusListId(itemid);
    context = ItemContext::NONE;
    count = 0;
    is_looted = 0;
    is_blocked = 0;
    is_underthreshold = 0;
    is_counted = 0;
    //canSave = true;
}

// Basic checks for player/item compatibility - if false no chance to see the item in the loot
bool LootItem::AllowedForPlayer(Player const* player) const
{
    // DB conditions check
    if (!sConditionMgr->IsObjectMeetToConditions(const_cast<Player*>(player), conditions))
        return false;

    if (!currency)
    {
        ItemTemplate const* pProto = sObjectMgr->GetItemTemplate(itemid);
        if (!pProto)
            return false;

        // not show loot for players without profession or those who already know the recipe
        if ((pProto->GetFlags() & ITEM_FLAG_HIDE_UNUSABLE_RECIPE) && (!player->HasSkill(pProto->GetRequiredSkill()) || player->HasSpell(pProto->Effects[1]->SpellID)))
            return false;

        // not show loot for not own team
        if ((pProto->GetFlags2() & ITEM_FLAG2_FACTION_HORDE) && player->GetTeam() != HORDE)
            return false;

        if ((pProto->GetFlags2() & ITEM_FLAG2_FACTION_ALLIANCE) && player->GetTeam() != ALLIANCE)
            return false;

        // check quest requirements
        if (!(pProto->FlagsCu & ITEM_FLAGS_CU_IGNORE_QUEST_STATUS) && ((needs_quest || (pProto->GetStartQuest() && player->GetQuestStatus(pProto->GetStartQuest()) != QUEST_STATUS_NONE)) && !player->HasQuestForItem(itemid)))
            return false;
    }

    return true;
}

void LootItem::AddAllowedLooter(const Player* player)
{
    allowedGUIDs.insert(player->GetGUID());
}

//
// --------- Loot ---------
//

Loot::Loot(uint32 _gold /*= 0*/) : gold(_gold), unlootedCount(0), loot_type(LOOT_NONE), _itemContext(ItemContext::NONE)
{
}

Loot::~Loot()
{
    clear();
}

void Loot::clear()
{
    PlayersLooting.clear();
    items.clear();
    gold = 0;
    unlootedCount = 0;
    loot_type = LOOT_NONE;
    i_LootValidatorRefManager.clearReferences();
    _itemContext = ItemContext::NONE;
}

uint32 Loot::GetUnlootedCount(Player const* player /*= nullptr*/) const
{
    uint32 unlootedCount = 0;

    if (player)
    {
        auto itr = items.find(player->GetGUID());
        if (itr != items.end())
            for (LootItem const& item : itr->second)
                if (!item.is_looted)
                    ++unlootedCount;
    }
    else
    {
        for (auto const& itemItr : items)
            for (LootItem const& item : itemItr.second)
                if (!item.is_looted)
                    ++unlootedCount;
    }

    return unlootedCount;
}

void Loot::NotifyItemRemoved(uint8 lootIndex)
{
    // notify all players that are looting this that the item was removed
    // convert the index to the slot the player sees
    GuidSet::iterator i_next;
    for (GuidSet::iterator i = PlayersLooting.begin(); i != PlayersLooting.end(); i = i_next)
    {
        i_next = i;
        ++i_next;
        if (Player* player = ObjectAccessor::FindPlayer(*i))
            player->SendNotifyLootItemRemoved(GetGUID(), lootIndex);
        else
            PlayersLooting.erase(i);
    }
}

void Loot::NotifyMoneyRemoved()
{
    // notify all players that are looting this that the money was removed
    GuidSet::iterator i_next;
    for (GuidSet::iterator i = PlayersLooting.begin(); i != PlayersLooting.end(); i = i_next)
    {
        i_next = i;
        ++i_next;
        if (Player* player = ObjectAccessor::FindPlayer(*i))
            player->SendNotifyLootMoneyRemoved(GetGUID());
        else
            PlayersLooting.erase(i);
    }
}

void Loot::GenerateMoneyLoot(uint32 minAmount, uint32 maxAmount)
{
    if (maxAmount > 0)
    {
        if (maxAmount <= minAmount)
            gold = uint32(maxAmount * sWorld->getRate(RATE_DROP_MONEY));
        else if ((maxAmount - minAmount) < 32700)
            gold = uint32(urand(minAmount, maxAmount) * sWorld->getRate(RATE_DROP_MONEY));
        else
            gold = uint32(urand(minAmount >> 8, maxAmount >> 8) * sWorld->getRate(RATE_DROP_MONEY)) << 8;
    }
}

void Loot::GenerateJournalEncounterLoot(Player* looter, uint32 journalEncounterId)
{
    if (!journalEncounterId)
        return;

    std::vector<JournalEncounterItemEntry const*> const* journalItems = sDB2Manager.GetJournalItemsByEncounter(journalEncounterId);
    if (!journalItems)
        return;

    std::vector<JournalEncounterItemEntry const*> stuffLoots;
    std::vector<JournalEncounterItemEntry const*> otherLoots;

    for (auto itr = journalItems->begin(); itr != journalItems->end(); ++itr)
    {
        JournalEncounterItemEntry const* journalEncounterItem = *itr;

        //if (journalEncounterItem->DifficultyMask)
        //    continue;

        ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(journalEncounterItem->ItemID);
        if (!itemTemplate)
            continue;

        if (!itemTemplate->IsUsableByLootSpecialization(looter, false))
            continue;

        if (itemTemplate->GetInventoryType() != INVTYPE_NON_EQUIP)
            stuffLoots.push_back(journalEncounterItem);
        else
            otherLoots.push_back(journalEncounterItem);
    }

    if (urand(0, 100) > 1)
    {
        JournalEncounterItemEntry const* randomStuffLoot = Trinity::Containers::SelectRandomContainerElement(stuffLoots);

        LootStoreItem lootStoreItem(randomStuffLoot->ItemID, uint8(LootItemType::Item), 0, 100, false, LOOT_MODE_DEFAULT, 0, 1, 1);
        AddItem(lootStoreItem, looter);
    }
}

// Calls processor of corresponding LootTemplate (which handles everything including references)
bool Loot::FillLoot(uint32 lootId, LootStore const& store, Player* lootOwner, bool /*personal*/, bool noEmptyError, uint16 lootMode /*= LOOT_MODE_DEFAULT*/, ItemContext context /*= ItemContext::NONE*/, bool specOnly /*= false*/)
{
    // Must be provided
    if (!lootOwner)
        return false;

    _itemContext = lootOwner->GetMap()->GetDifficultyLootItemContext();

    if (LFGDungeonsEntry const* dungeonEntry = sLFGMgr->GetPlayerLFGDungeonEntry(lootOwner->GetGUID()))
        if (dungeonEntry->Flags[0] & lfg::LfgFlags::LFG_FLAG_TIMEWALKER)
            _itemContext = ItemContext::TimeWalker;

    LootTemplate const* tab = store.GetLootFor(lootId);

    if (!tab)
    {
        if (!noEmptyError)
            TC_LOG_ERROR("sql.sql", "Table '%s' loot id #%u used but it doesn't have records.", store.GetName(), lootId);
        return false;
    }

    _itemContext = context;

    items.reserve(MAX_NR_LOOT_ITEMS);

    tab->Process(*this, store.IsRatesAllowed(), lootMode, 0, lootOwner, specOnly);          // Processing is done there, callback via Loot::AddItem()

    return true;
}

// Inserts the item into the loot (called by LootTemplate processors)
void Loot::AddItem(LootStoreItem const& item, Player const* player /*= nullptr*/, bool specOnly /*= false*/)
{
    if (!player)
        return;

    if (item.type == uint8(LootItemType::Currency))
    {
        LootItem generatedLoot(item);
        generatedLoot.count = urand(item.mincount, item.maxcount);
        items[player->GetGUID()].push_back(generatedLoot);
        return;
    }

    ItemTemplate const* proto = sObjectMgr->GetItemTemplate(item.itemid);
    if (!proto)
        return;

    // If this loot should be filtered by specialization, check player spec before adding
    if (specOnly && player)
        if (!proto->IsUsableByLootSpecialization(player, false))
            return;

    uint32 count = urand(item.mincount, item.maxcount);
    uint32 stacks = count / proto->GetMaxStackSize() + ((count % proto->GetMaxStackSize()) ? 1 : 0);

    uint32 limit = item.needs_quest ? MAX_NR_QUEST_ITEMS : MAX_NR_LOOT_ITEMS;

    for (uint32 i = 0; i < stacks && items.size() < limit; ++i)
    {
        LootItem generatedLoot(item);
        generatedLoot.context = _itemContext;
        generatedLoot.count = std::min(count, proto->GetMaxStackSize());
        if (_itemContext != ItemContext::NONE)
        {
            std::set<uint32> bonusListIDs = sDB2Manager.GetDefaultItemBonusTree(generatedLoot.itemid, _itemContext);
            generatedLoot.BonusListIDs.insert(generatedLoot.BonusListIDs.end(), bonusListIDs.begin(), bonusListIDs.end());
        }

        items[player->GetGUID()].push_back(generatedLoot);
        count -= proto->GetMaxStackSize();

        // non-conditional one-player only items are counted here,
        // free for all items are counted in FillFFALoot(),
        // non-ffa conditionals are counted in FillNonQuestNonFFAConditionalLoot()
        if (item.conditions.empty() && !(proto->GetFlags() & ITEM_FLAG_MULTI_DROP))
            ++unlootedCount;
    }
}

LootItem const* Loot::GetItemInSlot(uint32 lootSlot, Player const* player) const
{
    LootItemList const& playerItems = items.at(player->GetGUID());
    if (lootSlot < playerItems.size())
        return &playerItems[lootSlot];

    return nullptr;
}

LootItem* Loot::LootItemInSlot(uint32 lootSlot, Player* player)
{
    auto itr = items.find(player->GetGUID());
    if (itr == items.end())
        return nullptr;

    LootItemList& playerItems = itr->second;
    if (lootSlot >= playerItems.size())
        return nullptr;

    LootItem* item = &playerItems[lootSlot];
    if (item->is_looted)
        return nullptr;

    return item;
}

uint32 Loot::GetMaxSlotInLootFor(Player* player) const
{
    auto itr = items.find(player->GetGUID());
    if (itr == items.end())
        return 0;

    return itr->second.size();
}

// return true if there is any item that is lootable for any player (not quest item, FFA or conditional)
bool Loot::hasItemForAll() const
{
    // Gold is always lootable
    if (gold)
        return true;

    for (auto& itemItr : items)
        for (LootItem const& item : itemItr.second)
            if (!item.is_looted && !item.freeforall && item.conditions.empty())
                return true;

    return false;
}

// return true if there is any FFA, quest or conditional item for the player.
bool Loot::hasItemFor(Player const* player) const
{
    return items.find(player->GetGUID()) != items.end();
}

void Loot::BuildLootResponse(WorldPackets::Loot::LootResponse& packet, Player* viewer, PermissionTypes permission) const
{
    if (permission == NONE_PERMISSION)
        return;

    packet.Coins = gold;

    auto const& itr = items.find(viewer->GetGUID());
    if (itr == items.end())
        return;

    LootItemList const& playerItems = itr->second;

    uint8 lootIndex = 0;
    for (LootItem const& item : playerItems)
    {
        if (!item.is_looted && item.conditions.empty() && item.AllowedForPlayer(viewer))
        {
            if (!item.currency)
            {
                WorldPackets::Loot::LootItemData lootItem;
                lootItem.LootListID = ++lootIndex;
                lootItem.UIType = LOOT_SLOT_TYPE_OWNER;
                lootItem.Quantity = item.count;
                lootItem.Loot.Initialize(item);
                packet.Items.push_back(lootItem);
            }
            else
            {
                WorldPackets::Loot::LootItemData lootItem;
                lootItem.LootListID = ++lootIndex;
                lootItem.UIType = LOOT_SLOT_TYPE_OWNER;
                lootItem.Quantity = item.count;
                lootItem.Loot.Initialize(item);
                packet.Items.push_back(lootItem);
            }
        }
    }
}

LootSlotType Loot::GetUITypeByPermission(LootItem const& item, PermissionTypes permission, LootSlotType slotType) const
{
    switch (permission)
    {
        case MASTER_PERMISSION:
            return LOOT_SLOT_TYPE_MASTER;
        case RESTRICTED_PERMISSION:
            return item.is_blocked ? LOOT_SLOT_TYPE_LOCKED : LOOT_SLOT_TYPE_ALLOW_LOOT;
        case GROUP_PERMISSION:
            return item.is_blocked ? LOOT_SLOT_TYPE_ROLL_ONGOING : LOOT_SLOT_TYPE_ALLOW_LOOT;
        default:
            break;
    }

    return slotType;
}

//
// --------- AELootResult ---------
//

void AELootResult::Add(Item* item, uint32 count, LootType lootType)
{
    auto itr = _byItem.find(item);
    if (itr != _byItem.end())
        _byOrder[itr->second].count += count;
    else
    {
        _byItem[item] = _byOrder.size();
        ResultValue value;
        value.item = item;
        value.count = count;
        value.lootType = lootType;
        _byOrder.push_back(value);
    }
}

AELootResult::OrderedStorage::const_iterator AELootResult::begin() const
{
    return _byOrder.begin();
}

AELootResult::OrderedStorage::const_iterator AELootResult::end() const
{
    return _byOrder.end();
}
