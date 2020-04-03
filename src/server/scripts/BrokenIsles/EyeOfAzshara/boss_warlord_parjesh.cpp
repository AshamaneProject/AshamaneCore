/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "AreaTriggerTemplate.h"
#include "AreaTriggerAI.h"
#include "AreaTrigger.h"
#include <G3D/Vector3.h>
#include "eye_of_azshara.h"

enum Spells
{
    // Warlord Parjesh
    SPELL_ENERGIZE              = 202143,
    SPELL_CRASHING_WAVE         = 191900,
    SPELL_CRASHING_WAVE_DMG     = 191919,
    SPELL_QUICKSAND             = 192053,
    SPELL_QUICKSAND_5_YARDS     = 192040,
    SPELL_QUICKSAND_10_YARDS    = 192042,
    SPELL_QUICKSAND_15_YARDS    = 192043,
    SPELL_QUICKSAND_20_YARDS    = 192046,
    SPELL_QUICKSAND_25_YARDS    = 192047,
    SPELL_IMPALING_SPEAR        = 191946,
    SPELL_IMPALING_SPEAR_MARK   = 192094,
    SPELL_IMPALING_SPEAR_KNOCK  = 193183,
    SPELL_IMPALING_SPEAR_DMG    = 191977,
    SPELL_IMPALING_SPEAR_ADD    = 191975,
    SPELL_THROW_SPEAR           = 192131,
    SPELL_CALL_REINFORCEMENTS   = 196563,
    SPELL_CALL_REINFORCEMENTS_M = 192072, // Summon The melee add
    SPELL_CALL_REINFORCEMENTS_C = 192073, // Summon the caster add
    SPELL_ENRAGE                = 197064,
    SPELL_EMPTY_ENERGY          = 202146,

    // HateCoil ShellBreaker
    SPELL_BELLOWING_ROAR        = 192135,
    SPELL_MOTIVATED             = 197495,

    // HateCoil Crestrider
    SPELL_LIGHTING_STRIKE       = 192138,
    SPELL_RESTORATION           = 197502,
};

enum Events
{
    // Warlord Parjesh
    EVENT_CALL_REINFORCEMENTS   = 1,
    EVENT_THROW_SPEAR           = 2,
    EVENT_IMPALING_SPEAR        = 3,
    EVENT_CRASHING_WAVE         = 4,

    // Hatecoil ShellBreaker
    EVENT_BELLOWING_ROAR        = 5,

    // Hatecoil Crestrider
    EVENT_LIGHTING_STRIKE       = 6,
    EVENT_RESTORATION           = 7,
};

enum Adds
{
    NPC_HATECOIL_SHELLBREAKER   = 97264,
    NPC_HATECOIL_CRESTRIDER     = 97269,
};

enum Says
{
    SAY_INTRO           = 0,
    SAY_AGGRO           = 1,
    SAY_REINFORCEMENTS  = 2,
    SAY_IMPALING_SPEAR  = 3,
    SAY_ENRAGE          = 4,
    SAY_KILL            = 5,
    SAY_DEATH           = 6,
};

enum Actions
{
    ACTION_INTRO    = 1,
};

enum AreaTriggers
{
    AREA_CRASHING_WAVE_MOVE = 4863,
    AREA_CRASHING_WAVE_DMG  = 4888,
};

G3D::Vector3 wave_FinalPos(0,0,0);

class boss_warlord_parjesh : public CreatureScript
{
    public:
        boss_warlord_parjesh() : CreatureScript("boss_warlord_parjesh")
        {}

        struct boss_warlord_parjesh_AI : public BossAI
        {
            boss_warlord_parjesh_AI(Creature* creature) : BossAI(creature, DATA_PARJESH)
            {
            }

            void Reset() override
            {
                DoCast(me, SPELL_EMPTY_ENERGY, true);
                _Reset();
            }

            void DamageTaken(Unit* /**/, uint32 & /**/) override
            {
                if (me->HealthBelowPct(30) && !_enraged)
                {
                    Talk(SAY_ENRAGE);
                    _enraged = true;
                    DoCast(me, SPELL_ENRAGE);
                }
            }

            void DoAction(int32 action) override
            {
                if (action == ACTION_INTRO)
                {
                    Talk(SAY_INTRO);
                }
            }

            void KilledUnit(Unit* unit) override
            {
                if (unit && unit->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_KILL);
            }

            void JustDied(Unit* /**/) override
            {
                DespawnCreatures(NPC_HATECOIL_CRESTRIDER);
                DespawnCreatures(NPC_HATECOIL_SHELLBREAKER);
                Talk(SAY_DEATH);
                _JustDied();
            }

            void JustSummoned(Creature* summon) override
            {
                if (!summon)
                    return;

                if (summon->GetEntry() == NPC_HATECOIL_CRESTRIDER || summon->GetEntry() == NPC_HATECOIL_SHELLBREAKER)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                    {
                        summon->Attack(target, true);
                        summon->GetMotionMaster()->MoveChase(target, 0, 0);
                    }
                }
            }

            void DespawnCreatures(uint32 entry)
            {
                std::list<Creature*> creatures;

                me->GetCreatureListWithEntryInGrid(creatures, entry, 250.0f);

                if (creatures.empty())
                    return;

                for (auto & it : creatures)
                    if (it)
                        it->DespawnOrUnsummon();
            }

            void EnterEvadeMode(EvadeReason reason) override
            {
                DespawnCreatures(NPC_HATECOIL_CRESTRIDER);
                DespawnCreatures(NPC_HATECOIL_SHELLBREAKER);
                me->RemoveAurasDueToSpell(SPELL_ENERGIZE);
                me->RemoveAurasDueToSpell(SPELL_ENRAGE);
                me->RemoveAllAreaTriggers();
                CreatureAI::EnterEvadeMode(reason);
            }

            void EnterCombat(Unit* ) override
            {
                //me->SetMaxPower(me->getPowerType(), 100);
                DoCast(me, SPELL_ENERGIZE, true);
                Talk(SAY_AGGRO);
                _EnterCombat();
                _enraged = false;
                _addEntry = NPC_HATECOIL_SHELLBREAKER;
                events.ScheduleEvent(EVENT_CALL_REINFORCEMENTS, 3 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_CRASHING_WAVE, 25 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_THROW_SPEAR, 10 * IN_MILLISECONDS);
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
                        case EVENT_CALL_REINFORCEMENTS:
                        {
                            Talk(SAY_REINFORCEMENTS);

                            if (IsHeroic())
                                DoCast(me, SPELL_CALL_REINFORCEMENTS);
                            else
                            {
                                if (_addEntry == NPC_HATECOIL_SHELLBREAKER)
                                {
                                    DoCast(me, SPELL_CALL_REINFORCEMENTS_M);
                                    _addEntry = NPC_HATECOIL_CRESTRIDER;
                                }
                                else if (_addEntry == NPC_HATECOIL_CRESTRIDER)
                                {
                                    DoCast(me, SPELL_CALL_REINFORCEMENTS_C);
                                    _addEntry = NPC_HATECOIL_SHELLBREAKER;
                                }
                            }
                            break;
                        }

                        case EVENT_CRASHING_WAVE:
                        {
                            me->SetPower(POWER_ENERGY, 100);
                            DoCast(me, SPELL_CRASHING_WAVE);
                            events.ScheduleEvent(EVENT_CRASHING_WAVE, 25 * IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_IMPALING_SPEAR, 7 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_IMPALING_SPEAR:
                        {
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                            {
                                DoCast(target, SPELL_IMPALING_SPEAR_MARK);
                                DoCast(target, SPELL_IMPALING_SPEAR);
                            }
                            events.ScheduleEvent(EVENT_CALL_REINFORCEMENTS, 10 * IN_MILLISECONDS);
                            break;
                        }


                        case EVENT_THROW_SPEAR:
                        {
                            Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me));

                            if (!target)
                            {
                                if (Unit* victim = me->GetVictim())
                                    DoCast(victim, SPELL_THROW_SPEAR);
                            }
                            else
                                DoCast(target, SPELL_THROW_SPEAR);

                            events.ScheduleEvent(EVENT_THROW_SPEAR, urand(15, 25) * IN_MILLISECONDS);
                            break;
                        }

                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                uint32 _addEntry;
                bool _enraged;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_warlord_parjesh_AI(creature);
        }
};

class npc_eoa_hatecoil_shellbreaker : public CreatureScript
{
    public:
        npc_eoa_hatecoil_shellbreaker() : CreatureScript("npc_eoa_hatecoil_shellbreaker")
        {}

        struct npc_eoa_hatecoil_shellbreaker_AI : public ScriptedAI
        {
            npc_eoa_hatecoil_shellbreaker_AI(Creature* creature) : ScriptedAI(creature)
            {

            }

            void EnterCombat(Unit* /**/) override
            {
                _bellowingRoarTimer = 0;
                DoZoneInCombat();
            }

            void Reset() override
            {
                _bellowingRoarTimer = 0;
            }

            void JustDied(Unit* /**/) override
            {
                me->DespawnOrUnsummon(5000);
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                _bellowingRoarTimer += diff;

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                if (_bellowingRoarTimer >= 10 * IN_MILLISECONDS)
                {
                    DoCast(me, SPELL_BELLOWING_ROAR);
                    _bellowingRoarTimer = 0;
                }

                DoMeleeAttackIfReady();
            }

            private:
                uint32 _bellowingRoarTimer;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_hatecoil_shellbreaker_AI(creature);
        }
};

class npc_eoa_hatecoil_crestrider : public CreatureScript
{
    public:
        npc_eoa_hatecoil_crestrider() : CreatureScript("npc_eoa_hatecoil_crestrider")
        {}

        struct npc_eoa_hatecoil_crestrider_AI : public ScriptedAI
        {
            npc_eoa_hatecoil_crestrider_AI(Creature* creature) : ScriptedAI(creature)
            {

            }

            void EnterCombat(Unit* /**/) override
            {
                _lightingTimer      = 0;
                _restorationTimer   = 0;
                DoZoneInCombat();
            }

            void JustDied(Unit* /**/) override
            {
                me->DespawnOrUnsummon(5000);
            }

            void SpellHit(Unit* , SpellInfo const* spell)
            {
                if (!spell)
                    return;

                if (spell->HasEffect(SPELL_EFFECT_INTERRUPT_CAST) && me->HasAura(SPELL_RESTORATION))
                    me->InterruptNonMeleeSpells(false);
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                _lightingTimer += diff;
                _restorationTimer += diff;

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                if (_lightingTimer >= 2 * IN_MILLISECONDS)
                {
                    _lightingTimer = 0;
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                        DoCast(target, SPELL_LIGHTING_STRIKE);
                }

                if (IsHeroic() && _restorationTimer >= 15 * IN_MILLISECONDS)
                {
                    _restorationTimer = 0;
                    me->CastStop();
                    DoCast(me, SPELL_RESTORATION);
                }

                DoMeleeAttackIfReady();
            }

            private:
                uint32 _lightingTimer;
                uint32 _restorationTimer;

        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_hatecoil_crestrider_AI(creature);
        }
};

class spell_parjesh_call_reinforcements : public SpellScriptLoader
{
    public:
        spell_parjesh_call_reinforcements() : SpellScriptLoader("spell_parjesh_call_reinforcements")
        {}

        class spell_parjesh_call_reinforcements_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_parjesh_call_reinforcements_SpellScript);

                void HandleSummons()
                {
                    if (!GetCaster())
                        return;

                    GetCaster()->CastSpell(GetCaster(), SPELL_CALL_REINFORCEMENTS_C, true);
                    GetCaster()->CastSpell(GetCaster(), SPELL_CALL_REINFORCEMENTS_M, true);
                }

                void Register()
                {
                    OnCast += SpellCastFn(spell_parjesh_call_reinforcements_SpellScript::HandleSummons);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_parjesh_call_reinforcements_SpellScript();
        }
};

class spell_eoa_bellowing_roar : public SpellScriptLoader
{
    public:
        spell_eoa_bellowing_roar() : SpellScriptLoader("spell_eoa_bellowing_roar")
        {}

        class spell_eoa_bellowing_roar_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_eoa_bellowing_roar_SpellScript);

                void HandleDummy(SpellEffIndex /**/)
                {
                    if (!GetCaster())
                        return;

                    if (Map* map = GetCaster()->GetMap())
                    {
                        if (map->IsHeroic())
                            GetCaster()->CastSpell(GetCaster(), SPELL_MOTIVATED, true);
                    }
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(spell_eoa_bellowing_roar_SpellScript::HandleDummy, EFFECT_1, SPELL_EFFECT_DUMMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_eoa_bellowing_roar_SpellScript();
        }
};

class spell_parjesh_impale_spear : public SpellScriptLoader
{
    public:
        spell_parjesh_impale_spear() : SpellScriptLoader("spell_parjesh_impale_spear")
        {}

        class spell_parjesh_impale_spear_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_parjesh_impale_spear_SpellScript);

                void HandleDummy(SpellEffIndex /**/)
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    Unit* caster = GetCaster();
                    Unit* target = GetHitUnit();

                    std::list<Creature*> minions;

                    target->GetCreatureListWithEntryInGrid(minions, NPC_HATECOIL_CRESTRIDER, 100);
                    target->GetCreatureListWithEntryInGrid(minions, NPC_HATECOIL_SHELLBREAKER, 100);

                    if (!minions.empty())
                    {
                        for (auto & it : minions)
                        {
                            if (it && it->IsInBetween(GetCaster(), target, 5.0f))
                            {
                                target = it;
                                break;
                            }
                        }
                    }

                    if (target->ToPlayer())
                        caster->CastSpell(target, SPELL_IMPALING_SPEAR_DMG, true);
                    else if (target->ToCreature())
                    {
                        if (Creature* parjesh = caster->ToCreature())
                            parjesh->AI()->Talk(SAY_IMPALING_SPEAR);

                        caster->CastSpell(target, SPELL_IMPALING_SPEAR_ADD, true);
                    }
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(spell_parjesh_impale_spear_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_parjesh_impale_spear_SpellScript();
        }

};

class spell_parjesh_crashing_wave : public SpellScriptLoader
{
    public:
        spell_parjesh_crashing_wave() : SpellScriptLoader("spell_parjesh_crashing_wave")
        {}

        class spell_parjesh_crashing_wave_SpellScript : public SpellScript
        {
            public:

                PrepareSpellScript(spell_parjesh_crashing_wave_SpellScript);

                void HandleDebuffAreas()
                {
                    if (!GetCaster())
                        return;

                    Unit* caster = GetCaster();

                    if (caster->GetMap() && caster->GetMap()->IsHeroic())
                    {
                        caster->CastSpell(caster, SPELL_QUICKSAND_5_YARDS, true);
                        caster->CastSpell(caster, SPELL_QUICKSAND_10_YARDS, true);
                        caster->CastSpell(caster, SPELL_QUICKSAND_15_YARDS, true);
                        caster->CastSpell(caster, SPELL_QUICKSAND_20_YARDS, true);
                        caster->CastSpell(caster, SPELL_QUICKSAND_25_YARDS, true);
                    }
                }

                void Register()
                {
                    OnHit += SpellHitFn(spell_parjesh_crashing_wave_SpellScript::HandleDebuffAreas);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_parjesh_crashing_wave_SpellScript();
        }
};

class spell_parjesh_crashing_wave_trigger : public SpellScriptLoader
{
    public:

        spell_parjesh_crashing_wave_trigger() : SpellScriptLoader("spell_parjesh_crashing_wave_trigger")
        {}

        class spell_parjesh_crashing_wave_trigger_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_parjesh_crashing_wave_trigger_SpellScript);

                void CheckTargetsOnLine(SpellDestination& target)
                {
                    if (!GetCaster())
                        return;

                    //wave_FinalPos = G3D::Vector3(_position.GetPositionX(), _position.GetPositionY(), _position.GetPositionZ());

                }

                void Register()
                {
                    OnDestinationTargetSelect += SpellDestinationTargetSelectFn(spell_parjesh_crashing_wave_trigger_SpellScript::CheckTargetsOnLine, EFFECT_0, TARGET_DEST_CASTER_FRONT);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_parjesh_crashing_wave_trigger_SpellScript();
        }
};

class at_crashing_wave : public AreaTriggerEntityScript
{
    public:
        at_crashing_wave() : AreaTriggerEntityScript("at_crashing_wave")
        {}

        struct at_crashing_wave_AI : public AreaTriggerAI
        {
            at_crashing_wave_AI(AreaTrigger* at) : AreaTriggerAI(at)
            {}

            void SetupSpline()
            {
                if (!at->GetCaster())
                    return;

                G3D::Vector3 casterPos = {at->GetCaster()->GetPositionX(), at->GetCaster()->GetPositionY(), at->GetCaster()->GetPositionZ()};

                std::vector<G3D::Vector3> points;

                float dx = wave_FinalPos.x - casterPos.x;
                float dy = wave_FinalPos.y - casterPos.y;
                float dz = wave_FinalPos.z - casterPos.z;

                const float dist = 25.0f;

                G3D::Vector3 pos = casterPos;
                float tx, ty, tz;

                tx = dx/dist;
                ty = dy/dist;
                tz = dz/dist;

                for (float i = 0; i < dist; i++)
                {
                    pos.x += tx;
                    pos.y += ty;
                    pos.z += tz;

                    points.push_back(pos);
                }

                at->InitSplines(points, at->GetDuration());
            }

            void OnInitialize() override
            {
                SetupSpline();
            }

            void OnUnitEnter(Unit* unit) override
            {
                if (!unit || !at->GetCaster() || at->GetEntry() == AREA_CRASHING_WAVE_MOVE)
                    return;

                if (unit->ToPlayer())
                    at->GetCaster()->CastSpell(unit, SPELL_CRASHING_WAVE_DMG, true);
            }
        };

        AreaTriggerAI* GetAI(AreaTrigger* at) const override
        {
            return new at_crashing_wave_AI(at);
        }
};

class at_quicksand : public AreaTriggerEntityScript
{
    public:
        at_quicksand() : AreaTriggerEntityScript("at_quicksand")
        {

        }

        struct at_quicksand_AI : public AreaTriggerAI
        {
            at_quicksand_AI(AreaTrigger* at) : AreaTriggerAI(at)
            {}

            void OnUnitEnter(Unit* unit) override
            {
                if (!unit)
                    return;

                if (unit->GetTypeId() == TYPEID_PLAYER)
                    unit->CastSpell(unit, SPELL_QUICKSAND, true);
            }

            void OnUnitExit(Unit* unit) override
            {
                if (!unit)
                    return;

                if (unit && unit->GetTypeId() == TYPEID_PLAYER)
                    unit->RemoveAurasDueToSpell(SPELL_QUICKSAND);
            }
        };

        AreaTriggerAI* GetAI(AreaTrigger* at) const override
        {
            return new at_quicksand_AI(at);
        }
};

void AddSC_boss_warlord_parjesh()
{
    new boss_warlord_parjesh();
    new npc_eoa_hatecoil_crestrider();
    new npc_eoa_hatecoil_shellbreaker();
    new spell_parjesh_call_reinforcements();
    new spell_parjesh_impale_spear();
    new spell_parjesh_crashing_wave();
    new spell_parjesh_crashing_wave_trigger();
    new spell_eoa_bellowing_roar();
    new at_quicksand();
    new at_crashing_wave();
}
