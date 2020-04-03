/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 * Copyright (C) 2014-2015 ColossusEMU <https://colossuswow.com/>
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

#include "halls_of_valor.h"

enum hyrjaSpells
{
    SPELL_MYSTIC_EMPOWEREMENT_THUNDER_VISUAL    = 192008,
    SPELL_MYSTIC_EMPOWEREMENT_THUNDER           = 192132,
    SPELL_MYSTIC_EMPOWEREMENT_HOLY_VISUAL       = 191924,
    SPELL_MYSTIC_EMPOWEREMENT_HOLY              = 192133,
};

enum hyrjaEvents
{
    EVENT_MYSTIC_EMPOWEREMENT,
    EVENT_CHOOSE_SPECIAL,
};

enum olmyrSpells
{
    SPELL_SANCTIFY                              = 192307,
    SPELL_SANCTIFY_DAMAGE                       = 192206,
    SPELL_SANCTIFY_AREATRIGGER                  = 192163,
    SPELL_SEARING_LIGHT                         = 192288,
    SPELL_OLMYR_SPAWN_COSMETIC                  = 191899,
    SPELL_SHIELD_OF_LIGHT                       = 192018,
    SPELL_EXPEL_LIGHT                           = 192048,
    SPELL_EXPEL_LIGHT_EXPLODE                   = 192067,
    SPELL_EYE_OF_THE_STORM                      = 200901,
    SPELL_EYE_OF_THE_STORM_2                    = 200902,
    SPELL_EYE_OF_THE_STORM_ACTIVE               = 200906,
    SPELL_EYE_OF_THE_STORM_DMG                  = 200682,
    SPELL_SOLSTEN_SPAWN_COSMETIC                = 192147,
    SPELL_ARCING_BOLT                           = 191976,
    SPELL_EYE_OF_THE_STORM_ABSORB               = 203963,
};

enum olmyrEvents
{
    EVENT_SANCTIFY,
    EVENT_SEARING_LIGHT,
    EVENT_SHIELD_OF_LIGHT,
    EVENT_EYE_OF_THE_STORM,
    EVENT_ARCING_BOLT,
    EVENT_STORM,
};

enum hyrjaSays
{
    SAY_COMBAT = 0,
    SAY_KILLED = 1,
    SAY_SANCTIFY = 2,
    SAY_STORM = 3,
    SAY_DIED = 4,
};

class boss_hyrja : public CreatureScript
{
public:

    boss_hyrja() : CreatureScript("boss_hyrja") { }

    struct boss_hyrjaAI : public BossAI
    {
        boss_hyrjaAI(Creature* creature) : BossAI(creature, DATA_HYRJA)
        {
            me->SetReactState(REACT_DEFENSIVE);
            me->SetCanFly(false);

            me->AddUnitFlag(UnitFlags(UNIT_FLAG_NON_ATTACKABLE));
            me->AddUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE));

            if (instance)
                instance->SetBossState(DATA_HYRJA, NOT_STARTED);
        }

        std::list<Creature*> creatureList;
        bool inCombat = false;
        uint8 count;

        void Reset() override
        {
            _Reset();
            if (instance)
            {
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                instance->SetBossState(DATA_HYRJA, FAIL);
            }

            count = 0;

            me->SetReactState(REACT_DEFENSIVE);

            events.Reset();
        }

        void EnterCombat(Unit* /*who*/) override
        {
            _EnterCombat();

            if (instance)
            {
                instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me, 1);
                instance->SetBossState(DATA_HYRJA, IN_PROGRESS);
            }

            me->GetMotionMaster()->MoveJump(3148.366f, 325.743f, 655.16f, 0.80f, 15.0f, 15.0f);

            Talk(SAY_COMBAT);

            me->setActive(true);
            DoZoneInCombat();

            events.ScheduleEvent(EVENT_MYSTIC_EMPOWEREMENT, 5 * IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_CHOOSE_SPECIAL, 10 * IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_SHIELD_OF_LIGHT, 16 * IN_MILLISECONDS);
        }

        void JustDied(Unit* /*killer*/) override
        {
            if (instance)
            {
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                _JustDied();
                instance->SetBossState(DATA_HYRJA, DONE);
            }

            /*if (GameObject* go = me->FindNearestGameObject(GO_GATE, 5000.0f))
            {
                go->SetLootState(GO_READY);
                go->UseDoorOrButton(3000000, false);
                go->setActive(true);
            }*/

            Talk(SAY_DIED);
        }

        void KilledUnit(Unit* victim) override
        {
            if (victim->GetTypeId() == TYPEID_PLAYER)
                Talk(SAY_KILLED);
        }

        void JustReachedHome() override
        {
            if (instance)
            {
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                _JustReachedHome();
                instance->SetBossState(DATA_HYRJA, FAIL);
            }
        }

        void DoAction(int32 action)
        {
            if (action == ACTION_CAN_JOIN_COMBAT)
                CanJoinCombat();
        }

        void CanJoinCombat()
        {
            if (inCombat)
                return;

            uint8 count1 = 0;

            if (Creature* olmyr = me->FindNearestCreature(NPC_OLMYR_GHOST, 1500.0f, true))
                count1++;
            else if (Creature* olmyr = me->FindNearestCreature(NPC_OLMYR_THE_ENLIGHTENED, 1500.0f, false))
            {
                if (Creature* olmyrghost = me->SummonCreature(NPC_OLMYR_GHOST, olmyr->GetPositionX(), olmyr->GetPositionY(), olmyr->GetPositionZ(), olmyr->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN))
                    olmyrghost->CastSpell(olmyrghost, SPELL_OLMYR_SPAWN_COSMETIC, true);

                count1++;
            }

            if (Creature* solsten = me->FindNearestCreature(NPC_SOLSTEN_GHOST, 1500.0f, true))
                count1++;
            else if (Creature* solsten = me->FindNearestCreature(NPC_SOLSTEN, 1500.0f, false))
            {
                if (Creature* solstenghost = me->SummonCreature(NPC_SOLSTEN_GHOST, solsten->GetPositionX(), solsten->GetPositionY(), solsten->GetPositionZ(), solsten->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN))
                    solstenghost->CastSpell(solstenghost, SPELL_SOLSTEN_SPAWN_COSMETIC, true);

                count1++;
            }

            if (count1 >= 2)
            {
                me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NON_ATTACKABLE));
                me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE));
                inCombat = true;
                EnterCombat(me);
            }
        }

        void ChooseSpecial()
        {
            uint32 spellId = 0;

            switch (urand(1, 4))
            {
                case 1:
                    Talk(SAY_STORM);
                    me->CastSpell(me, SPELL_EYE_OF_THE_STORM_2, true);
                    events.ScheduleEvent(EVENT_STORM, 1 * IN_MILLISECONDS);
                    count = 0;
                    spellId = SPELL_EYE_OF_THE_STORM;
                    break;
                case 2:
                    spellId = SPELL_ARCING_BOLT;
                    break;
                case 3:
                    Talk(SAY_SANCTIFY);
                    spellId = SPELL_SANCTIFY;
                    break;
                case 4:
                    spellId = SPELL_EXPEL_LIGHT;
                    break;
            }

            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 5.0f, true, 0))
                me->CastSpell(target, spellId, true);
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

                    case EVENT_CHOOSE_SPECIAL:
                        ChooseSpecial();

                        if (me->HasAura(SPELL_MYSTIC_EMPOWEREMENT_HOLY) || me->HasAura(SPELL_MYSTIC_EMPOWEREMENT_THUNDER))
                            events.ScheduleEvent(EVENT_MYSTIC_EMPOWEREMENT, 4 * IN_MILLISECONDS);
                        else
                            events.ScheduleEvent(EVENT_MYSTIC_EMPOWEREMENT, 30 * IN_MILLISECONDS);

                        events.ScheduleEvent(EVENT_CHOOSE_SPECIAL, 20 * IN_MILLISECONDS);
                        break;

                    case EVENT_SHIELD_OF_LIGHT:
                        if (Unit* target = me->GetVictim())
                            me->CastSpell(target, SPELL_SHIELD_OF_LIGHT, true);

                        events.ScheduleEvent(EVENT_SHIELD_OF_LIGHT, 16 * IN_MILLISECONDS);
                        break;

                    case EVENT_STORM:
                        me->CastSpell(me, SPELL_EYE_OF_THE_STORM_DMG, true);

                        ++count;

                        if (count <= 8)
                            events.ScheduleEvent(EVENT_STORM, 1 * IN_MILLISECONDS);
                        break;

                    default:
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };

    /*CreatureAI* GetAI(Creature* creature) const override
    {
        return GetHallsOfValorAI<boss_hyrjaAI>(creature);
    }*/
};

class npc_olmyr_the_enlightened : public CreatureScript
{
public:

    npc_olmyr_the_enlightened() : CreatureScript("npc_olmyr_the_enlightened") { }

    struct npc_olmyr_the_enlightenedAI : public BossAI
    {
        npc_olmyr_the_enlightenedAI(Creature* creature) : BossAI(creature, DATA_OLMYR)
        {
            if (instance)
                instance->SetBossState(DATA_OLMYR, NOT_STARTED);

            Initialize();
        }

        void Initialize()
        {
            me->SetDisableGravity(false);
            me->SetCanFly(false);
        }

        void Reset() override
        {
            events.Reset();

            if (instance)
                instance->SetData(DATA_OLMYR, FAIL);
        }

        void EnterCombat(Unit* /*who*/) override
        {
            if (instance)
                instance->SetData(DATA_OLMYR, IN_PROGRESS);

            events.ScheduleEvent(EVENT_SANCTIFY, 3 * IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_SEARING_LIGHT, 8 * IN_MILLISECONDS);
        }

        void JustDied(Unit* killer) override
        {
            if (Creature* creature = me->SummonCreature(NPC_OLMYR_GHOST, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_MANUAL_DESPAWN))
            {
                creature->CastSpell(creature, SPELL_OLMYR_SPAWN_COSMETIC, true);
                if (instance)
                    instance->SetGuidData(DATA_OLMYR, creature->GetGUID());
            }

            if (Creature* hyrja = me->FindNearestCreature(BOSS_HYRJA, 1500.0f, true))
            {
                hyrja->AI()->DoAction(ACTION_CAN_JOIN_COMBAT);
                hyrja->SetTarget(killer->GetGUID());
            }

            if (instance)
                instance->SetData(DATA_OLMYR, DONE);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_SANCTIFY:
                        me->CastSpell(me, SPELL_SANCTIFY, true);
                        events.ScheduleEvent(EVENT_SANCTIFY, 12 * IN_MILLISECONDS);
                        break;
                    case EVENT_SEARING_LIGHT:
                        me->CastSpell(me, SPELL_SEARING_LIGHT, true);
                        events.ScheduleEvent(EVENT_SEARING_LIGHT, 21 * IN_MILLISECONDS);
                        break;
                    default:
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }

    private:
        EventMap events;
    };

    /*CreatureAI* GetAI(Creature* creature) const override
    {
        return GetHallsOfValorAI<npc_olmyr_the_enlightenedAI>(creature);
    }*/
};

class npc_olmyr_ghost : public CreatureScript
{
public:

    npc_olmyr_ghost() : CreatureScript("npc_olmyr_ghost") { }

    struct npc_olmyr_ghostAI : public ScriptedAI
    {
        npc_olmyr_ghostAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        enum Events
        {
            EVENT_MYSTIC_EMPOWERMENT,
        };

        void Initialize()
        {
            me->SetDisableGravity(false);
            me->SetCanFly(false);
        }

        void Reset() override
        {
            events.Reset();
            events.ScheduleEvent(EVENT_MYSTIC_EMPOWERMENT, 1 * IN_MILLISECONDS);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_MYSTIC_EMPOWERMENT:
                        if (Creature* hyrja = me->FindNearestCreature(BOSS_HYRJA, 1500.0f, true))
                        {
                            if (hyrja && me->GetDistance2d(hyrja->GetPositionX(), hyrja->GetPositionY()) < 5.0f)
                                me->CastSpell(hyrja, SPELL_MYSTIC_EMPOWEREMENT_HOLY, true);

                            else if (hyrja && me->GetDistance2d(hyrja->GetPositionX(), hyrja->GetPositionY()) < 20.0f)
                            {
                                me->CastSpell(hyrja, SPELL_MYSTIC_EMPOWEREMENT_HOLY_VISUAL, true);

                                /*if (hyrja->HasAura(SPELL_MYSTIC_EMPOWEREMENT_HOLY))
                                    hyrja->RemoveAurasDueToSpell(SPELL_MYSTIC_EMPOWEREMENT_HOLY);*/
                            }
                            /*else if (hyrja->HasAura(SPELL_MYSTIC_EMPOWEREMENT_HOLY_VISUAL))
                                hyrja->RemoveAurasDueToSpell(SPELL_MYSTIC_EMPOWEREMENT_HOLY_VISUAL);*/
                        }

                        events.ScheduleEvent(EVENT_MYSTIC_EMPOWERMENT, 5 * IN_MILLISECONDS);
                        break;
                    default:
                        break;
                }
            }
        }

    private:
        EventMap events;
    };

    /*CreatureAI* GetAI(Creature* creature) const override
    {
        return GetHallsOfValorAI<npc_olmyr_ghostAI>(creature);
    }*/
};

class npc_solsten : public CreatureScript
{
public:

    npc_solsten() : CreatureScript("npc_solsten") { }

    struct npc_solstenAI : public BossAI
    {
        npc_solstenAI(Creature* creature) : BossAI(creature, DATA_OLMYR)
        {
            if (instance)
                instance->SetBossState(DATA_OLMYR, NOT_STARTED);

            Initialize();
        }

        uint8 count;

        void Initialize()
        {
            me->SetDisableGravity(false);
            me->SetCanFly(false);
        }

        void Reset() override
        {
            events.Reset();

            count = 0;

            if (instance)
                instance->SetBossState(DATA_OLMYR, FAIL);
        }

        void EnterCombat(Unit* /*who*/) override
        {
            if (instance)
                instance->SetBossState(DATA_OLMYR, IN_PROGRESS);

            events.ScheduleEvent(EVENT_EYE_OF_THE_STORM, 5 * IN_MILLISECONDS);
        }

        void JustDied(Unit* killer) override
        {
            if (Creature* creature = me->SummonCreature(NPC_SOLSTEN_GHOST, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_MANUAL_DESPAWN))
            {
                creature->CastSpell(creature, SPELL_SOLSTEN_SPAWN_COSMETIC, true);
                if (instance)
                    instance->SetGuidData(DATA_SOLSTEN, creature->GetGUID());
            }

            if (Creature* hyrja = me->FindNearestCreature(BOSS_HYRJA, 1500.0f, true))
            {
                hyrja->AI()->DoAction(ACTION_CAN_JOIN_COMBAT);
                hyrja->SetTarget(killer->GetGUID());
            }

            if (instance)
                instance->SetData(DATA_SOLSTEN, DONE);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_STORM:
                        me->CastSpell(me, SPELL_EYE_OF_THE_STORM_DMG, true);

                        ++count;

                        if (count <= 8)
                            events.ScheduleEvent(EVENT_STORM, 1 * IN_MILLISECONDS);
                        break;

                    case EVENT_EYE_OF_THE_STORM:
                        if (Unit* target = me->GetVictim())
                        {
                            me->CastSpell(target, SPELL_EYE_OF_THE_STORM, true);
                            me->CastSpell(me, SPELL_EYE_OF_THE_STORM_2, true);
                            events.ScheduleEvent(EVENT_STORM, 1 * IN_MILLISECONDS);
                        }

                        events.ScheduleEvent(EVENT_EYE_OF_THE_STORM, 30 * IN_MILLISECONDS);
                        break;
                    default:
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }

    private:
        EventMap events;
    };

    /*CreatureAI* GetAI(Creature* creature) const override
    {
        return GetHallsOfValorAI<npc_solstenAI>(creature);
    }*/
};

class npc_solsten_ghost : public CreatureScript
{
public:

    npc_solsten_ghost() : CreatureScript("npc_solsten_ghost") { }

    struct npc_solsten_ghostAI : public ScriptedAI
    {
        npc_solsten_ghostAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        enum Events
        {
            EVENT_MYSTIC_EMPOWERMENT,
        };

        void Initialize()
        {
            me->SetDisableGravity(false);
            me->SetCanFly(false);
        }

        void Reset() override
        {
            events.Reset();
            events.ScheduleEvent(EVENT_MYSTIC_EMPOWERMENT, 1 * IN_MILLISECONDS);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_MYSTIC_EMPOWERMENT:
                        if (Creature* hyrja = me->FindNearestCreature(BOSS_HYRJA, 1500.0f, true))
                        {
                            if (hyrja && me->GetDistance2d(hyrja->GetPositionX(), hyrja->GetPositionY()) < 5.0f)
                                me->CastSpell(hyrja, SPELL_MYSTIC_EMPOWEREMENT_THUNDER, true);

                            else if (hyrja && me->GetDistance2d(hyrja->GetPositionX(), hyrja->GetPositionY()) < 20.0f)
                            {
                                me->CastSpell(hyrja, SPELL_MYSTIC_EMPOWEREMENT_THUNDER_VISUAL, true);

                                /*if (hyrja->HasAura(SPELL_MYSTIC_EMPOWEREMENT_THUNDER))
                                    hyrja->RemoveAurasDueToSpell(SPELL_MYSTIC_EMPOWEREMENT_THUNDER);*/
                            }
                            /*else if (hyrja->HasAura(SPELL_MYSTIC_EMPOWEREMENT_THUNDER_VISUAL))
                                hyrja->RemoveAurasDueToSpell(SPELL_MYSTIC_EMPOWEREMENT_THUNDER_VISUAL);*/
                        }

                        events.ScheduleEvent(EVENT_MYSTIC_EMPOWERMENT, 5 * IN_MILLISECONDS);
                        break;
                    default:
                        break;
                }
            }
        }

    private:
        EventMap events;
    };

    /*CreatureAI* GetAI(Creature* creature) const override
    {
        return GetHallsOfValorAI<npc_solsten_ghostAI>(creature);
    }*/
};

// 10675
/*class at_center_eye_of_the_storm : public AreaTriggerEntityScript
{
public:
    at_center_eye_of_the_storm() : AreaTriggerEntityScript("at_center_eye_of_the_storm") { }

    struct at_center_eye_of_the_stormAI : AreaTriggerAI
    {
        at_center_eye_of_the_stormAI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUnitEnter(Unit* target) override
        {
            if (!target)
                return;

            if (!target->HasAura(SPELL_EYE_OF_THE_STORM_ABSORB))
                target->CastSpell(target, SPELL_EYE_OF_THE_STORM_ABSORB, true);
        }

        void OnUnitExit(Unit* target) override
        {
            if (!target)
                return;

            if (target->HasAura(SPELL_EYE_OF_THE_STORM_ABSORB))
                target->RemoveAurasDueToSpell(SPELL_EYE_OF_THE_STORM_ABSORB);
        }

        void OnAreaTriggerEntityRemove()
        {
            Map::PlayerList const &PlayerList = at->GetMap()->GetPlayers();
            if (!PlayerList.isEmpty())
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    if (Player *player = i->GetSource())
                        if (player->HasAura(SPELL_EYE_OF_THE_STORM_ABSORB))
                            player->RemoveAurasDueToSpell(SPELL_EYE_OF_THE_STORM_ABSORB);
        }
    };

    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new at_center_eye_of_the_stormAI(areatrigger);
    }
};*/

// 10374
/*class at_eye_of_the_storm : public AreaTriggerEntityScript
{
public:
    at_eye_of_the_storm() : AreaTriggerEntityScript("at_eye_of_the_storm") { }

    struct at_eye_of_the_stormAI : AreaTriggerAI
    {
        at_eye_of_the_stormAI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUnitEnter(Unit* target) override
        {
            if (!target)
                return;

            if (!target->HasAura(SPELL_EYE_OF_THE_STORM_ACTIVE))
                target->CastSpell(target, SPELL_EYE_OF_THE_STORM_ACTIVE, true);
        }

        void OnUnitExit(Unit* target) override
        {
            if (!target)
                return;

            if (target->HasAura(SPELL_EYE_OF_THE_STORM_ACTIVE))
                target->RemoveAurasDueToSpell(SPELL_EYE_OF_THE_STORM_ACTIVE);
        }

        void OnAreaTriggerEntityRemove()
        {
            Map::PlayerList const &PlayerList = at->GetMap()->GetPlayers();
            if (!PlayerList.isEmpty())
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    if (Player *player = i->GetSource())
                        if (player->HasAura(SPELL_EYE_OF_THE_STORM_ACTIVE))
                            player->RemoveAurasDueToSpell(SPELL_EYE_OF_THE_STORM_ACTIVE);
        }
    };


    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new at_eye_of_the_stormAI(areatrigger);
    }
};*/

/*class at_sanctify : public AreaTriggerEntityScript
{
public:
    at_sanctify() : AreaTriggerEntityScript("at_sanctify") { }

    struct at_sanctifyAI : AreaTriggerAI
    {
        at_sanctifyAI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        uint32 m_Timer = 2000;

        void OnUnitEnter(Unit* target) override
        {
            if (!target)
                return;

            target->CastSpell(target, SPELL_SANCTIFY_DAMAGE, true);
        }

        void OnAreaTriggerEntityUpdate(uint32 diff)
        {
            if (diff <= m_Timer)
            {
                Map::PlayerList const &PlayerList = at->GetMap()->GetPlayers();
                if (!PlayerList.isEmpty())
                    for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                        if (Player *player = i->GetSource())
                            if (player->GetDistance2d(at->GetPositionX(), at->GetPositionY()) < 2.0f)
                                player->CastSpell(player, SPELL_SANCTIFY_DAMAGE, true);

                m_Timer = 2000;
            }
            else
                m_Timer += diff;
        }
    };

    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new at_sanctifyAI(areatrigger);
    }
};*/

//INSERT INTO spell_script_names(spell_id, scriptname) (192048, 'spell_expel_light');
// 192048 - Expel Light
class spell_expel_light : public SpellScriptLoader
{
public:
    spell_expel_light() : SpellScriptLoader("spell_expel_light") { }

    class spell_expel_light_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_expel_light_AuraScript);


        void HandleEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            GetCaster()->CastSpell(GetCaster(), SPELL_EXPEL_LIGHT_EXPLODE, true);
        }

        void Register() override
        {
            AfterEffectRemove += AuraEffectRemoveFn(spell_expel_light_AuraScript::HandleEffectRemove, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_expel_light_AuraScript();
    }
};

//
class spell_sanctify : public SpellScriptLoader
{
public:
    spell_sanctify() : SpellScriptLoader("spell_sanctify") { }

    class spell_sanctify_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_sanctify_AuraScript);

        void HandleEffectPeriodic(AuraEffect const* /*aurEff*/)
        {
            if (!GetCaster())
                return;

            Position pos = GetCaster()->GetPosition();
            pos = GetCaster()->GetRandomPoint(pos, 30.0f);

            GetCaster()->CastSpell(pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), SPELL_SANCTIFY_AREATRIGGER, true);
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_sanctify_AuraScript::HandleEffectPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_sanctify_AuraScript();
    }
};

void AddSC_boss_hyrja()
{
    new boss_hyrja();
    new npc_olmyr_the_enlightened();
    new npc_solsten();
    //new at_center_eye_of_the_storm();
    //new at_eye_of_the_storm();
    //new at_sanctify();
    new spell_expel_light();
    new spell_sanctify();
    new npc_olmyr_ghost();
    new npc_solsten_ghost();
}
