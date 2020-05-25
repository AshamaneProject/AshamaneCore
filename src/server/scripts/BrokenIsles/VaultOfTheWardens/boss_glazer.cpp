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
    SPELL_PULSE = 214893,
    SPELL_LINGERING_GAZE = 194942,

    SPELL_FOCUSED = 194289,
    SPELL_RADIATION = 195032,
    //
    SPELL_BEAMED = 194333,
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
    PHASE_2
};

struct boss_glazer : public BossAI
{
    boss_glazer(Creature* creature) : BossAI(creature, DATA_GLAZER) { Initialize(); }

    void Initialize()
    {
        PhaseStatus = Phases::PHASE_NORMAL;
    }

    void Reset() override
    {
        _Reset();
        Initialize();
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        //me->Yell(97650);
       // DoAction(EVENT_DIE_INTRO);
    }

    void ScheduleTasks() override
    {
        //me->Yell(97634);

        events.ScheduleEvent(SPELL_PULSE, 5000);
        events.ScheduleEvent(SPELL_LINGERING_GAZE, 5000);

        events.ScheduleEvent(SPELL_FOCUSED, 30000);
        events.ScheduleEvent(SPELL_RADIATION, 1000);
        /*
        if (IsHeroic() || IsMythic() || IsChallengeMode())
        events.ScheduleEvent(SPELL_SUMMON_TORMENTING_ORB, 5000);
        */
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
        case SPELL_PULSE:
        {
            if (PhaseStatus == Phases::PHASE_NORMAL)
                DoCast(SPELL_PULSE);
            events.Repeat(10s);
            break;
        }
        case SPELL_LINGERING_GAZE:
        {
            if (PhaseStatus == Phases::PHASE_NORMAL)
                DoCast(SPELL_LINGERING_GAZE);
            events.Repeat(10s);
            break;
        }
        case SPELL_FOCUSED:
        {
            PhaseStatus = Phases::PHASE_2;
            DoCast(SPELL_FOCUSED);
            events.Repeat(50s);
            break;
        }
        case SPELL_RADIATION:
        {
            if(PhaseStatus == Phases::PHASE_2)
                DoCast(SPELL_RADIATION);
            events.Repeat(1s);
            break;
        }
        default:
            break;
        }
    }

    uint8 PhaseStatus;

};

void AddSC_boss_glazer()
{
    RegisterCreatureAI(boss_glazer);
}
