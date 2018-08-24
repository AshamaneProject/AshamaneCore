/*
 * Copyright (C) 2017-2018 AshamaneProject <https://github.com/AshamaneProject>
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

#include "ChallengeModeMgr.h"
#include "Containers.h"
#include "DB2Stores.h"
#include "Item.h"
#include "LootPackets.h"

ChallengeModeMgr* ChallengeModeMgr::instance()
{
    static ChallengeModeMgr instance;
    return &instance;
}

MapChallengeModeEntry const* ChallengeModeMgr::GetMapChallengeModeEntry(uint32 mapId)
{
    for (uint32 i = 0; i < sMapChallengeModeStore.GetNumRows(); ++i)
        if (MapChallengeModeEntry const* challengeModeEntry = sMapChallengeModeStore.LookupEntry(i))
            if (challengeModeEntry->MapID == mapId)
                return challengeModeEntry;

    return nullptr;
}

uint32 ChallengeModeMgr::GetDamageMultiplier(uint8 challengeLevel)
{
    switch (challengeLevel)
    {
        case 2: return 10;
        case 3: return 21;
        case 4: return 33;
        case 5: return 46;
        case 6: return 61;
        case 7: return 77;
        case 8: return 95;
        case 9: return 114;
        case 10: return 136;
        case 11: return 159;
        case 12: return 185;
        case 13: return 214;
        case 14: return 245;
        case 15: return 280;
        case 16: return 318;
        case 17: return 359;
        case 18: return 405;
        case 19: return 456;
        case 20: return 512;
        case 21: return 573;
        case 22: return 640;
        case 23: return 714;
        case 24: return 795;
        case 25: return 885;
        case 26: return 983;
        case 27: return 1092;
        case 28: return 1211;
        case 29: return 1342;
        case 30: return 1486;
        case 31: return 1645;
        case 32: return 1819;
        case 33: return 2011;
        case 34: return 2223;
        case 35: return 2455;
        case 36: return 2710;
        case 37: return 2991;
        case 38: return 3300;
        case 39: return 3640;
        case 40: return 4014;
        default:
            break;
    }

    return 1;
}

uint32 ChallengeModeMgr::GetHealthMultiplier(uint8 challengeLevel)
{
    switch (challengeLevel)
    {
        case 2: return 10;
        case 3: return 21;
        case 4: return 33;
        case 5: return 46;
        case 6: return 61;
        case 7: return 77;
        case 8: return 95;
        case 9: return 114;
        case 10: return 136;
        case 11: return 159;
        case 12: return 185;
        case 13: return 214;
        case 14: return 245;
        case 15: return 280;
        case 16: return 318;
        case 17: return 359;
        case 18: return 405;
        case 19: return 456;
        case 20: return 512;
        case 21: return 573;
        case 22: return 640;
        case 23: return 714;
        case 24: return 795;
        case 25: return 885;
        case 26: return 983;
        case 27: return 1092;
        case 28: return 1211;
        case 29: return 1342;
        case 30: return 1486;
        case 31: return 1645;
        case 32: return 1819;
        case 33: return 2011;
        case 34: return 2223;
        case 35: return 2455;
        case 36: return 2710;
        case 37: return 2991;
        case 38: return 3300;
        case 39: return 3640;
        case 40: return 4014;
        default:
            break;
    }

    return 1;
}

uint32 ChallengeModeMgr::GetRandomChallengeId(uint32 flags/* = 4*/)
{
    std::vector<uint32> challenges;

    for (uint32 i = 0; i < sMapChallengeModeStore.GetNumRows(); ++i)
        if (MapChallengeModeEntry const* challengeModeEntry = sMapChallengeModeStore.LookupEntry(i))
            if (challengeModeEntry->Flags & flags &&
                (challengeModeEntry->ID == 197 || challengeModeEntry->ID == 198 || challengeModeEntry->ID == 199)) // Temp fix, only doable dungeons here
                challenges.push_back(challengeModeEntry->ID);

    if (challenges.empty())
        return 0;

    return Trinity::Containers::SelectRandomContainerElement(challenges);
}

std::vector<int32> ChallengeModeMgr::GetBonusListIdsForRewards(uint32 baseItemIlevel, uint8 challengeLevel)
{
    if (challengeLevel < 2)
        return {};

    std::vector<std::pair<int32, uint32>> bonusDescriptionByChallengeLevel =
    {
        { 3410, 5  },   // Mythic 2
        { 3411, 5  },   // Mythic 3
        { 3412, 10 },   // Mythic 4
        { 3413, 15 },   // Mythic 5
        { 3414, 20 },   // Mythic 6
        { 3415, 20 },   // Mythic 7
        { 3416, 25 },   // Mythic 8
        { 3417, 25 },   // Mythic 9
        { 3418, 30 },   // Mythic 10
        { 3509, 35 },   // Mythic 11
        { 3510, 40 },   // Mythic 12
        { 3534, 45 },   // Mythic 13
        { 3535, 50 },   // Mythic 14
        { 3535, 55 },   // Mythic 15
    };

    const uint32 baseMythicIlevel = 885;
    std::pair<int32, uint32> bonusAndDeltaPair = bonusDescriptionByChallengeLevel[challengeLevel < 15 ? (challengeLevel - 2): 13];
    return { bonusAndDeltaPair.first, (int32)sDB2Manager.GetItemBonusListForItemLevelDelta(baseMythicIlevel - baseItemIlevel + bonusAndDeltaPair.second) };
}

void ChallengeModeMgr::Reward(Player* player, uint8 challengeLevel)
{
    if (!GetMapChallengeModeEntry(player->GetMapId()))
        return;

    JournalInstanceEntry const* journalInstance  = sDB2Manager.GetJournalInstanceByMapId(player->GetMapId());
    if (!journalInstance)
        return;

    auto encounters = sDB2Manager.GetJournalEncounterByJournalInstanceId(journalInstance->ID);
    if (!encounters)
        return;

    std::vector<JournalEncounterItemEntry const*> items;
    for (auto encounter : *encounters)
        if (std::vector<JournalEncounterItemEntry const*> const* journalItems = sDB2Manager.GetJournalItemsByEncounter(encounter->ID))
            items.insert(items.end(), journalItems->begin(), journalItems->end());

    if (items.empty())
        return;

    std::vector<ItemTemplate const*> stuffLoots;
    for (JournalEncounterItemEntry const* journalEncounterItem : items)
    {
        ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(journalEncounterItem->ItemID);
        if (!itemTemplate)
            continue;

        if (!itemTemplate->IsUsableByLootSpecialization(player, false))
            continue;

        if (itemTemplate->GetInventoryType() != INVTYPE_NON_EQUIP)
            stuffLoots.push_back(itemTemplate);
    }

    ItemTemplate const* randomStuffItem = Trinity::Containers::SelectRandomContainerElement(stuffLoots);
    if (!randomStuffItem)
        return;

    uint32 itemId = randomStuffItem->GetId();
    ItemPosCountVec dest;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, itemId, 1);
    if (msg != EQUIP_ERR_OK)
    {
        player->SendEquipError(msg, nullptr, nullptr, itemId);
        return;
    }

    std::vector<int32> bonusListIds = GetBonusListIdsForRewards(randomStuffItem->GetBaseItemLevel(), challengeLevel);
    Item* pItem = player->StoreNewItem(dest, itemId, true, GenerateItemRandomPropertyId(itemId), GuidSet(), 0, bonusListIds);
    player->SendNewItem(pItem, 1, true, false, true);

    WorldPackets::Loot::DisplayToast displayToast;
    displayToast.EntityId = itemId;
    displayToast.ToastType = TOAST_ITEM;
    displayToast.Quantity = 1;
    displayToast.RandomPropertiesID = pItem->GetItemRandomPropertyId();
    displayToast.ToastMethod = TOAST_METHOD_POPUP;
    displayToast.bonusListIDs = pItem->GetDynamicValues(ITEM_DYNAMIC_FIELD_BONUSLIST_IDS);
    player->SendDirectMessage(displayToast.Write());
}
