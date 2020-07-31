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
#include "GameObject.h"
#include "ScriptMgr.h"
#include "halls_of_valor.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Map.h"

enum hymdallSpells
{
    SPELL_DANCING_BLADE              = 193235,
    SPELL_BLOODLETTING_SWEEP         = 193083,
    SPELL_HORN_VALOR                 = 191284,
    SPELL_STATIC_FIELD               = 193260,
    SPELL_STORM_BREATH_AT            = 188404,
    SPELL_STORM_BREATH_AT_SUMMON     = 192959,
};

enum hymdallEvents
{
    EVENT_DANCING_BLADE = 1,
    EVENT_BLOODLETTING_SWEEP,
    EVENT_HORN_VALOR,
    EVENT_DRAKE_TWO,
};

enum hymdallSays
{
    SAY_COMBAT      = 0,
    SAY_DRAKES      = 1,
    SAY_HORN        = 2,
    SAY_WEEKNESS    = 3,
    SAY_WIPE        = 5,
    SAY_DIED        = 6,
};

/* using hardcoded guids wouldn't be clean
std::list<int> firstTriggerLineIntGuids = { 20529995, 20530019, 20530018, 20530016, 20530015, 20530010, 20529992, 20529991, 20529984, 20529983, 20529980, 20529977, 20529976, 20529975, 20530000, 20529981, 20530020, 20529995 };
std::list<int> secondTriggerLineIntGuids = { 20530045, 20530027, 20530013, 20530012, 20530009, 20530006, 20530003, 20529998, 20529997, 20529990, 20529989, 20529988, 20529987, 20529985, 20529982, 20529979, 20529974 };
std::list<int> thridTriggerLineIntGuids = { 20530044, 20530043, 20530041, 20530039, 20530038, 20530037, 20530036, 20530034, 20530033, 20530032, 20530031, 20530030, 20530028, 20530026, 20530025, 20530024, 20530022 };
*/

// pos 94968
Position const stormDrakeSpawn[6] =
{
    { 3566.12f, 675.0f,  626.44f, 4.71f },
    { 3566.12f, 383.00f, 626.44f, 1.60f },
    { 3534.45f, 675.02f, 626.44f, 4.71f },
    { 3534.45f, 383.00f, 626.44f, 1.60f },
    { 3502.45f, 675.04f, 626.44f, 4.71f },
    { 3502.45f, 383.00f, 626.44f, 1.60f }
};

// 98542
struct boss_hymdall : public BossAI
{
    boss_hymdall(Creature* creature) : BossAI(creature, DATA_HYMDALL) { }

    void Reset() override
    {
        _Reset();

        spawn = 0;

        drakeGUID = ObjectGuid::Empty;
        selectedPosition = false;
    }

    void EnterCombat(Unit* /*who*/) override
    {
        _EnterCombat();
        Talk(SAY_COMBAT);

        events.ScheduleEvent(EVENT_DANCING_BLADE, 16 * IN_MILLISECONDS); // 22
        events.ScheduleEvent(EVENT_BLOODLETTING_SWEEP, 24 * IN_MILLISECONDS);
        events.ScheduleEvent(EVENT_HORN_VALOR, 15 * IN_MILLISECONDS);
    }

    void JustSummoned(Creature* summon) override
    {
        BossAI::JustSummoned(summon);

        if (summon->GetEntry() == NPC_DANCING_BLADE)
        {
            summon->SetFaction(me->GetFaction());
            summon->SetReactState(REACT_PASSIVE);
            summon->AddUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC | UNIT_FLAG_NOT_SELECTABLE));
        }
    }

    void DamageTaken(Unit* attacker, uint32& damage) override
    {
        if (me->GetMaxHealth() * 0.1 >= (me->GetHealth() - damage))
        {
            _JustDied();

            damage = 0;
            me->SetHealth(me->GetMaxHealth());
            me->SetFaction(35);
            DoStopAttack();
            instance->DoCombatStopOnPlayers();

            me->RemoveAllAuras();
            me->RemoveAllAreaTriggers();

            instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
            instance->SetBossState(DATA_HYMDALL, DONE);
            instance->UpdateEncounterStateForKilledCreature(me->GetEntry(), me);

            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MovePoint(1, { 3502.79f, 529.042f, 616.813f, 0.0f });

            AddTimedDelayedOperation(8000, [this, attacker]() -> void
            {
                me->SetFacingTo(0.0f);

                me->SetStateAnimId(ANIM_KNEEL_LOOP);

                me->SummonGameObject(GOB_HYMDALLS_CACHE, 3509.2f, 528.97f, 616.73f, 0.0f, QuaternionData(), false);

                instance->DoPlayConversation(1185);
            });

        }
    }

    void EnterEvadeMode(EvadeReason why)
    {
        summons.DespawnAll();

        if (me->GetFaction() != 35)
        {
            Talk(SAY_WIPE);
            BossAI::EnterEvadeMode();
            return;
        }
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_DANCING_BLADE:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        me->CastSpell(target, SPELL_DANCING_BLADE, false);

                    events.ScheduleEvent(EVENT_DANCING_BLADE, 18 * IN_MILLISECONDS);
                    break;
                case EVENT_BLOODLETTING_SWEEP:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        me->CastSpell(target, SPELL_BLOODLETTING_SWEEP, false);

                    Talk(SAY_WEEKNESS);

                    events.ScheduleEvent(EVENT_BLOODLETTING_SWEEP, 24 * IN_MILLISECONDS);
                    break;
                case EVENT_DRAKE_TWO:
                    newDrakePos = lastDrakePos += 2;
                    if (newDrakePos > 5)
                        newDrakePos = 0;
                    if (Creature* drake = me->SummonCreature(97788, stormDrakeSpawn[newDrakePos], TEMPSUMMON_TIMED_DESPAWN, 20000))
                    {
                        if (Creature* rider = me->SummonCreature(94968, stormDrakeSpawn[newDrakePos], TEMPSUMMON_TIMED_DESPAWN, 20000))
                            rider->CastSpell(drake, 46598, true);
                    }
                    break;
                case EVENT_HORN_VALOR:
                    me->CastSpell(me, SPELL_HORN_VALOR, true);

                    Talk(SAY_DRAKES);
                    Talk(SAY_HORN);

                    spawn = urand(0, 5);

                    if (Creature* drake = me->SummonCreature(97788, stormDrakeSpawn[spawn], TEMPSUMMON_TIMED_DESPAWN, 20000))
                    {
                        if (Creature* rider = me->SummonCreature(94968, stormDrakeSpawn[spawn], TEMPSUMMON_TIMED_DESPAWN, 20000))
                            rider->CastSpell(drake, 46598, true);

                        lastDrakePos = spawn;
                        drakeGUID = drake->GetGUID();
                        drake->SetCanFly(true);
                        drake->SetWalk(false);
                    }

                    events.ScheduleEvent(EVENT_HORN_VALOR, 32 * IN_MILLISECONDS);
                    events.ScheduleEvent(EVENT_DRAKE_TWO, 3000);
                    break;

                default:
                    break;
            }
        }

        DoMeleeAttackIfReady();
    }

    private:
        std::list<Creature*> creatureList;
        uint32 spawn;
        ObjectGuid drakeGUID;
        uint32 lastDrakePos;
        bool selectedPosition;
        int newDrakePos;
};

// SpellId 188404
// 9677
struct areatrigger_storm_breath : AreaTriggerAI
{
    areatrigger_storm_breath(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUnitEnter(Unit* unit) override
    {
        if (Unit* caster = at->GetCaster())
            if (!unit->HasAura(SPELL_STATIC_FIELD) && caster->IsValidAttackTarget(unit))
                caster->CastSpell(unit, SPELL_STATIC_FIELD, true);
    }

    void OnUnitExit(Unit* unit) override
    {
        unit->RemoveAurasDueToSpell(SPELL_STATIC_FIELD);
    }
};

// SpellId 193214
// 9700
struct areatrigger_dancing_blade : AreaTriggerAI
{
    areatrigger_dancing_blade(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    enum Spells
    {
        SPELL_DANCING_BLADE_DAMAGE  = 193234
    };

    void OnUnitEnter(Unit* unit) override
    {
        if (Unit* caster = at->GetCaster())
            if (caster->IsValidAttackTarget(unit))
                caster->CastSpell(unit, SPELL_DANCING_BLADE_DAMAGE, true);
    }

    void OnUnitExit(Unit* unit) override
    {
        unit->RemoveAurasDueToSpell(SPELL_DANCING_BLADE_DAMAGE);
    }
};

// 94968
struct hymdall_storm_drake : public ScriptedAI
{
    hymdall_storm_drake(Creature* pCreature) : ScriptedAI(pCreature)
    {
        me->SetReactState(REACT_PASSIVE);
        me->SetFlying(true);
        me->SetSpeed(MOVE_FLIGHT, 3.5f);
    }

    enum Events : uint32
    {
        EVENT_MOVE_FORWARD = 1,
    };

    void IsSummonedBy(Unit* summoner) override
    {
        AddTimedDelayedOperation(1000, [this]() -> void
        {
            Position l_Pos = me->GetPosition();

            l_Pos.m_positionX += 75.0f * std::cos(l_Pos.GetOrientation());
            l_Pos.m_positionY += 75.0f * std::sin(l_Pos.GetOrientation());
            l_Pos.m_positionZ -= 5.0f;

            me->SetCanFly(true);
            me->SetSpeed(MOVE_FLIGHT, 3.5f);

            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MovePoint(1, l_Pos);
        });
    }

    void MovementInform(uint32 type, uint32 id) override
    {
        if (type == POINT_MOTION_TYPE)
        {
            if (id == 1)
                DoCast(SPELL_STORM_BREATH_AT);
            if (id == 2)
                me->DespawnOrUnsummon();
        }
    }


    void OnSpellCasted(SpellInfo const* spellInfo) override
    {
        Position l_Pos = me->GetPosition();

        l_Pos.m_positionX += 150.0f * std::cos(l_Pos.GetOrientation());
        l_Pos.m_positionY += 150.0f * std::sin(l_Pos.GetOrientation());

        me->GetMotionMaster()->Clear();
        me->GetMotionMaster()->MovePoint(2, l_Pos);

        CheckInFront();

        me->SetCanFly(true);
        me->SetSpeed(MOVE_FLIGHT, 3.5f);
    }

    void CheckInFront()
    {
        std::list<Creature*> targetList = me->FindNearestCreatures(NPC_STATIC_FIELD, 150.0f);
        for (Creature* target : targetList)
        {
            targetList.remove_if([this](Creature* p_Creature) -> bool
            {
                float arc = 7.0f;

                if (!me->isInFront(p_Creature, M_PI / arc))
                    return true;

                return false;
            });
        }
        targetList.sort(Trinity::ObjectDistanceOrderPred(me));

        int delay = 50;
        int count = 0;
        for (Creature* validTarget : targetList)
        {
            AddTimedDelayedOperation(delay, [this, validTarget]() -> void
            {
                if (!validTarget->HasAura(SPELL_STORM_BREATH_AT_SUMMON))
                    validTarget->AddAura(SPELL_STORM_BREATH_AT_SUMMON);
            });
            count++;
            // todo check speed
            delay += 500;

            if (count >= 5 && count <= 13)
                delay -= 300;
        }
    }
};

void AddSC_boss_hymdall()
{
    RegisterCreatureAI(boss_hymdall);
    RegisterAreaTriggerAI(areatrigger_storm_breath);
    RegisterAreaTriggerAI(areatrigger_dancing_blade);
    RegisterCreatureAI(hymdall_storm_drake);
}
