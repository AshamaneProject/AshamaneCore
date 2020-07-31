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
#include "SpellAuraEffects.h"
#include "SpellAuras.h"
#include "eye_of_azshara.h"

enum Spells
{
    SPELL_CALL_OF_SEAS      = 193051,
    SPELL_CALL_OF_SEAS_AURA = 193054,
    SPELL_CALL_OF_SEAS_DMG  = 193055,
    SPELL_QUAKE             = 193152,
    SPELL_QUAKE_DMG         = 193159,
    SPELL_AFTERSHOCK        = 193167,
    SPELL_GASEOUS_BUBBLE    = 193018,
    SPELL_GASEOUS_EXPLOSION = 193047,
    SPELL_GROUND_SLAM       = 193093,
    SPELL_GROUND_SLAM_DMG   = 193056,
    SPELL_FRENZY            = 197550,
};

enum Events
{
    EVENT_CALL_OF_SEAS      = 1,
    EVENT_QUAKE             = 2,
    EVENT_GASEOUS_BUBBLES   = 3,
    EVENT_GROUND_SLAM       = 4,
};

enum Adds
{
    NPC_QUAKE           = 97916,
    NPC_CALL_OF_THE_SEA = 97844,
};

enum Says
{
    SAY_AGGRO           = 0,
    SAY_CALL_OF_SEAS    = 1,
    SAY_GASEOUS_BUBBLE  = 2,
    SAY_QUAKE           = 3,
    SAY_KILL            = 4,
    SAY_DEAD            = 5,
};

const Position CenterPos = { -3447.563f, 4176.818f, 29.186f };

const Position SeasSummonAdditionalsPos [] =
{
     {-3472.835f, 4144.646f, 29.184f },
     {-3464.612f, 4130.921f, 29.181f },
     {-3482.641f, 4131.088f, 29.183f },
     {-3452.843f, 4117.360f, 28.016f },
     {-3445.967f, 4137.251f, 29.183f },
     {-3432.729f, 4150.483f, 29.181f },
     {-3411.363f, 4141.958f, 29.186f },
};

class boss_king_deepbeard : public CreatureScript
{
    public:
        boss_king_deepbeard() : CreatureScript("boss_king_deepbeard")
        {}

        struct boss_king_deepbeard_AI : public BossAI
        {
            boss_king_deepbeard_AI(Creature* creature) : BossAI(creature, DATA_KING_DEEPBEARD)
            {}

            void Reset() override
            {
                _Reset();
            }

            void JustDied(Unit* /**/) override
            {
                Talk(SAY_DEAD);
                _JustDied();
            }

            void KilledUnit(Unit* victim) override
            {
                if (victim && victim->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_KILL);
            }

            void EnterCombat(Unit* /**/) override
            {
                me->SetMaxPower(POWER_ENERGY, 100);
                _isEnraged = false;
                Talk(SAY_AGGRO);
                _EnterCombat();
                events.ScheduleEvent(EVENT_GROUND_SLAM, 5 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_GASEOUS_BUBBLES, 10 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_QUAKE, 15 * IN_MILLISECONDS);
                me->SetPower(POWER_ENERGY, 30);
            }

            void DamageTaken(Unit* /**/, uint32 & /**/) override
            {
                if (me->HealthBelowPct(30) && !_isEnraged)
                {
                    _isEnraged = true;
                    DoCast(me, SPELL_FRENZY, true);
                }
            }

            void EnterEvadeMode(EvadeReason reason) override
            {
                me->RemoveAllAreaTriggers();
                CreatureAI::EnterEvadeMode(reason);
            }

            void SummonedCreatureDespawn(Creature* summon) override
            {
                if (summon->GetEntry() == NPC_CALL_OF_THE_SEA)
                {
                    Map::PlayerList const & players = me->GetMap()->GetPlayers();

                    for (auto & it : players)
                    {
                        if (Player* player = it.GetSource())
                        {
                            player->RemoveAurasDueToSpell(SPELL_CALL_OF_SEAS_DMG);
                            player->RemoveAurasDueToSpell(SPELL_CALL_OF_SEAS_AURA);
                        }
                    }
                }

                BossAI::SummonedCreatureDespawn(summon);
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
                        case EVENT_CALL_OF_SEAS:
                        {
                            Talk(SAY_CALL_OF_SEAS);
                            DoCast(me, SPELL_CALL_OF_SEAS);
                            break;
                        }

                        case EVENT_GROUND_SLAM:
                        {
                            DoCastVictim(SPELL_GROUND_SLAM);
                            DoCastVictim(SPELL_GROUND_SLAM_DMG, true);
                            events.ScheduleEvent(EVENT_GROUND_SLAM, 25 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_GASEOUS_BUBBLES:
                        {
                            Talk(SAY_GASEOUS_BUBBLE);
                            DoCast(me, SPELL_GASEOUS_BUBBLE);
                            events.ScheduleEvent(EVENT_GASEOUS_BUBBLES, 32 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_QUAKE:
                        {
                            Talk(SAY_QUAKE);
                            me->SetPower(POWER_ENERGY, 100);
                            DoCastAOE(SPELL_QUAKE);
                            events.ScheduleEvent(EVENT_CALL_OF_SEAS, 8 * IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_QUAKE, 28 * IN_MILLISECONDS);
                            break;
                        }

                        default : break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                bool _isEnraged;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_king_deepbeard_AI(creature);
        }
};

class npc_eoa_quake : public CreatureScript
{
    public:
        npc_eoa_quake() : CreatureScript("npc_eoa_quake")
        {
        }

        struct npc_eoa_quake_AI : public ScriptedAI
        {
            npc_eoa_quake_AI(Creature* creature) : ScriptedAI(creature)
            {
                me->SetFaction(14);
            }

            void Reset()
            {
                me->CastSpell(me, SPELL_QUAKE_DMG, true);
                me->CastSpell(me, SPELL_AFTERSHOCK, true);
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_quake_AI(creature);
        }
};

class npc_eoa_call_the_seas : public CreatureScript
{
    public:
        npc_eoa_call_the_seas() : CreatureScript("npc_eoa_call_the_seas")
        {}

        struct npc_eoa_call_the_seas_AI : public ScriptedAI
        {
            npc_eoa_call_the_seas_AI(Creature* creature) : ScriptedAI(creature)
            {

            }

            void Reset()
            {
                me->SetReactState(REACT_PASSIVE);
                me->AddUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC));
                me->CastSpell(me, SPELL_CALL_OF_SEAS_AURA, true);

                me->GetMotionMaster()->MoveRandom(50.f);

                const auto & players = me->GetMap()->GetPlayers();

                if (players.isEmpty())
                    return;

                for (auto & it : players)
                {
                    if (it.GetSource())
                        _targets.push_back(it.GetSource());
                }
            }

            void UpdateAI(uint32 diff) override
            {
                if (!_targets.empty())
                {
                    for (auto & it : _targets)
                    {
                        if (it->GetDistance2d(me) <= 2.3f)
                        {
                            if (!it->HasAura(SPELL_CALL_OF_SEAS_DMG))
                                me->CastSpell(it, SPELL_CALL_OF_SEAS_DMG, true);
                        }
                        else
                            it->RemoveAurasDueToSpell(SPELL_CALL_OF_SEAS_DMG, me->GetGUID());
                    }
                }
            }

            private:
                std::list<Player*> _targets;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_call_the_seas_AI(creature);
        }
};

class spell_deepbeard_gaseous_bubbles : public SpellScriptLoader
{
    public:
        spell_deepbeard_gaseous_bubbles() : SpellScriptLoader("spell_deepbeard_gaseous_bubbles")
        {}

        class spell_deepbeard_gaseous_bubbles_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_deepbeard_gaseous_bubbles_SpellScript);

                void FilterTargets(std::list<WorldObject*> & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if([] (WorldObject*& target)
                    {
                        if (target && target->ToPlayer())
                            return false;

                        return true;
                    });
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_deepbeard_gaseous_bubbles_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                }
        };

        class spell_deepbeard_gaseous_bubbles_AuraScript : public AuraScript
        {
            public:
                PrepareAuraScript(spell_deepbeard_gaseous_bubbles_AuraScript);

                bool Load() override
                {
                    _amountAbsorbed = 0;
                    return true;
                }

                void HandleEffectRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
                {
                    if (!GetUnitOwner())
                        return;

                    Unit* owner = GetUnitOwner();

                    if (_amountAbsorbed >= aurEff->GetBaseAmount())
                        return;

                    if (owner->GetMap() && owner->GetMap()->IsHeroic())
                        owner->CastCustomSpell(SPELL_GASEOUS_EXPLOSION, SPELLVALUE_BASE_POINT0, aurEff->GetBaseAmount() - _amountAbsorbed, owner, true);
                    else
                        owner->CastSpell(owner, SPELL_GASEOUS_EXPLOSION, true);
                }

                void HandleDmgAbsorb(AuraEffect* aurEff, DamageInfo& dmgInfo, uint32& absorbAmount)
                {
                    _amountAbsorbed += absorbAmount;
                }

                void Register()
                {
                    AfterEffectAbsorb += AuraEffectAbsorbFn(spell_deepbeard_gaseous_bubbles_AuraScript::HandleDmgAbsorb, EFFECT_0);
                    AfterEffectRemove += AuraEffectRemoveFn(spell_deepbeard_gaseous_bubbles_AuraScript::HandleEffectRemove, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB, AURA_EFFECT_HANDLE_REAL);
                }

                private:
                    int32 _amountAbsorbed;
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_deepbeard_gaseous_bubbles_SpellScript();
        }

        AuraScript* GetAuraScript() const
        {
            return new spell_deepbeard_gaseous_bubbles_AuraScript();
        }
};

class spell_deepbeard_call_of_seas : public SpellScriptLoader
{
    public:
        spell_deepbeard_call_of_seas() : SpellScriptLoader("spell_deepbeard_call_of_seas")
        {}

        class spell_deepbeard_call_of_seas_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_deepbeard_call_of_seas_SpellScript);

                void HandleOnCast()
                {
                    if (!GetCaster())
                        return;


                    for (uint8 i = 0; i < 34; i++)
                    {
                        Position random = GetCaster()->GetRandomPoint(CenterPos, 25.0f);
                        GetCaster()->SummonCreature(NPC_CALL_OF_THE_SEA, random, TEMPSUMMON_TIMED_DESPAWN, 21 * IN_MILLISECONDS);
                    }

                    for (uint8 i = 0; i < 7; i++)
                        GetCaster()->SummonCreature(NPC_CALL_OF_THE_SEA, SeasSummonAdditionalsPos[i], TEMPSUMMON_TIMED_DESPAWN, 21 * IN_MILLISECONDS);

                }

                void FilterTargets(std::list<WorldObject*> & targets)
                {
                    if (targets.empty())
                        return;

                    targets.clear();
                }

                void Register()
                {
                    OnCast += SpellCastFn(spell_deepbeard_call_of_seas_SpellScript::HandleOnCast);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_deepbeard_call_of_seas_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                }

                private:
                    std::list<Player*> _targets;
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_deepbeard_call_of_seas_SpellScript();
        }
};

class spell_deepbeard_quake : public SpellScriptLoader
{
    public:
        spell_deepbeard_quake() : SpellScriptLoader("spell_deepbeard_quake")
        {}

        class spell_deepbeard_quake_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_deepbeard_quake_SpellScript);

                void FilterTargets(std::list<WorldObject*>& targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if([] (WorldObject*& target)
                    {
                        if (target && target->ToPlayer())
                            return false;

                        return true;
                    });
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_deepbeard_quake_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_deepbeard_quake_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_deepbeard_quake_SpellScript();
        }
};

void AddSC_boss_king_deepbeard()
{
    new boss_king_deepbeard();
    new npc_eoa_quake();
    new npc_eoa_call_the_seas();
    new spell_deepbeard_gaseous_bubbles();
    new spell_deepbeard_call_of_seas();
    new spell_deepbeard_quake();
}
