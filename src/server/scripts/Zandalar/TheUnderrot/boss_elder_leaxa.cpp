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

#include "ScriptMgr.h"
#include "the_underrot.h"
#include "AreaTrigger.h"
#include "AreaTriggerAI.h"

enum Spells
{
    SPELL_TAINT_OF_GHUUN = 260685, // applied with all abilities except melee hit
    SPELL_BLOOD_BOLT = 260879,

    SPELL_CREEPING_ROT = 260894,
    //SPELL_CREEPING_ROT_TARGET_SELECTOR = 260889,
    SPELL_CREEPING_ROT_TRIGGER = 261496,
    SPELL_CREEPING_ROT_DOT = 261498,
    //SPELL_CREEPING_ROT_VISUAL = 260891,

    SPELL_SANGUINE_FEAST = 264753,

    SPELL_BLOOD_MIRROR = 264603,
    SPELL_BLOOD_MIRROR_MISSILE = 264609,
    SPELL_BLOOD_MIRROR_VISUAL = 272385,
};

enum Events
{
    EVENT_BLOOD_BOLT = 1,
    EVENT_CREEPING_ROT = 2,
    EVENT_BLOOD_MIRROR = 3,
    EVENT_SANGUINE_FEAST = 4,
};

enum Yells
{
    YELL_ENTER_COMBAT = 0,
    YELL_CREEPING_ROT = 1,
    YELL_FEAST = 2,
    YELL_BLOOD_MIRROR_EMOTE = 3,
    YELL_BLOOD_MIRROR_CAST = 6,
    YELL_KILLED = 4,
    YELL_KILL = 5,
};

struct boss_elder_leaxa : public BossAI
{
    boss_elder_leaxa(Creature* creature) : BossAI(creature, DATA_ELDER_LEAXA)
    {
        Initialize();
    }

    void Initialize()
    {
        events.ScheduleEvent(EVENT_BLOOD_BOLT, 1000);
        events.ScheduleEvent(EVENT_CREEPING_ROT, 12200);
        events.ScheduleEvent(EVENT_BLOOD_MIRROR, 15800);
        if (IsHeroic() || IsMythic())
            events.ScheduleEvent(EVENT_SANGUINE_FEAST, 6800);
    }

    void Reset() override
    {
        BossAI::Reset();
        events.Reset();
        Initialize();
        instance->SetBossState(DATA_ELDER_LEAXA, FAIL);
    }

    void EnterCombat(Unit* who) override
    {
        BossAI::EnterCombat(who);
        Talk(YELL_ENTER_COMBAT);
        instance->SetBossState(DATA_ELDER_LEAXA, IN_PROGRESS);
    }

    void JustDied(Unit* killer) override
    {
        BossAI::JustDied(killer);
        Talk(YELL_KILLED);
        instance->SetBossState(DATA_ELDER_LEAXA, DONE);
    }

    void KilledUnit(Unit* victim) override
    {
        if (victim->GetTypeId() == TYPEID_PLAYER)
            Talk(YELL_KILL);
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        while (uint32 eventID = events.ExecuteEvent())
        {
            switch (eventID)
            {
            case EVENT_SANGUINE_FEAST:
                DoCastRandom(SPELL_SANGUINE_FEAST, 100);
                events.DelayEvents(3000); // if antoher cast happens while jumping, no landing spell is cast
                events.ScheduleEvent(EVENT_SANGUINE_FEAST, 30000);
                break;
            case EVENT_BLOOD_BOLT:
                DoCastVictim(SPELL_BLOOD_BOLT);
                events.ScheduleEvent(EVENT_BLOOD_BOLT, 6100);
                break;
            case EVENT_CREEPING_ROT:
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 40, true))
                {
                    Talk(YELL_CREEPING_ROT);
                    me->FaceTargetAndStopMoving(target, 4000);
                    DoCast(SPELL_CREEPING_ROT);
                }
                events.ScheduleEvent(EVENT_CREEPING_ROT, 15800);
                break;
            case EVENT_BLOOD_MIRROR:
                Talk(YELL_BLOOD_MIRROR_EMOTE);
                Talk(YELL_BLOOD_MIRROR_CAST);
                DoCastSelf(SPELL_BLOOD_MIRROR);
                events.ScheduleEvent(EVENT_BLOOD_MIRROR, 47400);
                break;
            default:
                break;
            }
        }

        DoMeleeAttackIfReady();
    }

    //private
};

// 132398 Blood Wave Stalker
struct npc_blood_wave_stalker : public ScriptedAI
{
    npc_blood_wave_stalker(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        me->SetReactState(REACT_PASSIVE);
        me->CastSpell(me, SPELL_CREEPING_ROT_TRIGGER, true);
        MoveForward(40.0f);
    }

    void MoveForward(float distance)
    {
        Position movePos;
        float ori = me->GetOrientation();
        float x = me->GetPositionX() + distance * cos(ori);
        float y = me->GetPositionY() + distance * sin(ori);
        float z = me->GetPositionZ();
        me->UpdateGroundPositionZ(x, y, z);
        movePos = { x, y, z };
        me->GetMotionMaster()->MovePoint(1, movePos);
    }

    void UpdateAI(uint32 /*diff*/) override { }
};

// 134701 Blood Effigy
struct npc_blood_effigy : public ScriptedAI
{
    npc_blood_effigy(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        me->CastSpell(me, SPELL_BLOOD_MIRROR_VISUAL, true);
        me->GetScheduler().Schedule(2s, [this](TaskContext context)
        {
            DoCastVictim(SPELL_BLOOD_BOLT);
            context.Repeat();
        });
    }

    void UpdateAI(uint32 /*diff*/) override { }
};

// 17135
class at_creeping_rot : public AreaTriggerEntityScript
{
public:
    at_creeping_rot() : AreaTriggerEntityScript("at_creeping_rot") { }

    struct at_creeping_rotAI : AreaTriggerAI
    {
        at_creeping_rotAI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUnitEnter(Unit* unit) override
        {
            if (unit && unit->GetTypeId() == TYPEID_PLAYER)
                unit->CastSpell(unit, SPELL_CREEPING_ROT_DOT, true);
        }

        void OnUnitExit(Unit* unit) override
        {
            if (unit && unit->HasAura(SPELL_CREEPING_ROT_DOT))
                unit->RemoveAura(SPELL_CREEPING_ROT_DOT);
        }
    };

    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new at_creeping_rotAI(areatrigger);
    }
};

// 264603 - Blood Mirror
class spell_blood_mirror : public SpellScriptLoader
{
public:
    spell_blood_mirror() : SpellScriptLoader("spell_blood_mirror") { }

    class spell_blood_mirror_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_blood_mirror_SpellScript);

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
            {
                if (Unit* target = caster->GetAI()->SelectTarget(SELECT_TARGET_RANDOM, 0, 40, true))
                {
                    caster->CastSpell(target, SPELL_BLOOD_MIRROR_MISSILE, true);
                }
            }
        }

        void Register() override
        {
            OnEffectHit += SpellEffectFn(spell_blood_mirror_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_blood_mirror_SpellScript();
    }
};

// 260879 - Blood Bolt
class spell_blood_bolt : public SpellScriptLoader
{
public:
    spell_blood_bolt() : SpellScriptLoader("spell_blood_bolt") { }

    class spell_blood_bolt_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_blood_bolt_SpellScript);

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetExplTargetUnit();
            if (!caster || !target)
                return;
            caster->CastSpell(target, SPELL_TAINT_OF_GHUUN, true);
        }

        void Register() override
        {
            OnEffectHit += SpellEffectFn(spell_blood_bolt_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_blood_bolt_SpellScript();
    }
};

// 261498 - Creeping Rot
class spell_creeping_rot : public SpellScriptLoader
{
public:
    spell_creeping_rot() : SpellScriptLoader("spell_creeping_rot") { }

    class spell_creeping_rot_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_creeping_rot_AuraScript);

        void OnTick(AuraEffect const* aurEff)
        {
            if (Unit* target = GetTarget())
            {
                if (Unit* leaxa = target->FindNearestCreature(NPC_ELDER_LEAXA, 100))
                    leaxa->CastSpell(target, SPELL_TAINT_OF_GHUUN, true);
            }
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_creeping_rot_AuraScript::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_creeping_rot_AuraScript();
    }
};

void AddSC_boss_elder_leaxa()
{
    RegisterCreatureAI(boss_elder_leaxa);
    RegisterCreatureAI(npc_blood_wave_stalker);
    RegisterCreatureAI(npc_blood_effigy);
    new at_creeping_rot();
    new spell_blood_mirror();
    new spell_blood_bolt();
    new spell_creeping_rot();
}
