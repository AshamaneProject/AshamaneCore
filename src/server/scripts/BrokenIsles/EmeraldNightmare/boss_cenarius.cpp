/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
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

#include "ScriptMgr.h"
#include "GameObject.h"
#include "emerald_nightmare.h"

enum Spells
{
    SPELL_CREEPING_NIGHTMARES = 210279,
    SPELL_AURA_OF_DREAD_THORNS = 210346,
    SPELL_FORCES_OF_NIGHTMARE = 212726,
    SPELL_NIGHTMARE_BLAST = 213162,
    SPELL_SPEAR_OF_NIGHTMARES = 214529,
    SPELL_NIGHTMARE_BRAMBLES = 210290,
    SPELL_BRAMBLE_SWARM = 210302,
    SPELL_BEASTS_OF_NIGHTMARE = 214876,
    SPELL_ENTANGLING_NIGHTMARES = 214505,

    SPELL_OVERWHELMING_NIGHTMARE = 217368,
    //Malfurion
    SPELL_CLEANSING_GROUND = 214249,  //start 30s  every 77s
    //Forces of Nightmare
    SPELL_SCORNED_TOUCH = 211471, //start 5s  every 21s
    SPELL_TWISTED_TOUCH_OF_LIFE = 211368, //start 10s  every 15s
    SPELL_ROTTEN_BREATH = 211192, //start 18s  every 24s
    SPELL_DESICCATING_STOMP = 211073, //start 29s  every 32s
    //
    NPC_NIGHTMARE_BRAMBLES = 106167,
    NPC_ENTANGLING_ROOTS = 108040,
    NPC_TORMENTED_SOULS = 106895,
    NPC_CORRUPTED_EMERALD_EGG = 106898,
    NPC_CORRUPTED_NATURE = 106899,
    NPC_NIGHTMARE_SAPLING = 106427,
    NPC_CORRUPTED_WISP = 106304,
    NPC_ROTTEN_DRAKE = 105494,
    NPC_TWISTED_SISTER = 105495,
    NPC_NIGHTMARE_ANCIENT = 105468,
};


enum Events
{
    // Intro
    EVENT_1 = 1,
    EVENT_2,
    EVENT_3,
    EVENT_4,
    EVENT_5,
    EVENT_6
};

enum Phases
{
    PHASE_1, //Phase 1: Forces of Nightmare!
    PHASE_2, //Phase 2: Your Nightmare Ends!
    PHASE_NORMAL,
    PHASE_INTRO
};

std::vector<TalkData> const talkData =
{
    { EVENT_ON_ENTERCOMBAT,             EVENT_TYPE_TALK,            0 },
    { SPELL_FORCES_OF_NIGHTMARE,        EVENT_TYPE_TALK,            1 },
    { EVENT_ON_JUSTDIED,                EVENT_TYPE_TALK,            4 },
};

Position northeast = { 11405.299805f,-12723.7f,487.224f,2.23775f };
Position northwest = { 11391.2f,-12670.0f,487.1889f,4.21162f };
Position southwest = { 11343.0332f,-12663.058f,487.26428f,5.03789f };
Position southeast = { 11339.5f,-12719.2f,487.334f,0.842365f };

struct CustomSpawnData
{
    uint32 event, npcId;
    Position pos;
};

CustomSpawnData const spawnData[] =
{
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_CORRUPTED_WISP, northeast },
    { EVENT_1, NPC_ROTTEN_DRAKE, northwest },
    { EVENT_1, NPC_NIGHTMARE_ANCIENT, southeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_CORRUPTED_WISP, northeast },
    { EVENT_2, NPC_ROTTEN_DRAKE, northwest },
    { EVENT_2, NPC_TWISTED_SISTER, southwest },
    { EVENT_3, NPC_NIGHTMARE_ANCIENT, southeast },
    { EVENT_3, NPC_TWISTED_SISTER, southwest },
    { EVENT_3, NPC_TWISTED_SISTER, southwest },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_CORRUPTED_WISP, northeast },
    { EVENT_4, NPC_ROTTEN_DRAKE, northwest },
    { EVENT_4, NPC_ROTTEN_DRAKE, northwest },
    { EVENT_5, NPC_NIGHTMARE_ANCIENT, southeast },
    { EVENT_5, NPC_NIGHTMARE_ANCIENT, southeast },
    { EVENT_5, NPC_TWISTED_SISTER, southwest },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_CORRUPTED_WISP, northeast },
    { EVENT_6, NPC_TWISTED_SISTER, southwest },
};

struct boss_cenarius_1 : public BossAI
{
    boss_cenarius_1(Creature* creature) : BossAI(creature, DATA_CENARIUS) { Initialize(); }

    void Initialize()
    {
        PhaseStatus = Phases::PHASE_INTRO;
        //SetDungeonEncounterID(1877);
        LoadTalkData(&talkData);
        addsCount = 0;
        sisterCount = 0;
        wave = 0;
    }

    void LoadNPC(uint32 event, const CustomSpawnData* data)
    {
        while (data->event)
        {
            if (data->event == event)
                me->SummonCreature(data->npcId, Position(data->pos), TEMPSUMMON_MANUAL_DESPAWN, WEEK);
            ++data;
        }
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        if (Creature* target = me->FindNearestCreature(106482, 500.0f, true))
            target->AI()->DoAction(2);
        if (GameObject* box = me->SummonGameObject(254168, Position(11364.23f, -12743.16f, 488.074585f), QuaternionData(), WEEK))
            box->SetLootState(GO_READY);;
    }

    void DamageTaken(Unit* /*attacker*/, uint32& damage) override
    {
        if (me->HealthWillBeBelowPctDamaged(35, damage))
        {
            PhaseStatus = Phases::PHASE_2;
            events.Reset();
            DoCast(SPELL_OVERWHELMING_NIGHTMARE);
            events.ScheduleEvent(SPELL_CREEPING_NIGHTMARES, 2s);//all phase
            events.ScheduleEvent(SPELL_BEASTS_OF_NIGHTMARE, 30s);
            events.ScheduleEvent(SPELL_SPEAR_OF_NIGHTMARES, 20s);//33
            events.ScheduleEvent(SPELL_ENTANGLING_NIGHTMARES, 35s);
            if (IsMythic())
                events.ScheduleEvent(SPELL_NIGHTMARE_BLAST, 13s);
        }
    }

    void ScheduleTasks() override
    {
        PhaseStatus = Phases::PHASE_1;
        events.ScheduleEvent(SPELL_CREEPING_NIGHTMARES, 2s);//all phase
        events.ScheduleEvent(SPELL_FORCES_OF_NIGHTMARE, 7s, 8s);
        events.ScheduleEvent(SPELL_AURA_OF_DREAD_THORNS, 14s);
        events.ScheduleEvent(SPELL_NIGHTMARE_BRAMBLES, 28s);
        if(IsMythic())
            events.ScheduleEvent(SPELL_NIGHTMARE_BLAST, 30s);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {

        case SPELL_CREEPING_NIGHTMARES:
        {
            instance->DoCastSpellOnPlayers(SPELL_CREEPING_NIGHTMARES);
            events.Repeat(2s);
            break;
        }
        case SPELL_AURA_OF_DREAD_THORNS:
        {
            DoCast(SPELL_AURA_OF_DREAD_THORNS);
            events.Repeat(34s);
            break;
        }
        case SPELL_FORCES_OF_NIGHTMARE:
        {
            GetTalkData(SPELL_FORCES_OF_NIGHTMARE);
            DoCast(SPELL_FORCES_OF_NIGHTMARE);
            wave++;
            LoadNPC(wave, spawnData);
            events.Repeat(77s);
            break;
        }
        case SPELL_NIGHTMARE_BLAST:
        {
            DoCast(SPELL_NIGHTMARE_BLAST);
            events.Repeat(32s);
            break;
        }
        case SPELL_SPEAR_OF_NIGHTMARES:
        {
            DoCast(SPELL_SPEAR_OF_NIGHTMARES);
            events.Repeat(33s);
            break;
        }
        case SPELL_NIGHTMARE_BRAMBLES:
        {
            DoCast(SPELL_NIGHTMARE_BRAMBLES);
            AddTimedDelayedOperation(2500, [this]() -> void
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.f, true))
                    me->SummonCreature(NPC_NIGHTMARE_BRAMBLES, target->GetPosition(), TEMPSUMMON_MANUAL_DESPAWN, WEEK);
            });
            events.Repeat(30s);
            break;
        }
        case SPELL_BEASTS_OF_NIGHTMARE:
        {
            DoCast(SPELL_BEASTS_OF_NIGHTMARE);
            events.Repeat(30s);
            break;
        }
        case SPELL_ENTANGLING_NIGHTMARES:
        {
            DoCast(SPELL_ENTANGLING_NIGHTMARES);
            events.Repeat(51s);
            break;
        }
        default:
            break;
        }
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->IsPlayer() && me->IsWithinDist(who, 55.0f, false) && PhaseStatus == Phases::PHASE_INTRO)
        {
            PhaseStatus = Phases::PHASE_1;
            me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC));
        }
    }

    void JustSummoned(Creature* summon) override
    {
        BossAI::JustSummoned(summon);
        switch (summon->GetEntry())
        {
        case NPC_NIGHTMARE_BRAMBLES:
        case NPC_ENTANGLING_ROOTS:
        case NPC_TORMENTED_SOULS:
        case NPC_CORRUPTED_EMERALD_EGG:
        case NPC_CORRUPTED_NATURE:
        case NPC_NIGHTMARE_SAPLING:
        case NPC_CORRUPTED_WISP:
        case NPC_ROTTEN_DRAKE:
        case NPC_TWISTED_SISTER:
        case NPC_NIGHTMARE_ANCIENT:
        {
            summon->SetFaction(me->GetFaction());
            break;
        }
        }
    }
    uint8 PhaseStatus;
    uint8 addsCount = 0;
    uint8 sisterCount = 0;
    uint8 wave = 0;
};
// boss_cenarius_1
void AddSC_boss_cenarius()
{
    RegisterCreatureAI(boss_cenarius_1);
}
