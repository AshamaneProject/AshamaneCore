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
    SPELL_BRITTLE = 192517,

    SPELL_FISSURE = 192522,
    SPELL_LAVA_WREATH = 192631,
    SPELL_PYROCLAST = 192621,
    SPELL_SMOLDERING = 193209,
};

enum Events
{
    // Intro
    EVENT_INTRO = 1,
};

struct boss_ashgolm : public BossAI
{
    boss_ashgolm(Creature* creature) : BossAI(creature, DATA_ASHGOLM) { }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        //me->Yell(97650);
    }

    void ScheduleTasks() override
    {
        //me->Yell(97634);

        events.ScheduleEvent(SPELL_FISSURE, 5000);
        events.ScheduleEvent(SPELL_LAVA_WREATH, 5000);
        events.ScheduleEvent(SPELL_PYROCLAST, 5000);

        if (IsHeroic() || IsMythic() || IsChallengeMode())
            events.ScheduleEvent(SPELL_SMOLDERING, 120000);

    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
        case SPELL_FISSURE:
        {
            DoCast(SPELL_FISSURE);
            events.Repeat(10s);
            break;
        }
        case SPELL_LAVA_WREATH:
        {
            DoCast(SPELL_LAVA_WREATH);
            events.Repeat(10s);
            break;
        }
        case SPELL_PYROCLAST:
        {
            DoCast(SPELL_PYROCLAST);
            events.Repeat(10s);
            break;
        }
        case SPELL_SMOLDERING:
        {
            DoCast(SPELL_SMOLDERING);
            events.Repeat(10s);
            break;
        }
        default:
            break;
        }
    }
};

void AddSC_boss_ashgolm()
{
    RegisterCreatureAI(boss_ashgolm);
}
