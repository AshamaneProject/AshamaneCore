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

#include "GameObject.h"
#include "tomb_of_sargeras.h"

const Position infernalChaosbringer[4] =
{
    { 6130.221f, -801.1302f, 2971.884f, 2.807055f },
    { 6086.503f, -816.4011f, 2971.987f, 2.965497f },
    { 6064.199f, -782.8004f, 2971.644f, 2.827615f },
    { 6131.155f, -773.0943f, 2971.543f, 0.0f },
};

// 119726 - Archimage Khadgar
class npc_archimage_khadgar_tos : public CreatureScript
{
public:
    npc_archimage_khadgar_tos() : CreatureScript("npc_archimage_khadgar_tos") { }

    enum velenEvents
    {
        EVENT_FALL_BACK = 1,
        EVENT_IMPACT,
        EVENT_CHECK_FOR_EVENT_START,
        EVENT_ILLIDAN_TALK,
        EVENT_TALK_ATRIGAN1,
        EVENT_CAST_SCENE,
        EVENT_SUMMONS,
    };

    enum velenSay
    {
        SAY_INTRO = 0,
    };

    struct npc_archimage_khadgar_tosAI : public ScriptedAI
    {
        npc_archimage_khadgar_tosAI(Creature* creature) : ScriptedAI(creature)
        {
            //me->SummonGameObject(GO_DESTRUCTIBLE_2, 6146.56f, -762.025f, 2970.9f, 3.14159f, QuaternionData(-0.0f, -0.0f, -0.284929f, -0.958549f), 100000);
        }

        uint32 startTimer;
        bool eventStarted;

        void Reset() override
        {
            events.Reset();

            me->SetReactState(REACT_PASSIVE);
            me->AttackStop();

            if (Creature* creature = me->FindNearestCreature(NPC_VELEN, 1000.0f))
            {
                creature->SetReactState(REACT_PASSIVE);
                creature->AttackStop();
            }

            if (Creature* creature = me->FindNearestCreature(117931, 1000.0f))
            {
                creature->SetReactState(REACT_PASSIVE);
                creature->AttackStop();
                creature->SetFaction(35);
            }

            std::list<Unit*> unitList;
            //me->GetAnyUnitListInRange(unitList, 1000.0f);

            if (!unitList.empty())
            {
                for (auto unit : unitList)
                {
                    if (unit->GetTypeId() != TYPEID_UNIT)
                        continue;

                    unit->ToCreature()->Respawn();
                }
            }

            me->SetReactState(REACT_PASSIVE);
            me->AttackStop();

            DoZoneInCombat();

            events.ScheduleEvent(EVENT_CHECK_FOR_EVENT_START, 1 * IN_MILLISECONDS);

            eventStarted = false;
        }

        void CheckForStartEvent()
        {
            if (!eventStarted)
            {
                Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
                if (!PlayerList.isEmpty())
                    for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                        if (Player *player = i->GetSource())
                            if (player->IsAlive() && player->GetDistance2d(5967.10f, -795.73f) <= 3.0f)
                            {
                                if (eventStarted)
                                    continue;

                                me->Yell("Quickly, bolster our ranks! We must push through!", LANG_UNIVERSAL, NULL);

                                events.ScheduleEvent(EVENT_ILLIDAN_TALK, 6 * IN_MILLISECONDS);

                                events.CancelEvent(EVENT_CHECK_FOR_EVENT_START);

                                eventStarted = true;
                            }

            }
        }

        void CastSceneToPlayers()
        {
            Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
            if (!PlayerList.isEmpty())
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    if (Player *player = i->GetSource())
                        if (player->IsAlive())
                            player->CastSpell(player, SPELL_GOROTH_INTRO, true);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_IMPACT:
                        if (Creature* creature = me->FindNearestCreature(NPC_VELEN, 1000.0f))
                            creature->DespawnOrUnsummon();

                        if (Creature* creature = me->FindNearestCreature(NPC_ILLIDAN, 1000.0f))
                            creature->DespawnOrUnsummon();

                        DoCast(SPELL_IMPACT);

                        me->DespawnCreaturesInArea(121024, 1000.0f);
                        me->DespawnCreaturesInArea(119742, 1000.0f);
                        me->DespawnCreaturesInArea(119768, 1000.0f);
                        me->DespawnCreaturesInArea(121005, 1000.0f);
                        me->DespawnCreaturesInArea(119730, 1000.0f);
                        me->DespawnCreaturesInArea(117931, 1000.0f);
                        me->DespawnCreaturesInArea(119777, 1000.0f);

                        if (Creature* creature = me->FindNearestCreature(NPC_ATRIGAN, 1000.0f))
                        {
                            creature->SummonCreature(NPC_INFERNAL_CHAOSBRINGER, 6130.221f, -801.1302f, 2971.884f, 0.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000);
                            creature->SummonCreature(NPC_INFERNAL_CHAOSBRINGER, 6086.503f, -816.4011f, 2971.987f, 0.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000);
                            creature->SummonCreature(NPC_INFERNAL_CHAOSBRINGER, 6064.199f, -782.8004f, 2971.644f, 0.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000);

                            creature->DespawnOrUnsummon(5000);
                        }

                        me->DespawnOrUnsummon();
                        break;

                    case EVENT_FALL_BACK:
                        Talk(SAY_INTRO);

                        events.ScheduleEvent(EVENT_IMPACT, 100);
                        break;

                    case EVENT_ILLIDAN_TALK:
                        if (Creature* creature = me->FindNearestCreature(NPC_ILLIDAN, 1000.0f))
                            creature->Yell("Leave none standing! If we fall here, Azeroth burns.", LANG_UNIVERSAL, NULL);

                        events.ScheduleEvent(EVENT_TALK_ATRIGAN1, 6 * IN_MILLISECONDS);
                        break;

                    case EVENT_TALK_ATRIGAN1:
                        if (Creature* creature = me->FindNearestCreature(NPC_ATRIGAN, 1000.0f))
                        {
                            creature->Yell("Yes! Let them come! Their bodies will fuel the flames or their burning world!", LANG_UNIVERSAL, NULL);

                            CastSceneToPlayers();

                            if (GameObject* go = me->FindNearestGameObject(GO_DESTRUCTIBLE_1, 5000.0f))
                            {
                                /*if (Creature* boss = me->FindNearestCreature(BOSS_GOROTH, 1000.0f))
                                    go->CastSpell(boss, SPELL_SUMMON, true);*/

                                go->SetLootState(GO_READY);
                                go->UseDoorOrButton(1000000, true);
                            }
                        }

                        events.ScheduleEvent(EVENT_CAST_SCENE, 1 * IN_MILLISECONDS);
                        break;

                    case EVENT_CHECK_FOR_EVENT_START:
                        CheckForStartEvent();

                        events.ScheduleEvent(EVENT_CHECK_FOR_EVENT_START, 1 * IN_MILLISECONDS);
                        break;

                    case EVENT_CAST_SCENE:

                        if (GameObject* go = me->FindNearestGameObject(GO_DESTRUCTIBLE_2, 1000.0f))
                        {
                            go->SetLootState(GO_READY);
                            go->UseDoorOrButton(1000000, false);
                        }

                        if (GameObject* go = me->FindNearestGameObject(GO_DESTRUCTIBLE_3, 1000.0f))
                        {
                            go->SetLootState(GO_READY);
                            go->UseDoorOrButton(1000000, false);
                        }

                        events.ScheduleEvent(EVENT_SUMMONS, 3 * IN_MILLISECONDS);
                        events.ScheduleEvent(EVENT_FALL_BACK, 5 * IN_MILLISECONDS);
                        break;

                    case EVENT_SUMMONS:
                        if (Creature* creature = me->FindNearestCreature(BOSS_GOROTH, 1000.0f))
                        {
                            creature->SetVisible(true);
                            creature->SetAIAnimKitId(8801);
                            creature->PlayOneShotAnimKitId(8801);
                            creature->CastSpell(creature, 233081, true);
                            creature->CastSpell(creature, SPELL_IMPACT, true);
                        }

                        break;
                }
            }
        }

    private:
        EventMap events;

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetTombOfSargerasAI<npc_archimage_khadgar_tosAI>(creature);
    }
};

// 241227 - Summon
class spell_goroth_summon : public SpellScriptLoader
{
public:
    spell_goroth_summon() : SpellScriptLoader("spell_goroth_summon") { }

    class spell_goroth_summon_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_goroth_summon_SpellScript);

        void HandleDummy(SpellEffIndex effIndex)
        {
            /*if (Unit* caster = GetCaster())
            {
                if (GameObject* go = caster->FindNearestGameObject(269839, 1000.0f))
                {
                    go->setActive(true);
                    go->SetLootState(GO_ACTIVATED);
                }

                if (GameObject* go = caster->FindNearestGameObject(269838, 1000.0f))
                {
                    go->setActive(true);
                    go->SetLootState(GO_ACTIVATED);
                }

                if (Creature* creature = caster->FindNearestCreature(BOSS_GOROTH, 1000.0f))
                {
                    creature->SetVisible(true);
                    creature->AddAura(233081, creature);
                }

                for (uint8 i = 0; i < 4; ++i)
                    caster->SummonCreature(NPC_INFERNAL_CHAOSBRINGER, infernalChaosbringer[i], TEMPSUMMON_CORPSE_DESPAWN);

                caster->ToCreature()->DespawnOrUnsummon();
            }*/
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_goroth_summon_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_goroth_summon_SpellScript();
    }
};


void AddSC_tomb_of_sargeras()
{
    new npc_archimage_khadgar_tos();
    new spell_goroth_summon();
}
