/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 * Copyright (C) 2016-2019 MagicStorm
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

#include "AreaTriggerTemplate.h"
#include "AreaTrigger.h"
#include "AreaTriggerAI.h"
#include "SpellAuraEffects.h"
#include "ScriptMgr.h"
#include "GameObject.h"
#include "ScriptedCreature.h"
#include "tomb_of_sargeras.h"
#include "SpellMgr.h"

enum harjatanSpells
{
    SPELL_ABRASIVE_ARMOR            = 233071,
    SPELL_JAGGED_ABRASION           = 231998,
    SPELL_UNCHECKED_RAGE            = 231854,
    SPELL_COMMANDING_ROAR           = 232192,
    SPELL_DRENCHED                  = 231770,
    SPELL_WATERY_SPLASH             = 233371,
    SPELL_AQUEOUS_BURST             = 231729,
    SPELL_AQUEOUS_BURST_DMG         = 231754,
    SPELL_DRIPPING_BLADE            = 239907,
    SPELL_DRIVEN_ASSAULT            = 234128,
    SPELL_SPLASHY_CLEAVE            = 234129,
    SPELL_DRENCHING_WATERS          = 231768,
    SPELL_DRAW_IN                   = 232061,
    SPELL_FRIGID_BLOWS              = 233429,
    SPELL_GATHER_ENERGY             = 232379,
    SPELL_ENRAGED                   = 241587,
    SPELL_FROSTY_DISCHARGE          = 232174,
};

enum harjatanEvents
{
    EVENT_UNCHECKED_RAGE = 1,
    EVENT_COMMANDING_ROAR,
    EVENT_WATERY_SPLASH,
    EVENT_AQUEOUS_BURST,
    EVENT_DRIVEN_ASSAULT,
    EVENT_SPLASHY_CLEAVE,
    EVENT_DRENCHING_WATERS,
    EVENT_DRAW_IN,
    EVENT_CHECK_FOR_PLAYERS,
};

class boss_harjatan : public CreatureScript
{
public:
    boss_harjatan() : CreatureScript("boss_harjatan") {}

    struct boss_harjatanAI : public BossAI
    {
        boss_harjatanAI(Creature* creature) : BossAI(creature, DATA_HARJATAN)
        {
            instance->SetBossState(DATA_HARJATAN, NOT_STARTED);

            //me->setPowerType(POWER_ENERGY);
            me->SetMaxPower(POWER_ENERGY, 100);
            me->SetPower(POWER_ENERGY, 100);
        }

        bool isCasting;
        std::list<Creature*> waveMender;
        std::list<Creature*> gladiator;

        void Reset() override
        {
            _Reset();
            if (instance)
            {
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                instance->SetBossState(DATA_HARJATAN, FAIL);
            }

            if (GameObject* go = me->FindNearestGameObject(269192, 500.0f))
                go->SetLootState(GO_READY);

            isCasting = false;

            me->RemoveAurasDueToSpell(SPELL_GATHER_ENERGY);

            //me->setPowerType(POWER_ENERGY);
            me->SetMaxPower(POWER_ENERGY, 100);
            me->SetPower(POWER_ENERGY, 0);

            events.Reset();
        }

        void EnterEvadeMode(EvadeReason why) override
        {
            BossAI::EnterEvadeMode();

            me->GetMotionMaster()->MoveTargetedHome();

            _DespawnAtEvade(0, nullptr);
        }

        void EnterCombat(Unit* /*who*/) override
        {
            _EnterCombat();

            DoCast(SPELL_ABRASIVE_ARMOR);

            //Talk(SAY_COMBAT);

            me->SetPower(POWER_ENERGY, 0);

            events.ScheduleEvent(EVENT_COMMANDING_ROAR, 17.3 * IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_DRAW_IN, 59 * IN_MILLISECONDS);

            if (GameObject* go = me->FindNearestGameObject(269192, 500.0f))
                go->UseDoorOrButton(1000000, true);

            if (Creature* creature = me->FindNearestCreature(121184, 150.0f))
                creature->SetVisible(false);

            me->setActive(true);
            DoZoneInCombat();

            DoCast(SPELL_GATHER_ENERGY);

            SetPlayersInCombat(true);
        }

        void JustDied(Unit* /*killer*/) override
        {
            if (instance)
            {
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                _JustDied();
                instance->SetBossState(DATA_HARJATAN, DONE);
            }

            if (GameObject* go = me->FindNearestGameObject(269192, 500.0f))
                go->SetLootState(GO_READY);

            if (GameObject* go = me->FindNearestGameObject(269120, 500.0f))
                go->UseDoorOrButton(1000000, true);

            //Talk(SAY_DIED);
        }

        void KilledUnit(Unit* victim) override
        {
            //if (victim->GetTypeId() == TYPEID_PLAYER)
            //    Talk(SAY_KILL);
        }

        void JustReachedHome() override
        {
            if (instance)
            {
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                _JustReachedHome();
                instance->SetBossState(DATA_HARJATAN, FAIL);
            }
        }

        void DespawnGameObjects(uint32 entry)
        {
            std::list<GameObject*> gameObjects;
            GetGameObjectListWithEntryInGrid(gameObjects, me, entry, 1000.0f);

            if (gameObjects.empty())
                return;

            for (std::list<GameObject*>::iterator iter = gameObjects.begin(); iter != gameObjects.end(); ++iter)
                (*iter)->Delete();
        }

        void DespawnCreatures(uint32 entry)
        {
            std::list<Creature*> creatures;
            GetCreatureListWithEntryInGrid(creatures, me, entry, 1000.0f);

            if (creatures.empty())
                return;

            for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                (*iter)->DespawnOrUnsummon();
        }

        void SetPlayersInCombat(bool evade)
        {
            uint8 players = 0;
            Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
            if (!PlayerList.isEmpty())
            {
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                {
                    if (Player *player = i->GetSource())
                    {
                        if (player->IsAlive() && player->GetDistance(me) <= 150.0f && !player->IsGameMaster())
                        {
                            ++players;

                            player->SetInCombatWith(me->ToUnit());
                        }
                    }
                }
                if (players == 0 && evade == true)
                    _EnterEvadeMode();
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            events.Update(diff);

            if (uint32 power = me->GetPower(POWER_ENERGY))
                if (power == 100)
                    if (!isCasting)
                    {
                        events.ScheduleEvent(EVENT_UNCHECKED_RAGE, 1 * IN_MILLISECONDS);
                        isCasting = true;
                    }

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_UNCHECKED_RAGE:
                        DoCast(SPELL_UNCHECKED_RAGE);

                        isCasting = false;
                        break;

                    case EVENT_COMMANDING_ROAR:
                        DoCast(SPELL_COMMANDING_ROAR);

                        for (uint8 i = 0; i < 2; ++i)
                        {
                            me->SummonCreature(NPC_RAZORJAW_WAVEMENDER, 5898.825f, -879.8507f, 2941.018f, 0.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
                            me->SummonCreature(NPC_RAZORJAW_GLADIATOR, 5876.136f, -887.0951f, 2933.093f, 0.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
                        }

                        events.ScheduleEvent(EVENT_COMMANDING_ROAR, 31.8 * IN_MILLISECONDS);
                        break;

                    case EVENT_DRAW_IN:
                        DoCast(SPELL_DRAW_IN);

                        events.ScheduleEvent(EVENT_DRAW_IN, 59 * IN_MILLISECONDS);
                        break;

                    case EVENT_CHECK_FOR_PLAYERS:
                        SetPlayersInCombat(true);

                        events.ScheduleEvent(EVENT_CHECK_FOR_PLAYERS, 1 * IN_MILLISECONDS);
                        break;

                    default:
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetTombOfSargerasAI<boss_harjatanAI>(creature);
    }
};

// 116569 - Razorjaw Wavemender
class npc_razorjaw_wavemender : public CreatureScript
{
public:

    npc_razorjaw_wavemender() : CreatureScript("npc_razorjaw_wavemender") { }

    struct npc_razorjaw_wavemenderAI : public ScriptedAI
    {
        npc_razorjaw_wavemenderAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        void Reset() override
        {
            events.Reset();
        }

        void EnterCombat(Unit* /*who*/) override
        {
            events.ScheduleEvent(EVENT_WATERY_SPLASH, 10 * IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_AQUEOUS_BURST, 12 * IN_MILLISECONDS);
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
                    case EVENT_WATERY_SPLASH:
                        if (Unit* target = me->GetVictim())
                            me->CastSpell(target, SPELL_WATERY_SPLASH, true);

                        events.ScheduleEvent(EVENT_WATERY_SPLASH, 10 * IN_MILLISECONDS);
                        break;

                    case EVENT_AQUEOUS_BURST:
                        if (Unit* target = me->GetVictim()/*SelectTarget(SELECT_TARGET_RANDOM, 0, 5.0f, true)*/)
                            me->CastSpell(target, SPELL_AQUEOUS_BURST, true);

                        events.ScheduleEvent(EVENT_AQUEOUS_BURST, 16 * IN_MILLISECONDS);
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }
    private:
        EventMap events;

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetTombOfSargerasAI<npc_razorjaw_wavemenderAI>(creature);
    }
};

// 117596 - Razorjaw Gladiator
class npc_razorjaw_gladiator : public CreatureScript
{
public:

    npc_razorjaw_gladiator() : CreatureScript("npc_razorjaw_gladiator") { }

    struct npc_razorjaw_gladiatorAI : public ScriptedAI
    {
        npc_razorjaw_gladiatorAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        std::list<AreaTrigger*> areaTriggerList;

        void Reset() override
        {
            events.Reset();

            me->RemoveAllAreaTriggers();
        }

        void EnterCombat(Unit* /*who*/) override
        {
            DoCast(SPELL_DRIPPING_BLADE);

            events.ScheduleEvent(EVENT_DRIVEN_ASSAULT, 10 * IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_SPLASHY_CLEAVE, 12 * IN_MILLISECONDS);
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
                    case EVENT_DRIVEN_ASSAULT:
                        if (Unit* target = me->GetVictim()/*SelectTarget(SELECT_TARGET_RANDOM, 0, 5.0f, true)*/)
                        {
                            if (!target->HasAura(240792))
                            {
                                me->CastSpell(target, 234016, true);
                                me->CastSpell(me, SPELL_DRIVEN_ASSAULT, true);
                            }
                            else
                                events.ScheduleEvent(EVENT_DRIVEN_ASSAULT, 1 * IN_MILLISECONDS);
                        }

                        events.ScheduleEvent(EVENT_DRIVEN_ASSAULT, 10 * IN_MILLISECONDS);
                        break;

                    case EVENT_SPLASHY_CLEAVE:
                        DoCast(SPELL_SPLASHY_CLEAVE);

                        events.ScheduleEvent(EVENT_SPLASHY_CLEAVE, 12 * IN_MILLISECONDS);
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }

    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetTombOfSargerasAI<npc_razorjaw_gladiatorAI>(creature);
    }
};

// 233429 - frigid blows
class spell_harjatan_frigid_blows : public SpellScriptLoader
{
public:
    spell_harjatan_frigid_blows() : SpellScriptLoader("spell_harjatan_frigid_blows") { }

    class spell_harjatan_frigid_blows_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_harjatan_frigid_blows_AuraScript);

        void HandleEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (Unit* target = GetTarget())
                if (Aura* aura = target->GetAura(GetId()))
                    if (aura->GetStackAmount() <= 1)
                        target->CastSpell(target, SPELL_FROSTY_DISCHARGE, true);
        }

        void Register() override
        {
            AfterEffectRemove += AuraEffectRemoveFn(spell_harjatan_frigid_blows_AuraScript::HandleEffectRemove, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_harjatan_frigid_blows_AuraScript();
    }
};

// 231729 - Aqueous Burst
class spell_harjatan_aqueous_burst : public SpellScriptLoader
{
public:
    spell_harjatan_aqueous_burst() : SpellScriptLoader("spell_harjatan_aqueous_burst") { }

    class spell_harjatan_aqueous_burst_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_harjatan_aqueous_burst_AuraScript);

        void HandleEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (Unit* target = GetTarget())
                target->CastSpell(target, SPELL_AQUEOUS_BURST_DMG, true);
        }

        void Register() override
        {
            AfterEffectRemove += AuraEffectRemoveFn(spell_harjatan_aqueous_burst_AuraScript::HandleEffectRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_harjatan_aqueous_burst_AuraScript();
    }
};

// 13251 - Drenching waters
class areatrigger_drenching_waters : public AreaTriggerEntityScript
{
public:
    areatrigger_drenching_waters() : AreaTriggerEntityScript("areatrigger_drenching_waters") { }

    struct areatrigger_drenching_watersAI : AreaTriggerAI
    {
        areatrigger_drenching_watersAI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        bool isCasting = false;
        uint32 checkTime;
        uint8 count;

        void OnInitialize() override
        {
            checkTime = 1000;
            count = 0;
        }

        void OnUpdate(uint32 diff) override
        {
            if (checkTime <= diff)
            {
                if (Creature* boss = at->FindNearestCreature(BOSS_HARJATAN, 500.0f))
                    if (boss->HasAura(SPELL_DRAW_IN))
                    {
                        Position pos = at->GetNearPosition(float(-count), at->GetAngle(*boss));
                        at->GetMap()->AreaTriggerRelocation(at, pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), pos.GetOrientation());
                    }

                if (Creature* boss = at->FindNearestCreature(BOSS_HARJATAN, 5.0f))
                    if (boss->HasAura(SPELL_DRAW_IN))
                    {
                        boss->CastSpell(boss, SPELL_FRIGID_BLOWS, true);
                        at->RemoveFromWorld();
                    }

                if (Creature* boss = at->FindNearestCreature(BOSS_HARJATAN, 500.0f, false))
                    at->RemoveFromWorld();

                checkTime = 1000;
            }
            else
                checkTime -= diff;
        }

        void OnUnitEnter(Unit* target) override
        {
            if (!target)
                return;

            if (target->GetTypeId() != TYPEID_PLAYER)
                return;

            if (Unit* caster = at->GetCaster())
                caster->CastSpell(target, SPELL_DRENCHING_WATERS, true);
        }

        void OnUnitExit(Unit* target) override
        {
            if (!target)
                return;

            if (target->GetTypeId() != TYPEID_PLAYER)
                return;

            if (target->HasAura(SPELL_DRENCHING_WATERS))
                target->RemoveAurasDueToSpell(SPELL_DRENCHING_WATERS);
        }
    };


    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new areatrigger_drenching_watersAI(areatrigger);
    }
};

// 231854 - Unchecked Rage
class spell_harjatan_unchecked_rage : public SpellScriptLoader
{
public:
    spell_harjatan_unchecked_rage() : SpellScriptLoader("spell_harjatan_unchecked_rage") { }

    class spell_harjatan_unchecked_rage_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_harjatan_unchecked_rage_SpellScript);

        void FilterTargets(std::list<WorldObject*>& targets)
        {
            uint8 count = 0;
            for (auto target : targets)
                ++count;

            if (count < 5)
                if (Unit* caster = GetCaster())
                    caster->CastSpell(caster, SPELL_ENRAGED, true);
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_harjatan_unchecked_rage_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_104);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_harjatan_unchecked_rage_SpellScript();
    }
};

// 232174 - Frosty Discharge
class spell_harjatan_frosty_discharge : public SpellScriptLoader
{
public:
    spell_harjatan_frosty_discharge() : SpellScriptLoader("spell_harjatan_frosty_discharge") { }

    class spell_harjatan_frosty_discharge_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_harjatan_frosty_discharge_SpellScript);

        void HandleDummy()
        {
            if (Unit* caster = GetCaster())
                caster->CastSpell(caster, GetSpellInfo()->GetEffect(EFFECT_0)->BasePoints, true);
        }

        void Register() override
        {
            OnCast += SpellCastFn(spell_harjatan_frosty_discharge_SpellScript::HandleDummy);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_harjatan_frosty_discharge_SpellScript();
    }
};

void AddSC_boss_harjatan()
{
    new boss_harjatan();
    new npc_razorjaw_wavemender();
    new npc_razorjaw_gladiator();
    new spell_harjatan_frigid_blows();
    new spell_harjatan_aqueous_burst();
    new areatrigger_drenching_waters();
    new spell_harjatan_unchecked_rage();
    new spell_harjatan_frosty_discharge();
}
