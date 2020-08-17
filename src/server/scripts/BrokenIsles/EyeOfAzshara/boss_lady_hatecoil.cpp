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
#include "GameObjectAI.h"
#include "GameObject.h"
#include "eye_of_azshara.h"

enum Spells
{
    SPELL_ARCANE_SHIELDING          = 197868,
    SPELL_STATIC_NOVA               = 193597,
    SPELL_BECKON_STORM              = 193682,
    SPELL_BECKON_STORM_SUMMON       = 193683,
    SPELL_FOCUSED_LIGHTNING         = 193611,
    SPELL_EXCESS_LIGHTING_PLAYER    = 193624,
    SPELL_EXCESS_LIGHTING_SAND      = 193625,
    SPELL_CRACKLING_THUNDER         = 197326,
    SPELL_CURSE_OF_WITCH_AURA       = 193698,
    SPELL_CURSE_OF_WITCH_KNOCK      = 193700,
    SPELL_CURSE_OF_WITCH_ROOT       = 194197,
    SPELL_CURSE_OF_WITCH_KILL       = 193720,
    SPELL_MONSOON                   = 196630,

    SPELL_WATERY_SPLASH             = 193636,

    SPELL_SAND_DUNE                 = 193060,
    SPELL_SAND_DUNE_SUMMON          = 193061,

    // Monsoon
    SPELL_MONSOON_VISAL             = 196609,
    SPELL_MONSOON_DMG               = 196610,

    // Hatecoil Arcanist
    SPELL_AQUA_SPOT                 = 196027,
    SPELL_ARCANE_REBOUND            = 196028,
    SPELL_POLYMORPH                 = 197105,
    SPELL_ARCANE_ALIGNMENT          = 197115,
    SPELL_ARCANE_FORTIFICATION      = 199865,
};

enum Npcs
{
    NPC_SALTSEA_GLOBULE = 98293,
    NPC_SAND_DUNE       = 97853,
    NPC_MONSOON         = 99852,
};

enum Events
{
    EVENT_STATIC_NOVA       = 1,
    EVENT_BECKON_STORM      = 2,
    EVENT_FOCUSED_LIGHTING  = 3,
    EVENT_CRACKLING_THUNDER = 4,
    EVENT_CURSE_OF_WITCH    = 5,
    EVENT_MONSOON           = 6,

    // Hatecoil Arcanist
    EVENT_AQUA_SPOT         = 7,
    EVENT_ARCANE_REBOUND    = 8,
    EVENT_POLYMORPH         = 9,
};

enum Says
{
    SAY_AGGRO               = 0,
    SAY_INTRO               = 1,
    SAY_STATIC_NOVA         = 2,
    SAY_BECKON_STORM        = 3,
    SAY_FOCUSED_LIGHTING    = 4,
    SAY_CURSE_OF_WITCH      = 5,
    SAY_KILL                = 6,
    SAY_DEATH               = 7,
    SAY_DEATH_LAST          = 8,
};

enum Actions
{
    ACTION_SPAWN_DUNE       = 1,
    ACTION_REMOVE_SHIELD    = 2,
};

const uint32 CurseOfWitchSpells [] =
{
    193712, // SPELL_CURSE_OF_WITCH_1_TARGET
    193716, // SPELL_CURSE_OF_WITCH_3_TARGET
    193717, // SPELL_CURSE_OF_WITCH_5_TARGET
};

const Position ArenaCenter = {-3439.963f, 4589.192f, -0.4387f};

class boss_lady_hatecoil : public CreatureScript
{
    public:
        boss_lady_hatecoil() : CreatureScript("boss_lady_hatecoil")
        {}

        struct boss_lady_hatecoil_AI : public BossAI
        {
            boss_lady_hatecoil_AI(Creature* creature) : BossAI(creature, DATA_LADY_HATECOIL)
            {
                CheckIntro();
                RespawnDunes();
            }

            void Reset()
            {
                _Reset();
            }

            void CheckIntro()
            {
                if (instance->GetData(DATA_LADY_INTRO) == DONE)
                {
                    _intro = true;
                    me->RemoveAurasDueToSpell(SPELL_ARCANE_SHIELDING);
                }
                else
                {
                    for (uint8 i  = 0; i < 2; ++i)
                        me->CastSpell(me, SPELL_ARCANE_SHIELDING, true);

                    _intro = false;
                    _arcanistDead = 0;
                }
            }

            void EnterEvadeMode(EvadeReason reason) override
            {
                CreatureAI::EnterEvadeMode(reason);
            }

            void JustReachedHome() override
            {
                RespawnDunes();
                CheckIntro();
                _JustReachedHome();
            }

            void JustDied(Unit* /**/) override
            {
                Talk(SAY_DEATH);
                _JustDied();
            }

            void EnterCombat(Unit* ) override
            {
                Talk(SAY_AGGRO);
                _EnterCombat();
                events.ScheduleEvent(EVENT_BECKON_STORM, 19 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_CURSE_OF_WITCH, 16 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_STATIC_NOVA, 11 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_CRACKLING_THUNDER, IN_MILLISECONDS);

                if (IsHeroic())
                    events.ScheduleEvent(EVENT_MONSOON, 50 * IN_MILLISECONDS);
            }

            void RespawnDunes()
            {
                std::list<GameObject*> dunesGob;

                me->GetGameObjectListWithEntryInGrid(dunesGob, GO_SAND_DUNE, 500.0f);

                if (!dunesGob.empty())
                {
                    for (auto & it : dunesGob)
                        it->SetGoState(GO_STATE_READY);
                }
            }

            void KilledUnit(Unit* target) override
            {
                if (target && target->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_KILL);
            }

            void DoAction(int32 action) override
            {
                if (action == ACTION_REMOVE_SHIELD)
                {
                    _arcanistDead++;

                    if (_arcanistDead >= 2 && !_intro)
                    {
                        instance->SetData(DATA_LADY_INTRO, DONE);
                        me->RemoveAurasDueToSpell(SPELL_ARCANE_SHIELDING);
                        _intro = true;
                        Talk(SAY_INTRO);
                    }
                }
            }

            void CheckPlayersFar()
            {
                Map::PlayerList const & players = me->GetMap()->GetPlayers();

                if (players.isEmpty())
                    return;

                for (auto & it : players)
                {
                    if (Player* player = it.GetSource())
                    {
                        if (player->GetDistance2d(ArenaCenter.GetPositionX(), ArenaCenter.GetPositionY()) >= 50.0f)
                            me->CastSpell(player, SPELL_CRACKLING_THUNDER, true);
                    }
                }
            }

            void UpdateAI(uint32 diff)
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
                        case EVENT_MONSOON:
                        {
                            uint32 castTimes = urand(1,3);

                            for (uint32 i = 0; i < castTimes; ++i)
                                DoCast(SPELL_MONSOON);

                            events.ScheduleEvent(EVENT_MONSOON, 25 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_STATIC_NOVA:
                        {
                            Talk(SAY_STATIC_NOVA);
                            DoCast(me, SPELL_STATIC_NOVA);
                            events.ScheduleEvent(EVENT_FOCUSED_LIGHTING, 15 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_CRACKLING_THUNDER:
                        {
                            CheckPlayersFar();
                            events.ScheduleEvent(EVENT_CRACKLING_THUNDER, 500);
                            break;
                        }

                        case EVENT_CURSE_OF_WITCH:
                        {
                            Talk(SAY_CURSE_OF_WITCH);
                            uint32 spellId = CurseOfWitchSpells[urand(0,2)];
                            DoCast(me, spellId);
                            events.ScheduleEvent(EVENT_CURSE_OF_WITCH, 23 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_FOCUSED_LIGHTING:
                        {
                            Talk(SAY_FOCUSED_LIGHTING);
                            DoCast(me, SPELL_FOCUSED_LIGHTNING);
                            events.ScheduleEvent(EVENT_STATIC_NOVA, 20 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_BECKON_STORM:
                        {
                            Talk(SAY_BECKON_STORM);
                            DoCast(me, SPELL_BECKON_STORM);
                            events.ScheduleEvent(EVENT_BECKON_STORM, 45 * IN_MILLISECONDS);
                            break;
                        }
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                uint32 _arcanistDead;
                bool _intro;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_lady_hatecoil_AI(creature);
        }
};

class go_sand_dune : public GameObjectScript
{
    public:
        go_sand_dune() : GameObjectScript("go_sand_dune")
        {}

        struct go_sand_dune_AI : public GameObjectAI
        {
            go_sand_dune_AI(GameObject* go) : GameObjectAI(go)
            {}

            void Reset()
            {
                me->AddFlag(GameObjectFlags(GO_FLAG_LOCKED | GO_FLAG_NOT_SELECTABLE));
            }
        };

        GameObjectAI* GetAI(GameObject* go) const override
        {
            return new go_sand_dune_AI(go);
        }
};

class npc_eoa_hatecoil_arcanist : public CreatureScript
{
    public:
        npc_eoa_hatecoil_arcanist() : CreatureScript("npc_eoa_hatecoil_arcanist")
        {}

        struct npc_eoa_hatecoil_arcanist_AI : public ScriptedAI
        {
            npc_eoa_hatecoil_arcanist_AI(Creature* creature) : ScriptedAI(creature)
            {
                _instance = nullptr;
            }

            void Reset() override
            {
                if (!_instance)
                    _instance = me->GetInstanceScript();

                _events.Reset();

                if (!_instance)
                    return;

                if (_instance->GetData(DATA_LADY_INTRO) == DONE)
                    me->RemoveAurasDueToSpell(SPELL_ARCANE_ALIGNMENT);
                else
                    me->CastSpell(me, SPELL_ARCANE_ALIGNMENT, true);
            }

            void EnterCombat(Unit* /**/) override
            {
                _events.ScheduleEvent(EVENT_ARCANE_REBOUND, 2 * IN_MILLISECONDS);
                _events.ScheduleEvent(EVENT_POLYMORPH, 12 * IN_MILLISECONDS);
                _events.ScheduleEvent(EVENT_AQUA_SPOT, 16 * IN_MILLISECONDS);
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
                        case EVENT_AQUA_SPOT:
                            DoCast(me, SPELL_AQUA_SPOT);
                            _events.ScheduleEvent(EVENT_AQUA_SPOT, 20 * IN_MILLISECONDS);
                            break;

                        case EVENT_POLYMORPH:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                                DoCast(target, SPELL_POLYMORPH);
                            _events.ScheduleEvent(EVENT_POLYMORPH, urand(12, 15) * IN_MILLISECONDS);
                            break;

                        case EVENT_ARCANE_REBOUND:
                            DoCastVictim(SPELL_ARCANE_REBOUND);
                            _events.ScheduleEvent(EVENT_ARCANE_REBOUND, 6 * IN_MILLISECONDS);
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                InstanceScript* _instance;
                EventMap _events;

        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_hatecoil_arcanist_AI(creature);
        }
};

class npc_eoa_saltsea_globule : public CreatureScript
{
    public:
        npc_eoa_saltsea_globule() : CreatureScript("npc_eoa_saltsea_globule")
        {}

        struct npc_eoa_saltsea_globule_AI : public ScriptedAI
        {
            npc_eoa_saltsea_globule_AI(Creature* creature) : ScriptedAI(creature)
            {}

            void JustDied(Unit* ) override
            {
                DoCast(me, SPELL_WATERY_SPLASH, true);
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_saltsea_globule_AI(creature);
        }
};

class npc_eoa_moonson : public CreatureScript
{
    public:
        npc_eoa_moonson() : CreatureScript("npc_eoa_moonson")
        {}

        struct npc_eoa_moonson_AI : public ScriptedAI
        {
            npc_eoa_moonson_AI(Creature* creature) : ScriptedAI(creature)
            {

            }

            void Reset() override
            {
                _target = nullptr;
                _timeBorn = 0;
                me->CastSpell(me, SPELL_MONSOON_VISAL, true);
                me->SetWalk(true);
                me->SetWaterWalking(true);
                me->SetSpeed(MOVE_WALK, 0.25f);
                me->SetSpeed(MOVE_RUN, 0.05f);

                _dunes.clear();
                me->GetGameObjectListWithEntryInGrid(_dunes, GO_SAND_DUNE, 500.0f);
            }


            void FindTargetToFollow()
            {
                _target = SelectTarget(SELECT_TARGET_MINDISTANCE, 0, 0, true);

                if (_target)
                {
                    me->GetMotionMaster()->MoveFollow(_target, 0, 0);
                }
            }

            void JustDied(Unit* /**/) override
            {
                _dunes.clear();
            }

            void CheckDistanceToTarget()
            {
                if (!_target)
                    return;

                me->GetMotionMaster()->MoveFollow(_target, 0, 0);

                if (me->GetDistance2d(_target) <= 3.0f)
                {
                    me->CastSpell(_target, SPELL_MONSOON_DMG, true);
                    _dunes.clear();
                    me->DespawnOrUnsummon(500);
                }
            }

            void CheckDunesNear()
            {
                if (_dunes.empty())
                   return;

                for (auto & it : _dunes)
                {
                    if (it == nullptr)
                        continue;

                    if (me->GetDistance2d(it) <= 5.0f)
                    {
                        it->SetGoState(GO_STATE_ACTIVE);
                        it = nullptr;
                   }
                }
            }

            void UpdateAI(uint32 diff) override
            {
                _timeBorn += diff;
                _timerDunes += diff;
                _timerPlayer += diff;

                if (_timeBorn >= 10 * IN_MILLISECONDS)
                {
                    if (_timerPlayer >= 5 * IN_MILLISECONDS)
                    {
                        if (!_target)
                        {
                            FindTargetToFollow();
                        }
                        else if (_target && _target->IsAlive())
                        {
                            CheckDistanceToTarget();
                        }
                        else if (_target && _target->isDead())
                        {
                            FindTargetToFollow();
                        }

                        _timerPlayer = 0;
                    }
                    else if (_timerDunes >= 250)
                    {
                        CheckDunesNear();
                        _timerDunes = 0;
                    }
                }
            }

            private:
                uint32 _timeBorn;
                uint32 _timerPlayer;
                uint32 _timerDunes;
                Unit* _target;
                std::list<GameObject*> _dunes;

        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_moonson_AI(creature);
        }
};

class spell_lady_hatecoil_beckon_storm : public SpellScriptLoader
{
    public:
        spell_lady_hatecoil_beckon_storm() : SpellScriptLoader("spell_lady_hatecoil_beckon_storm")
        {}

        class spell_lady_hatecoil_beckon_storm_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_lady_hatecoil_beckon_storm_SpellScript);

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

                void HandleDummy(SpellEffIndex /**/)
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    GetCaster()->CastSpell(GetHitUnit(), SPELL_BECKON_STORM_SUMMON, true);
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(spell_lady_hatecoil_beckon_storm_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_lady_hatecoil_beckon_storm_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_lady_hatecoil_beckon_storm_SpellScript();
        }
};

class spell_lady_hatecoil_curse_of_witch : public SpellScriptLoader
{
    public:
        spell_lady_hatecoil_curse_of_witch() : SpellScriptLoader("spell_lady_hatecoil_curse_of_witch")
        {}

        class spell_lady_hatecoil_curse_of_witch_AuraScript : public AuraScript
        {
            public:
                PrepareAuraScript(spell_lady_hatecoil_curse_of_witch_AuraScript);

                void HandleEffectRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
                {
                    if (!GetUnitOwner() || !GetCaster())
                        return;

                    Unit* target = GetUnitOwner();

                    target->CastSpell(target, SPELL_CURSE_OF_WITCH_KNOCK, true);
                    target->CastSpell(target, SPELL_CURSE_OF_WITCH_KILL, true);
                    target->CastSpell(target, SPELL_CURSE_OF_WITCH_ROOT, true);
                }

                void Register()
                {
                    AfterEffectRemove += AuraEffectRemoveFn(spell_lady_hatecoil_curse_of_witch_AuraScript::HandleEffectRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
                }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_lady_hatecoil_curse_of_witch_AuraScript();
        }
};

class spell_lady_hatecoil_curse_of_witch_kill : public SpellScriptLoader
{
    public:
        spell_lady_hatecoil_curse_of_witch_kill() : SpellScriptLoader("spell_lady_hatecoil_curse_of_witch_kill")
        {}

        class spell_lady_hatecoil_curse_of_witch_kill_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_lady_hatecoil_curse_of_witch_kill_SpellScript);

                void FilterTargets(std::list<WorldObject*> & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if([] (WorldObject*& target)
                    {
                        if (target && target->GetEntry() == NPC_SALTSEA_GLOBULE)
                            return false;

                        return true;
                    });
                }

                void Register()
                {
                    // OnEffectHitTarget += SpellEffectFn(spell_lady_hatecoil_excess_lighting_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_lady_hatecoil_curse_of_witch_kill_SpellScript();
        }
};

class spell_lady_hatecoil_curse_of_witch_trigger : public SpellScriptLoader
{
    public:
        spell_lady_hatecoil_curse_of_witch_trigger() : SpellScriptLoader("spell_lady_hatecoil_curse_of_witch_trigger")
        {}

        class spell_lady_hatecoil_curse_of_witch_trigger_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_lady_hatecoil_curse_of_witch_trigger_SpellScript);

                void FilterTargets(std::list<WorldObject*> & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if([] (WorldObject* & target)
                    {
                        if (target && target->ToPlayer())
                            return false;

                        return true;
                    });
                }

                void HandleDummy(SpellEffIndex /**/)
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    GetCaster()->CastSpell(GetHitUnit(), SPELL_CURSE_OF_WITCH_AURA, true);
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(spell_lady_hatecoil_curse_of_witch_trigger_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_lady_hatecoil_curse_of_witch_trigger_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_lady_hatecoil_curse_of_witch_trigger_SpellScript();
        }
};

class spell_lady_hatecoil_static_nova : public SpellScriptLoader
{
    public:
        spell_lady_hatecoil_static_nova() : SpellScriptLoader("spell_lady_hatecoil_static_nova")
        {}

        class spell_lady_hatecoil_static_nova_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_lady_hatecoil_static_nova_SpellScript);

                void FilterTargets(std::list<WorldObject*> & targets)
                {
                    targets.remove_if([] (WorldObject*& target)
                    {
                        if (target && target->GetPositionZ() > 0 && target->ToPlayer())
                            return true;

                        return false;
                    });
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_lady_hatecoil_static_nova_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_lady_hatecoil_static_nova_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_lady_hatecoil_static_nova_SpellScript();
        }
};

class spell_lady_hatecoil_excess_lighting : public SpellScriptLoader
{
    public:
        spell_lady_hatecoil_excess_lighting() : SpellScriptLoader("spell_lady_hatecoil_excess_lighting")
        {}

        class spell_lady_hatecoil_excess_lighting_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_lady_hatecoil_excess_lighting_SpellScript);

                void HandleDummy(SpellEffIndex)
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    Unit* target = GetHitUnit();

                    if (target->GetEntry() == NPC_SAND_DUNE)
                    {
                        if (GameObject* Cage = target->FindNearestGameObject(GO_SAND_DUNE, 10.0f))
                            Cage->SetGoState(GO_STATE_ACTIVE);
                    }
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(spell_lady_hatecoil_excess_lighting_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_lady_hatecoil_excess_lighting_SpellScript();
        }
};

void AddSC_boss_lady_hatecoil()
{
    new boss_lady_hatecoil();
    new npc_eoa_moonson();
    new npc_eoa_saltsea_globule();
    new npc_eoa_hatecoil_arcanist();
    new go_sand_dune();
    new spell_lady_hatecoil_beckon_storm();
    new spell_lady_hatecoil_curse_of_witch();
    new spell_lady_hatecoil_curse_of_witch_trigger();
    new spell_lady_hatecoil_curse_of_witch_kill();
    new spell_lady_hatecoil_excess_lighting();
    new spell_lady_hatecoil_static_nova();
}
