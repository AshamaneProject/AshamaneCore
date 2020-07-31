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

enum WarlockClassHall
{
    // Creatures
    NPC_RITSSYN_FLAMESCOWL_103506           = 103506,

    // Texts
    RITSSYN_FLAMESCOWL_TEXT_00              = 0,
    RITSSYN_FLAMESCOWL_TEXT_01              = 1,

    // Quests
    QUEST_THE_SIXTH                         = 40716,
    QUEST_THE_NEW_BLOOD                     = 40729
};

struct npc_ritssyn_flamescowl_103506 : public ScriptedAI
{
    npc_ritssyn_flamescowl_103506(Creature* creature) : ScriptedAI(creature)
    {
        SayHi = false;
    }

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
            // Summon one door
            Talk(RITSSYN_FLAMESCOWL_TEXT_00, player);
        }
    }

    void QuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_THE_SIXTH)
        {
            Talk(RITSSYN_FLAMESCOWL_TEXT_01, player);
            me->DespawnOrUnsummon(5000);
        }
    }

private:

    bool SayHi;
};

void AddSC_class_hall_warlock()
{
    RegisterCreatureAI(npc_ritssyn_flamescowl_103506);
}
