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

#include "ScriptedEscortAI.h"

 // 197180
struct npc_vault_of_the_wardens_sledge_or_crusher : public ScriptedAI
{
    npc_vault_of_the_wardens_sledge_or_crusher(Creature* creature) : ScriptedAI(creature) { }

    enum Quest
    {
        QUEST_STOP_GULDAN_DMG_SPEC = 38723,
        QUEST_STOP_GULDAN_TANK_SPEC = 40253,
    };

    void EnterCombat(Unit*) override
    {

    }

    void JustDied(Unit* /*killer*/) override
    {
        std::list<Player*> players;
        me->GetPlayerListInGrid(players, 50.0f);

        for (Player* player : players)
        {
            player->ForceCompleteQuest(QUEST_STOP_GULDAN_DMG_SPEC);
            player->ForceCompleteQuest(QUEST_STOP_GULDAN_TANK_SPEC);
        }
    }
};

class npc_vault_of_the_wardens_vampiric_felbat : public npc_escortAI
{
public:
    npc_vault_of_the_wardens_vampiric_felbat(Creature* creature) : npc_escortAI(creature)
    {
        me->SetCanFly(true);
        me->SetSpeed(MOVE_FLIGHT, 26);
        me->SetReactState(REACT_PASSIVE);
        me->SetMovementAnimKitId(3);
        me->SetSpeed(MOVE_FLIGHT, 75);
    }

    void OnCharmed(bool /*apply*/) override
    {
        // Make sure the basic cleanup of OnCharmed is done to avoid looping problems
        if (me->NeedChangeAI)
            me->NeedChangeAI = false;
    }

    void LastWaypointReached() override
    {
        if (Player* rider = me->GetOwner()->ToPlayer())
        {
            rider->KilledMonsterCredit(96659);
        }
    }

    void EnterEvadeMode(EvadeReason /*why*/) override { }

    void IsSummonedBy(Unit* summoner) override
    {
        if (summoner)
        {
            // me->GetScheduler().Schedule(1s, [this, summoner](TaskContext /*context*/)
            summoner->CastSpell(me, 46598);
        }
    }

    void PassengerBoarded(Unit* who, int8 /*seatId*/, bool /*apply*/) override
    {
        Start(false, true, who->GetGUID());
    }
};

void AddSC_zone_vault_of_wardens()
{
    RegisterCreatureAI(npc_vault_of_the_wardens_sledge_or_crusher);
    RegisterCreatureAI(npc_vault_of_the_wardens_vampiric_felbat);
}
