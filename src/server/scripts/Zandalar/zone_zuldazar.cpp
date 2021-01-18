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

#include "SpellScript.h"
#include "SpellAuras.h"
#include "SpellAuraEffects.h"
#include "Player.h"
#include "ScriptedEscortAI.h"

#include "Creature.h"
#include "ScriptedCreature.h"
#include "ScriptMgr.h"
#include "CreatureAI.h"
#include "ScriptedGossip.h"

enum ZuldazarQuests
{
    QUEST_WELCOME_ZULDAZAR      = 46957,
    QUEST_RASTAKHAN             = 46930,

    QUEST_SPEAKER_OF_THE_HORDE  = 46931,
    OBJECTIVE_SUMMON_THE_HORDE  = 291969,

    QUEST_NEED_EACH_OTHER       = 52131,
};

enum ZuldazarSpells
{
    SPELL_TALANJI_EXPOSITION_CONVERSATION_1 = 261541,
    SPELL_TALANJI_EXPOSITION_CONVERSATION_2 = 261549,
    SPELL_TALANJI_EXPOSITION_KILL_CREDIT    = 265711,

    SPELL_RASTAKHAN_GREETINGS_SCENE         = 244534,

    SPELL_PREVIEW_TO_ZANDALAR               = 273387,
};

enum ZuldazarNpcs
{
    NPC_ZOLANI                      = 135441,
    NPC_FOLLOW_ZOLANI_KILL_CREDIT   = 120169,
};

// 132332
struct npc_talanji_arrival : public ScriptedAI
{
    npc_talanji_arrival(Creature* creature) : ScriptedAI(creature) { }

    void QuestAccept(Player* player, Quest const* /*quest*/) override
    {
        me->DestroyForPlayer(player);
    }
};

// 132661
struct npc_talanji_arrival_escort : public EscortAI
{
    npc_talanji_arrival_escort(Creature* creature) : EscortAI(creature) { }

    void IsSummonedBy(Unit* summoner) override
    {
        me->Mount(80358);
        Start(false, true, summoner->GetGUID());
        SetDespawnAtEnd(false);
        summoner->CastSpell(summoner, SPELL_TALANJI_EXPOSITION_CONVERSATION_1, true);
    }

    void LastWaypointReached() override
    {
        me->SetFacingTo(0.f);
        me->CastSpell(me, SPELL_TALANJI_EXPOSITION_KILL_CREDIT, true);

        if (Player* player = GetPlayerForEscort())
            player->CastSpell(player, SPELL_TALANJI_EXPOSITION_CONVERSATION_2, true);
    }
};

// 138912
struct npc_enforcer_pterrordax : public EscortAI
{
    npc_enforcer_pterrordax(Creature* creature) : EscortAI(creature) { }

    void IsSummonedBy(Unit* summoner) override
    {
        Player* player = summoner->ToPlayer();
        if (!player || player->GetQuestStatus(QUEST_RASTAKHAN) != QUEST_STATUS_INCOMPLETE)
        {
            me->ForcedDespawn();
            return;
        }

        KillCreditMe(player);
        me->SetSpeed(MOVE_RUN, 21.f);
        player->EnterVehicle(me);
        Start(false, true, player->GetGUID());
    }

    void LastWaypointReached() override
    {
        if (Player* player = GetPlayerForEscort())
            player->CastSpell(player, SPELL_RASTAKHAN_GREETINGS_SCENE, true);
    }
};

// 120740
struct npc_rastakhan_zuldazar_arrival : public ScriptedAI
{
    npc_rastakhan_zuldazar_arrival(Creature* creature) : ScriptedAI(creature) { }

    void QuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_SPEAKER_OF_THE_HORDE)
            player->SummonCreature(NPC_ZOLANI, -1100.689941f, 817.934021f, 497.243011f, 6.062160f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000, true);
    }
};

// 135441
struct npc_soth_zolani : public EscortAI
{
    npc_soth_zolani(Creature* creature) : EscortAI(creature) { }

    bool GossipHello(Player* player) override
    {
        //Zolani at the beginning shouldn't start running through the air
        if (player->hasQuest(46931))
        {
            SetDespawnAtEnd(false);
            Start(false, false, player->GetGUID());
            Talk(0);
        }

        return false;
    }

    void LastWaypointReached() override
    {
        if (Player* player = GetPlayerForEscort())
        {
            Talk(1);
            player->KilledMonsterCredit(NPC_FOLLOW_ZOLANI_KILL_CREDIT);
            me->ForcedDespawn(10000);
        }
    }
};

// 122690
struct npc_brillin_the_beauty : public ScriptedAI
{
    npc_brillin_the_beauty(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
            if (player->GetDistance(me) < 10.f)
                if (player->GetQuestStatus(QUEST_SPEAKER_OF_THE_HORDE) == QUEST_STATUS_INCOMPLETE)
                    if (player->GetQuestObjectiveCounter(OBJECTIVE_SUMMON_THE_HORDE) != 0)
                        KillCreditMe(player);
    }
};

// 130984
struct npc_natal_hakata : public ScriptedAI
{
    npc_natal_hakata(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
            if (player->GetDistance(me) < 10.f)
                if (player->GetQuestStatus(QUEST_SPEAKER_OF_THE_HORDE) == QUEST_STATUS_INCOMPLETE)
                    if (player->GetQuestObjectiveCounter(OBJECTIVE_SUMMON_THE_HORDE) != 0)
                        KillCreditMe(player);
    }
};

// 131443
struct npc_telemancer_oculeth_zuldazar : public ScriptedAI
{
    npc_telemancer_oculeth_zuldazar(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
            if (player->GetDistance(me) < 10.f)
                if (player->GetQuestStatus(QUEST_SPEAKER_OF_THE_HORDE) == QUEST_STATUS_INCOMPLETE)
                    if (player->GetQuestObjectiveCounter(OBJECTIVE_SUMMON_THE_HORDE) != 0)
                        player->KilledMonsterCredit(135435);
    }
};

// 133050
struct npc_talanji_great_seal : public ScriptedAI
{
    npc_talanji_great_seal(Creature* creature) : ScriptedAI(creature) { }

    void QuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_NEED_EACH_OTHER)
            player->CastSpell(player, SPELL_PREVIEW_TO_ZANDALAR, true);
    }
};

// 255588 - Rastari Skull Whistle
class spell_generic_rastari_skull_whistle : public SpellScript
{
    PrepareSpellScript(spell_generic_rastari_skull_whistle);

    void DoCast()
    {
        if (Player* caster = GetCaster()->ToPlayer())
            caster->KilledMonsterCredit(129204);
    }

    void Register() override
    {
        AfterCast += SpellCastFn(spell_generic_rastari_skull_whistle::DoCast);
    }
};

//
class npc_ata_the_winglord_offensively_defence : public EscortAI
{
public:
    npc_ata_the_winglord_offensively_defence(Creature* creature) : EscortAI(creature)
    {
        me->SetCanFly(true);
        me->SetSpeed(MOVE_FLIGHT, 26);
        me->SetReactState(REACT_PASSIVE);
        me->AddUnitFlag(UNIT_FLAG_IMMUNE_TO_NPC);
    }

    void OnCharmed(bool /*apply*/) override
    {
        // Make sure the basic cleanup of OnCharmed is done to avoid looping problems
        if (me->NeedChangeAI)
            me->NeedChangeAI = false;
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
        if (Player* player = who->ToPlayer())
            player->KilledMonsterCredit(126822);
        Start(false, true, who->GetGUID());
    }
};

class npc_ata_the_winglord_paku_master_of_winds : public EscortAI
{
public:
    npc_ata_the_winglord_paku_master_of_winds(Creature* creature) : EscortAI(creature)
    {
        me->SetCanFly(true);
        me->SetSpeed(MOVE_FLIGHT, 26);
        me->SetReactState(REACT_PASSIVE);
      //  me->AddUnitFlag(UNIT_FLAG_IMMUNE_TO_NPC);
    }

    void OnCharmed(bool /*apply*/) override
    {
        // Make sure the basic cleanup of OnCharmed is done to avoid looping problems
        if (me->NeedChangeAI)
            me->NeedChangeAI = false;
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
        if (Player* player = who->ToPlayer())
            player->KilledMonsterCredit(127414);
        Start(false, true, who->GetGUID());
    }
};

class npc_pterrordax_paku_master_of_winds : public EscortAI
{
public:
    npc_pterrordax_paku_master_of_winds(Creature* creature) : EscortAI(creature)
    {
        me->SetCanFly(true);
        me->SetReactState(REACT_PASSIVE);
        me->AddUnitFlag(UNIT_FLAG_IMMUNE_TO_NPC);
    }

    void OnCharmed(bool /*apply*/) override
    {
        // Make sure the basic cleanup of OnCharmed is done to avoid looping problems
        if (me->NeedChangeAI)
            me->NeedChangeAI = false;
    }

   /* void WaypointReached(uint32 waypointId, uint32 pathId) override
    {
        if (waypointId == 11)
            me->ForcedDespawn();
    }*/

    void EnterEvadeMode(EvadeReason /*why*/) override { }

    void IsSummonedBy(Unit* summoner) override
    {
        if (summoner)
        {
            // me->GetScheduler().Schedule(1s, [this, summoner](TaskContext /*context*/)
            summoner->CastSpell(me, 46598);
            me->SetSpeed(MOVE_RUN, 26);
        }
    }

    void PassengerBoarded(Unit* who, int8 /*seatId*/, bool /*apply*/) override
    {
        if (Player* player = who->ToPlayer())
            player->KilledMonsterCredit(127512);
        Start(false, true, who->GetGUID());
    }


};

enum Spells
{
    SPELL_CALL_PTERRORDAX = 281048
};

//127377
struct npc_paku : public ScriptedAI
{
    npc_paku(Creature* pCreature) : ScriptedAI(pCreature)
    {
    }

    void Reset() override
    {
        me->GetScheduler().Schedule(1s, [this](TaskContext context)
        {
            std::list<Player*> players;
            me->GetPlayerListInGrid(players, 75.0f);

            for (Player* player : players)
            {
                if (player->GetPositionZ() <= 400 && !player->IsMounted() && !player->IsOnVehicle() && player->HasQuest(47440))
                {
                    Talk(0);
                    player->CastSpell(player, SPELL_CALL_PTERRORDAX);
                }
            }

            context.Repeat();
        });
    }

    bool GossipHello(Player* player) override
    {
        player->KilledMonsterCredit(127377);
        return false;
    }
};

class spell_rastari_skull_whistle : public SpellScript
{
	PrepareSpellScript(spell_rastari_skull_whistle);

	void HandleHitTarget(SpellEffIndex /*effIndex*/)
	{
		//if (Creature* target = GetHitCreature())
			if (Player* player = GetCaster()->ToPlayer())
				player->KilledMonsterCredit(129204);
	}

	void Register() override
	{
		OnEffectHitTarget += SpellEffectFn(spell_rastari_skull_whistle::HandleHitTarget, EFFECT_1, SPELL_EFFECT_DUMMY);
	}
};





void AddSC_zone_zuldazar()
{
    RegisterCreatureAI(npc_talanji_arrival);
    RegisterCreatureAI(npc_talanji_arrival_escort);
    RegisterCreatureAI(npc_enforcer_pterrordax);
    RegisterCreatureAI(npc_rastakhan_zuldazar_arrival);
    RegisterCreatureAI(npc_soth_zolani);
    RegisterCreatureAI(npc_brillin_the_beauty);
    RegisterCreatureAI(npc_natal_hakata);
    RegisterCreatureAI(npc_telemancer_oculeth_zuldazar);
    RegisterCreatureAI(npc_talanji_great_seal);

    RegisterCreatureAI(npc_ata_the_winglord_offensively_defence);

    RegisterCreatureAI(npc_ata_the_winglord_paku_master_of_winds);
    RegisterCreatureAI(npc_pterrordax_paku_master_of_winds);
    RegisterCreatureAI(npc_paku);

    RegisterSpellScript(spell_rastari_skull_whistle);
    RegisterSpellScript(spell_generic_rastari_skull_whistle);
}
