/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 * Copyright (C) 2008-2017 TrinityCore <http://www.trinitycore.org/>
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

#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "PhasingHandler.h"
#include "GameObject.h"
#include "ScriptedGossip.h"
#include "Log.h"

enum
{
    ///Hunter Quest
    NPC_SNOWFEATHER_100786 = 100786,
    QUEST_NEEDS_OF_THE_HUNTERS = 40384,
    QUEST_The_Hunters_Call = 41415,
};

enum ClassHallhunter
{
    SPELL_PLAYERCHOICE                      = 198430,
    PLAYER_CHOICE_HUNTER_ARTIFACT_SELECTION = 240,
    PLAYER_CHOICE_Hunter_Shooting           = 451,
    PLAYER_CHOICE_Hunter_Survival           = 450,
    PLAYER_CHOICE_Hunter_Beast_Mastery      = 452,
    SPELL_Hunter_SPEC_Beast_Mastery              = 198433,
    SPELL_Hunter_SPEC_Survival                   = 198435,
    SPELL_Hunter_SPEC_Shooting                   = 198436,
    KILL_CREDIT_HUNTER_ARTIFACT_CHOSEN          = 104634,
};

struct npc_snowfeather_100786 : public ScriptedAI
{
    npc_snowfeather_100786(Creature* creature) : ScriptedAI(creature) { SayHi = false; }

    void MoveInLineOfSight(Unit* who) override
    {
        if (!who || !who->IsInWorld())
            return;
        if (!me->IsWithinDist(who, 25.0f, false))
            return;

        Player* player = who->GetCharmerOrOwnerPlayerOrPlayerItself();

        if (!player)
            return;
        me->GetMotionMaster()->MoveFollow(player, PET_FOLLOW_DIST, me->GetFollowAngle());
        if (!SayHi)
        {
            SayHi = true;
            Talk(0, player);
        }
    }

    void QuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_NEEDS_OF_THE_HUNTERS)
        {
            Talk(1, player);
            me->DespawnOrUnsummon(5000);
        }
    }
private:
    bool SayHi;
};

struct npc_grif_wildheart_100810 : public ScriptedAI
{
    npc_grif_wildheart_100810(Creature* creature) : ScriptedAI(creature) {  }

    bool GossipSelect(Player* player, uint32 menuId, uint32 gossipListId)
    {
        TC_LOG_ERROR("server.worldserver", "sGossipSelect %u, %u", menuId, gossipListId);
        if (player->HasQuest(QUEST_The_Hunters_Call))
        {
            if (gossipListId == 0)
            {
                player->KilledMonsterCredit(104297);
                CloseGossipMenuFor(player);
            }
        }
        return false;
    }
};

struct npc_apata_highmountain_99986 : public ScriptedAI
{
    npc_apata_highmountain_99986(Creature* creature) : ScriptedAI(creature) {  }

    bool GossipSelect(Player* player, uint32 menuId, uint32 gossipListId)
    {
        TC_LOG_ERROR("server.worldserver", "sGossipSelect %u, %u", menuId, gossipListId);
        if (player->HasQuest(QUEST_The_Hunters_Call))
        {
            if (gossipListId == 0)
            {
                player->KilledMonsterCredit(104298);
                CloseGossipMenuFor(player);
            }
        }
        return false;
    }
};

struct npc_courier_larkspur_100171 : public ScriptedAI
{
    npc_courier_larkspur_100171(Creature* creature) : ScriptedAI(creature) {  }

    bool GossipSelect(Player* player, uint32 menuId, uint32 gossipListId)
    {
        TC_LOG_ERROR("server.worldserver", "sGossipSelect %u, %u", menuId, gossipListId);
        if (player->HasQuest(QUEST_The_Hunters_Call))
        {
            if (gossipListId == 0)
            {
                player->KilledMonsterCredit(104299);
                CloseGossipMenuFor(player);
            }
        }
        return false;
    }
};

class PlayerScript_hunter_artifact_choice : public PlayerScript
{
public:
    PlayerScript_hunter_artifact_choice() : PlayerScript("PlayerScript_hunter_artifact_choice") {}

    void OnCompleteQuestChoice(Player* player, uint32 choiceID, uint32 responseID)
    {
        if (choiceID != PLAYER_CHOICE_HUNTER_ARTIFACT_SELECTION)
            return;

        switch (responseID)
        {
            case PLAYER_CHOICE_Hunter_Shooting:
            {
                player->RemoveRewardedQuest(40618);
                player->KilledMonsterCredit(KILL_CREDIT_HUNTER_ARTIFACT_CHOSEN);

                if (ChrSpecializationEntry const* spec = sChrSpecializationStore.AssertEntry(577))
                    player->ActivateTalentGroup(spec);

                break;
            }
            case PLAYER_CHOICE_Hunter_Beast_Mastery:
            {
                player->RemoveRewardedQuest(40618);
                player->KilledMonsterCredit(KILL_CREDIT_HUNTER_ARTIFACT_CHOSEN);

                if (ChrSpecializationEntry const* spec = sChrSpecializationStore.AssertEntry(581))
                    player->ActivateTalentGroup(spec);

                break;
            }
            case PLAYER_CHOICE_Hunter_Survival:
            {
                player->RemoveRewardedQuest(40618);
                player->KilledMonsterCredit(KILL_CREDIT_HUNTER_ARTIFACT_CHOSEN);

                if (ChrSpecializationEntry const* spec = sChrSpecializationStore.AssertEntry(582))
                    player->ActivateTalentGroup(spec);

                break;
            }
            default:
                break;
        }
    }
};

class npc_40618_artifact : public CreatureScript
{
public:
    npc_40618_artifact() : CreatureScript("npc_40618_artifact") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
    {
        if (quest->GetQuestId() == 40618)
        {
            player->CastSpell(player, SPELL_PLAYERCHOICE, true); // Display player spec choice
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->HasQuest(40618) &&
            player->GetQuestStatus(40618) != QUEST_STATUS_REWARDED) {
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "I would like to review weapons we might pursue.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }

        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);

        switch (action)
        {
        case GOSSIP_ACTION_INFO_DEF + 1:
            player->CastSpell(player, SPELL_PLAYERCHOICE, true); // Display player spec choice
            CloseGossipMenuFor(player);
            break;
        }
        return true;
    }
};

void AddSC_class_hall_hunter()
{
    RegisterCreatureAI(npc_snowfeather_100786);
    RegisterCreatureAI(npc_grif_wildheart_100810);
    RegisterCreatureAI(npc_apata_highmountain_99986);
    RegisterCreatureAI(npc_courier_larkspur_100171);
    new PlayerScript_hunter_artifact_choice();
    new npc_40618_artifact();
}
