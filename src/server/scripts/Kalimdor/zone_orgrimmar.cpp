/*
 * Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
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

enum OrgrimmarQuests
{
    QUEST_MISSION_ORDERS    = 51443,
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
                        KillCreditMe(player);
                    }
    }
};

void AddSC_orgrimmar()
{
    RegisterCreatureAI(npc_orgri_mission_orders_speak_sylvanas);
    RegisterSceneScript(scene_orgri_secret_weapon);
    RegisterCreatureAI(npc_orgri_mission_orders_meet_team);
}
