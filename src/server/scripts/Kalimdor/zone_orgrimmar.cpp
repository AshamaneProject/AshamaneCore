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

#include "GameObject.h"
#include "ScriptedCreature.h"

enum OrgrimmarQuests
{
    QUEST_MISSION_ORDERS                    = 51443,
    QUEST_STORMWIND_EXTRACTION              = 50769,

    OBJECTIVE_STORMWIND_EXTRACTION_POTION   = 333785,
};

enum OrgrimmarGameObjects
{
    GOB_BLIGHTCALLER_EASY_DEATH = 289645
};

enum OrgrimmarQuestObjectives
{
    OBJECTIVE_MISSION_ORDERS_TAlk_SYLVANAS  = 335883,
};

enum OrgrimmarSpells
{
    SPELL_SCENE_SECRET_WEAPON   = 281294,
    SPELL_TALK_TO_SYLVANAS_KC   = 265586,

    // invisibility_detection_27 100616
    SPELL_START_SE_SCENARIO     = 265595,
};

enum OrgrimmarConversations
{
    CONVERSATION_MISSION_STATEMENT_ALL_HERE     = 7170,
    CONVERSATION_STORMWIND_EXTRACTION_LETS_MOVE = 8399,
};

 // 135201 - Talk to Sylvanas
struct npc_orgri_mission_orders_speak_sylvanas : public ScriptedAI
{
    npc_orgri_mission_orders_speak_sylvanas(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
            if (player->GetQuestStatus(QUEST_MISSION_ORDERS) == QUEST_STATUS_INCOMPLETE)
                if (player->GetQuestObjectiveCounter(OBJECTIVE_MISSION_ORDERS_TAlk_SYLVANAS) == 0)
                    if (player->GetDistance(me) < 40.f)
                        player->CastSpell(player, SPELL_SCENE_SECRET_WEAPON);
    }
};

// 2136
class scene_orgri_secret_weapon : public SceneScript
{
public:
    scene_orgri_secret_weapon() : SceneScript("scene_orgri_secret_weapon") { }

    void OnSceneEnd(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/) override
    {
        player->CastSpell(player, SPELL_TALK_TO_SYLVANAS_KC, true);
    }
};

// 134202 - Meet your team
struct  npc_orgri_mission_orders_meet_team : public ScriptedAI
{
    npc_orgri_mission_orders_meet_team(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
            if (player->GetQuestStatus(QUEST_MISSION_ORDERS) == QUEST_STATUS_INCOMPLETE)
                if (player->GetQuestObjectiveCounter(OBJECTIVE_MISSION_ORDERS_TAlk_SYLVANAS) == 1)
                    if (player->GetDistance(me) < 5.0f)
                    {
                        player->PlayConversation(CONVERSATION_MISSION_STATEMENT_ALL_HERE);
                        KillCreditMe(player);
                    }
    }
};

// 135205 - Nathanos (At team meeting)
struct  npc_nathanos_team_meeting : public ScriptedAI
{
    npc_nathanos_team_meeting(Creature* creature) : ScriptedAI(creature) { }

    void QuestAccept(Player* player, Quest const* /*quest*/) override
    {
        Talk(0);
        player->SummonGameObject(GOB_BLIGHTCALLER_EASY_DEATH, 1577.965f, -4455.622f, 16.55939f, 0.f, QuaternionData(0.f, 0.f, 0.f, 1.f), 0, true);
    }
};

// 50769
struct quest_stormwind_extraction : public QuestScript
{
    quest_stormwind_extraction() : QuestScript("quest_stormwind_extraction") { }

    // Called when a quest objective data change
    void OnQuestObjectiveChange(Player* player, Quest const* /*quest*/, QuestObjective const& objective, int32 /*oldAmount*/, int32 /*newAmount*/) override
    {
        if (objective.ID == OBJECTIVE_STORMWIND_EXTRACTION_POTION)
            player->PlayConversation(CONVERSATION_STORMWIND_EXTRACTION_LETS_MOVE);
    }
};

// 135211 - Stormwind Extraction skyhorn eagle
struct npc_skyhorn_eagle : public ScriptedAI
{
    npc_skyhorn_eagle(Creature* creature) : ScriptedAI(creature) { }

    void OnSpellClick(Unit* clicker, bool& result) override
    {
        Player* player = clicker->ToPlayer();
        if (!player || player->GetQuestStatus(QUEST_STORMWIND_EXTRACTION) != QUEST_STATUS_INCOMPLETE)
        {
            result = false;
            return;
        }

        KillCreditMe(player);
        player->CastSpell(player, SPELL_START_SE_SCENARIO);
    }
};

void AddSC_orgrimmar()
{
    RegisterCreatureAI(npc_orgri_mission_orders_speak_sylvanas);
    RegisterSceneScript(scene_orgri_secret_weapon);
    RegisterCreatureAI(npc_orgri_mission_orders_meet_team);
    RegisterCreatureAI(npc_nathanos_team_meeting);
    RegisterQuestScript(quest_stormwind_extraction);
    RegisterCreatureAI(npc_skyhorn_eagle);
}
