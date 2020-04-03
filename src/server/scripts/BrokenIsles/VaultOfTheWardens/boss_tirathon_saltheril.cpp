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
#include "vault_of_the_wardens.h"

enum Spells
{
    SPELL_DARKSTRIKES = 191941,
    SPELL_SWOOP = 191765,
    SPELL_FURIOUS_BLAST = 191823,
    SPELL_FEL_MORTAR = 202913,
    SPELL_METAMORPHOSIS = 196787,
    SPELL_UNLEASH_FURY = 196799,
    SPELL_DEAFENING_SCREECH = 191735,
    SPELL_IMMOLATION_AURA = 192502,
    SPELL_THROW_GLAIVE = 192014,
    SPELL_HATRED = 190836,
};

enum Events
{
    // Intro
    EVENT_INTRO = 1,
    EVENT_DIE_INTRO = 2,
};

enum Phases
{
    PHASE_NORMAL,
    PHASE_INTRO
};

struct boss_tirathon_saltheril : public BossAI
{
    boss_tirathon_saltheril(Creature* creature) : BossAI(creature, DATA_TIRATHON) { Initialize(); }

    void Initialize()
    {
        PhaseStatus = Phases::PHASE_INTRO;
        hp50 = false;
        hp25 = false;
    }

    void Reset() override
    {
        _Reset();
        hp50 = false;
        hp25 = false;
        me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC));
    }

    void DoAction(int32 param)
    {
        switch (param)
        {
        case EVENT_INTRO:
            //me->Yell(100592);///I wonder what this pool will reveal about you, Drelanim.
            instance->DoPlayConversation(559);
            if (Creature* drelanim = me->FindNearestCreature(NPC_DRELANIM_WHISPERWIND, 100.0f, true))
            {
                drelanim->AI()->DoAction(1);
                instance->DoDelayedConversation(6000, 866);
                instance->DoDelayedConversation(14000, 867);
                instance->DoDelayedConversation(20000, 868);
                instance->DoDelayedConversation(28000, 869);
                instance->DoDelayedConversation(33000, 870);
                instance->DoDelayedConversation(36000, 871);
                instance->DoDelayedConversation(44000, 872);
                instance->DoDelayedConversation(50000, 873);

                me->GetScheduler().Schedule(Milliseconds(52000), [this](TaskContext context)
                {
                    GetContextCreature()->GetMotionMaster()->MoveJump(Position(4284.973f, -451.2752f, 259.6006f), 20.0f, 7.0f);
                    GetContextCreature()->SetHomePosition(Position(4284.973f, -451.2752f, 259.6006f));
                    GetContextCreature()->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC));
                });

                drelanim->GetScheduler().Schedule(Milliseconds(54000), [](TaskContext context)
                {
                    GetContextCreature()->GetMotionMaster()->MovePoint(1, Position(4242.61f, -428.42f, 259.354f, 5.921902f), true);
                });

                drelanim->GetScheduler().Schedule(Milliseconds(56000), [](TaskContext context)
                {
                    GetContextCreature()->SetOrientation(5.921902f);
                });

            }
            break;
        case EVENT_DIE_INTRO:
        {
            if (Creature* drelanim = me->FindNearestCreature(NPC_DRELANIM_WHISPERWIND, 100.0f, true))
                drelanim->AI()->DoAction(2);
            break;
        }
        }
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        instance->SendBossKillCredit(1815);
        DoAction(EVENT_DIE_INTRO);
    }

    void ScheduleTasks() override
    {
        events.ScheduleEvent(SPELL_DARKSTRIKES, 5000);
        events.ScheduleEvent(SPELL_SWOOP, 5000);
        events.ScheduleEvent(SPELL_FEL_MORTAR, 5000);
        events.ScheduleEvent(SPELL_DEAFENING_SCREECH, 10000);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        if (!hp50 && HealthBelowPct(50))
        {
            hp50 = true;
            DoCastSelf(SPELL_METAMORPHOSIS);
            DoCastSelf(SPELL_IMMOLATION_AURA);
            events.ScheduleEvent(SPELL_THROW_GLAIVE, 5000);
            events.ScheduleEvent(SPELL_HATRED, 10000);
        }

        if (!hp25 && HealthBelowPct(25))
        {
            hp25 = true;
            events.ScheduleEvent(SPELL_UNLEASH_FURY, 1000);
        }

        switch (eventId)
        {
        case SPELL_THROW_GLAIVE:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
                me->CastSpell(target1, SPELL_THROW_GLAIVE, false);
            events.Repeat(10s);
            break;
        }
        case SPELL_HATRED:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
                me->CastSpell(target1, SPELL_HATRED, false);
            events.Repeat(20s);
            break;
        }
        case SPELL_UNLEASH_FURY:
        {
            DoCastAOE(SPELL_UNLEASH_FURY);
            break;
        }
        case SPELL_DARKSTRIKES:
        {
            DoCast(SPELL_DARKSTRIKES);
            events.Repeat(10s);
            break;
        }
        case SPELL_SWOOP:
        {
            Talk(0);
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
            {
                me->CastSpell(target1, SPELL_SWOOP, false);
                me->GetMotionMaster()->MoveJump(target1->GetPosition(), 20.0f, 7.0f);
            }
            events.ScheduleEvent(SPELL_FURIOUS_BLAST, 1000);
            events.Repeat(10s);
            break;
        }
        case SPELL_FURIOUS_BLAST:
        {
            me->Yell(97642);
            DoCast(SPELL_FURIOUS_BLAST);
            break;
        }
        case SPELL_FEL_MORTAR:
        {
            DoCast(SPELL_FEL_MORTAR);
            events.Repeat(10s);
            break;
        }
        case SPELL_DEAFENING_SCREECH:
        {
            DoCast(SPELL_FEL_MORTAR);
            events.Repeat(10s);
            break;
        }
        default:
            break;
        }
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->IsPlayer() && me->IsWithinDist(who, 500.0f, true) && PhaseStatus == Phases::PHASE_INTRO)
        {
            PhaseStatus = Phases::PHASE_NORMAL;
            DoAction(EVENT_INTRO);
        }
    }
    uint8 PhaseStatus;
    bool hp50;
    bool hp25;
};

struct npc_drelanim_whisperwind_99013 : public ScriptedAI
{
    npc_drelanim_whisperwind_99013(Creature* creature) : ScriptedAI(creature) { Initialize(); }

    void DoAction(int32 param)
    {
        switch (param)
        {
        case 1:


            break;
        case 2:
            me->GetScheduler().Schedule(Milliseconds(2000), [this](TaskContext context)
            {
                Talk(0);
                me->GetMotionMaster()->MoveTargetedHome();
            });
            me->GetScheduler().Schedule(Milliseconds(6000), [this](TaskContext context)
            {
                Talk(1);
            });
            break;
        }
    }

    void Initialize()
    {
        instance = me->GetInstanceScript();
    }

private:
    InstanceScript * instance;
};

void AddSC_boss_tirathon_saltheril()
{
    RegisterCreatureAI(boss_tirathon_saltheril);
    RegisterCreatureAI(npc_drelanim_whisperwind_99013);
}
