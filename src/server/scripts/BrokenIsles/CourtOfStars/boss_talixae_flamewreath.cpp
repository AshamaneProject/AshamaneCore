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
#include "court_of_stars.h"

enum Spells
{
    // Talixae Flamewreath
    SPELL_WITHERING_SOUL            = 208165,
    SPELL_INFERNAL_ERUPTION         = 207881,
    SPELL_INFERNAL_ERUPTION_MISSILE = 207883,
    SPELL_INFERNAL_ERUPTION_AREA    = 211457,
    SPELL_INFERNAL_ERUPTION_DMG     = 207887,
    SPELL_BURNING_INTESITY_AURA     = 207906,
    SPELL_BURNING_INTESITY_DMG      = 207907,

    // Bonds Buffs
    SPELL_BOND_OF_CRUELTY           = 209719,
    SPELL_BOND_OF_CUNNING           = 209713,
    SPELL_BOND_OF_STRENGTH          = 207850,
    SPELL_BOND_OF_FLAME             = 209722,

    // Infernal Imp
    SPELL_FIREBOLT                  = 224374,
    SPELL_DRIFTING_EMBERS           = 224375,
    SPELL_DRIFTING_EMBERS_TARGET    = 224376,
    SPELL_DRIFTING_EMBERS_DMG       = 224377,

    // Minions
    SPELL_SHOCKWAVE                 = 207979,
    SPELL_DISINTEGRATION_BEAM       = 207980,
    SPELL_WHIRLING_BLADES           = 209378,
};

enum Events
{
    EVENT_BURNING_INTESITY      = 1,
    EVENT_WITHERING_SOUL        = 2,
    EVENT_INFERNAL_ERUPTION     = 3,

    // Minions
    EVENT_WHIRLING_BLADES       = 4,
    EVENT_DISINTEGRATION_BEAM   = 5,
    EVENT_SHOCK_WAVE            = 6,

    // Imp
    EVENT_FIREBOLT              = 7,
    EVENT_DRIFTING_EMBERS       = 8,
};

enum Says
{
    SAY_EVENT_1             = 0,
    SAY_EVENT_2             = 1,
    SAY_EVENT_3             = 2,
    SAY_AGGRO               = 3,
    SAY_AGGRO_MINIONS       = 4,
    SAY_BURNING_INTESITY    = 5,
    SAY_KILL                = 6,
    SAY_WIPE                = 7,
    SAY_DEATH               = 8,
};

enum Adds
{
    NPC_INFERNAL_IMP            = 112668,
};

enum Actions
{
    ACTION_MINIONS_DEAD         = 1,
};

using SpellTargets = std::list<WorldObject*>;

struct PlayerFilter
{
    bool operator() (WorldObject*& object)
    {
        if (object->ToPlayer())
            return false;

        return true;
    }
};

void CheckMinionsDead(Creature* me)
{
    if (!me)
        return;

    Creature* baalgar = nullptr;
    Creature* imacutya = nullptr;
    Creature* talixae = nullptr;
    Creature* jazshariu = nullptr;

    if (me->GetEntry() == NPC_JAZSHARIU)
    {
        baalgar = me->FindNearestCreature(NPC_BAALGAR, 10.0f, true);
        imacutya = me->FindNearestCreature(NPC_IMACUTYA, 10.0f, true);
        talixae = me->FindNearestCreature(BOSS_TALIXAE_FLAMEWREATH, 10.0f, true);

        if (baalgar)
            me->CastSpell(me, SPELL_BOND_OF_CUNNING, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_CUNNING);

        if (imacutya)
            me->CastSpell(me, SPELL_BOND_OF_CRUELTY, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_CRUELTY);

        if (talixae)
            me->CastSpell(me, SPELL_BOND_OF_FLAME, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_FLAME);

    }
    else if (me->GetEntry() == NPC_IMACUTYA)
    {
        baalgar = me->FindNearestCreature(NPC_BAALGAR, 10.0f, true);
        jazshariu = me->FindNearestCreature(NPC_JAZSHARIU, 10.0f, true);
        talixae = me->FindNearestCreature(BOSS_TALIXAE_FLAMEWREATH, 10.0f, true);

        if (baalgar)
            me->CastSpell(me, SPELL_BOND_OF_CUNNING, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_CUNNING);

        if (jazshariu)
            me->CastSpell(me, SPELL_BOND_OF_STRENGTH, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_STRENGTH);

        if (talixae)
            me->CastSpell(me, SPELL_BOND_OF_FLAME, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_FLAME);

    }
    else if (me->GetEntry() == NPC_BAALGAR)
    {
        jazshariu = me->FindNearestCreature(NPC_JAZSHARIU, 10.0f, true);
        imacutya = me->FindNearestCreature(NPC_IMACUTYA, 10.0f, true);
        talixae = me->FindNearestCreature(BOSS_TALIXAE_FLAMEWREATH, 10.0f, true);

        if (jazshariu)
            me->CastSpell(me, SPELL_BOND_OF_STRENGTH, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_STRENGTH);

        if (imacutya)
            me->CastSpell(me, SPELL_BOND_OF_CRUELTY, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_CRUELTY);

        if (talixae)
            me->CastSpell(me, SPELL_BOND_OF_FLAME, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_FLAME);
    }
    else if (me->GetEntry() == BOSS_TALIXAE_FLAMEWREATH)
    {
        jazshariu = me->FindNearestCreature(NPC_JAZSHARIU, 10.0f, true);
        imacutya = me->FindNearestCreature(NPC_IMACUTYA, 10.0f, true);
        baalgar = me->FindNearestCreature(NPC_BAALGAR, 10.0f, true);

        if (jazshariu)
            me->CastSpell(me, SPELL_BOND_OF_STRENGTH, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_STRENGTH);

        if (imacutya)
            me->CastSpell(me, SPELL_BOND_OF_CRUELTY, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_CRUELTY);

        if (baalgar)
            me->CastSpell(me, SPELL_BOND_OF_CUNNING, true);
        else
            me->RemoveAurasDueToSpell(SPELL_BOND_OF_CUNNING);
    }
}

class boss_talixae_flamewreath : public CreatureScript
{
    public:
        boss_talixae_flamewreath() : CreatureScript("boss_talixae_flamewreath")
        {}

        struct boss_talixae_flamewreath_AI : public BossAI
        {
            boss_talixae_flamewreath_AI(Creature* creature) : BossAI(creature, DATA_TALIXAE_FLAMEWREATH)
            {}

            void Reset() override
            {
                _Reset();
                CheckMinionsDead(me);
            }

            void DoAction(int32 action) override
            {
                if (action == ACTION_MINIONS_DEAD)
                {
                    CheckMinionsDead(me);

                    if (Creature* baalgar = me->FindNearestCreature(NPC_BAALGAR, 10.0f, true))
                        baalgar->AI()->DoAction(ACTION_MINIONS_DEAD);

                    if (Creature* jazshariu = me->FindNearestCreature(NPC_JAZSHARIU, 10.0f, true))
                        jazshariu->AI()->DoAction(ACTION_MINIONS_DEAD);

                    if (Creature* imacutya = me->FindNearestCreature(NPC_IMACUTYA, 10.0f, true))
                        imacutya->AI()->DoAction(ACTION_MINIONS_DEAD);
                }
            }

            bool IsAliveAMinion()
            {
                if (me->FindNearestCreature(NPC_BAALGAR, 10.0f, true) || me->FindNearestCreature(NPC_JAZSHARIU, 10.0f, true) || me->FindNearestCreature(NPC_IMACUTYA, 10.0f, true))
                    return true;

                return false;
            }

            void EnterCombat(Unit* /**/) override
            {
                if (IsAliveAMinion())
                    Talk(SAY_AGGRO_MINIONS);
                else
                    Talk(SAY_AGGRO);

                _EnterCombat();

                CheckMinionsDead(me);
                events.ScheduleEvent(EVENT_BURNING_INTESITY, 5 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_WITHERING_SOUL, 12 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_INFERNAL_ERUPTION, 16 * IN_MILLISECONDS);
            }

            void KilledUnit(Unit* target) override
            {
                if (!target)
                    return;

                if (target->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_KILL);
            }

            void EnterEvadeMode(EvadeReason reason) override
            {
                me->RemoveAllAreaTriggers();
                CreatureAI::EnterEvadeMode(reason);
            }

            void JustDied(Unit* /**/) override
            {
                Talk(SAY_DEATH);
                _JustDied();
            }

            void JustReachedHome() override
            {
                Talk(SAY_WIPE);
                _JustReachedHome();
            }

            void ExecuteEvent(uint32 eventId) override
            {
                switch (eventId)
                {
                    case EVENT_BURNING_INTESITY:
                    {
                        Talk(SAY_BURNING_INTESITY);
                        DoCast(me, SPELL_BURNING_INTESITY_AURA);
                        events.ScheduleEvent(EVENT_BURNING_INTESITY, 23 * IN_MILLISECONDS);
                        break;
                    }

                    case EVENT_WITHERING_SOUL:
                    {
                        DoCast(me, SPELL_WITHERING_SOUL);
                        events.ScheduleEvent(EVENT_WITHERING_SOUL, 14 * IN_MILLISECONDS);
                        break;
                    }

                    case EVENT_INFERNAL_ERUPTION:
                    {
                        DoCast(me, SPELL_INFERNAL_ERUPTION);
                        events.ScheduleEvent(EVENT_INFERNAL_ERUPTION, 30 * IN_MILLISECONDS);
                        break;
                    }

                    default : break;
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_talixae_flamewreath_AI(creature);
        }
};

class npc_cots_talixae_minion : public CreatureScript
{
    public:
        npc_cots_talixae_minion() : CreatureScript("npc_cots_talixae_minion")
        {}

        struct npc_cots_talixae_minion_AI : public ScriptedAI
        {
            npc_cots_talixae_minion_AI(Creature* creature) : ScriptedAI(creature)
            {
                CheckMinionsDead(me);
            }

            void Reset()
            {
                _events.Reset();
                CheckMinionsDead(me);
            }

            void DoAction(int32 action)
            {
                if (action == ACTION_MINIONS_DEAD)
                    CheckMinionsDead(me);
            }

            void JustReachedHome()
            {
                CheckMinionsDead(me);
            }

            void EnterCombat(Unit* /**/) override
            {
                CheckMinionsDead(me);
                DoZoneInCombat();

                switch (me->GetEntry())
                {
                    case NPC_BAALGAR:
                        _events.ScheduleEvent(EVENT_DISINTEGRATION_BEAM, 6 * IN_MILLISECONDS);
                        break;

                    case NPC_JAZSHARIU:
                        _events.ScheduleEvent(EVENT_SHOCK_WAVE, 20 * IN_MILLISECONDS);
                        break;

                    case NPC_IMACUTYA:
                        _events.ScheduleEvent(EVENT_WHIRLING_BLADES, 7 * IN_MILLISECONDS);
                        break;
                }
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_WHIRLING_BLADES:
                            DoCast(me, SPELL_WHIRLING_BLADES);
                            _events.ScheduleEvent(EVENT_WHIRLING_BLADES, 15 * IN_MILLISECONDS);
                            break;

                        case EVENT_SHOCK_WAVE:
                            DoCastVictim(SPELL_SHOCKWAVE);
                            _events.ScheduleEvent(EVENT_SHOCK_WAVE, 10 * IN_MILLISECONDS);
                            break;

                        case EVENT_DISINTEGRATION_BEAM:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                                DoCast(target, SPELL_DISINTEGRATION_BEAM);
                            _events.ScheduleEvent(EVENT_DISINTEGRATION_BEAM, 14 * IN_MILLISECONDS);
                            break;

                        default : break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap _events;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_cots_talixae_minion_AI(creature);
        }
};

class npc_cots_infernal_imp : public CreatureScript
{
    public:
        npc_cots_infernal_imp() : CreatureScript("npc_cots_infernal_imp")
        {}

        struct npc_cots_infernal_imp_AI : public ScriptedAI
        {
            npc_cots_infernal_imp_AI(Creature* creature) : ScriptedAI(creature)
            {}

            void Reset() override
            {
                _castTimes = _maxCast = 0;
                _events.Reset();
            }

            void EnterCombat(Unit* /**/) override
            {
                _events.ScheduleEvent(EVENT_DRIFTING_EMBERS, Seconds(2));
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    if (eventId == EVENT_DRIFTING_EMBERS)
                    {
                        _maxCast = urand(1,3);
                        _castTimes = 0;
                        DoCast(me, SPELL_DRIFTING_EMBERS, true);
                        _events.ScheduleEvent(EVENT_FIREBOLT, Seconds(3));
                    }
                    else if (eventId == EVENT_FIREBOLT)
                    {
                        _castTimes++;

                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                            DoCast(target, SPELL_FIREBOLT);

                        if (_castTimes == _maxCast)
                            _events.ScheduleEvent(EVENT_DRIFTING_EMBERS, Seconds(2));
                        else
                            _events.ScheduleEvent(EVENT_FIREBOLT, Seconds(3));
                    }
                }
            }

            private:
                EventMap _events;
                uint8 _castTimes, _maxCast;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_cots_infernal_imp_AI(creature);
        }
};

class spell_talixae_whitering_soul : public SpellScriptLoader
{
    public:
        spell_talixae_whitering_soul() : SpellScriptLoader("spell_talixae_whitering_soul")
        {}

        class spell_talixae_whitering_soul_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_talixae_whitering_soul_SpellScript);

                void FilterTargets(SpellTargets& targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_talixae_whitering_soul_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_talixae_whitering_soul_SpellScript();
        }
};

class spell_talixae_infernal_eruption : public SpellScriptLoader
{
    public:
        spell_talixae_infernal_eruption() : SpellScriptLoader("spell_talixae_infernal_eruption")
        {}

        class spell_talixae_infernal_eruption_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_talixae_infernal_eruption_SpellScript);

                void HandleDummy(SpellEffIndex /**/)
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    GetCaster()->CastSpell(GetHitUnit(), SPELL_INFERNAL_ERUPTION_MISSILE, true);
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(spell_talixae_infernal_eruption_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_talixae_infernal_eruption_SpellScript();
        }
};

class spell_talixae_infernal_eruption_dmg : public SpellScriptLoader
{
    public:
        spell_talixae_infernal_eruption_dmg() : SpellScriptLoader("spell_talixae_infernal_eruption_dmg")
        {}

        class spell_talixae_infernal_eruption_dmg_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_talixae_infernal_eruption_dmg_SpellScript);

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_talixae_infernal_eruption_dmg_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_talixae_infernal_eruption_dmg_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_talixae_infernal_eruption_dmg_SpellScript();
        }
};

class spell_cots_drifting_embers_dmg : public SpellScriptLoader
{
    public:
        spell_cots_drifting_embers_dmg() : SpellScriptLoader("spell_cots_drifting_embers_dmg")
        {}

        class spell_cots_drifting_embers_dmg_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_cots_drifting_embers_dmg_SpellScript);

                void HandleDummy(SpellEffIndex /**/)
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    GetCaster()->CastSpell(GetHitUnit(), SPELL_DRIFTING_EMBERS_DMG, true);
                }

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_cots_drifting_embers_dmg_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                    OnEffectHitTarget += SpellEffectFn(spell_cots_drifting_embers_dmg_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                }

        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cots_drifting_embers_dmg_SpellScript();
        }
};

class at_cots_infernal_eruption : public AreaTriggerEntityScript
{
    public:
        at_cots_infernal_eruption() : AreaTriggerEntityScript("at_cots_infernal_eruption")
        {}

        struct at_cots_infernal_eruption_AI : public AreaTriggerAI
        {
            at_cots_infernal_eruption_AI(AreaTrigger* at) : AreaTriggerAI(at)
            {}

            void OnInitialize()
            {
                if (!at->GetCaster())
                    return;

                at->GetCaster()->SummonCreature(NPC_INFERNAL_IMP, at->GetPosition(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5 * IN_MILLISECONDS);
            }

            void OnUnitEnter(Unit* target) override
            {
                if (!target || !at->GetCaster())
                    return;

                if (target->ToPlayer())
                    at->GetCaster()->CastSpell(target, SPELL_INFERNAL_ERUPTION_AREA, true);
            }
        };

        AreaTriggerAI* GetAI(AreaTrigger* at) const override
        {
            return new at_cots_infernal_eruption_AI(at);
        }
};

void AddSC_boss_talixae_flamewreath()
{
    new boss_talixae_flamewreath();
    new npc_cots_talixae_minion();
    new npc_cots_infernal_imp();
    new spell_talixae_whitering_soul();
    new spell_talixae_infernal_eruption();
    new spell_talixae_infernal_eruption_dmg();
    new spell_cots_drifting_embers_dmg();
    new at_cots_infernal_eruption();
}
