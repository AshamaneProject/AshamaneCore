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

#include "ScriptedEscortAI.h"

//
struct npc_talanji_arrival_escort : public npc_escortAI
{
    npc_talanji_arrival_escort(Creature* creature) : npc_escortAI(creature) { }

    void Reset() override { }

    void WaypointReached(uint32 waypointId) override
    {
        Player* player = GetPlayerForEscort();
        if (!player)
            return;

        switch (waypointId)
        {
            default:
                break;
        }
    }
};

void AddSC_zone_zuldazar()
{
    RegisterCreatureAI(npc_talanji_arrival_escort);
}
