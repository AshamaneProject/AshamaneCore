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
    ///Priest Quest
    QUEST_PRIESTLY_MATTERS = 40705,
};


struct npc_hooded_priestess : public ScriptedAI
{
    npc_hooded_priestess(Creature* creature) : ScriptedAI(creature) { SayHi = false; }

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
        if (quest->GetQuestId() == QUEST_PRIESTLY_MATTERS)
        {
            Talk(1, player);
            me->DespawnOrUnsummon(5000);
        }
    }
private:
    bool SayHi;
};

struct npc_calia_102343 : public ScriptedAI
{
    npc_calia_102343(Creature* creature) : ScriptedAI(creature) {  }

    bool GossipSelect(Player* player, uint32 menuId, uint32 gossipListId)
    {
        if (player->HasQuest(QUEST_PRIESTLY_MATTERS))
        {
            if (gossipListId == 0)
            {
                player->KilledMonsterCredit(102340);
                CloseGossipMenuFor(player);
                me->SummonCreature(102358, Position(2602.699951f, -534.164978f, 88.999901f, 4.55463f), TEMPSUMMON_MANUAL_DESPAWN);
            }
        }

        return false;
    }
};

void AddSC_class_hall_priest()
{
    RegisterCreatureAI(npc_hooded_priestess);
    RegisterCreatureAI(npc_calia_102343);
}
