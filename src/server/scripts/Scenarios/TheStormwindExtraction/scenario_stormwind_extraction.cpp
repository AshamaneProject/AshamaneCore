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
#include "Creature.h"
#include "GameObject.h"
#include "InstanceScript.h"
#include "Scenario.h"
#include "stormwind_extraction.h"

struct scenario_stormwind_extraction : public InstanceScript
{
    scenario_stormwind_extraction(InstanceMap* map) : InstanceScript(map) { }

    void OnPlayerEnter(Player* player) override
    {
        // Temp introduction fix
        player->GetScheduler().Schedule(2s, [player](TaskContext /*context*/)
        {
            player->GetScenario()->SendScenarioEvent(player, SCENARIO_EVENT_STORMWIND_INFILTRATION);
        });
    }

    void OnCompletedCriteriaTree(CriteriaTree const* tree)
    {
        if (tree->ID == CRITERIA_TREE_OPEN_SEWERS)
            HandleGameObject(GetObjectGuid(GOB_SEWER_ACCESS_GATE), true);
    }
};

void AddSC_scenario_stormwind_extraction()
{
    RegisterInstanceScript(scenario_stormwind_extraction, 1904);
}
