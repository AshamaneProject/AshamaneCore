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
#include "ScriptedCreature.h"
#include "ScriptMgr.h"
#include "SpellAuras.h"
#include "SpellScript.h"
#include "emerald_nightmare.h"

enum Spells
{
    SPELL_WEB_OF_PAIN = 215288,
    SPELL_NECROTIC_VENOM = 218831,//215443,
    SPELL_VILE_AMBUSH = 214348,

    //phase
    SPELL_FEEDING_TIME = 212364,
    SPELL_TWISTING_SHADOWS = 210864,
    SPELL_DARK_STORM = 210948,
    SPELL_SHIMMERING_FEATHER = 212993,
    SPELL_BERSERK = 26662,
    SPELL_RAZOR_WING = 210547,

    SPELL_GATHERING_CLOUDS = 212707,
    //SPELL_RAKING_TALONS = 215582, //start 52s every  32s
    SPELL_VIOLENT_WINDS = 218124,
    //SPELL_VIOLENT_WINDS = 218144,
    SPELL_WIND_BURN = 218519,
    SPELL_RAKING_TALONS = 222037,
    SPELL_ARACHNID_FORM = 210326,
    SPELL_DARKWING_FORM = 210308,
    SPELL_NIGHTMARE_SPAWN = 218630,//hero
};

//PHASE_1 Spider Form
//PHASE_2Roc Form

struct boss_elerethe_renferal : public BossAI
{
    boss_elerethe_renferal(Creature* creature) : BossAI(creature, DATA_ELERETHE_RENFERAL) { Initialize(); }

    void Initialize()
    {
        //SetDungeonEncounterID(1876);
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        Talk(2);
    }

    void ScheduleTasks() override
    {
        Talk(0);
        me->RemoveAurasDueToSpell(226017);
        events.ScheduleEvent(PHASE_01, 1s);
        events.ScheduleEvent(SPELL_BERSERK, 510s);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
        case PHASE_01:
        {
            PhaseStatus = PHASE_01;
            events.Reset();
            events.ScheduleEvent(SPELL_ARACHNID_FORM, 4s);
            events.ScheduleEvent(SPELL_WEB_OF_PAIN, 5s);
            events.ScheduleEvent(SPELL_NECROTIC_VENOM, 12s);
            events.ScheduleEvent(SPELL_VILE_AMBUSH, 50s);
            events.ScheduleEvent(PHASE_02, 90s);
            events.ScheduleEvent(SPELL_FEEDING_TIME, 15s);
            events.ScheduleEvent(SPELL_SHIMMERING_FEATHER, 50s);
            break;
        }
        case PHASE_02:
        {
            PhaseStatus = PHASE_02;
            events.Reset();
            events.ScheduleEvent(SPELL_DARKWING_FORM, 4s);
            events.ScheduleEvent(SPELL_GATHERING_CLOUDS, 15s);
            events.ScheduleEvent(SPELL_DARK_STORM, 26s);
            events.ScheduleEvent(SPELL_TWISTING_SHADOWS, 40s);
            events.ScheduleEvent(SPELL_RAZOR_WING, 60s);
            if (IsMythic())
                events.ScheduleEvent(SPELL_VIOLENT_WINDS, 50s);
            events.ScheduleEvent(SPELL_SHIMMERING_FEATHER, 50s);
            events.ScheduleEvent(SPELL_RAKING_TALONS, 20s);
            events.ScheduleEvent(SPELL_NIGHTMARE_SPAWN, 30s);

            events.ScheduleEvent(PHASE_01, 120s);
            break;
        }
        case SPELL_ARACHNID_FORM:
        {
            me->RemoveAurasDueToSpell(SPELL_DARKWING_FORM);
            DoCast(SPELL_ARACHNID_FORM);
            break;
        }
        case SPELL_DARKWING_FORM:
        {
            me->RemoveAurasDueToSpell(SPELL_ARACHNID_FORM);
            DoCast(SPELL_DARKWING_FORM);
            break;
        }
        case SPELL_FEEDING_TIME:
        {
            DoCast(SPELL_FEEDING_TIME);
            events.Repeat(50s);
            break;
        }
        case SPELL_SHIMMERING_FEATHER:
        {
            instance->DoCastSpellOnPlayers(SPELL_SHIMMERING_FEATHER);
            events.Repeat(50s);
            break;
        }
        case SPELL_BERSERK:
        {
            DoCast(SPELL_BERSERK);
            events.Repeat(5s);
            break;
        }
        case SPELL_RAZOR_WING:
        {
            DoCast(SPELL_RAZOR_WING);
            events.Repeat(32s);
            break;
        }
        case SPELL_TWISTING_SHADOWS:
        {
            DoCast(SPELL_TWISTING_SHADOWS);
            events.Repeat(22s);
            break;
        }
        case SPELL_DARK_STORM:
        {
            DoCast(SPELL_DARK_STORM);
            events.Repeat(26s);
            break;
        }
        case SPELL_GATHERING_CLOUDS:
        {
            DoCast(SPELL_GATHERING_CLOUDS);
            events.Repeat(15s);
            break;
        }
        case SPELL_VILE_AMBUSH:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
                me->CastSpell(target1, SPELL_VILE_AMBUSH);
            events.Repeat(50s);
            break;
        }
        case SPELL_NIGHTMARE_SPAWN:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
                me->CastSpell(target1, SPELL_NIGHTMARE_SPAWN);
            events.Repeat(20s);
            break;
        }
        case SPELL_WEB_OF_PAIN:
        {
            DoCast(SPELL_WEB_OF_PAIN);
            events.Repeat(90s);
            break;
        }
        case SPELL_NECROTIC_VENOM:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me)))
            {
                me->CastSpell(target1, SPELL_NECROTIC_VENOM);
                me->CastSpell(target1, 223065);
            }

            if (Unit* target2 = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me)))
            {
                me->CastSpell(target2, SPELL_NECROTIC_VENOM);
                me->CastSpell(target2, 223065);
            }

            events.Repeat(22s);
            break;
        }
        case SPELL_RAKING_TALONS:
        {
            DoCast(SPELL_RAKING_TALONS);
            events.Repeat(20s);
            break;
        }
        case SPELL_VIOLENT_WINDS:
        {
            DoCast(SPELL_VIOLENT_WINDS);
            events.Repeat(15s);
            break;
        }
        case SPELL_WIND_BURN:
        {
            DoCast(SPELL_WIND_BURN);
            events.Repeat(5s);
            break;
        }
        default:
            break;
        }
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->IsPlayer() && me->IsWithinDist(who, 55.0f, false) && !IsLock)
        {
            IsLock = true;
            me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC));
        }
    }
    uint8 PhaseStatus;
};

void AddSC_elerethe_renferal()
{
    RegisterCreatureAI(boss_elerethe_renferal);
}
