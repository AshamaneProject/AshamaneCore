/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
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
#include "ScriptedGossip.h"


struct npc_94973 : public ScriptedAI
{
   npc_94973(Creature* creature) : ScriptedAI(creature) {  }

    bool GossipSelect(Player* player, uint32 menuId, uint32 gossipListId)
    {
        if (player->HasQuest(40244))
        {
            if (gossipListId == 0)
            {
                player->CastSpell(player, 205336, true);
                CloseGossipMenuFor(player);
            }
        }
        return false;
    }
};

void AddSC_highmountain()
{
    RegisterCreatureAI(npc_94973);
}
