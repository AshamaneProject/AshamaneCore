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
#include "eye_of_azshara.h"
#include "AreaTrigger.h"
#include "Vehicle.h"
#include <G3D/Vector3.h>

enum Spells
{
    // Wrath of Azshara
    SPELL_ARCANE_BOMB               = 192706,
    SPELL_ARCANE_BOMB_DMG           = 192708,
    SPELL_ARCANE_BOMB_VISUAL        = 192711,

    SPELL_MASSIVE_DELUGE            = 192617,
    SPELL_MASSIVE_DELUGE_DMG        = 192619,

    SPELL_MYSTIC_TORNADO            = 192680,
    SPELL_MYSTIC_TORNADO_SUMMON     = 192681,

    SPELL_CRUSHING_DEPTHS           = 197365,
    SPELL_CRY_OF_WRATH              = 192985,
    SPELL_RAGING_STORMS             = 192696,
    SPELL_HEAVING_SANDS             = 197165,

    SPELL_TIDAL_WAVE_AURA           = 192940,
    SPELL_TIDAL_WAVE_DUMMY          = 192793,
    SPELL_LIGHTING_STRIKES_AURA     = 192737,
    SPELL_LIGHTING_STRIKES_TARGET   = 192966,
    SPELL_LIGHTING_STRIKES_DMG      = 192796,

    SPELL_TIDAL_WAVE_AURA_CRY       = 197219,
    SPELL_TIDAL_WAVE_CRY_DUMMY      = 192797,

    SPELL_LIGHTING_STRIKES_AURA_CRY = 192989,
    SPELL_RIDE_VEHICLE              = 46598,

    SPELL_VIOLET_WINDS_AURA         = 191805,
    SPELL_VIOLET_WINDS_AURA_CRY     = 192649,
    SPELL_VIOLET_WINDS_DEBUFF       = 191797,
    SPELL_VIOLET_WINDS_AREA         = 191794,

    // Crushing Wave
    SPELL_FROST_RESONANCE           = 196666,

    // Mystic Tornado
    SPELL_MYSTIC_TORNADO_VISUAL     = 192673,
    SPELL_MYSTIC_TORNADO_DMG        = 192675,
    SPELL_MAGIC_RESONANCE           = 196665,

    // Tidal Wave
    SPELL_TIDAL_WAVE_TARGET         = 192792,
    SPELL_TIDAL_WAVE_DMG            = 192801,
    SPELL_TIDAL_WAVE_VISUAL         = 192753,

    // Ritualist Spells
    SPELL_MAGIC_BINDING             = 196515,
    SPELL_POLYMORPH_FISH            = 197105,
    SPELL_AQUA_SPOT                 = 196027,
    SPELL_STORM                     = 196870,
    SPELL_LIGHTING_BLAST            = 196516,
    SPELL_STORM_CONDUIT             = 193196,
};

enum Events
{
    EVENT_ARCANE_BOMB       = 1,
    EVENT_CRUSHING_DEPTHS   = 2,
    EVENT_MASSIVE_DELUGE    = 3,
    EVENT_MYSTIC_TORNADO    = 4,
    EVENT_RAGING_STORMS     = 5,

    // Mystic Tornado
    EVENT_CHECK_DISTANCE    = 6,
    EVENT_FIND_POSITION     = 7,
    EVENT_BORN              = 8,

    // Tidal Wave
    EVENT_TIDAL_WAVE        = 9,

    // Ritualist Events
    EVENT_MAGIC_BINDING     = 10,
    EVENT_POLYMORPH_FISH     = 11,
    EVENT_AQUA_SPOT         = 12,
    EVENT_STORM             = 13,
    EVENT_LIGHTING_BLAST    = 14,
};

enum Adds
{
    NPC_ARCANE_BOMB     = 97691,
    NPC_MYSTIC_TORNADO  = 97673,
    NPC_TIDAL_WAVE      = 97739,
};

enum Says
{
    SAY_INTRO           = 0,
    SAY_ACTIVE          = 1,
    SAY_AGGRO           = 2,
    SAY_MASSIVE_DELUGE  = 3,
    SAY_CRUSHING_DEPTHS = 4,
    SAY_ARCANE_BOMB     = 5,
    SAY_CRY_OF_WRATH    = 6,
    SAY_KILL            = 7,
    SAY_WIPE            = 8,
    SAY_DEATH           = 9,
};

enum Points
{
    POINT_SELECT_POSITION = 1,
};

enum Actions
{
    ACTION_RITUALIST_DEAD   = 1,
    ACTION_BOSSES_DEAD      = 2,
};

struct PlayerFilter
{
    bool operator() (WorldObject* unit)
    {
        if (unit && unit->ToPlayer())
            return false;

        return true;
    }
};

using SpellTargets = std::list<WorldObject*>;

class boss_wrath_of_azshara : public CreatureScript
{
    public:
        boss_wrath_of_azshara() : CreatureScript("boss_wrath_of_azshara")
        {}

        struct boss_wrath_of_azshara_AI : public BossAI
        {
            boss_wrath_of_azshara_AI(Creature* creature) : BossAI(creature, DATA_WRATH_OF_AZSHARA)
            {
            }

            void Reset() override
            {
                me->SetObjectScale(0.6f);
                me->SetRegenerateHealth(false);
                me->AddUnitState(UNIT_STATE_ROOT);
                _Reset();
                CheckIntro();
            }

            void CheckIntro()
            {
                if (instance->GetData(DATA_WRATH_INTRO) == DONE)
                {
                    _intro = true;
                    me->SetHealth(me->GetMaxHealth() * 0.2);
                    me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC));
                }
                else
                {
                    me->SetFullHealth();
                    _intro = false;
                    me->AddUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC));
                }
            }

            void DamageTaken(Unit* attacker, uint32 & damage) override
            {
                if (me->HealthBelowPct(10) && !_isWrathed)
                {
                    Talk(SAY_CRY_OF_WRATH);
                    me->InterruptNonMeleeSpells(false);
                    me->RemoveAurasDueToSpell(SPELL_LIGHTING_STRIKES_AURA);
                    me->RemoveAurasDueToSpell(SPELL_VIOLET_WINDS_AURA);
                    me->CastSpell(me, SPELL_CRY_OF_WRATH);
                    _isWrathed = true;
                }
            }

            void CleanUpAuras()
            {
                me->RemoveAurasDueToSpell(SPELL_LIGHTING_STRIKES_AURA);
                me->RemoveAurasDueToSpell(SPELL_LIGHTING_STRIKES_AURA_CRY);
                me->RemoveAurasDueToSpell(SPELL_TIDAL_WAVE_AURA_CRY);
                me->RemoveAurasDueToSpell(SPELL_VIOLET_WINDS_AURA);
                me->RemoveAurasDueToSpell(SPELL_VIOLET_WINDS_AURA_CRY);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_FROST_RESONANCE);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_MAGIC_RESONANCE);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_ARCANE_BOMB);
            }

            void EnterEvadeMode(EvadeReason reason) override
            {
                Talk(SAY_WIPE);
                _EnterEvadeMode(reason);
                CleanUpAuras();
                Reset();
            }

            void EnterCombat(Unit* /**/) override
            {
                _isWrathed = false;
                _EnterCombat();

                DoCast(me, SPELL_LIGHTING_STRIKES_AURA, true);
                DoCast(me, SPELL_VIOLET_WINDS_AURA, true);

                events.ScheduleEvent(EVENT_MYSTIC_TORNADO, 8 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_ARCANE_BOMB, 27 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_MASSIVE_DELUGE, 13 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_RAGING_STORMS, 5 * IN_MILLISECONDS);

                if (IsHeroic())
                    events.ScheduleEvent(EVENT_CRUSHING_DEPTHS, 21 * IN_MILLISECONDS);
            }

            void KilledUnit(Unit* unit) override
            {
                if (unit && unit->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_KILL);
            }

            void JustDied(Unit* ) override
            {
                Talk(SAY_DEATH);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_FROST_RESONANCE);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_MAGIC_RESONANCE);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_ARCANE_BOMB);
                _JustDied();
            }

            void DamageDealt(Unit* victim, uint32& /*damage*/, DamageEffectType damageType) override
            {
                if (victim)
                {
                    if (victim == me->GetVictim() && damageType == DIRECT_DAMAGE)
                        me->CastSpell(me, SPELL_HEAVING_SANDS, true);
                }
            }

            void DoAction(int32 action) override
            {
                if (action == ACTION_RITUALIST_DEAD && !_intro)
                {
                    _intro = true;
                    Talk(SAY_INTRO);
                    instance->SetData(DATA_WRATH_INTRO, DONE);
                    CheckIntro();
                }
            }

            void SpellHitTarget(Unit* target, SpellInfo const* spell) override
            {
                if (!target || !spell)
                    return;

                if (!IsHeroic())
                    return;

                switch(spell->Id)
                {
                    case SPELL_RAGING_STORMS:
                    case SPELL_MASSIVE_DELUGE_DMG:
                    case SPELL_CRUSHING_DEPTHS:
                        me->CastSpell(target, SPELL_FROST_RESONANCE, true);
                        break;

                    default : break;
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
                        case EVENT_RAGING_STORMS:
                        {
                            if (!me->IsWithinMeleeRange(me->GetVictim()))
                                DoCast(me, SPELL_RAGING_STORMS);

                            events.ScheduleEvent(EVENT_RAGING_STORMS, 500);
                            break;
                        }

                        case EVENT_ARCANE_BOMB:
                        {
                            Talk(SAY_ARCANE_BOMB);
                            Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me, true));

                            if (target)
                                DoCast(target, SPELL_ARCANE_BOMB);
                            else
                                DoCastVictim(SPELL_ARCANE_BOMB);

                            events.ScheduleEvent(EVENT_ARCANE_BOMB, 24 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_CRUSHING_DEPTHS:
                        {
                            Talk(SAY_CRUSHING_DEPTHS);

                            Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me, true));

                            if (target)
                                DoCast(target, SPELL_CRUSHING_DEPTHS);
                            else
                                DoCastVictim(SPELL_CRUSHING_DEPTHS);

                            events.ScheduleEvent(EVENT_CRUSHING_DEPTHS, 43 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_MASSIVE_DELUGE:
                        {
                            Talk(SAY_MASSIVE_DELUGE);
                            DoCastVictim(SPELL_MASSIVE_DELUGE);
                            events.ScheduleEvent(EVENT_MASSIVE_DELUGE, 27 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_MYSTIC_TORNADO:
                        {
                            DoCast(me, SPELL_MYSTIC_TORNADO);
                            if (_isWrathed)
                                events.ScheduleEvent(EVENT_MYSTIC_TORNADO, Seconds(15));
                            else
                                events.ScheduleEvent(EVENT_MYSTIC_TORNADO, Seconds(26));
                            break;
                        }

                        default : break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                bool _isWrathed, _intro;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_wrath_of_azshara_AI(creature);
        }
};

class npc_hatecoil_ritualist : public CreatureScript
{
    public:
        npc_hatecoil_ritualist() : CreatureScript("npc_hatecoil_ritualist")
        {}

        struct npc_hatecoil_ritualist_AI : public ScriptedAI
        {
            npc_hatecoil_ritualist_AI(Creature* creature) : ScriptedAI(creature)
            {
            }

            void Reset() override
            {
                CheckStormChannel();
                _events.Reset();
            }

            void DoAction(int32 action) override
            {
                if (action == ACTION_BOSSES_DEAD)
                    CheckStormChannel();
            }

            void CheckStormChannel()
            {
                InstanceScript* instance = me->GetInstanceScript();

                if (!instance)
                    return;

                if (instance->GetData(DATA_RITUAL_EVENT) == DONE)
                {
                    me->RemoveAurasDueToSpell(SPELL_TEMPEST_ATTUNEMENT);
                    ActivateConduit();
                }
                else
                    me->CastSpell(me, SPELL_TEMPEST_ATTUNEMENT, true);
            }

            void JustReachedHome()
            {
                ActivateConduit();
            }

            void ActivateConduit()
            {
                if (Creature* wrath = me->FindNearestCreature(BOSS_WRATH_OF_AZSHARA, 500.f, true))
                    DoCast(wrath, SPELL_STORM_CONDUIT, true);
            }

            void EnterCombat(Unit* /**/) override
            {
                me->setActive(true);
                DoZoneInCombat();

                _events.ScheduleEvent(EVENT_LIGHTING_BLAST, 3 * IN_MILLISECONDS);
                _events.ScheduleEvent(EVENT_ARCANE_BOMB, 15 * IN_MILLISECONDS);

                switch (me->GetEntry())
                {
                    case NPC_CHANNELER_VARISZ:
                    {
                        _events.ScheduleEvent(EVENT_POLYMORPH_FISH, 6 * IN_MILLISECONDS);
                        break;
                    }

                    case NPC_RITUALIST_LESHA:
                    {
                        _events.ScheduleEvent(EVENT_AQUA_SPOT, 6 * IN_MILLISECONDS);
                        break;
                    }

                    case NPC_MYSTIC_SSAVEH:
                    {
                        _events.ScheduleEvent(EVENT_STORM, 10 * IN_MILLISECONDS);
                        break;
                    }

                    case NPC_BINDER_ASHIOIS:
                    {
                        _events.ScheduleEvent(EVENT_MAGIC_BINDING, 6 * IN_MILLISECONDS);
                        break;
                    }
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
                        case EVENT_ARCANE_BOMB:
                        {
                            Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me, true));

                            if (!target)
                                DoCastVictim(SPELL_ARCANE_BOMB);
                            else
                                DoCast(target, SPELL_ARCANE_BOMB);

                            _events.ScheduleEvent(EVENT_ARCANE_BOMB, 15 * IN_MILLISECONDS);

                            break;
                        }

                        case EVENT_POLYMORPH_FISH:
                        {
                            Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me, true));

                            if (!target)
                                DoCastVictim(SPELL_POLYMORPH_FISH);
                            else
                                DoCast(target, SPELL_POLYMORPH_FISH);

                            _events.ScheduleEvent(EVENT_POLYMORPH_FISH, 20 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_MAGIC_BINDING:
                        {
                            DoCast(me, SPELL_MAGIC_BINDING);
                            _events.ScheduleEvent(EVENT_MAGIC_BINDING, urand(10, 13) * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_LIGHTING_BLAST:
                        {
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                                DoCast(target, SPELL_LIGHTING_BLAST);
                            _events.ScheduleEvent(EVENT_LIGHTING_BLAST, 6 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_STORM:
                        {
                            DoCast(me, SPELL_STORM);
                            _events.ScheduleEvent(EVENT_STORM, 20 * IN_MILLISECONDS);
                            break;
                        }

                        case EVENT_AQUA_SPOT:
                        {
                            DoCast(me, SPELL_AQUA_SPOT);
                            _events.ScheduleEvent(EVENT_AQUA_SPOT, 20 * IN_MILLISECONDS);
                            break;
                        }

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
            return new npc_hatecoil_ritualist_AI(creature);
        }
};

class npc_eoa_mystic_tornado : public CreatureScript
{
    public:
        npc_eoa_mystic_tornado() : CreatureScript("npc_eoa_mystic_tornado")
        {}

        struct npc_eoa_mystic_tornado_AI : public ScriptedAI
        {
            npc_eoa_mystic_tornado_AI(Creature* creature) : ScriptedAI(creature)
            {
            }

            void Reset()
            {
                me->SetSpeed(MOVE_RUN, 1.2f);

                _events.Reset();

                me->setActive(true);

                _events.ScheduleEvent(EVENT_BORN, 2 * IN_MILLISECONDS);
            }

            void SpellHitTarget(Unit* target, SpellInfo const* spell) override
            {
                if (!target || !spell)
                    return;

                if (!IsHeroic())
                    return;

                if (spell->Id == SPELL_MYSTIC_TORNADO_DMG)
                    me->CastSpell(target, SPELL_MAGIC_RESONANCE, true);
            }

            void CheckDist()
            {
                Map::PlayerList const & players = me->GetMap()->GetPlayers();

                if (!players.isEmpty())
                {
                    for (auto & it : players)
                    {
                        if (Player* player = it.GetSource())
                        {
                            if (me->GetDistance2d(player) <= 3.0f)
                                me->CastSpell(player, SPELL_MYSTIC_TORNADO_DMG, true);
                        }
                    }
                }
            }

            void UpdateAI(uint32 diff) override
            {
                _events.Update(diff);

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    if (eventId == EVENT_CHECK_DISTANCE)
                    {
                        CheckDist();
                        _events.ScheduleEvent(EVENT_CHECK_DISTANCE, 500);
                    }
                    else if (eventId == EVENT_BORN)
                    {
                        me->CastSpell(me, SPELL_MYSTIC_TORNADO_VISUAL, true);
                        me->GetMotionMaster()->MoveRandom(25.0f);
                        _events.ScheduleEvent(EVENT_CHECK_DISTANCE, 500);
                    }
                }
            }

            private:
                EventMap _events;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_mystic_tornado_AI(creature);
        }
};

class npc_eoa_arcane_bomb : public CreatureScript
{
    public:
        npc_eoa_arcane_bomb() : CreatureScript("npc_eoa_arcane_bomb")
        {}

        struct npc_eoa_arcane_bomb_AI : public ScriptedAI
        {
            npc_eoa_arcane_bomb_AI(Creature* creature) : ScriptedAI(creature)
            {}

            void Reset() override
            {
                _timerCast = 0;
                _casted = false;
            }

            void SpellHitTarget(Unit* target, SpellInfo const* spell) override
            {
                if (!target || !spell)
                    return;

                if (!IsHeroic())
                    return;

                if (spell->Id == SPELL_ARCANE_BOMB_DMG && _summoner && _summoner->GetEntry() == BOSS_WRATH_OF_AZSHARA)
                    me->CastSpell(target, SPELL_MAGIC_RESONANCE, true);
            }

            void IsSummonedBy(Unit* summoner) override
            {
                if (!summoner)
                    return;

                _summoner = summoner;

                for (auto & it : me->GetMap()->GetPlayers())
                {
                    if (Player* player = it.GetSource())
                    {
                        if (player->HasAura(SPELL_ARCANE_BOMB))
                        {
                            me->NearTeleportTo(player->GetPosition());
                            DoCast(player, SPELL_RIDE_VEHICLE, true);
                            DoCast(player, SPELL_ARCANE_BOMB_VISUAL, true);
                            _events.ScheduleEvent(EVENT_ARCANE_BOMB, 100);
                            break;
                        }
                    }
                }
            }

            void UpdateAI(uint32 diff) override
            {
                _events.Update(diff);

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    if (eventId == EVENT_ARCANE_BOMB)
                    {
                        DoCast(me, SPELL_ARCANE_BOMB_DMG, false);
                    }
                }
            }

            private:
                EventMap _events;
                Unit* _summoner;
                bool _casted;
                uint32 _timerCast;


        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_arcane_bomb_AI(creature);
        }
};

class npc_eoa_tidal_wave : public CreatureScript
{
    public:
        npc_eoa_tidal_wave() : CreatureScript("npc_eoa_tidal_wave")
        {}

        struct npc_eoa_tidal_wave_AI : public ScriptedAI
        {
            npc_eoa_tidal_wave_AI(Creature* creature) : ScriptedAI(creature)
            {}

            void Reset()
            {
                me->AddUnitState(UNIT_STATE_ROOT);
                DoCast(me, SPELL_TIDAL_WAVE_VISUAL, true);
            }

            void SpellHitTarget(Unit* target, SpellInfo const* spell) override
            {
                if (!spell || !target || !IsHeroic())
                    return;

                if (spell->Id == SPELL_TIDAL_WAVE_DMG)
                    me->CastSpell(target, SPELL_FROST_RESONANCE, true);
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_eoa_tidal_wave_AI(creature);
        }
};

class spell_wrath_of_azshara_mystic_tornado : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_mystic_tornado() : SpellScriptLoader("spell_wrath_of_azshara_mystic_tornado")
        {}

        class spell_wrath_of_azshara_mystic_tornado_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_mystic_tornado_SpellScript);

                using mystic_tornado_Spell = spell_wrath_of_azshara_mystic_tornado_SpellScript;

                void HandleDummy(SpellEffIndex)
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    GetCaster()->CastSpell(GetHitUnit(), SPELL_MYSTIC_TORNADO_SUMMON, true);
                }

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(mystic_tornado_Spell::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(mystic_tornado_Spell::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_mystic_tornado_SpellScript();
        }
};

class spell_wrath_of_azshara_arcane_bomb : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_arcane_bomb() : SpellScriptLoader("spell_wrath_of_azshara_arcane_bomb")
        {}

        class spell_wrath_of_azshara_arcane_bomb_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_arcane_bomb_SpellScript);

                void HandleSummon()
                {
                    if (!GetCaster() || !GetHitUnit())
                        return;

                    Position summon_pos = GetHitUnit()->GetPosition();

                    GetCaster()->SummonCreature(NPC_ARCANE_BOMB, summon_pos, TEMPSUMMON_TIMED_DESPAWN, 20 * IN_MILLISECONDS);
                }

                void Register()
                {
                    AfterHit += SpellHitFn(spell_wrath_of_azshara_arcane_bomb_SpellScript::HandleSummon);
                }
        };

        class spell_wrath_of_azshara_arcane_bomb_AuraScript : public AuraScript
        {
            public:
                PrepareAuraScript(spell_wrath_of_azshara_arcane_bomb_AuraScript);

                void HandleDispel(DispelInfo* dispelInfo)
                {
                    if (!GetCaster() || !GetUnitOwner())
                        return;

                    Unit* owner = GetUnitOwner();

                    owner->RemoveAurasDueToSpell(SPELL_RIDE_VEHICLE);

                    if (Vehicle* vehicle = owner->GetVehicle())
                        vehicle->RemoveAllPassengers();

                    if (Creature* bomb = owner->FindNearestCreature(NPC_ARCANE_BOMB, 50.0f, true))
                        bomb->AddUnitState(UNIT_STATE_ROOT);
                }

                void Register()
                {
                    OnDispel += AuraDispelFn(spell_wrath_of_azshara_arcane_bomb_AuraScript::HandleDispel);
                }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_wrath_of_azshara_arcane_bomb_AuraScript();
        }

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_arcane_bomb_SpellScript();
        }
};

class spell_wrath_of_azshara_massive_deluge : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_massive_deluge() : SpellScriptLoader("spell_wrath_of_azshara_massive_deluge")
        {}

        class spell_wrath_of_azshara_massive_deluge_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_massive_deluge_SpellScript);

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_massive_deluge_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_massive_deluge_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_massive_deluge_SpellScript();
        }
};

class spell_wrath_of_azshara_raging_storms : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_raging_storms() : SpellScriptLoader("spell_wrath_of_azshara_raging_storms")
        {}

        class spell_wrath_of_azshara_raging_storms_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_raging_storms_SpellScript);

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_raging_storms_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_raging_storms_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_raging_storms_SpellScript();
        }
};

class spell_wrath_of_azshara_crushing_depths : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_crushing_depths() : SpellScriptLoader("spell_wrath_of_azshara_crushing_depths")
        {}

        class spell_wrath_of_azshara_crushing_depths_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_crushing_depths_SpellScript);

                bool Load() override
                {
                    _targetsSize = 1;
                    return true;
                }

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());

                    if (!targets.empty())
                        _targetsSize = targets.size();
                }

                void HandleDamage(SpellEffIndex)
                {
                    if (!GetCaster())
                        return;

                    SetHitDamage(GetHitDamage() / _targetsSize);
                }

                void Register()
                {
                    OnEffectLaunchTarget += SpellEffectFn(spell_wrath_of_azshara_crushing_depths_SpellScript::HandleDamage, EFFECT_0, SPELL_EFFECT_DAMAGE_FROM_MAX_HEALTH_PCT);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_crushing_depths_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
                }

                private:
                    uint32 _targetsSize;
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_crushing_depths_SpellScript();
        }
};

class spell_wrath_of_azshara_heaving_sands : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_heaving_sands() : SpellScriptLoader("spell_wrath_of_azshara_heaving_sands")
        {}

        class spell_wrath_of_azshara_heaving_sands_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_heaving_sands_SpellScript);

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_heaving_sands_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_heaving_sands_SpellScript();
        }
};

class spell_wrath_of_azshara_lighting_strikes : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_lighting_strikes() : SpellScriptLoader("spell_wrath_of_azshara_lighting_strikes")
        {}

        class spell_wrath_of_azshara_lighting_strikes_AuraScript : public AuraScript
        {
            public:
                using lighting_strikes_AuraScript = spell_wrath_of_azshara_lighting_strikes_AuraScript;

                PrepareAuraScript(spell_wrath_of_azshara_lighting_strikes_AuraScript);

                void HandlePeriodic(AuraEffect const* /**/)
                {
                    if (!GetCaster())
                        return;

                    GetCaster()->CastSpell(GetCaster(), SPELL_LIGHTING_STRIKES_DMG, true);
                }

                void Register()
                {
                    OnEffectPeriodic += AuraEffectPeriodicFn(lighting_strikes_AuraScript::HandlePeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
                }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_wrath_of_azshara_lighting_strikes_AuraScript();
        }
};

class spell_wrath_of_azshara_lightning_strikes_dmg : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_lightning_strikes_dmg() : SpellScriptLoader("spell_wrath_of_azshara_lightning_strikes_dmg")
        {}

        class spell_wrath_of_azshara_lightning_strikes_dmg_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_lightning_strikes_dmg_SpellScript);

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if(PlayerFilter());
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_lightning_strikes_dmg_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_lightning_strikes_dmg_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENTRY);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_lightning_strikes_dmg_SpellScript::FilterTargets, EFFECT_2, TARGET_UNIT_DEST_AREA_ENTRY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_lightning_strikes_dmg_SpellScript();
        }
};

class spell_wrath_of_azshara_tidal_wave : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_tidal_wave() : SpellScriptLoader("spell_wrath_of_azshara_tidal_wave")
        {}

        class spell_wrath_of_azshara_tidal_wave_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_tidal_wave_SpellScript);

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    targets.clear();
                }

                void HandleCast()
                {
                    if (!GetCaster() || !GetSpellInfo())
                        return;

                    Unit* caster = GetCaster();

                    Position pos1 = caster->GetRandomNearPosition(1.5f);
                    caster->SummonCreature(NPC_TIDAL_WAVE, pos1, TEMPSUMMON_TIMED_DESPAWN, 180 * IN_MILLISECONDS);
                }

                void Register()
                {
                    OnCast += SpellCastFn(spell_wrath_of_azshara_tidal_wave_SpellScript::HandleCast);
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_tidal_wave_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new  spell_wrath_of_azshara_tidal_wave_SpellScript();
        }
};

class spell_wrath_of_azshara_cry_of_wrath : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_cry_of_wrath() : SpellScriptLoader("spell_wrath_of_azshara_cry_of_wrath")
        {}

        class spell_wrath_of_azshara_cry_of_wrath_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_cry_of_wrath_SpellScript);

                void HandleDummy(SpellEffIndex)
                {
                    if (!GetCaster())
                        return;

                    GetCaster()->CastSpell(GetCaster(), SPELL_TIDAL_WAVE_AURA_CRY, true);
                    GetCaster()->CastSpell(GetCaster(), SPELL_LIGHTING_STRIKES_AURA_CRY, true);
                    GetCaster()->CastSpell(GetCaster(), SPELL_VIOLET_WINDS_AURA_CRY, true);
                }

                void Register()
                {
                    OnEffectHitTarget += SpellEffectFn(spell_wrath_of_azshara_cry_of_wrath_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_cry_of_wrath_SpellScript();
        }
};

class spell_wrath_of_azshara_storm_conduit : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_storm_conduit() : SpellScriptLoader("spell_wrath_of_azshara_storm_conduit")
        {}

        class spell_wrath_of_azshara_storm_conduit_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_wrath_of_azshara_storm_conduit_SpellScript);

                void FilterTargets(SpellTargets& targets)
                {
                    if (targets.empty())
                        return;

                    targets.remove_if([] (WorldObject* & target)
                    {
                        if (target->GetEntry() == BOSS_WRATH_OF_AZSHARA)
                            return false;

                        return true;
                    });
                }

                void Register()
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrath_of_azshara_storm_conduit_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_wrath_of_azshara_storm_conduit_SpellScript();
        }
};

class spell_wrath_of_azshara_violet_winds : public SpellScriptLoader
{
    public:
        spell_wrath_of_azshara_violet_winds() : SpellScriptLoader("spell_wrath_of_azshara_violet_winds")
        {}

        class spell_wrath_of_azshara_violet_winds_AuraScript : public AuraScript
        {
            public:

                PrepareAuraScript(spell_wrath_of_azshara_violet_winds_AuraScript);

                void HandlePeriodic(AuraEffect const* /**/)
                {
                    if (!GetCaster())
                        return;

                    Map::PlayerList const & players = GetCaster()->GetMap()->GetPlayers();

                    if (!players.isEmpty())
                    {
                        for (auto & it : players)
                        {
                            if (Player* player = it.GetSource())
                            {
                                player->CastSpell(player, SPELL_VIOLET_WINDS_AREA, true);
                                player->CastSpell(player, SPELL_VIOLET_WINDS_DEBUFF, true);
                            }
                        }
                    }
                }

                void Register()
                {
                    OnEffectPeriodic += AuraEffectPeriodicFn(spell_wrath_of_azshara_violet_winds_AuraScript::HandlePeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
                }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_wrath_of_azshara_violet_winds_AuraScript();
        }
};

class at_tidal_wave : public AreaTriggerEntityScript
{
    public:
        at_tidal_wave() : AreaTriggerEntityScript("at_tidal_wave")
        {}

        struct at_tidal_wave_AI : public AreaTriggerAI
        {
            at_tidal_wave_AI(AreaTrigger* at) : AreaTriggerAI(at)
            {}

            void SetupSpline(bool reverse)
            {
                if (!at->GetCaster())
                    return;

                _points.clear();

                float step = (2 * float(M_PI)/ -23.f);

                for (uint8 i = 0; i < 138; i++, _angle += step)
                {
                    G3D::Vector3 point;

                    point.x = _center.x + _radius * cosf(_angle);
                    point.y = _center.y + _radius * sinf(_angle);
                    point.z = at->GetPositionZ();

                    _points.push_back(point);

                    if (i == 23 || i == 46 || i == 69 || i == 92 || i == 115)
                        _reversed = !_reversed;

                    if (_radius < 88.0f && !_reversed)
                        _radius += 3.0f;
                    else if (_radius > 3.0f && _reversed)
                        _radius -= 3.0f;
                }

                at->InitSplines(_points, at->GetDuration() * 1.2);
            }

            void OnInitialize() override
            {
                Creature* wrath = at->GetCaster()->FindNearestCreature(BOSS_WRATH_OF_AZSHARA, 500.f);
                Unit* caster = at->GetCaster();

                if (!wrath)
                    return;

                _center = { wrath->GetPositionX(), wrath->GetPositionY(), wrath->GetPositionZ() };
                _angle = caster->GetPosition().GetAngle(_center.x, _center.y);
                _radius = 5.0f;
                _reversed = false;

                SetupSpline(_reversed);
            }

            void OnUnitEnter(Unit* target) override
            {
                if (!target || !at->GetCaster())
                    return;

                if (target->ToPlayer())
                    at->GetCaster()->CastSpell(target, SPELL_TIDAL_WAVE_DMG, true);
            }

            private:
                float _radius;
                float _angle;
                bool _reversed;
                G3D::Vector3 _center;
                std::vector<G3D::Vector3> _points;
        };

        AreaTriggerAI* GetAI(AreaTrigger* at) const override
        {
            return new at_tidal_wave_AI(at);
        }
};

void AddSC_boss_wrath_of_azshara()
{
    new boss_wrath_of_azshara();
    new npc_hatecoil_ritualist();
    new npc_eoa_mystic_tornado();
    new npc_eoa_arcane_bomb();
    new npc_eoa_tidal_wave();
    new spell_wrath_of_azshara_violet_winds();
    new spell_wrath_of_azshara_mystic_tornado();
    new spell_wrath_of_azshara_massive_deluge();
    new spell_wrath_of_azshara_raging_storms();
    new spell_wrath_of_azshara_crushing_depths();
    new spell_wrath_of_azshara_heaving_sands();
    new spell_wrath_of_azshara_arcane_bomb();
    new spell_wrath_of_azshara_cry_of_wrath();
    new spell_wrath_of_azshara_tidal_wave();
    new spell_wrath_of_azshara_lighting_strikes();
    new spell_wrath_of_azshara_lightning_strikes_dmg();
    new spell_wrath_of_azshara_storm_conduit();
    new at_tidal_wave();
}
