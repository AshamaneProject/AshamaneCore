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
#include "the_underrot.h"
#include "AreaTrigger.h"
#include "AreaTriggerAI.h"

enum Spells
{
    SPELL_TAINT_OF_GHUUN = 260685, // applied with all abilities except melee hit
    SPELL_BLOOD_BOLT = 260879,

    SPELL_CREEPING_ROT = 260894,
    SPELL_CREEPING_ROT_TARGET_SELECTOR = 260889,
    SPELL_CREEPING_ROT_TRIGGER = 261496,
    SPELL_CREEPING_ROT_DOT = 261498,
    SPELL_CREEPING_ROT_VISUAL = 260891,

    SPELL_SANGUINE_FEAST = 264753,
    SPELL_SANGUINE_FEAST_TARGET_SELECTOR = 264747,
    SPELL_SANGUINE_FEAST_JUMP = 264753,

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

enum AnimKit
{
    AnimKitPreFight = 13325
};

struct boss_elder_leaxa : public BossAI
{
public:
    boss_elder_leaxa(Creature* creature) : BossAI(creature, DATA_ELDER_LEAXA)
    {
        Initialize();
    }

    int32 mirrorCount;

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
        //me->SetAIAnimKitId(AnimKit::AnimKitPreFight);
        mirrorCount = 1;
        BossAI::Reset();
        events.Reset();
        Initialize();
        instance->SetBossState(DATA_ELDER_LEAXA, FAIL);
    }

    void EnterCombat(Unit* who) override
    {
        //me->SetAIAnimKitId(0);
        BossAI::EnterCombat(who);
        Talk(YELL_ENTER_COMBAT);
        instance->SetBossState(DATA_ELDER_LEAXA, IN_PROGRESS);
        me->SetAIAnimKitId(0);
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
                Talk(YELL_FEAST);
                events.DelayEvents(1000);
                DoCastAOE(SPELL_SANGUINE_FEAST_TARGET_SELECTOR);
                events.ScheduleEvent(EVENT_SANGUINE_FEAST, 30000);
                break;
            case EVENT_BLOOD_BOLT:
                DoCastVictim(SPELL_BLOOD_BOLT);
                events.ScheduleEvent(EVENT_BLOOD_BOLT, 6100);
                break;
            case EVENT_CREEPING_ROT:
                // me->StopMovingAndAttacking(1000);  Might be needed because of buggy movement core side
                Talk(YELL_CREEPING_ROT);
                DoCastAOE(SPELL_CREEPING_ROT_TARGET_SELECTOR);
                events.ScheduleEvent(EVENT_CREEPING_ROT, 15800);
                break;
            case EVENT_BLOOD_MIRROR:
                Talk(YELL_BLOOD_MIRROR_EMOTE);
                Talk(YELL_BLOOD_MIRROR_CAST);
                me->CastCustomSpell(SPELL_BLOOD_MIRROR, SPELLVALUE_BASE_POINT0, std::min(mirrorCount, 3), me);
                if (IsMythic())
                    ++mirrorCount;
                events.ScheduleEvent(EVENT_BLOOD_MIRROR, 47400);
                break;
            default:
                break;
            }
        }

        DoMeleeAttackIfReady();
    }
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
        me->GetNearPoint2D(x, y, distance, ori);
        movePos = { x, y, z };
        me->GetMotionMaster()->MovePoint(1, movePos, false);
    }

    void UpdateAI(uint32 /*diff*/) override { }
};

// 134701 Blood Effigy
struct npc_blood_effigy : public ScriptedAI
{
    npc_blood_effigy(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        events.ScheduleEvent(EVENT_BLOOD_BOLT, 0);
        events.ScheduleEvent(EVENT_CREEPING_ROT, urand(3200, 5200));
        if (IsHeroic() || IsMythic())
            events.ScheduleEvent(EVENT_SANGUINE_FEAST, urand(6800, 8800));

        me->CastSpell(me, SPELL_BLOOD_MIRROR_VISUAL, true);
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
                events.DelayEvents(1000);
                DoCastAOE(SPELL_SANGUINE_FEAST_TARGET_SELECTOR);
                events.ScheduleEvent(EVENT_SANGUINE_FEAST, 30000);
                break;
            case EVENT_BLOOD_BOLT:
                DoCastVictim(SPELL_BLOOD_BOLT);
                events.ScheduleEvent(EVENT_BLOOD_BOLT, 2000);
                break;
            case EVENT_CREEPING_ROT:
                DoCastAOE(SPELL_CREEPING_ROT_TARGET_SELECTOR);
                events.ScheduleEvent(EVENT_CREEPING_ROT, 15800);
                break;
            default:
                break;
            }
        }

        DoMeleeAttackIfReady();
    }
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

// 260889 - Creeping Rot Target Selector
class spell_creeping_rot_target_selector : public SpellScript
{
    PrepareSpellScript(spell_creeping_rot_target_selector);

    void DoEffectHitTarget(SpellEffIndex /*effIndex*/)
    {
        if (Unit* target = GetHitUnit())
            GetCaster()->CastSpell(target, SPELL_CREEPING_ROT);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_creeping_rot_target_selector::DoEffectHitTarget, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 264747 - Sanguine Feast Target Selector
class spell_sanguine_feast_target_selector : public SpellScript
{
    PrepareSpellScript(spell_sanguine_feast_target_selector);

    void DoEffectHitTarget(SpellEffIndex /*effIndex*/)
    {
        if (Unit* target = GetHitUnit())
            GetCaster()->CastSpell(target, GetEffectValue());
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_sanguine_feast_target_selector::DoEffectHitTarget, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 260894 - Creeping Rot Summon
class spell_creeping_rot_summon : public SpellScript
{
    PrepareSpellScript(spell_creeping_rot_summon);

    void DoCast()
    {
        GetCaster()->CastSpell(GetCaster(), SPELL_CREEPING_ROT_VISUAL, true);
    }

    void Register() override
    {
        OnPrepare += SpellOnPrepareFn(spell_creeping_rot_summon::DoCast);
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

        // Guessed values from videos
        const Position spawnPoints[3] =
        {
            {875.113159f, 1240.381958f, 56.332645f},
            {879.703979f, 1224.49646f, 56.33368f},
            {858.541931f, 1221.745239f, 56.347778f}
        };

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            int32 spawnPointsIndex = irand(0, 2);
            for (int32 i = 0; i < GetEffectValue(); ++i)
                GetCaster()->CastSpell(spawnPoints[(spawnPointsIndex + i) % 3], SPELL_BLOOD_MIRROR_MISSILE, true);
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
            if (Unit* target = GetExplTargetUnit())
                GetCaster()->CastSpell(target, SPELL_TAINT_OF_GHUUN, true);
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

        void OnTick(AuraEffect const* /*aurEff*/)
        {
            if (Unit* target = GetTarget())
                if (Creature* leaxa = target->GetInstanceScript()->GetCreature(DATA_ELDER_LEAXA))
                    leaxa->CastSpell(target, SPELL_TAINT_OF_GHUUN, true);
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
    RegisterSpellScript(spell_creeping_rot_target_selector);
    RegisterSpellScript(spell_creeping_rot_summon);
    RegisterSpellScript(spell_sanguine_feast_target_selector);
    new at_creeping_rot();
    new spell_blood_mirror();
    new spell_blood_bolt();
    new spell_creeping_rot();
}
