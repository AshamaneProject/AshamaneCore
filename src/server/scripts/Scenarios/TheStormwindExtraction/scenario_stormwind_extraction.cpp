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

#include "ScriptMgr.h"
#include "CombatAI.h"
#include "Creature.h"
#include "CreatureGroups.h"
#include "GameObject.h"
#include "InstanceScript.h"
#include "Scenario.h"
#include "stormwind_extraction.h"

struct scenario_stormwind_extraction : public InstanceScript
{
    scenario_stormwind_extraction(InstanceMap* map) : InstanceScript(map) { }

    void OnPlayerEnter(Player* player) override
    {
        SummonCreatureGroup(SUMMON_GROUP_LION_REST);
        SummonCreatureGroup(SUMMON_GROUP_TALANJI_ZUL_PRISON);

        // Temp introduction fix
        player->GetScheduler().Schedule(2s, [player](TaskContext /*context*/)
        {
            player->GetScenario()->SendScenarioEvent(player, SCENARIO_EVENT_STORMWIND_INFILTRATION);
        });
    }

    void OnCompletedCriteriaTree(CriteriaTree const* tree) override
    {
        if (tree->ID == CRITERIA_TREE_OPEN_SEWERS)
            HandleGameObject(GetObjectGuid(GOB_SEWER_ACCESS_GATE), true);
    }

    void SetData(uint32 type, uint32 value) override
    {
        if (type == SCENARIO_EVENT_ENTER_STOCKADE)
        {
            DespawnCreatureGroup(SUMMON_GROUP_LION_REST);
            SummonCreatureGroup(SUMMON_GROUP_INSIDE_PRISON);

            SummonCreatureGroup(SUMMON_GROUP_GUARD_ENTRANCE);
            SummonCreatureGroup(SUMMON_GROUP_GUARD_FIRST_ROOM);
        }
        else if (type == SCENARIO_EVENT_FIND_ROKHAN)
        {
            DoPlayConversation(CONVERSATION_PRISON_ENTRANCE);
            DoSendScenarioEvent(SCENARIO_EVENT_FIND_ROKHAN);
        }
    }

    void OnCreatureGroupWipe(uint32 creatureGroupId) override
    {
        if (creatureGroupId == SUMMON_GROUP_GUARD_ENTRANCE)
        {
            if (Creature* rokhan = GetRokhan())
            {
                // StartConversation 7042
                rokhan->GetScheduler().Schedule(2s, [](TaskContext context)
                {
                    GetContextUnit()->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                    GetContextUnit()->CastSpell(GetContextUnit(), SPELL_ROKHAN_SOLO_STEALTH, true);
                    GetContextUnit()->GetMotionMaster()->MovePoint(1, -8692.569336f, 905.782898f, 53.733604f);
                });
            }

            if (Creature* thalyssra = GetThalyssra())
            {
                thalyssra->GetScheduler().Schedule(5s, [this](TaskContext context)
                {
                    GetContextUnit()->GetMotionMaster()->MovePoint(1, -8743.606445f, 998.370361f, 44.149288f, 3.284534f);

                    if (CreatureGroup* group = GetCreatureGroup(SUMMON_GROUP_GUARD_FIRST_ROOM))
                        group->MoveGroupTo(-8747.977539f, 997.306824f, 44.148872f);
                });
            }
        }

        if (creatureGroupId == SUMMON_GROUP_GUARD_FIRST_ROOM)
        {
            if (Creature* thalyssra = GetThalyssra())
            {
                thalyssra->GetScheduler().Schedule(2s, [thalyssra](TaskContext /*context*/)
                {
                    thalyssra->AI()->DoAction(1);
                });
            }
        }
    }

private:
    Creature* GetRokhan()       { return GetCreature(NPC_ROKHAN); }
    Creature* GetThalyssra()    { return GetCreature(NPC_THALYSSRA); }
};

void AddSC_scenario_stormwind_extraction()
{
    RegisterInstanceScript(scenario_stormwind_extraction, 1904);
}
