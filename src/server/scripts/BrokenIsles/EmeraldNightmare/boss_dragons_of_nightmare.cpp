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
#include "AreaTrigger.h"
#include "AreaTriggerAI.h"
#include "ScriptMgr.h"
#include "emerald_nightmare.h"

enum Spells
{
    SPELL_BERSERK = 26662,
    SPELL_CORRUPTED_BREATH = 203028,//all 腐化吐息 33s
    SPELL_TAIL_LASH = 204122,//mythic
    SPELL_NIGHTMARE_BLAST = 203153,//16s
    //SUMMON
    NPC_NIGHTMARE_BLOOM = 102804,
    SPELL_NIGHTMARE_BLOOM = 207681, //3s todo
    //SUMMON
    NPC_DREAD_HORROR = 103044,
    SPELL_WASTING_DREAD = 204731,//3s    after 20s unsummon

    SPELL_MARK_OF_YSONDRE = 203102,

    SPELL_CALL_DEFILED_SPIRIT = 207573,//34s
    //
    NPC_DEFILED_DRUID_SPIRIT = 103080,
    SPELL_DEFILED_VINES = 203770,//8s  被亵渎的藤蔓
    SPELL_DEFILED_ERUPTION = 203771,// 亵渎喷发


    SPELL_DEVOUR_NIGHTMARE = 214490,

    //EMERISS
    SPELL_MARK_OF_EMERISS = 203125,
    SPELL_VOLATILE_INFECTION = 203787,
    //SPELL_VOLATILE_INFECTION = 223699,//45s //When Emeriss reaches 100 Energy, approximately every 45 seconds, she will cast  快速传染 on two random non-tank players.
    SPELL_ESSENCE_OF_CORRUPTION = 205298,//summon 30s
    //SUMMON
    NPC_ESSENCE_OF_CORRUPTION = 103691,
    SPELL_CORRUPTION = 205300,//15s

    //Lethon
    SPELL_MARK_OF_LETHON = 203124,
    SPELL_LETHON = 102682,
    SPELL_SHADOW_BURST = 204040,// on fly
    SPELL_SIPHON_SPIRIT = 203888,// mythic //When Lethon reaches 100 Energy, approximately every 50 seconds, he will cast  虹吸灵魂.
    //summon
    NPC_SPIRIT_SHADE = 103100,
    SPELL_DARK_OFFERING = 203897,

    //Taerar
    SPELL_MARK_OF_TAERAR = 203121,
    SPELL_BELLOWING_ROAR = 204078,
    //While Taerar is active, he will spawn two clouds of  渗漏之雾 approximately every 15 seconds.
    NPC_SEEPING_FOG = 103697,
    SPELL_SEEPING_FOG = 205341,

    SPELL_SHADES_OF_TAERAR = 204100,
    //When Taerar reaches 100 Energy, approximately every 50 seconds, he will summon  泰拉尔之影
    //SUMMON
    NPC_SHADE_OF_TAERAR = 103145,
    //SPELL_CORRUPTED_BREATH = 203028,// 腐化吐息 18s
    /*        */
};

enum Events
{
    // Intro
    EVENT_INTRO = 1,
};
enum Phases
{
    PHASE_NORMAL,
    PHASE_INTRO
};

///.go creature id 102679
struct boss_dragons_of_nightmare : public BossAI
{
    boss_dragons_of_nightmare(Creature* creature) : BossAI(creature, DATA_DRAGONS_OF_NIGHTMARE) { Initialize(); }

    void Initialize()
    {
        PhaseStatus = Phases::PHASE_INTRO;
        //SetDungeonEncounterID(1854);
    }

    void DamageTaken(Unit* done_by, uint32 &damage) override
    {
        _DamageTaken(done_by, damage);

        SubDragonDamageTaken(NPC_LETHON, damage);
        SubDragonDamageTaken(NPC_TAERAR, damage);
        SubDragonDamageTaken(NPC_EMERISS, damage);
    }

    void SubDragonDamageTaken(uint32 dragonid, uint32 &damage)
    {
        if (Creature* target = me->FindNearestCreature(dragonid, 500.0f))
        {
            uint64 ohealth = target->GetHealth() - damage;
            target->SetHealth(ohealth > 0 ? ohealth : 0);

            if (ohealth <= 0)
                target->setDeathState(JUST_DIED);
        }
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        Talk(2);
        instance->SetBossState(DATA_DRAGONS_OF_NIGHTMARE, DONE);
        if (Creature* target = me->FindNearestCreature(NPC_EMERISS, 500.0f))
            target->KillSelf();
        if (Creature* target = me->FindNearestCreature(NPC_LETHON, 500.0f))
            target->KillSelf();
        if (Creature* target = me->FindNearestCreature(NPC_TAERAR, 500.0f))
            target->KillSelf();
        instance->DoAddItemByClassOnPlayers(CLASS_MONK, 139562, 1);
        instance->DoPlayConversation(3609);
    }

    void ScheduleTasks() override
    {
        Talk(1);
        //events.ScheduleEvent(SPELL_BERSERK, 5s);
        events.ScheduleEvent(SPELL_CORRUPTED_BREATH, 33s);
        if(IsMythic())
            events.ScheduleEvent(SPELL_NIGHTMARE_BLAST, 40s);
        else
            events.ScheduleEvent(SPELL_NIGHTMARE_BLAST, 21s);
        events.ScheduleEvent(SPELL_MARK_OF_YSONDRE, 5s);
        events.ScheduleEvent(SPELL_CALL_DEFILED_SPIRIT, 30s);
        //events.ScheduleEvent(SPELL_DEVOUR_NIGHTMARE, 5s);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
        case SPELL_BERSERK:
        {
            DoCast(SPELL_BERSERK);
            break;
        }
        case SPELL_CORRUPTED_BREATH:
        {
            DoCast(SPELL_CORRUPTED_BREATH);
            events.Repeat(33s);
            break;
        }
        case SPELL_NIGHTMARE_BLAST:
        {
            DoCast(SPELL_NIGHTMARE_BLAST);
            events.Repeat(15s, 20s);
            break;
        }
        case SPELL_MARK_OF_YSONDRE:
        {
            DoCast(SPELL_MARK_OF_YSONDRE);
            events.Repeat(5s);
            break;
        }

        case SPELL_CALL_DEFILED_SPIRIT:
        {
            DoCast(SPELL_CALL_DEFILED_SPIRIT);
            events.Repeat(34s);
            break;
        }
        case SPELL_DEVOUR_NIGHTMARE:
        {
            DoCast(SPELL_DEVOUR_NIGHTMARE);
            events.Repeat(5s);
            break;
        }

        default:
            break;
        }
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->IsPlayer() && me->IsWithinDist(who, 25.0f, false) && !IsLock)
        {
            IsLock = true;
            Talk(0);
            me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC));
        }
        if (who->IsPlayer() && me->IsWithinDist(who, 25.0f, false))
            if (me->isInBackInMap(who, 25.0f) && IsMythic())
                DoCast(SPELL_TAIL_LASH);
    }

    void JustSummoned(Creature* summon) override
    {
        BossAI::JustSummoned(summon);
        switch (summon->GetEntry())
        {
        case NPC_NIGHTMARE_BLOOM:
        case NPC_DREAD_HORROR:
        case NPC_DEFILED_DRUID_SPIRIT:
        case NPC_ESSENCE_OF_CORRUPTION:
        case NPC_SPIRIT_SHADE:
        case NPC_SEEPING_FOG:
        case NPC_SHADE_OF_TAERAR:
        {
            summon->SetFaction(me->GetFaction());
            break;
        }
        }
    }
    uint8 PhaseStatus;
};

struct npc_taerar_102681 : public ScriptedAI
{
    npc_taerar_102681(Creature* creature) : ScriptedAI(creature) { }

    Creature* GetOtherBoss()
    {
        return  me->FindNearestCreature(NPC_YSONDRE, 500.0f);
    }

    void DamageTaken(Unit* /*done_by*/, uint32 &damage) override
    {
        Unit* pOtherBoss = GetOtherBoss();
        if (pOtherBoss)
        {
            uint64 ohealth = pOtherBoss->GetHealth() - damage;
            pOtherBoss->SetHealth(ohealth > 0 ? ohealth : 0);

            if (ohealth <= 0)
            {
                pOtherBoss->setDeathState(JUST_DIED);
                pOtherBoss->SetDynamicFlags(UNIT_DYNFLAG_LOOTABLE);
            }
        }
    }

    void JustSummoned(Creature* summon) override
    {
        switch (summon->GetEntry())
        {
        case NPC_SHADE_OF_TAERAR:
        {
            summon->SetFaction(me->GetFaction());
            break;
        }
        }
    }

    void EnterEvadeMode(EvadeReason why)
    {
        std::list<Creature*> list;
        me->GetCreatureListWithEntryInGrid(list, NPC_SHADE_OF_TAERAR, 500.0f);

        if (!list.empty())
            for (Creature* target : list)
                target->DespawnOrUnsummon();
    }

    void EnterCombat(Unit* /*victim*/)
    {
        Talk(0);
        events.ScheduleEvent(SPELL_CORRUPTED_BREATH, 33s);
        events.ScheduleEvent(SPELL_MARK_OF_TAERAR, 5s);
        events.ScheduleEvent(SPELL_BELLOWING_ROAR, 15s);
        events.ScheduleEvent(SPELL_SHADES_OF_TAERAR, 50s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_CORRUPTED_BREATH:
            {
                DoCast(SPELL_CORRUPTED_BREATH);
                events.Repeat(33s);
                break;
            }
            case SPELL_MARK_OF_TAERAR:
            {
                DoCast(SPELL_MARK_OF_TAERAR);
                events.Repeat(5s);
                break;
            }
            case SPELL_BELLOWING_ROAR:
            {
                DoCast(SPELL_BELLOWING_ROAR);
                events.Repeat(15s);
                break;
            }
            case SPELL_SHADES_OF_TAERAR:
            {
                DoCast(SPELL_SHADES_OF_TAERAR);
                events.Repeat(50s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (me->isInBackInMap(who, 25.0f) && IsMythic())
            DoCast(SPELL_TAIL_LASH);
    }
};

struct npc_lethon_102682 : public ScriptedAI
{
    npc_lethon_102682(Creature* creature) : ScriptedAI(creature) { }

    Creature* GetOtherBoss()
    {
        return  me->FindNearestCreature(NPC_YSONDRE, 500.0f);
    }

    void DamageTaken(Unit* /*done_by*/, uint32 &damage) override
    {
        Unit* pOtherBoss = GetOtherBoss();
        if (pOtherBoss)
        {
            uint64 ohealth = pOtherBoss->GetHealth() - damage;
            pOtherBoss->SetHealth(ohealth > 0 ? ohealth : 0);

            if (ohealth <= 0)
            {
                pOtherBoss->setDeathState(JUST_DIED);
                pOtherBoss->SetDynamicFlags(UNIT_DYNFLAG_LOOTABLE);
            }
        }
    }

    void EnterCombat(Unit* /*victim*/)
    {
        Talk(0);
        events.ScheduleEvent(SPELL_CORRUPTED_BREATH, 33s);
        events.ScheduleEvent(SPELL_MARK_OF_LETHON, 5s);
        events.ScheduleEvent(SPELL_LETHON, 10s);
        events.ScheduleEvent(SPELL_SHADOW_BURST, 10s);
        events.ScheduleEvent(SPELL_SIPHON_SPIRIT, 30s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_CORRUPTED_BREATH:
            {
                DoCast(SPELL_CORRUPTED_BREATH);
                events.Repeat(33s);
                break;
            }
            case SPELL_MARK_OF_LETHON:
            {
                DoCast(SPELL_MARK_OF_LETHON);
                events.Repeat(5s);
                break;
            }
            case SPELL_LETHON:
            {
                DoCast(SPELL_LETHON);
                events.Repeat(10s);
                break;
            }
            case SPELL_SHADOW_BURST:
            {
                DoCast(SPELL_SHADOW_BURST);
                events.Repeat(10s);
                break;
            }
            case SPELL_SIPHON_SPIRIT:
            {
                DoCast(SPELL_SIPHON_SPIRIT);
                events.Repeat(50s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (me->isInBackInMap(who, 25.0f) && IsMythic())
            DoCast(SPELL_TAIL_LASH);
    }
};

struct npc_emeriss_102683 : public ScriptedAI
{
    npc_emeriss_102683(Creature* creature) : ScriptedAI(creature) { }

    Creature* GetOtherBoss()
    {
        return  me->FindNearestCreature(NPC_YSONDRE, 500.0f);
    }

    void DamageTaken(Unit* /*done_by*/, uint32 &damage) override
    {
        Unit* pOtherBoss = GetOtherBoss();
        if (pOtherBoss)
        {
            uint64 ohealth = pOtherBoss->GetHealth() - damage;
            pOtherBoss->SetHealth(ohealth > 0 ? ohealth : 0);

            if (ohealth <= 0)
            {
                pOtherBoss->setDeathState(JUST_DIED);
                pOtherBoss->SetDynamicFlags(UNIT_DYNFLAG_LOOTABLE);
            }
        }
    }

    void EnterCombat(Unit* /*victim*/)
    {
        events.ScheduleEvent(SPELL_CORRUPTED_BREATH, 33s);
        events.ScheduleEvent(SPELL_MARK_OF_EMERISS, 5s);
        events.ScheduleEvent(SPELL_VOLATILE_INFECTION, 20s);
        events.ScheduleEvent(SPELL_ESSENCE_OF_CORRUPTION, 30s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_CORRUPTED_BREATH:
            {
                DoCast(SPELL_CORRUPTED_BREATH);
                events.Repeat(33s);
                break;
            }
            case SPELL_MARK_OF_EMERISS:
            {
                DoCast(SPELL_MARK_OF_EMERISS);
                events.Repeat(5s);
                break;
            }
            case SPELL_ESSENCE_OF_CORRUPTION:
            {
                if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me)))
                    me->CastSpell(target1, SPELL_ESSENCE_OF_CORRUPTION);

                if (Unit* target2 = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me)))
                    me->CastSpell(target2, SPELL_ESSENCE_OF_CORRUPTION);

                events.Repeat(30s);
                break;
            }
            case SPELL_VOLATILE_INFECTION:
            {
                DoCast(SPELL_VOLATILE_INFECTION);
                events.Repeat(45s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (me->isInBackInMap(who, 25.0f) && IsMythic())
            DoCast(SPELL_TAIL_LASH);
    }
};

struct npc_nightmare_bloom_102804 : public ScriptedAI
{
    npc_nightmare_bloom_102804(Creature* creature) : ScriptedAI(creature) { }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;

        DoSpellAttackIfReady(SPELL_NIGHTMARE_BLOOM);
    }
};

struct npc_dread_horror_103044 : public ScriptedAI
{
    npc_dread_horror_103044(Creature* creature) : ScriptedAI(creature) { }

    void EnterCombat(Unit* /*victim*/)
    {
        events.ScheduleEvent(SPELL_WASTING_DREAD, 1s);
        events.ScheduleEvent(1, 20s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_WASTING_DREAD:
            {
                DoCast(SPELL_WASTING_DREAD);
                events.Repeat(5s);
                break;
            }
            case 1:
            {
                if (me->IsAlive())
                    me->DespawnOrUnsummon();
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_defiled_druid_spirit_103080 : public ScriptedAI
{
    npc_defiled_druid_spirit_103080(Creature* creature) : ScriptedAI(creature) { }

    void EnterCombat(Unit* /*victim*/)
    {
        events.ScheduleEvent(SPELL_DEFILED_VINES, 1s);
        events.ScheduleEvent(SPELL_DEFILED_ERUPTION, 5s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_DEFILED_VINES:
            {
                DoCast(SPELL_DEFILED_VINES);
                events.Repeat(8s);
                break;
            }
            case SPELL_DEFILED_ERUPTION:
            {
                DoCast(SPELL_DEFILED_ERUPTION);
                events.Repeat(10s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_essence_of_corruption_103691 : public ScriptedAI
{
    npc_essence_of_corruption_103691(Creature* creature) : ScriptedAI(creature) { }

    void EnterCombat(Unit* /*victim*/)
    {
        events.ScheduleEvent(SPELL_CORRUPTION, 5s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_CORRUPTION:
            {
                DoCast(SPELL_CORRUPTION);
                events.Repeat(15s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_spirit_shade_103100 : public ScriptedAI
{
    npc_spirit_shade_103100(Creature* creature) : ScriptedAI(creature) { }

    void EnterCombat(Unit* /*victim*/)
    {
        events.ScheduleEvent(SPELL_DARK_OFFERING, 5s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_DARK_OFFERING:
            {
                DoCast(SPELL_DARK_OFFERING);
                events.Repeat(10s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_shade_of_taerar_103145 : public ScriptedAI
{
    npc_shade_of_taerar_103145(Creature* creature) : ScriptedAI(creature) { }

    void EnterCombat(Unit* /*victim*/)
    {
        events.ScheduleEvent(SPELL_CORRUPTED_BREATH, 18s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_CORRUPTED_BREATH:
            {
                DoCast(SPELL_CORRUPTED_BREATH);
                events.Repeat(18s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_seeping_fog_103697 : public ScriptedAI
{
    npc_seeping_fog_103697(Creature* creature) : ScriptedAI(creature) { }

    void EnterCombat(Unit* /*victim*/)
    {
        events.ScheduleEvent(SPELL_SEEPING_FOG, 5s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_SEEPING_FOG:
            {
                DoCast(SPELL_SEEPING_FOG);
                events.Repeat(10s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }
};

void AddSC_boss_dragons_of_nightmare()
{
    RegisterCreatureAI(boss_dragons_of_nightmare);
    RegisterCreatureAI(npc_taerar_102681);
    RegisterCreatureAI(npc_lethon_102682);
    RegisterCreatureAI(npc_emeriss_102683);

    RegisterCreatureAI(npc_nightmare_bloom_102804);
    RegisterCreatureAI(npc_dread_horror_103044);
    RegisterCreatureAI(npc_defiled_druid_spirit_103080);
    RegisterCreatureAI(npc_essence_of_corruption_103691);
    RegisterCreatureAI(npc_spirit_shade_103100);
    RegisterCreatureAI(npc_shade_of_taerar_103145);
    RegisterCreatureAI(npc_seeping_fog_103697);
}
