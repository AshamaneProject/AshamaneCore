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

#include "Player.h"
#include "ScriptedEscortAI.h"

enum ZuldazarQuests
{
    QUEST_WELCOME_ZULDAZAR  = 46957
};

enum ZuldazarSpells
{
    SPELL_TALANJI_EXPOSITION_CONVERSATION_1 = 261541,
    SPELL_TALANJI_EXPOSITION_CONVERSATION_2 = 261549,
    SPELL_TALANJI_EXPOSITION_KILL_CREDIT    = 265711,

    SPELL_RASTAKHAN_GREETINGS_SCENE         = 244534,
};

// 132661
struct npc_talanji_arrival_escort : public npc_escortAI
{
    npc_talanji_arrival_escort(Creature* creature) : npc_escortAI(creature) { }

    void IsSummonedBy(Unit* summoner)
    {
        me->Mount(80358);
        Start(false, true, summoner->GetGUID());
        SetDespawnAtEnd(false);
        summoner->CastSpell(summoner, SPELL_TALANJI_EXPOSITION_CONVERSATION_1, true);
    }

    void LastWaypointReached() override
    {
        me->SetFacingTo(0.f);

        if (Player* player = GetPlayerForEscort())
        {
            player->CastSpell(player, SPELL_TALANJI_EXPOSITION_CONVERSATION_2, true);
            player->CastSpell(player, SPELL_TALANJI_EXPOSITION_KILL_CREDIT, true);
        }
    }
};

// 138912
struct npc_enforcer_pterrordax : public npc_escortAI
{
    npc_enforcer_pterrordax(Creature* creature) : npc_escortAI(creature) { }

    void IsSummonedBy(Unit* summoner)
    {
        if (Player* player = summoner->ToPlayer())
        {
            KillCreditMe(player);
            me->SetSpeed(MOVE_RUN, 21.f);
            player->EnterVehicle(me);
            Start(false, true, player->GetGUID());
        }
    }

    void LastWaypointReached() override
    {
        if (Player* player = GetPlayerForEscort())
            player->CastSpell(player, SPELL_RASTAKHAN_GREETINGS_SCENE, true);
    }
};

void AddSC_zone_zuldazar()
{
    RegisterCreatureAI(npc_talanji_arrival_escort);
    RegisterCreatureAI(npc_enforcer_pterrordax);
}
