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
    SPELL_SAP_SOUL = 200905,
    SPELL_SAP_SOUL_AURA = 200904,//CHECK
    SPELL_TELEPORT = 200898,
    SPELL_SUMMON_TORMENTING_ORB = 212567,
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

struct boss_inquisitor_tormentorum : public BossAI
{
    boss_inquisitor_tormentorum(Creature* creature) : BossAI(creature, DATA_INQUISITOR) { Initialize(); }

    void Initialize()
    {
        PhaseStatus = Phases::PHASE_INTRO;
        hp70 = false;
        hp40 = false;
    }

    void Reset() override
    {
        _Reset();
        hp70 = false;
        hp40 = false;
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        //me->Yell(97650);
        instance->SendBossKillCredit(1850);
        DoAction(EVENT_DIE_INTRO);
    }

    void ScheduleTasks() override
    {
        //me->Yell(97634);
        events.ScheduleEvent(SPELL_SAP_SOUL, 10000);
        events.ScheduleEvent(SPELL_TELEPORT, 1000);
        //SPELL_SUMMON_TORMENTING_ORB
        if (IsHeroic() || IsMythic() || IsChallengeMode())
            events.ScheduleEvent(SPELL_SUMMON_TORMENTING_ORB, 5000);

    }

    void ExecuteEvent(uint32 eventId) override
    {

        if (!hp70 && HealthBelowPct(70))
        {
            hp70 = true;
            DoCastSelf(SPELL_TELEPORT);
            ///events.ScheduleEvent(SPELL_TELEPORT, 1000); summon
        }

        if (!hp40 && HealthBelowPct(40))
        {
            hp40 = true;
            DoCastSelf(SPELL_TELEPORT);
            ///events.ScheduleEvent(SPELL_TELEPORT, 1000); summon
        }

        switch (eventId)
        {
        case SPELL_SAP_SOUL:
        {
            DoCast(SPELL_SAP_SOUL);
            events.Repeat(10s, 20s);
            break;
        }
        case SPELL_SUMMON_TORMENTING_ORB:
        {
            DoCast(SPELL_SUMMON_TORMENTING_ORB);
            events.Repeat(10s, 20s);
            break;
        }
        default:
            break;
        }
    }

    uint8 PhaseStatus;
    bool hp70;
    bool hp40;
};

void AddSC_boss_inquisitor_tormentorum()
{
    RegisterCreatureAI(boss_inquisitor_tormentorum);
}
