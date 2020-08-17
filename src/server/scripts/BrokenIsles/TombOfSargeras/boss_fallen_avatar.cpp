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

#include "AreaTrigger.h"
#include "AreaTriggerAI.h"
#include "ScriptedCreature.h"
#include "ScriptMgr.h"
#include "SpellAuras.h"
#include "SpellScript.h"
#include "InstanceScript.h"
#include "GameObject.h"
#include "PhaseShift.h"
#include "PhasingHandler.h"
#include "tomb_of_sargeras.h"

enum Spells
{
    //Stage One: A Slumber Disturbed
    SPELL_TOUCH_OF_SARGERAS = 239207,//?????? 14s 42s mythic 60
    SPELL_TOUCH_OF_SARGERAS_VISUAL = 234012,//239057 summon
    SPELL_RUPTURE_REALITIES = 239132,//???? to do 31s    60s    phase2 every 37s
    //SPELL_RUPTURE_REALITIES = 239132,235572
    //SPELL_RUPTURE_REALITIES = 239152, //????  236419 dmg  234090 visual
    SPELL_UNBOUND_CHAOS = 234059, //7s 35-60 s
    SPELL_UNBOUND_CHAOS_MARK = 239482,
    SPELL_SHADOWY_BLADES = 236571,//27s 30-46  236591/???? 241588
    SPELL_SHADOWY_BLADES_MOVETO = 236591,
    SPELL_SHADOWY_BLADES_DMG = 241588,
    SPELL_DESOLATE = 236494,//?? 13s-19s 11.4s
    //Maiden of Valor
    NPC_MAIDEN_OF_VALOR = 120437,
    SPELL_CORRUPTED_MATRIX = 233556,// 10s  40s
    SPELL_MATRIX_EMPOWERMENT = 233961,// add
    SPELL_CLEANSING_PROTOCOL = 233856,
    SPELL_MALFUNCTION = 233739,// on 233856 remove ,damage 25%hp
    //Stage Two: An Avatar Awakened
    SPELL_DARK_MARK = 239739,//???? mythic 31.6 ,21  every mythic 25  34s
    SPELL_RAIN_OF_THE_DESTROYER = 240396, //only mythic 15s  35s

    SPELL_RIPPLE_OF_DARKNESS = 236528,// on no one in range AOE
    SPELL_SEAR = 234179, //aura
    SPELL_INTRO = 239847,//????
    SPELL_ANNIHILATION = 235597,//PHASE_2 ??
    SPELL_CONSUME = 240594,//??

    GO_GROUND = 267934,
    NPC_CORRUPTED_BLADE = 119158,
};

enum Events
{
    EVENT_INTRO = 1,
    EVENT_ATTACK_RANGE = 2000,
};

struct boss_fallen_avatar : public BossAI
{
    boss_fallen_avatar(Creature* creature) : BossAI(creature, DATA_FALLEN_AVATAR) { Initialize(); }

    void Initialize()
    {
        PhaseStatus = PHASE_01;
        SetCombatMovement(false);
        //me->SetDisableGravity(true);
        IsLock = false;
    }

    void Reset() override
    {
        _Reset();
        Initialize();
        if (Creature* maidenofvalor = me->FindNearestCreature(NPC_MAIDEN_OF_VALOR, 150.0f, true))
            maidenofvalor->DespawnOrUnsummon();
        //if (!me->FindNearestGameObject(GO_GROUND, 500.0f))
        //    me->SummonGameObject(GO_GROUND, Position(5825.93f, -1216.87f, 2787.37f, 0.872664f), QuaternionData(), WEEK);
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        instance->DoDelayedConversation(5000, 4955);
    }

    void DoAction(int32 param)
    {
        switch (param)
        {
        case 1:
            SwitchPhase();
            break;
        }
    }

    void DamageTaken(Unit* /*attacker*/, uint32& damage) override
    {
        if (me->HealthWillBeBelowPctDamaged(20, damage))
            SwitchPhase();
    }

    void SwitchPhase()
    {
        if(PhaseStatus == PHASE_01)
        {
            PhaseStatus = PHASE_02;
            SetCombatMovement(true);
            //me->SetDisableGravity(false);
            if (GameObject* ground = me->FindNearestGameObject(GO_GROUND, 150.0f))
                ground->Delete();

            events.Reset();
            DoCastSelf(SPELL_ANNIHILATION);
            AddTimedDelayedOperation(3500, [this]() -> void
            {
                me->NearTeleportTo(Position(6621.16f, -794.8966f, 1519.918f, 2.9986f));
                instance->DoNearTeleportPlayers(Position(6561.1f, -791.82f, 1509.91f, 6.2429f));
                DoCastSelf(SPELL_ANNIHILATION);
            });
            AddTimedDelayedOperation(5000, [this]() -> void
            {
                //me->GetMotionMaster()->Clear();
                //me->GetMotionMaster()->MovePoint(0, Position(6561.1f, -791.82f, 1509.91f, 6.2429f), true);
                //me->GetMotionMaster()->MoveChase(me->SelectNearestPlayer());
                DoCastSelf(SPELL_SEAR);
                events.ScheduleEvent(SPELL_RUPTURE_REALITIES, 37s);
                events.ScheduleEvent(SPELL_DESOLATE, 19s);
                if (IsMythic())
                    events.ScheduleEvent(SPELL_DARK_MARK, 31s, 32s);
                else
                    events.ScheduleEvent(SPELL_DARK_MARK, 21s);
                if (IsMythic())
                    events.ScheduleEvent(SPELL_RAIN_OF_THE_DESTROYER, 15s);
            });
        }
    }

    void ScheduleTasks() override
    {
        PhaseStatus = PHASE_01;
        me->RemoveAurasDueToSpell(SPELL_INTRO);
        events.ScheduleEvent(SPELL_TOUCH_OF_SARGERAS, 14s, 15s);
        events.ScheduleEvent(SPELL_RUPTURE_REALITIES, 31s);
        events.ScheduleEvent(SPELL_UNBOUND_CHAOS, 7s);
        events.ScheduleEvent(SPELL_SHADOWY_BLADES, 27s);
        events.ScheduleEvent(SPELL_DESOLATE, 13s);
        events.ScheduleEvent(NPC_MAIDEN_OF_VALOR, 4s);

        //events.ScheduleEvent(SPELL_ANNIHILATION, 120s);
        //events.ScheduleEvent(SPELL_FEL_INFUSION, 5s);
        //events.ScheduleEvent(SPELL_CONSUME, 5s);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        /*
        for (auto threat : me->GetThreatManager().getThreatList())
            if (me->IsWithinCombatRange(threat->getTarget(), me->GetCombatReach()))
                me->RemoveAurasDueToSpell(SPELL_RIPPLE_OF_DARKNESS);
         */

        switch (eventId)
        {
        case SPELL_TOUCH_OF_SARGERAS:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
            {
                me->CastSpell(target1, SPELL_TOUCH_OF_SARGERAS, false);

                AddTimedDelayedOperation(2500, [this, target1]() -> void
                {
                    me->CastSpell(target1, SPELL_TOUCH_OF_SARGERAS_VISUAL, false);
                });
            }

            if(IsMythic())
                events.Repeat(60s);
            else
                events.Repeat(42s);
            break;
        }
        case SPELL_RUPTURE_REALITIES:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
                me->CastSpell(target1, SPELL_RUPTURE_REALITIES, false);
            for (uint8 i = 0; i < 5; ++i)
                me->SummonCreature(NPC_CORRUPTED_BLADE, me->GetRandomNearPosition(10.0f), TEMPSUMMON_MANUAL_DESPAWN, WEEK);

            if (PhaseStatus == PHASE_01)
                events.Repeat(60s);
            else
                events.Repeat(37s);
            break;
        }
        case SPELL_UNBOUND_CHAOS:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
            {
                me->CastSpell(target1, SPELL_UNBOUND_CHAOS, false);
                AddTimedDelayedOperation(500, [this, target1]() -> void
                {
                    me->CastSpell(target1, SPELL_UNBOUND_CHAOS_MARK, false);
                });
                AddTimedDelayedOperation(1000, [this, target1]() -> void
                {
                    me->CastSpell(target1, SPELL_UNBOUND_CHAOS_MARK, false);
                });
                AddTimedDelayedOperation(1500, [this, target1]() -> void
                {
                    me->CastSpell(target1, SPELL_UNBOUND_CHAOS_MARK, false);
                });
            }

            events.Repeat(35s);
            break;
        }
        case SPELL_SHADOWY_BLADES:
        {
            DoCast(SPELL_SHADOWY_BLADES);
            events.Repeat(30s);
            break;
        }
        case SPELL_DESOLATE:
        {
            DoCast(SPELL_DESOLATE);
            events.Repeat(11s, 12s);
            break;
        }
        case NPC_MAIDEN_OF_VALOR:
        {
            me->SummonCreature(NPC_MAIDEN_OF_VALOR, me->GetPositionWithDistInFront(25.0f), TEMPSUMMON_MANUAL_DESPAWN, WEEK);
            break;
        }
        case SPELL_DARK_MARK:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
                me->CastSpell(target1, SPELL_DARK_MARK, false);
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
                me->CastSpell(target1, SPELL_DARK_MARK, false);
            if (IsMythic())
                events.Repeat(25s);
            else
                events.Repeat(34s);
            break;
        }
        case SPELL_RAIN_OF_THE_DESTROYER:
        {
            DoCast(SPELL_RAIN_OF_THE_DESTROYER);
            events.Repeat(35s);
            break;
        }
        default:
            if (me->GetDistance2d(me->SelectNearestPlayer())>me->GetCombatReach())
                me->CastSpell(me, SPELL_RIPPLE_OF_DARKNESS, false);
            break;
        }
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->IsPlayer() && me->IsWithinDist(who, 25.0f, false) && !IsLock)
        {
            IsLock = true;
            instance->DoPlayConversation(4899);
            if (Creature* jidan = me->FindNearestCreature(120867, 50.0f, true))
            {
                AddTimedDelayedOperation(25000, [this, jidan]() -> void
                {
                    jidan->CastSpell(me, 240897, true);
                    me->RemoveAurasDueToSpell(SPELL_INTRO);
                    me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC));
                    me->NearTeleportTo(me->GetPositionWithDistInFront(20.0f));
                });
                AddTimedDelayedOperation(30000, [this, jidan]() -> void
                {
                    PhasingHandler::AddPhase(jidan, 180, true);
                });
                //jidan->DespawnOrUnsummon(30000);
            }
        }
    }

    void JustSummoned(Creature* summon) override
    {
        switch (summon->GetEntry())
        {
        case NPC_MAIDEN_OF_VALOR:
        {
            summon->SetFaction(me->GetFaction());
            uint64 health = (uint64)(me->GetMaxHealth()*0.5f);
            summon->SetMaxHealth(health);
            summon->SetHealth(health);
            break;
        }
        case NPC_CORRUPTED_BLADE:
        {
            summon->SetFaction(me->GetFaction());
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
            {
                AddTimedDelayedOperation(3000, [this, summon, target1]() -> void
                {
                    summon->CastSpell(target1, SPELL_SHADOWY_BLADES_MOVETO, false);
                });
                AddTimedDelayedOperation(5500, [this, summon, target1]() -> void
                {
                    summon->CastSpell(target1, SPELL_SHADOWY_BLADES_DMG, false);
                    summon->DespawnOrUnsummon();
                });
            }
            break;
        }
        }
    }
    /*

    */
    uint8 PhaseStatus;
    uint8 PHASE_01;
    uint8 PHASE_02;
    bool IsLock;
};

struct npc_maiden_of_valor_120437 : public ScriptedAI
{
    npc_maiden_of_valor_120437(Creature* creature) : ScriptedAI(creature) { }

    void JustDied(Unit* /*killer*/) override
    {
        if (Creature* boss = me->FindNearestCreature(NPC_FALLEN_AVATAR, 150.0f, true))
            boss->AI()->DoAction(1);
    }
    /*
    SPELL_CORRUPTED_MATRIX = 233556,// 10s  40s
    SPELL_MATRIX_EMPOWERMENT = 233961,// add
    SPELL_CLEANSING_PROTOCOL = 233856,
    SPELL_MALFUNCTION = 233739,// on 233856 remove ,damage 25%hp
    */
    void EnterCombat(Unit* /*victim*/)
    {
        events.ScheduleEvent(SPELL_CORRUPTED_MATRIX, 10s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_CORRUPTED_MATRIX:
            {
                DoCast(SPELL_CORRUPTED_MATRIX);
                events.Repeat(40s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }

    int8 IsLock;

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->IsPlayer() && me->IsWithinDist(who, 25.0f, false) && !IsLock)
        {
            IsLock = true;
            me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE));
        }
    }
};

struct npc_corrupted_blade_119158 : public ScriptedAI
{
    npc_corrupted_blade_119158(Creature* creature) : ScriptedAI(creature)
    {
        me->SetReactState(REACT_PASSIVE);
        SetCombatMovement(false);
        me->AddUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE));
    }

    void UpdateAI(uint32 diff) override { }
};

void AddSC_boss_fallen_avatar()
{
    RegisterCreatureAI(boss_fallen_avatar);
    RegisterCreatureAI(npc_maiden_of_valor_120437);
    RegisterCreatureAI(npc_corrupted_blade_119158);
}
