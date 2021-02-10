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
#include "eye_of_azshara.h"

enum Spells
{
    // Serpentrix
    SPELL_TOXIC_WOUND           = 191855,
    SPELL_TOXIC_PUDDLE          = 191858,
    SPELL_POISON_SPIT           = 192050,
    SPELL_POISON_SPIT_TRIGGER   = 191839,
    SPELL_POISON_SPIT_DMG_1     = 191841,
    SPELL_POISON_SPIT_DMG_2     = 191843,
    SPELL_POISON_SPIT_DMG_3     = 191845,
    SPELL_SUMERGE               = 191873,
    SPELL_RAMPAGE               = 191848,
    SPELL_RAMPAGE_TRIGGER       = 191850,
    SPELL_HYDRA_HEAD            = 202680,
    SPELL_HYDRA_HEAD_HIDE       = 180898, // Hide The Heads while not in phase

    // Blazing Hydra Spawn
    SPELL_BLAZING_NOVA          = 192003,

    // Arcane Hydra Spawn
    SPELL_ARCANE_BLAST          = 192005,
    SPELL_ARCANE_CHARGE         = 192007,
};

enum Events
{
    EVENT_TOXIC_WOUND    = 1,
    EVENT_POISON_SPIT    = 2,
    EVENT_ACTIVATE_HEADS = 3,
    EVENT_RAMPAGE        = 4,
};

enum Npcs
{
    NPC_BLAZING_HYDRA_SPAWN    = 97259,
    NPC_ARCANE_HYDRA_SPAWN     = 97260,
    NPC_SINK_HOLE              = 97263,
};

enum Says
{
    SAY_SUBMERGE = 0,
};

enum Actions
{
    ACTION_SPAWN_HEAD   = 1,
};

Position EmergePos;

class boss_serpentrix : public CreatureScript
{
    public:
        boss_serpentrix() : CreatureScript("boss_serpentrix")
        {}

        struct boss_serpentrix_AI : public BossAI
        {
            boss_serpentrix_AI(Creature* creature) : BossAI(creature, DATA_SERPENTRIX)
            {
            }

            void Reset() override
            {
                GetHolesToEmerge();
                me->AddUnitState(UNIT_STATE_ROOT);
                _Reset();
                _firstSumerged = _secondSumerged = false;
            }

            void JustDied(Unit* ) override
            {
                _JustDied();
            }

            void ActivateHeads()
            {
                Trinity::Containers::RandomResize(_holes, 2);

                if (IsHeroic())
                {
                    DoSummon(NPC_ARCANE_HYDRA_SPAWN, _holes.back(), 5 * IN_MILLISECONDS);
                    DoSummon(NPC_BLAZING_HYDRA_SPAWN, _holes.front(), 5 * IN_MILLISECONDS);
                }
                else
                {
                    for (auto & it : _holes)
                        DoSummon(NPC_BLAZING_HYDRA_SPAWN, it, 5 * IN_MILLISECONDS);
                }
            }

            void GetHolesToEmerge()
            {
                _holes.clear();

                std::list<Creature*> sink_holes;

                me->GetCreatureListWithEntryInGrid(sink_holes, NPC_SINK_HOLE, 500.0f);

                if (sink_holes.empty())
                    return;

                for (auto & it : sink_holes)
                    if (it)
                        _holes.push_back(it->GetPosition());

            }

            Position FindEmergeHole()
            {
                if (_holes.empty())
                    return me->GetPosition();

                Position emergePos = Trinity::Containers::SelectRandomContainerElement(_holes);

                _holes.erase(find(_holes.begin(), _holes.end(), emergePos));

                return emergePos;
            }

            void InitSubmerged()
            {
                me->CastStop();
                Talk(SAY_SUBMERGE);
                EmergePos = FindEmergeHole();

                me->CastSpell(me, SPELL_SUMERGE, false);
                events.ScheduleEvent(EVENT_ACTIVATE_HEADS, 2 * IN_MILLISECONDS);
                events.RescheduleEvent(EVENT_RAMPAGE, 3 * IN_MILLISECONDS);
            }

            void DamageTaken(Unit* attacker, uint32 & /**/) override
            {
                if (attacker)
                {
                    if (me->IsWithinMeleeRange(attacker) && me->HasAura(SPELL_RAMPAGE))
                        me->CastStop();
                }

                if (me->HealthBelowPct(66) && !_firstSumerged)
                {
                    _firstSumerged = true;
                    InitSubmerged();
                }
                else if (me->HealthBelowPct(33) && !_secondSumerged)
                {
                    _secondSumerged = true;
                    InitSubmerged();
                }
            }

            void EnterEvadeMode(EvadeReason /**/) override
            {
                std::list<Creature*> heads;
                me->GetCreatureListWithEntryInGrid(heads,NPC_BLAZING_HYDRA_SPAWN);

                if (!heads.empty())
                {
                    for (auto & it : heads)
                        it->AI()->EnterEvadeMode();
                }

                _EnterEvadeMode();
                me->RemoveAllAreaTriggers();
                me->NearTeleportTo(me->GetHomePosition());
                Reset();
            }

            void EnterCombat(Unit* /**/) override
            {
                _EnterCombat();
                _firstSumerged = _secondSumerged = false;
                events.ScheduleEvent(EVENT_POISON_SPIT, 9 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_TOXIC_WOUND, 6 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_RAMPAGE, 3 * IN_MILLISECONDS);
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
                        case EVENT_RAMPAGE:
                        {
                            if (!me->IsWithinMeleeRange(me->GetVictim()))
                                DoCast(me, SPELL_RAMPAGE);

                            events.ScheduleEvent(EVENT_RAMPAGE, IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_TOXIC_WOUND:
                        {
                            Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me));

                            if (!target)
                                DoCastVictim(SPELL_TOXIC_WOUND);
                            else
                                DoCast(target, SPELL_TOXIC_WOUND);

                            events.ScheduleEvent(EVENT_TOXIC_WOUND, 25 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_POISON_SPIT:
                        {
                            DoCast(me, SPELL_POISON_SPIT);
                            events.ScheduleEvent(EVENT_POISON_SPIT, 7 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_ACTIVATE_HEADS:
                        {
                            ActivateHeads();
                            GetHolesToEmerge();
                            break;
                        }

                        default : break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                bool _firstSumerged, _secondSumerged;
                std::vector<Position> _holes;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_serpentrix_AI(creature);
        }
};

class npc_serpentrix_head : public CreatureScript
{
    public:
        npc_serpentrix_head() : CreatureScript("npc_serpentrix_head")
        {}

        struct npc_serpentrix_head_AI : public ScriptedAI
        {
            npc_serpentrix_head_AI(Creature* creature) : ScriptedAI(creature)
            {}

            void Reset() override
            {
                me->AddUnitState(UNIT_STATE_ROOT);
            }

            void EnterCombat(Unit* /**/) override
            {
                _spellTimer = 0;
                DoZoneInCombat();
            }

            void EnterEvadeMode(EvadeReason reason) override
            {
                _EnterEvadeMode(reason);
                Reset();
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                _spellTimer += diff;

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                if (_spellTimer >= 3 * IN_MILLISECONDS)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                    {
                        if (me->GetEntry() == NPC_ARCANE_HYDRA_SPAWN)
                            DoCast(target, SPELL_ARCANE_BLAST);
                        else
                            DoCast(target, SPELL_BLAZING_NOVA);
                    }
                    _spellTimer = 0;
                }
            }

            private:
                uint32 _spellTimer;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_serpentrix_head_AI(creature);
        }
};

class at_toxic_wound : public AreaTriggerEntityScript
{
    public:
        at_toxic_wound() : AreaTriggerEntityScript("at_toxic_wound")
        {}

        struct at_toxic_wound_AI : public AreaTriggerAI
        {
            at_toxic_wound_AI(AreaTrigger* at) : AreaTriggerAI(at)
            {}

            void OnInitialize()
            {
                _serpentrix = nullptr;
                _timerToxic = 0;
                //at->SetDecalPropertiesID(22);

                if (!at->GetCaster())
                    return;

                _serpentrix = at->GetCaster()->FindNearestCreature(BOSS_SERPENTRIX, 500.0f, true);

                if (_serpentrix)
                    _serpentrix->_RegisterAreaTrigger(at);
            }

            void OnUnitEnter(Unit* unit) override
            {
                if (!unit || !at->GetCaster())
                    return;

                if (unit->ToPlayer())
                    _targets.push_back(unit);
            }

            void OnUnitExit(Unit* unit) override
            {
                if (!unit)
                    return;

                if (unit->ToPlayer())
                    _targets.remove(unit);
            }

            void OnRemove()
            {
                if (!at)
                    return;

                if (_serpentrix)
                    _serpentrix->_UnregisterAreaTrigger(at);
            }

            void OnUpdate(uint32 diff) override
            {
                _timerToxic += diff;

                if (_timerToxic >= IN_MILLISECONDS)
                {
                    if (!_targets.empty())
                    {
                        for (auto & it : _targets)
                            if (it)
                                it->CastSpell(it, SPELL_TOXIC_PUDDLE, true);
                    }

                    _timerToxic = 0;
                }
            }

            private:
                Creature* _serpentrix;
                std::list<Unit*> _targets;
                uint32 _timerToxic;
        };

        AreaTriggerAI* GetAI(AreaTrigger* at) const override
        {
            return new at_toxic_wound_AI(at);
        }
};

class spell_serpentrix_poison_spit : public SpellScriptLoader
{
    public:
        spell_serpentrix_poison_spit() : SpellScriptLoader("spell_serpentrix_poison_spit")
        {}

        class spell_serpentrix_poison_spit_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_serpentrix_poison_spit_SpellScript);

                void HandleAreaTargets(std::list<WorldObject*>& targets)
                {
                    if (targets.empty())
                        return;

                    for (auto & it : targets)
                    {
                        if (it && it->ToPlayer())
                            _targets.push_back(it->ToPlayer());
                    }

                }

                void HandleOnCast()
                {
                    if (!GetCaster() || _targets.empty())
                        return;

                    for (auto & it : _targets)
                        GetCaster()->CastSpell(it, SPELL_POISON_SPIT_TRIGGER, true);
                }

                void Register()
                {
                    OnCast += SpellCastFn(spell_serpentrix_poison_spit_SpellScript::HandleOnCast);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_serpentrix_poison_spit_SpellScript::HandleAreaTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                }

                private:
                    std::list<Player*> _targets;
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_serpentrix_poison_spit_SpellScript();
        }
};

class spell_serpentrix_poison_spit_dmg : public SpellScriptLoader
{
    public:
        spell_serpentrix_poison_spit_dmg() : SpellScriptLoader("spell_serpentrix_poison_spit_dmg")
        {}

        class spell_serpentrix_poison_spit_dmg_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_serpentrix_poison_spit_dmg_SpellScript);

                void HandleDmg()
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    GetCaster()->CastSpell(GetHitUnit(), SPELL_POISON_SPIT_DMG_1, true);
                }

                void Register()
                {
                    OnHit += SpellHitFn(spell_serpentrix_poison_spit_dmg_SpellScript::HandleDmg);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_serpentrix_poison_spit_dmg_SpellScript();
        }
};

class spell_serpentrix_rampage_dmg : public SpellScriptLoader
{
    public:
        spell_serpentrix_rampage_dmg() : SpellScriptLoader("spell_serpentrix_rampage_dmg")
        {}

        class spell_serpentrix_rampage_dmg_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_serpentrix_rampage_dmg_SpellScript);

                void HandleDummy(SpellEffIndex /**/)
                {
                    if (!GetHitUnit())
                        return;

                    GetCaster()->CastSpell(GetHitUnit(), SPELL_POISON_SPIT_DMG_2, true);
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(spell_serpentrix_rampage_dmg_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_serpentrix_rampage_dmg_SpellScript();
        }
};

class spell_serpentrix_submerge : public SpellScriptLoader
{
    public:
        spell_serpentrix_submerge() : SpellScriptLoader("spell_serpentrix_submerge")
        {}

        class spell_serpentrix_submerge_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_serpentrix_submerge_SpellScript);

                void HandleCast()
                {
                    if (!GetCaster())
                        return;

                    GetCaster()->NearTeleportTo(EmergePos, false);
                }

                void Register()
                {
                    OnCast += SpellCastFn(spell_serpentrix_submerge_SpellScript::HandleCast);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_serpentrix_submerge_SpellScript();
        }
};

void AddSC_boss_serpentrix()
{
    new boss_serpentrix();
    new npc_serpentrix_head();
    new at_toxic_wound();
    new spell_serpentrix_poison_spit();
    new spell_serpentrix_poison_spit_dmg();
    new spell_serpentrix_rampage_dmg();
    new spell_serpentrix_submerge();
}
