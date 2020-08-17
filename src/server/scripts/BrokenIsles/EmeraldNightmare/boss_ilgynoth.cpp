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
#include "emerald_nightmare.h"
#include "CreatureGroups.h"
#include "LFGMgr.h"
#include "LFGQueue.h"
#include "LFGPackets.h"
#include "DynamicObject.h"
#include "ScriptedEscortAI.h"
#include "CreatureTextMgr.h"
#include "MiscPackets.h"
#include "GameObjectAI.h"
#include "ScriptedCreature.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "Creature.h"
#include "ObjectAccessor.h"
#include "ScriptedGossip.h"
#include "Vehicle.h"
#include "MotionMaster.h"
#include "TemporarySummon.h"
#include "GameObject.h"
#include "CombatAI.h"
#include "SpellInfo.h"
#include "Conversation.h"
#include "PhasingHandler.h"
#include "SpellScript.h"
#include "Chat.h"
#include "Map.h"
#include "Transport.h"
#include "InstanceScript.h"
#include "DBCEnums.h"
#include "SceneMgr.h"
#include "Unit.h"
#include "SpellAuras.h"

enum Says
{
    SAY_AGGRO = 0,
    SAY_ANNOUNCE = 4,
    SAY_EVADE = 5,
    SAY_DEATH = 6,
};

enum Spells
{
    //ilgynoth
    SPELL_DARK_RECONSTITUTION = 210781,
    SPELL_FINAL_TORPOR = 223121,
    SPELL_CURSED_BLOOD = 215128,
    SPELL_CURSED_BLOOD_EXPLOSION = 215143,
    SPELL_DARKEST_NIGHTMARE_AT = 210786,
    SPELL_KNOCKBACK_AT = 224929,
    SPELL_INTERFERE_TARGETTING = 210780,
    SPELL_RECOVERY_TELEPORT = 222531,
    SPELL_KILL_WHISPER = 222173, //? Il'gynoth Kill Whisper

                                 //Eye ilgynoth
                                 SPELL_NIGHTMARE_GAZE = 210931,
                                 SPELL_SUM_NIGHTMARE_HORROR = 210289,

                                 //Mythic
                                 SPELL_DEATH_BLOSSOM = 218415, //Remove AT cast
                                 SPELL_DEATH_BLOSSOM_AT = 215761,
                                 SPELL_DEATH_BLOSSOM_VISUAL = 215763,
                                 SPELL_DEATH_BLOSSOM_DMG = 215836,
                                 SPELL_DISPERSED_SPORES = 215845,
                                 SPELL_VIOLENT_BLOODBURST = 215971,
                                 SPELL_VIOLENT_BLOODBURST_AT = 215975,
                                 SPELL_SUM_SHRIVELED_EYESTALK = 216131,

                                 //Dominator Tentacle - 105304
                                 SPELL_NIGHTMARISH_FURY = 215234,
                                 SPELL_GROUND_SLAM_DMG = 208689,
                                 SPELL_GROUND_SLAM_VISUAL = 212723,
                                 SPELL_RUPTURING_ROAR = 208685,

                                 //Deathglare Tentacle - 105322
                                 SPELL_MIND_FLAY = 208697,

                                 //Corruptor Tentacle - 105383
                                 SPELL_SPEW_CORRUPTION = 208928,

                                 //Nightmare Horror - 105591
                                 SPELL_SEEPING_CORRUPTION = 209387,
                                 SPELL_EYE_OF_FATE = 210984,

                                 //Nightmare Ichor - 105721
                                 SPELL_FIXATE = 210099,
                                 SPELL_NIGHTMARE_EXPLOSION = 209471,
                                 SPELL_NIGHTMARE_EXPLOSION_PCT = 210048,
                                 SPELL_REABSORPTION = 212942,

                                 //Other
                                 SPELL_SPAWN_BLOOD = 209965,
};

enum eEvents
{
    EVENT_SUMMON_1 = 1,
    EVENT_SUMMON_2 = 2,
    EVENT_SUMMON_3 = 3,
    EVENT_SUMMON_4 = 4,
    EVENT_SUMMON_5 = 5,
    EVENT_SUMMON_6 = 6,
    EVENT_SUMMON_7 = 7,
    EVENT_DARK_RECONSTITUTION = 8,
    EVENT_CURSED_BLOOD = 9,
    EVENT_EYE_RESPAWN = 10,
    EVENT_ANNOUNCE = 11,
    EVENT_ANNOUNCE_FINAL = 12,
    EVENT_CHECK_TARGET_DISTANCE = 13,

    //Mythic
    EVENT_SUM_SHRIVELED_EYESTALK,
    EVENT_DEATH_BLOSSOM
};

Position const sumPos[4] =
{
    { -12818.1f, 12328.3f, -245.72f, 3.79f }, //105906 - Eye of Ilgynoth
    { -12843.59f, 12331.40f, -246.01f, 3.56f },
    { -12821.79f, 12302.79f, -246.01f, 3.83f },
    { -12856.12f, 12296.79f, -253.16f, 0.72f } //Horror
};

Position const blossPos[22] =
{
    { -12843.5f, 12321.6f, -250.77f },
    { -12840.4f, 12297.1f, -251.92f },
    { -12822.7f, 12281.8f, -250.72f },
    { -12832.5f, 12290.1f, -251.82f },
    { -12848.9f, 12327.6f, -250.40f },
    { -12837.4f, 12314.9f, -250.81f },
    { -12831.4f, 12308.4f, -250.07f },
    { -12824.1f, 12300.7f, -248.79f },
    { -12814.5f, 12290.5f, -248.35f },
    { -12848.0f, 12303.3f, -252.25f },
    { -12854.7f, 12310.2f, -252.30f },
    { -12861.6f, 12319.4f, -252.85f },
    { -12852.3f, 12319.2f, -251.93f },
    { -12844.8f, 12311.6f, -251.94f },
    { -12839.7f, 12305.9f, -251.59f },
    { -12831.2f, 12298.9f, -250.53f },
    { -12823.5f, 12291.4f, -249.49f },
    { -12830.6f, 12277.5f, -252.17f },
    { -12842.2f, 12285.1f, -253.12f },
    { -12852.0f, 12290.9f, -253.25f },
    { -12858.0f, 12298.5f, -253.22f },
    { -12864.3f, 12307.0f, -253.70f }
};

//105393
class boss_ilgynoth : public CreatureScript
{
public:
    boss_ilgynoth() : CreatureScript("boss_ilgynoth") {}

    struct boss_ilgynothAI : public BossAI
    {
        boss_ilgynothAI(Creature* creature) : BossAI(creature, DATA_ILGYNOTH), summons(me)
        {
            me->SetReactState(REACT_PASSIVE);
            SetCombatMovement(false);
            AnnText = 1;
        }

        SummonList summons;
        FormationInfo* group_member = nullptr;
        bool specialPhase;
        bool finalTorpor;
        int8 AnnText;

        void Reset() override
        {
            _Reset();
            summons.DespawnAll();
            //RemoveAT();
            CreateGroupAndSummonTrash();
            me->SetReactState(REACT_PASSIVE);
            me->AddUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_ATTACKABLE_1));
            instance->SetData(DATA_EYE_ILGYNOTH, IN_PROGRESS);
            specialPhase = false;
            finalTorpor = false;
            DoCast(me, SPELL_KNOCKBACK_AT, true);
        }

        /*void EnterEvadeMode(EvadeReason /*why*) override
        {
            BossAI::EnterEvadeMode();
            TeleportPlayer();
        }*/

        void CreateGroupAndSummonTrash()
        {
            /*if (group_member)
                sFormationMgr->RemoveCreatureFromGroup(me->GetFormation(), me);

            group_member = sFormationMgr->CreateFormation(me);*/

            me->SummonCreature(NPC_EYE_OF_ILGYNOTH, sumPos[0]);
            me->SummonCreature(NPC_DOMINATOR_TENTACLE, sumPos[1]);
            me->SummonCreature(NPC_DOMINATOR_TENTACLE, sumPos[2]);
        }

        /*void RemoveAT()
        {
            std::list<AreaTrigger*> list;
            me->GetAreaTriggerListWithEntryInGrid(list, 11189, 150.0f); //Nightmare Corruption - 208931
            if (!list.empty())
                for (std::list<AreaTrigger*>::iterator itr = list.begin(); itr != list.end(); ++itr)
                    if (AreaTrigger* areaObj = (*itr))
                        areaObj->Despawn();
        }*/

        void EnterCombat(Unit* /*who*/) override
        {
            _EnterCombat();
            EntryCheckPredicate pred1(NPC_EYE_OF_ILGYNOTH);
            EntryCheckPredicate pred2(NPC_DOMINATOR_TENTACLE);
            summons.DoAction(true, pred1);
            summons.DoAction(true, pred2);
            DoCast(me, SPELL_DARKEST_NIGHTMARE_AT, true);
            TeleportPlayer();
            Talk(SAY_AGGRO);

            events.ScheduleEvent(EVENT_SUMMON_1, 20000); //Sum Deathglare
            events.ScheduleEvent(EVENT_CHECK_TARGET_DISTANCE, 2000);
            events.ScheduleEvent(100, 10000);
        }

        void JustDied(Unit* /*killer*/) override
        {
            _JustDied();
            summons.DespawnAll();
            //RemoveAT();
            instance->SetData(DATA_EYE_ILGYNOTH, DONE);
            Talk(SAY_DEATH);
        }

        void JustSummoned(Creature* summon) override
        {
            summons.Summon(summon);

            switch (summon->GetEntry())
            {
            case NPC_EYE_OF_ILGYNOTH:
            case NPC_DOMINATOR_TENTACLE:
                if (CreatureGroup* f = me->GetFormation())
                    f->AddMember(summon);
                break;
            }
        }

        void SummonedCreatureDies(Creature* summon, Unit* /*killer*/) override
        {
            if (summon->GetEntry() == NPC_EYE_OF_ILGYNOTH)
            {
                events.Reset();
                specialPhase = true;
                instance->SetData(DATA_EYE_ILGYNOTH, DONE);
                me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_ATTACKABLE_1));
                events.ScheduleEvent(EVENT_DARK_RECONSTITUTION, 10000);
                events.ScheduleEvent(EVENT_CURSED_BLOOD, 15000);

                if (GetDifficulty() == DIFFICULTY_MYTHIC_RAID)
                {
                    if (finalTorpor)
                        events.ScheduleEvent(EVENT_SUM_SHRIVELED_EYESTALK, 16000);

                    if (me->GetHealth() > me->CountPctFromMaxHealth(33))
                        me->SetHealth(me->GetHealth() - me->CountPctFromMaxHealth(33));
                    else if (me->GetHealthPct() > 10)
                        me->SetHealth(me->CountPctFromMaxHealth(10));
                }
            }
        }

        void TeleportPlayer()
        {
            std::list<Player*> players;
            GetPlayerListInGrid(players, me, 25.0f);
            if (!players.empty())
                for (auto const& player : players)
                    player->CastSpell(player, SPELL_RECOVERY_TELEPORT, true);
        }

        void SummomRandPos(uint8 count, uint32 entry)
        {
            for (uint8 i = 0; i < count; i++)
            {
                uint8 rand = urand(1, 2);
                float angle = frand(0.0f, 2.0f * float(M_PI));
                float x = sumPos[rand].GetPositionX() + (5.0f * std::cos(angle));
                float y = sumPos[rand].GetPositionY() + (5.0f * std::sin(angle));
                me->SummonCreature(entry, x, y, sumPos[rand].GetPositionZ());
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_SUMMON_1:
                    SummomRandPos(1, NPC_DEATHGLARE_TENTACLE);
                    events.ScheduleEvent(EVENT_SUMMON_2, 70000); //Next: 2 Corruptors
                    break;
                case EVENT_SUMMON_2:
                    SummomRandPos(2, NPC_CORRUPTOR_TENTACLE);
                    events.ScheduleEvent(EVENT_SUMMON_3, 6000); //Next: 2 Deathglare
                    break;
                case EVENT_SUMMON_3:
                    SummomRandPos(2, NPC_DEATHGLARE_TENTACLE);
                    events.ScheduleEvent(EVENT_SUMMON_4, 84000); //Next: 1 Deathglare
                    break;
                case EVENT_SUMMON_4:
                    SummomRandPos(1, NPC_DEATHGLARE_TENTACLE);
                    events.ScheduleEvent(EVENT_SUMMON_5, 4000); //Next: 2 Corruptors
                    break;
                case EVENT_SUMMON_5:
                    SummomRandPos(2, NPC_CORRUPTOR_TENTACLE);
                    events.ScheduleEvent(EVENT_SUMMON_6, 40000); //Next: 1 Corruptors
                    break;
                case EVENT_SUMMON_6:
                    SummomRandPos(1, NPC_CORRUPTOR_TENTACLE);
                    events.ScheduleEvent(EVENT_SUMMON_7, 15000); //Next: 1 Deathglare
                    break;
                case EVENT_SUMMON_7:
                    SummomRandPos(1, NPC_DEATHGLARE_TENTACLE);
                    events.ScheduleEvent(EVENT_SUMMON_6, 30000); //Next: ??? ????. ?????????
                    break;
                case EVENT_DARK_RECONSTITUTION:
                    DoCast(finalTorpor ? SPELL_FINAL_TORPOR : SPELL_DARK_RECONSTITUTION);
                    finalTorpor = true;
                    events.ScheduleEvent(EVENT_ANNOUNCE_FINAL, 45000);
                    events.ScheduleEvent(EVENT_EYE_RESPAWN, 51000);
                    events.ScheduleEvent(EVENT_ANNOUNCE, 10000);
                    AnnText = 1;
                    break;
                case EVENT_CURSED_BLOOD:
                    DoCast(me, SPELL_CURSED_BLOOD, true);
                    events.ScheduleEvent(EVENT_CURSED_BLOOD, 15000);
                    break;
                case EVENT_SUM_SHRIVELED_EYESTALK:
                {
                    Position pos;
                    float angle = 0.0f;
                    for (uint8 i = 0; i < 6; i++)
                    {
                        angle += 1.0f;
                        me->GetNearPosition(20.0f, angle);
                        me->CastSpell(pos, SPELL_SUM_SHRIVELED_EYESTALK, true);
                    }
                    events.ScheduleEvent(EVENT_SUM_SHRIVELED_EYESTALK, 20000);
                    break;
                }
                case 100:
                    SummomRandPos(1, NPC_NIGHTMARE_ICHOR);
                    SummomRandPos(2, NPC_NIGHTMARE_ICHOR);
                    SummomRandPos(1, NPC_NIGHTMARE_ICHOR);
                    SummomRandPos(2, NPC_NIGHTMARE_ICHOR);
                    SummomRandPos(2, NPC_NIGHTMARE_ICHOR);
                    SummomRandPos(2, NPC_NIGHTMARE_ICHOR);
                    SummomRandPos(2, NPC_NIGHTMARE_ICHOR);
                    SummomRandPos(1, NPC_NIGHTMARE_ICHOR);
                    SummomRandPos(1, NPC_NIGHTMARE_ICHOR);
                    events.RescheduleEvent(100, 45000);
                    break;
                case EVENT_EYE_RESPAWN:
                    events.Reset();
                    instance->SetData(DATA_EYE_ILGYNOTH, IN_PROGRESS);
                    me->AddUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_ATTACKABLE_1));
                    me->SummonCreature(NPC_EYE_OF_ILGYNOTH, sumPos[0]);
                    TeleportPlayer();
                    Talk(SAY_EVADE);
                    specialPhase = false;
                    events.ScheduleEvent(EVENT_SUMMON_1, 20000); //Sum Deathglare
                    events.ScheduleEvent(EVENT_CHECK_TARGET_DISTANCE, 2000);
                    break;
                case EVENT_ANNOUNCE_FINAL:
                    Talk(SAY_ANNOUNCE);
                    break;
                case EVENT_ANNOUNCE:
                    Talk(AnnText);
                    if (AnnText == 1)
                    {
                        AnnText++;
                        events.ScheduleEvent(EVENT_ANNOUNCE, 20000);
                    }
                    break;
                case EVENT_CHECK_TARGET_DISTANCE:
                {
                    if (!specialPhase)
                        TeleportPlayer();

                    bool closestPlayers = false;
                    std::list<HostileReference*> threatlist = me->GetThreatManager().getThreatList();
                    if (!threatlist.empty())
                    {
                        for (std::list<HostileReference*>::iterator itr = threatlist.begin(); itr != threatlist.end(); ++itr)
                            if (Unit* target = me->GetOwner())
                            {
                                if (me->GetDistance(target) < 150.0f)
                                {
                                    closestPlayers = true;
                                    break;
                                }
                            }
                    }
                    /*if (!closestPlayers)
                    {
                        //EnterEvadeMode(EVADE_REASON_OTHER);
                        return;
                    }*/
                    events.ScheduleEvent(EVENT_CHECK_TARGET_DISTANCE, 2000);
                    break;
                }
                }
            }
        }

        /*void TalkWhisper(uint8 text)
        {
            Map::PlayerList const& players = me->GetMap()->GetPlayers();

            for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
            {
                if (Player* player = itr->GetSource())
                    Talk(text, player->GetGUID());
            }
        }*/
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_ilgynothAI(creature);
    }
};

//105906
class npc_eye_of_ilgynoth : public CreatureScript
{
public:
    npc_eye_of_ilgynoth() : CreatureScript("npc_eye_of_ilgynoth") {}

    struct npc_eye_of_ilgynothAI : public ScriptedAI
    {
        npc_eye_of_ilgynothAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = me->GetInstanceScript();
            SetCombatMovement(false);
            introDone = false;
        }

        InstanceScript* instance;
        EventMap events;
        bool introDone;

        void Reset() override {}

        void EnterCombat(Unit* /*who*/) override
        {
            DoZoneInCombat();
            events.ScheduleEvent(1, 2000);
            events.ScheduleEvent(2, 65000); //Summon Nightmare Horror

            if (GetDifficulty() == DIFFICULTY_MYTHIC_RAID)
                events.ScheduleEvent(EVENT_DEATH_BLOSSOM, 60000);
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (who->GetTypeId() != TYPEID_PLAYER)
                return;

            if (!introDone && me->IsWithinDistInMap(who, 250.0f))
            {
                introDone = true;
                //Conversation* conversation = new Conversation;
                //if (!conversation->CreateConversation(sObjectMgr->GetGenerator<HighGuid::Conversation>()->Generate(), 3617, who, nullptr, who->GetPosition()))
                    //delete conversation;
            }
        }
        void JustDied(Unit* /*killer*/) override
        {
            instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
        }

        void IsSummonedBy(Unit* summoner) override
        {
            if (summoner->IsInCombat())
            {
                DoZoneInCombat();
                DoAction(true);
            }
        }

        void DoAction(int32 const action) override
        {
            instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
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
                case 1:
                    if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 120.0f, true))
                    {
                        ResetThreatList();
                        AddThreat(pTarget, 100000.0f);
                        DoCast(pTarget, SPELL_NIGHTMARE_GAZE);
                    }
                    events.ScheduleEvent(1, 2000);
                    break;
                case 2:
                    if (Unit* summoner = me->GetOwner())
                        if (Creature* horror = summoner->SummonCreature(NPC_NIGHTMARE_HORROR, sumPos[3]))
                        {
                            DoCast(horror, SPELL_SUM_NIGHTMARE_HORROR, true);
                            horror->AddUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_ATTACKABLE_1));
                        }
                    Talk(0);
                    events.ScheduleEvent(2, 3 * MINUTE * IN_MILLISECONDS + 40 * IN_MILLISECONDS); //3m40s
                    break;
                case EVENT_DEATH_BLOSSOM:
                    DoCast(SPELL_DEATH_BLOSSOM);
                    if (Unit* summoner = me->GetOwner())
                    {
                        std::list<uint8> randList;
                        for (uint8 i = 0; i < 22; i++)
                            randList.push_back(i);

                        Trinity::Containers::RandomResize(randList, 10);

                        for (std::list<uint8>::iterator itr = randList.begin(); itr != randList.end(); ++itr)
                            if (Creature* blossom = summoner->SummonCreature(NPC_DEATH_BLOSSOM, blossPos[*itr], TEMPSUMMON_TIMED_DESPAWN, 16000))
                            {
                                blossom->CastSpell(blossom, SPELL_DEATH_BLOSSOM_AT, true);
                                blossom->CastSpell(blossom, SPELL_DEATH_BLOSSOM_VISUAL, true);
                            }
                    }
                    events.ScheduleEvent(EVENT_DEATH_BLOSSOM, 100000); //1m40s
                    break;
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_eye_of_ilgynothAI(creature);
    }
};

//105304, 105322, 105383, 108821
class npc_ilgynoth_tentacles : public CreatureScript
{
public:
    npc_ilgynoth_tentacles() : CreatureScript("npc_ilgynoth_tentacles") {}

    struct npc_ilgynoth_tentaclesAI : public ScriptedAI
    {
        npc_ilgynoth_tentaclesAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = me->GetInstanceScript();
            SetCombatMovement(false);
        }

        InstanceScript* instance;
        EventMap events;
        uint8 bloodCount;

        void Reset() override {}

        void EnterCombat(Unit* /*who*/) override
        {
            DoZoneInCombat();

            switch (me->GetEntry())
            {
            case NPC_DOMINATOR_TENTACLE:
                events.ScheduleEvent(1, 7000);
                events.ScheduleEvent(2, 13000);
                events.ScheduleEvent(3, 4000);
                break;
            case NPC_DEATHGLARE_TENTACLE:
            case NPC_SHRIVELED_EYESTALK:
                events.ScheduleEvent(4, 2000);
                break;
            case NPC_CORRUPTOR_TENTACLE:
                events.ScheduleEvent(5, 2000);
                break;
            }
        }

        void JustDied(Unit* /*killer*/) override
        {
            if (me->GetEntry() == NPC_SHRIVELED_EYESTALK)
                return;

            if (me->GetEntry() == NPC_CORRUPTOR_TENTACLE)
                bloodCount = 1;
            else
                bloodCount = 2;

            if (Unit* summoner = me->GetOwner())
                for (uint8 i = 0; i < bloodCount; i++)
                    me->CastSpell(me, SPELL_SPAWN_BLOOD, true, nullptr, nullptr, summoner->GetGUID());

            if (me->GetEntry() == NPC_DOMINATOR_TENTACLE)
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
        }

        void DoAction(int32 const action) override
        {
            if (me->GetEntry() == NPC_DOMINATOR_TENTACLE)
                instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
        }

        void IsSummonedBy(Unit* summoner) override
        {
            if (me->GetEntry() != NPC_DOMINATOR_TENTACLE)
                DoZoneInCombat();
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING) || me->HasAura(SPELL_NIGHTMARISH_FURY))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case 1:
                    DoCast(SPELL_NIGHTMARISH_FURY);
                    events.ScheduleEvent(1, 11000);
                    break;
                case 2:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f, true))
                    {
                        DoCast(target, SPELL_GROUND_SLAM_DMG);
                        float dist = 0.0f;
                        float angle = me->GetRelativeAngle(target);
                        for (uint16 i = 0; i < 73; ++i)
                        {
                            Position groundPos;
                            me->GetClosePoint(groundPos.m_positionX, groundPos.m_positionY, groundPos.m_positionZ, 1.0f, dist, angle + frand(-0.12f, 0.12f));
                            dist += 0.54f;
                            AddTimedDelayedOperation(50 * i, [this, groundPos]() -> void
                            {
                                if (me && me->IsAlive() && me->IsInCombat())
                                    me->CastSpell(groundPos, SPELL_GROUND_SLAM_VISUAL, true);
                            });
                        }
                    }
                    events.ScheduleEvent(2, 22000);
                    break;
                case 3:
                    if (Unit* target = SelectTarget(SELECT_TARGET_MINDISTANCE, 0, 100.0f, true))
                        if (!me->IsWithinMeleeRange(target))
                            DoCast(SPELL_RUPTURING_ROAR);
                    events.ScheduleEvent(3, 3000);
                    break;
                case 4:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 120.0f, true))
                        DoCast(target, SPELL_MIND_FLAY);
                    events.ScheduleEvent(4, urand(9, 12) * IN_MILLISECONDS);
                    break;
                case 5:
                    DoCast(me, SPELL_SPEW_CORRUPTION, true);
                    events.ScheduleEvent(5, 10000);
                    break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_ilgynoth_tentaclesAI(creature);
    }
};

//105591
class npc_ilgynoth_nightmare_horror : public CreatureScript
{
public:
    npc_ilgynoth_nightmare_horror() : CreatureScript("npc_ilgynoth_nightmare_horror") {}

    struct npc_ilgynoth_nightmare_horrorAI : public ScriptedAI
    {
        npc_ilgynoth_nightmare_horrorAI(Creature* creature) : ScriptedAI(creature)
        {
            me->SetReactState(REACT_PASSIVE);
            instance = me->GetInstanceScript();
        }

        InstanceScript* instance;
        EventMap events;
        uint8 power;
        uint16 tickPower_Timer;

        void Reset() override
        {
            me->SetPowerType(POWER_ENERGY);
            me->SetMaxPower(POWER_ENERGY, 100);
            me->SetPower(POWER_ENERGY, 0);
            tickPower_Timer = 1000;
        }

        void IsSummonedBy(Unit* summoner) override
        {
            DoZoneInCombat(me, 120.0f);
            events.ScheduleEvent(1, 5000);
        }

        void JustDied(Unit* /*killer*/) override
        {
            if (instance)
                instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);

            if (Unit* summoner = me->GetOwner())
                for (uint8 i = 0; i < 4; i++)
                    me->CastSpell(me, SPELL_SPAWN_BLOOD, true, nullptr, nullptr, summoner->GetGUID());
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim() && me->IsInCombat())
                return;

            if (tickPower_Timer <= diff)
            {
                tickPower_Timer = 500;
                if (me->GetReactState() == REACT_AGGRESSIVE)
                {
                    power = me->GetPower(POWER_ENERGY);
                    if (power < 100)
                        me->SetPower(POWER_ENERGY, power + 5);
                    else
                        DoCast(SPELL_EYE_OF_FATE);
                }
            }
            else
                tickPower_Timer -= diff;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case 1:
                    me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_ATTACKABLE_1));
                    me->SetReactState(REACT_AGGRESSIVE);
                    if (instance)
                        instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
                    break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_ilgynoth_nightmare_horrorAI(creature);
    }
};

//105721
class npc_ilgynoth_nightmare_ichor : public CreatureScript
{
public:
    npc_ilgynoth_nightmare_ichor() : CreatureScript("npc_ilgynoth_nightmare_ichor") {}

    struct npc_ilgynoth_nightmare_ichorAI : public ScriptedAI
    {
        npc_ilgynoth_nightmare_ichorAI(Creature* creature) : ScriptedAI(creature)
        {
            me->SetReactState(REACT_PASSIVE);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SAPPED, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISTRACT, true);
            me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_CONFUSE, true);
            me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
        }

        EventMap events;
        bool explosion;

        void Reset() override {}

        void IsSummonedBy(Unit* summoner) override
        {
            explosion = false;
            DoZoneInCombat(me, 120.0f);
            events.ScheduleEvent(1, 1000);
            events.ScheduleEvent(3, 2000);
        }

        void SpellHitTarget(Unit* target, const SpellInfo* spell) override
        {
            if (spell->Id == SPELL_FIXATE)
            {
                me->AttackStop();
                ResetThreatList();
                AddThreat(target, 100000.0f);
                AttackStart(target);
            }
        }

        void DamageTaken(Unit* /*attacker*/, uint32& damage) override
        {
            if (damage >= me->GetHealth())
            {
                damage = 0;
                if (!explosion)
                {
                    explosion = true;
                    events.Reset();
                    me->InterruptNonMeleeSpells(false);
                    me->AttackStop();
                    me->StopMoving();
                    DoCast(SPELL_NIGHTMARE_EXPLOSION);
                    events.ScheduleEvent(2, 3000);
                }
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case 1:
                        if (!me->GetVictim() || !me->GetVictim()->HasAura(SPELL_FIXATE, me->GetGUID()))
                        {
                            DoCast(me, SPELL_FIXATE, true);
                            me->ClearUnitState(UNIT_STATE_CASTING);
                        }
                        events.ScheduleEvent(1, 2000);
                        break;
                    case 2:
                        DoCast(me, SPELL_NIGHTMARE_EXPLOSION_PCT, true);
                        me->Kill(me);
                        break;
                    case 3:
                        if (Unit* summoner = me->GetOwner())
                            if (me->GetDistance(summoner) <= 20.0f)
                            {
                                explosion = true;
                                me->AttackStop();
                                me->DespawnOrUnsummon(1000);
                                DoCast(me, SPELL_REABSORPTION, true);
                                me->AddUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_ATTACKABLE_1));
                                break;
                            }
                        events.ScheduleEvent(3, 2000);
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_ilgynoth_nightmare_ichorAI(creature);
    }
};

//218415
class spell_ilgynoth_death_blossom : public SpellScriptLoader
{
public:
    spell_ilgynoth_death_blossom() : SpellScriptLoader("spell_ilgynoth_death_blossom") {}

    class spell_ilgynoth_death_blossom_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_ilgynoth_death_blossom_SpellScript);

        void HandleOnHit()
        {
            if (GetCaster() && GetHitUnit())
            {
                if (GetHitUnit()->HasAura(SPELL_DEATH_BLOSSOM_VISUAL))
                {
                    GetHitUnit()->CastSpell(GetHitUnit(), SPELL_DISPERSED_SPORES);
                    GetHitUnit()->RemoveAurasDueToSpell(SPELL_DEATH_BLOSSOM_VISUAL);
                }
                else
                    GetHitUnit()->CastSpell(GetHitUnit(), SPELL_DEATH_BLOSSOM_DMG);
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_ilgynoth_death_blossom_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_ilgynoth_death_blossom_SpellScript();
    }
};

//215128
class spell_ilgynoth_cursed_blood : public SpellScriptLoader
{
public:
    spell_ilgynoth_cursed_blood() : SpellScriptLoader("spell_ilgynoth_cursed_blood") { }

    class spell_ilgynoth_cursed_blood_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_ilgynoth_cursed_blood_AuraScript);

        void OnRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
        {
            if (!GetCaster() || !GetTarget() || GetTargetApplication()->GetRemoveMode() != AURA_REMOVE_BY_EXPIRE)
                return;

            GetTarget()->CastSpell(GetTarget(), SPELL_CURSED_BLOOD_EXPLOSION, true);
        }

        void Register() override
        {
            OnEffectRemove += AuraEffectRemoveFn(spell_ilgynoth_cursed_blood_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_ilgynoth_cursed_blood_AuraScript();
    }
};

//209471 - HACK!!!
class spell_ilgynoth_nightmare_explosion : public SpellScriptLoader
{
public:
    spell_ilgynoth_nightmare_explosion() : SpellScriptLoader("spell_ilgynoth_nightmare_explosion") { }

    class spell_ilgynoth_nightmare_explosion_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_ilgynoth_nightmare_explosion_SpellScript);

        void FilterTargets(std::list<WorldObject*>& targets)
        {
            if (GetCaster() && GetCaster()->GetMap()->GetDifficultyID() != DIFFICULTY_MYTHIC_RAID)
                targets.clear();
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_ilgynoth_nightmare_explosion_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENEMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_ilgynoth_nightmare_explosion_SpellScript();
    }
};

//210048
class spell_ilgynoth_nightmare_explosion_pct : public SpellScriptLoader
{
public:
    spell_ilgynoth_nightmare_explosion_pct() : SpellScriptLoader("spell_ilgynoth_nightmare_explosion_pct") { }

    class spell_ilgynoth_nightmare_explosion_pct_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_ilgynoth_nightmare_explosion_pct_SpellScript);

        uint8 dmgPct;

        void HandleDamage(SpellEffIndex effIndex)
        {
            if (GetHitUnit())
            {
                switch (GetHitUnit()->GetMap()->GetDifficultyID())
                {
                case DIFFICULTY_LFR:
                    dmgPct = 7;
                    break;
                case DIFFICULTY_MYTHIC_RAID:
                    dmgPct = 4;
                    break;
                default:
                    dmgPct = 5;
                    break;
                }
                SetHitDamage(GetHitUnit()->CountPctFromMaxHealth(dmgPct));
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_ilgynoth_nightmare_explosion_pct_SpellScript::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_ilgynoth_nightmare_explosion_pct_SpellScript();
    }
};

void AddSC_ilgynoth()
{
    new boss_ilgynoth();
    new npc_eye_of_ilgynoth();
    new npc_ilgynoth_tentacles();
    new npc_ilgynoth_nightmare_horror();
    new npc_ilgynoth_nightmare_ichor();
    new spell_ilgynoth_death_blossom();
    new spell_ilgynoth_cursed_blood();
    new spell_ilgynoth_nightmare_explosion();
    new spell_ilgynoth_nightmare_explosion_pct();
}
