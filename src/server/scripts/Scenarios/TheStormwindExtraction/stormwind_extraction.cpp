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

#include "GameObjectAI.h"
#include "Scenario.h"
#include "ScriptMgr.h"
#include "stormwind_extraction.h"

// 281484 - Sewer access portal
struct go_se_sewer_access_portal : public GameObjectAI
{
    go_se_sewer_access_portal(GameObject* go) : GameObjectAI(go) { }

    void Reset() override
    {
        go->GetScheduler().CancelAll();
        go->GetScheduler().Schedule(1s, [this](TaskContext context)
        {
            if (Player* player = go->SelectNearestPlayer(2.f))
                if (Scenario* scenario = player->GetScenario())
                    if (scenario->CheckCompletedCriteriaTree(CRITERIA_TREE_OPEN_SEWERS, player))
                    {
                        player->CastSpell(player, SPELL_TELEPORT_STOCKADE, true);
                        scenario->SendScenarioEvent(player, SCENARIO_EVENT_ENTER_STOCKADE);
                        return;
                    }

            context.Repeat();
        });
    }
};

void AddSC_stormwind_extraction()
{
    RegisterGameObjectAI(go_se_sewer_access_portal);
}
