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
#include "AreaTrigger.h"
#include "court_of_stars.h"
#include "CreatureAIImpl.h"
#include "GridNotifiersImpl.h"
#include "InstanceScript.h"
#include "SpellHistory.h"
#include "CellImpl.h"
#include "ScriptedCreature.h"
#include "SpellAuraEffects.h"
#include <G3D/Vector3.h>
#include "MotionMaster.h"
#include "ObjectAccessor.h"

enum Texts
{
    SAY_AGGRO = 0,
    SAY_DEATH,
    SAY_DEATH_SOLEMN_NIGHT,
    SAY_PLAYER_KILL,
    SAY_SIGNAL_BEACON,
    SAY_ARCANE_LOCKDOWN,
    SAY_FLASH_OF_SOLEMN_NIGHT,

    EMOTE_ARCANE_LOCKDOWN,
};

enum Spells
{
    SPELL_AREA_SECURED              = 227147,
    SPELL_RESONANT_SLASH            = 207261,
    SPELL_RESONANT_SLASH_DMG        = 206574,
    SPELL_STREETSWEEPER             = 219488,
    SPELL_STREETSWEEPER_VISUAL      = 219475,
    SPELL_STREETSWEEPER_BEAM        = 219483,
    SPELL_STREETSWEEPER_VISUAL_LINE = 219477,
    SPELL_STREETSWEEPER_AURA        = 219482,
    SPELL_STREETSWEEPER_DMG         = 219498,
    SPELL_ARCANE_LOCKDOWN           = 207278,
    SPELL_SIGNAL_BEACON             = 207806,
    SPELL_CALL_VIGILANT_NIGHT_WATCH = 210435,
    SPELL_FLASK_OF_THE_SOLEMN_NIGHT = 207815,
    SPELL_HINDER                    = 215204,
    SPELL_DISABLE_BEACON            = 210253,
};

enum Events
{
    EVENT_RESONANT_SLASH            = 1,
    EVENT_STREETSWEEPER             = 2,
    EVENT_ARCANE_LOCKDOWN           = 3,
    EVENT_SIGNAL_BEACON             = 4,
    EVENT_FLASK_OF_SOLEMN_NIGHT     = 5,
    EVENT_SOLEMN_FLASK_DRINKED      = 6,
    EVENT_DEATH_BY_POISONED         = 7,

    EVENT_HINDER                    = 8,

    EVENT_STREETSWEEPER_CAST        = 9,
};

enum Points
{
    POINT_FLASK = 0
};

enum Actions
{
    ACTION_FLASK_OF_THE_SOLEMN_NIGHT            = 0,
    ACTION_FLASK_OF_THE_SOLEMN_NIGHT_POISONED    = 1,
};

enum Data
{
    DATA_BEACON_ACTIVATED = 1,
};

using SpellTargets = std::list<WorldObject*>;

struct PlayerFilter
{
    bool operator() (WorldObject* target)
    {
        if (target->ToPlayer())
            return false;

        return true;
    }
};

const Position FlaskPosition = { 1309.9564f, 3537.9099f, 20.762846f, 0.219f };

class boss_patrol_captain_gerdo: public CreatureScript
{
    public:

        boss_patrol_captain_gerdo() : CreatureScript("boss_patrol_captain_gerdo")
        { }

        struct boss_patrol_captain_gerdo_AI : public BossAI
        {
            boss_patrol_captain_gerdo_AI(Creature* creature) : BossAI(creature, DATA_PATROL_CAPTAIN_GERDO)
            {
                CheckBeacons();
            }

            void Reset() override
            {
                _Reset();
                _flask = false;
                _signal_beacon = false;
                _poisonFlask = false;
            }

            void EnterEvadeMode(EvadeReason reason) override
            {
                instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
                CreatureAI::EnterEvadeMode(reason);
            }

            void EnterCombat(Unit* /*who*/) override
            {
                Talk(SAY_AGGRO);
                instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
                _EnterCombat();

                events.ScheduleEvent(EVENT_RESONANT_SLASH, Seconds(7));
                events.ScheduleEvent(EVENT_ARCANE_LOCKDOWN, Seconds(15));
                events.ScheduleEvent(EVENT_STREETSWEEPER, Seconds(13));
            }

            void JustSummoned(Creature* summon) override
            {
                BossAI::JustSummoned(summon);

                switch(summon->GetEntry())
                {
                    case NPC_RESONANT_STALKER:
                        summon->CastSpell(summon, SPELL_RESONANT_SLASH_DMG);
                        summon->DespawnOrUnsummon(Seconds(5));
                        break;
                    case NPC_VIGILANT_DUSKWATCH:
                        summon->AI()->AttackStart(me->GetVictim());
                        break;

                }
            }

            void CheckBeacons()
            {
                std::list<Creature*> beacons;
                uint8 beaconsActivated = 0;

                me->GetCreatureListWithEntryInGrid(beacons, NPC_ARCANE_BEACON, 500.f);

                if (beacons.empty())
                    return;

                for (auto & it : beacons)
                {
                    if (it->HasNpcFlag(UNIT_NPC_FLAG_SPELLCLICK))
                        beaconsActivated++;
                }

                for (uint8 i = 0; i < beaconsActivated; ++i)
                    me->CastSpell(me, SPELL_AREA_SECURED, true);

            }

            void CheckLockDown()
            {
                Map::PlayerList const & players = me->GetMap()->GetPlayers();

                if (players.isEmpty())
                    return;

                for (auto & it : players)
                {
                    if (Player* player = it.GetSource())
                    {
                        if (player->GetPositionZ() >= me->GetPositionZ() + 1.0f)
                        {
                            if (Aura* aura = player->GetAura(SPELL_ARCANE_LOCKDOWN))
                                aura->ModStackAmount(-1);
                        }
                    }
                }
            }

            void SpellHit(Unit* /**/, SpellInfo const* spell) override
            {
                if (!spell)
                    return;

                if (spell->Id == SPELL_FLASK_OF_THE_SOLEMN_NIGHT)
                {
                    if (_poisonFlask)
                        me->KillSelf();
                }
            }

            void JustDied(Unit* /*killer*/) override
            {
                Talk(me->HasAura(SPELL_FLASK_OF_THE_SOLEMN_NIGHT) ? SAY_DEATH_SOLEMN_NIGHT : SAY_DEATH);
                _JustDied();
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
            }

            void KilledUnit(Unit* victim) override
            {
                if (!victim)
                    return;

                if (victim->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_PLAYER_KILL);
            }

            void MovementInform(uint32 type, uint32 id) override
            {
                if (type == POINT_MOTION_TYPE)
                {
                    switch (id)
                    {
                        case POINT_FLASK:
                            if (Creature* flask = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FLASK_OF_THE_SOLEMN_NIGHT)))
                                flask->AI()->DoAction(ACTION_FLASK_OF_THE_SOLEMN_NIGHT);
                            break;
                    }
                }
            }

            void DoAction(int32 action) override
            {
                if (action == ACTION_FLASK_OF_THE_SOLEMN_NIGHT)
                    events.ScheduleEvent(EVENT_SOLEMN_FLASK_DRINKED, Seconds(5));
                else if (action == ACTION_FLASK_OF_THE_SOLEMN_NIGHT_POISONED)
                    _poisonFlask = true;
            }

            void DamageTaken(Unit* /*atacker*/, uint32 &damage) override
            {
                if (me->HealthBelowPct(75) && !_signal_beacon)
                {
                    _signal_beacon = true;
                    events.ScheduleEvent(EVENT_SIGNAL_BEACON, Seconds(1));
                }

                if (me->HealthBelowPct(25) && !_flask)
                {
                    _flask = true;
                    Talk(SAY_FLASH_OF_SOLEMN_NIGHT);
                    events.Reset();
                    events.ScheduleEvent(EVENT_FLASK_OF_SOLEMN_NIGHT, 100);
                }
            }

            void SummonResonantsStalkers()
            {
                Position pos = me->GetPosition();

                DoSummon(NPC_RESONANT_STALKER, pos,  6 * IN_MILLISECONDS, TEMPSUMMON_TIMED_DESPAWN);

                pos.SetOrientation(pos.GetOrientation() + float(M_PI));

                DoSummon(NPC_RESONANT_STALKER, pos,  6 * IN_MILLISECONDS, TEMPSUMMON_TIMED_DESPAWN);
            }

            void ExecuteEvent(uint32 eventId) override
            {
                me->GetSpellHistory()->ResetAllCooldowns();
                switch (eventId)
                {
                    case EVENT_RESONANT_SLASH:
                    {
                        DoCast(me, SPELL_RESONANT_SLASH);
                        SummonResonantsStalkers();

                        if (_flask)
                            events.ScheduleEvent(EVENT_RESONANT_SLASH, Seconds(10));
                        else
                            events.ScheduleEvent(EVENT_RESONANT_SLASH, Seconds(12));
                        break;
                    }

                    case EVENT_SIGNAL_BEACON:
                    {
                        Talk(SAY_SIGNAL_BEACON);
                        DoCast(me, SPELL_SIGNAL_BEACON);
                        break;
                    }

                    case EVENT_ARCANE_LOCKDOWN:
                    {
                        Talk(EMOTE_ARCANE_LOCKDOWN);
                        DoCast(me, SPELL_ARCANE_LOCKDOWN);
                        events.ScheduleEvent(EVENT_ARCANE_LOCKDOWN, Seconds(30));
                        break;
                    }

                    case EVENT_FLASK_OF_SOLEMN_NIGHT:
                    {
                        me->SetReactState(REACT_PASSIVE);
                        me->AttackStop();
                        me->GetMotionMaster()->MovePoint(POINT_FLASK, FlaskPosition);
                        Talk(SAY_FLASH_OF_SOLEMN_NIGHT);
                        break;
                    }

                    case EVENT_STREETSWEEPER:
                    {
                        DoCast(SPELL_STREETSWEEPER);
                        events.ScheduleEvent(EVENT_STREETSWEEPER, Seconds(6));
                        break;
                    }

                    case EVENT_SOLEMN_FLASK_DRINKED:
                    {
                        me->SetReactState(REACT_AGGRESSIVE);
                        me->GetMotionMaster()->MoveChase(me->GetVictim());
                        events.ScheduleEvent(EVENT_ARCANE_LOCKDOWN, Seconds(5));
                        events.ScheduleEvent(EVENT_STREETSWEEPER, Seconds(15));
                        events.ScheduleEvent(EVENT_RESONANT_SLASH, Seconds(10));
                        break;
                    }

                    default : break;
                }
            }

            void UpdateAI(uint32 diff) override
            {
                _timerLockdown += diff;

                if (_timerLockdown >= 250)
                {
                    CheckLockDown();
                    _timerLockdown = 0;
                }

                BossAI::UpdateAI(diff);
            }

        private:
            uint32 _timerLockdown;
            bool _flask, _signal_beacon, _poisonFlask;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetCourtofStarsAI<boss_patrol_captain_gerdo_AI>(creature);
        }
};

class npc_cos_streetsweeper : public CreatureScript
{
    public:
        npc_cos_streetsweeper() : CreatureScript("npc_cos_streetsweeper") {}

        struct npc_cos_streetsweeper_AI : public ScriptedAI
        {
            npc_cos_streetsweeper_AI(Creature* creature) : ScriptedAI(creature)
            {
                _summoner = nullptr;
            }

            void Reset()
            {
                _events.Reset();
                DoCast(me, SPELL_STREETSWEEPER_VISUAL, true);
            }

            void IsSummonedBy(Unit* summoner) override
            {
                if (!summoner)
                    return;


                Unit* target = summoner->GetAI()->SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true);

                if (target)
                {
                    me->SetFacingToObject(target, true);
                    _events.ScheduleEvent(EVENT_STREETSWEEPER, 500);
                    _events.ScheduleEvent(EVENT_STREETSWEEPER_CAST, Seconds(3));
                }
            }

            void JustRegisteredAreaTrigger(AreaTrigger* at) override
            {
                if (!at)
                    return;

                at->SetDuration(3500);
            }

            void UpdateAI(uint32 diff)
            {
                _events.Update(diff);

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_STREETSWEEPER:
                        {
                            me->CastSpell(me, SPELL_STREETSWEEPER_VISUAL_LINE, true);
                            break;
                        }
                        case EVENT_STREETSWEEPER_CAST:
                        {
                            DoCast(me, SPELL_STREETSWEEPER_BEAM, true);
                            me->CastSpell(me, SPELL_STREETSWEEPER_DMG, TRIGGERED_IGNORE_TARGET_CHECK);
                            me->DespawnOrUnsummon(Seconds(2));
                        }

                        default : break;
                    }
                }
            }

            private:
                Unit* _summoner;
                EventMap _events;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_cos_streetsweeper_AI(creature);
        }
};

class npc_cos_vigilant_duskwatch : public CreatureScript
{
    public:
        npc_cos_vigilant_duskwatch() : CreatureScript("npc_cos_vigilant_duskwatch")
        {}

        struct npc_cos_vigilant_duskwatch_AI : public ScriptedAI
        {
            npc_cos_vigilant_duskwatch_AI(Creature* creature) : ScriptedAI(creature)
            {}

            void Reset() override
            {
                _events.Reset();

                if (Creature* gerdo = me->FindNearestCreature(BOSS_PATROL_CAPTAIN_GERDO, 1000.f, true))
                    gerdo->AI()->JustSummoned(me);
            }

            void EnterCombat(Unit* /**/) override
            {
                _events.ScheduleEvent(EVENT_HINDER, Seconds(7));
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
                    if (eventId == EVENT_HINDER)
                    {
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                            DoCast(target, SPELL_HINDER);

                        _events.ScheduleEvent(EVENT_HINDER, Seconds(urand(10, 15)));
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap _events;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_cos_vigilant_duskwatch_AI(creature);
        }
};

class npc_cos_flask_of_the_solemn_night : public CreatureScript
{
    public:
        npc_cos_flask_of_the_solemn_night() : CreatureScript("npc_cos_flask_of_the_solemn_night") { }

        struct npc_cos_flask_of_the_solemn_night_AI : public ScriptedAI
        {
            npc_cos_flask_of_the_solemn_night_AI(Creature* creature) : ScriptedAI(creature)
            {
                instance = creature->GetInstanceScript();
                _poison = false;
            }

            void OnSpellClick(Unit* clicker, bool & result)
            {
                if (!clicker)
                {
                    result = false;
                    return;
                }

                if (clicker->GetTypeId() != TYPEID_PLAYER)
                {
                    result = false;
                    return;
                }

                if (Player* player  = clicker->ToPlayer())
                {
                    if (player->getClass() == CLASS_ROGUE || player->HasSkill(SKILL_ALCHEMY))
                    {
                        _poison = true;
                        result = true;
                        me->RemoveNpcFlag(UNIT_NPC_FLAG_SPELLCLICK);
                    }
                    else
                    {
                        result = false;
                        return;
                    }
                }
            }

            void DoAction(int32 action) override
            {
                if (action == ACTION_FLASK_OF_THE_SOLEMN_NIGHT)
                {
                    if (Creature* patrol = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_PATROL_CAPTAIN_GERDO)))
                    {
                        patrol->AI()->DoCastSelf(SPELL_FLASK_OF_THE_SOLEMN_NIGHT);
                        if (_poison)
                            patrol->AI()->DoAction(ACTION_FLASK_OF_THE_SOLEMN_NIGHT_POISONED);
                        else
                            patrol->AI()->DoAction(ACTION_FLASK_OF_THE_SOLEMN_NIGHT);
                    }
                }
            }

        private:
            InstanceScript* instance;
            bool _poison;
        };

        CreatureAI* GetAI(Creature *creature) const override
        {
            return GetInstanceAI<npc_cos_flask_of_the_solemn_night_AI>(creature, COSScriptName);
        }
};

class npc_cos_arcane_beacon : public CreatureScript
{
    public:
        npc_cos_arcane_beacon() : CreatureScript("npc_cos_arcane_beacon")
        {}

        struct npc_cos_arcane_beacon_AI : public ScriptedAI
        {
            npc_cos_arcane_beacon_AI(Creature* creature) : ScriptedAI(creature)
            {}

            void SpellHit(Unit* caster, SpellInfo const* spell)
            {
                if (!spell || !caster)
                    return;

                if (spell->Id == SPELL_DISABLE_BEACON)
                {
                    me->AddUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE));
                    me->RemoveNpcFlag(UNIT_NPC_FLAG_SPELLCLICK);

                    if (Creature* gerdo = me->FindNearestCreature(BOSS_PATROL_CAPTAIN_GERDO, 500.0f))
                    {
                        if (Aura* securedArea = gerdo->GetAura(SPELL_AREA_SECURED))
                            securedArea->ModStackAmount(-1);
                    }
                }
            }

        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_cos_arcane_beacon_AI(creature);
        }

};

class spell_gerdo_arcane_lockdown : public SpellScriptLoader
{
    public:

        spell_gerdo_arcane_lockdown() : SpellScriptLoader("spell_gerdo_arcane_lockdown")
        {}

        class spell_arcane_lockdown_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_arcane_lockdown_AuraScript);

            void HandleOnApply(AuraEffect const* /**/, AuraEffectHandleModes mode)
            {
                if (!GetUnitOwner())
                    return;

                SetStackAmount(3);
            }

            void Register()
            {
                OnEffectApply += AuraEffectApplyFn(spell_arcane_lockdown_AuraScript::HandleOnApply, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL);
                OnEffectApply += AuraEffectApplyFn(spell_arcane_lockdown_AuraScript::HandleOnApply, EFFECT_1, SPELL_AURA_MOD_DECREASE_SPEED, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_arcane_lockdown_AuraScript();
        }
};

class spell_gerdo_signal_beacon : public SpellScriptLoader
{
    public:
        spell_gerdo_signal_beacon() : SpellScriptLoader("spell_gerdo_signal_beacon")
        {}

        class spell_gerdo_signal_beacon_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_gerdo_signal_beacon_SpellScript);

                void HandleDummy(SpellEffIndex)
                {
                    if (!GetCaster())
                        return;

                    std::list<Creature*> beacons;
                    Unit* caster = GetCaster();

                    caster->GetCreatureListWithEntryInGrid(beacons, NPC_ARCANE_BEACON, 500.0f);

                    if (beacons.empty())
                        return;

                    for (auto & it : beacons)
                    {
                        if (it->HasNpcFlag(UNIT_NPC_FLAG_SPELLCLICK))
                            it->CastSpell(it, SPELL_CALL_VIGILANT_NIGHT_WATCH, true);
                    }
                }

                void Register() override
                {
                    OnEffectHitTarget += SpellEffectFn(spell_gerdo_signal_beacon_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gerdo_signal_beacon_SpellScript();
        }
};

class spell_gerdo_streetsweeper_dmg : public SpellScriptLoader
{
    public:
        spell_gerdo_streetsweeper_dmg() : SpellScriptLoader("spell_gerdo_streetsweeper_dmg")
        {}

        class spell_gerdo_streetsweeper_dmg_SpellScript : public SpellScript
        {
            public:
                PrepareSpellScript(spell_gerdo_streetsweeper_dmg_SpellScript);

                void FilterTargets(SpellTargets & targets)
                {
                    if (targets.empty())
                        return;

                    if (GetCaster()->GetEntry() != NPC_STREETSWEEPER)
                    {
                        targets.clear();
                        return;
                    }

                    Unit* caster = GetCaster();

                    float radius = 100.0f;

                    G3D::Vector2 v1, v2, v3;

                    v1.x = caster->GetPositionX();
                    v1.y = caster->GetPositionY();

                    v2.x = caster->GetPositionX() + (radius * cosf(caster->GetOrientation()));
                    v2.y = caster->GetPositionY() + (radius * sinf(caster->GetOrientation()));

                    v3 = v2 - v1;


                    targets.remove_if([&] (WorldObject* target)
                    {
                        std::cout << "Caster In Front: " << caster->isInFront(caster) << std::endl;
                        std::cout << "Target In Front: " << target->isInFront(caster) << std::endl;

                        G3D::Vector2 v4 = { target->GetPositionX() - caster->GetPositionX(), target->GetPositionY() - caster->GetPositionY() };

                        float angle = (v3.dot(v4) / (v3.length() * v4.length()));

                        angle = std::acos(angle);

                        float dist = v4.length() * sinf(angle);

                        if (dist > 2.0f)
                            return true;

                        return false;
                    });

                }

                void Register() override
                {
                    OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_gerdo_streetsweeper_dmg_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_104);
                }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_gerdo_streetsweeper_dmg_SpellScript();
        }
};


void AddSC_boss_patrol_captain_gerdo()
{
    new boss_patrol_captain_gerdo();
    new npc_cos_streetsweeper();
    new npc_cos_flask_of_the_solemn_night();
    new npc_cos_arcane_beacon();
    new npc_cos_vigilant_duskwatch();
    new spell_gerdo_arcane_lockdown();
    new spell_gerdo_signal_beacon();
    new spell_gerdo_streetsweeper_dmg();
}
