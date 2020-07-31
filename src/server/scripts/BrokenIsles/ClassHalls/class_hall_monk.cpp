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
enum
{
    ///MONK Quest
    NPC_INITIATE_DA_NEL = 98519,
    QUEST_DA_NEL = 12103,
};


struct npc_initiate_da_nel : public ScriptedAI
{
    npc_initiate_da_nel(Creature* creature) : ScriptedAI(creature) { SayHi = false; }

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
        if (quest->GetQuestId() == QUEST_DA_NEL)
        {
            Talk(1, player);
            player->CastSpell(player, 194004, true);
            me->DespawnOrUnsummon(5000);
        }
    }
private:
    bool SayHi;
};


void AddSC_class_hall_monk()
{
    RegisterCreatureAI(npc_initiate_da_nel);
}
