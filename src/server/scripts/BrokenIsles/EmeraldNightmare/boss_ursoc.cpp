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


enum Spells
{
    SPELL_FOCUSED_GAZE = 198006,
    SPELL_OVERWHELM = 197943,
    //
    SPELL_TRAMPLING_SLAM = 199237,
    SPELL_BARRELING_IMPACT = 198109,
    SPELL_MOMENTUM = 198108,    //198099
    SPELL_ECHOING_DISCHORD = 198392,
    SPELL_ROARING_CACOPHONY = 197969,
    SPELL_REND_FLESH = 197942,
    SPELL_BLOOD_FRENZY = 198388, //on hp 30%

    NPC_NIGHTMARE_IMAGE = 100576,
    SPELL_NIGHTMARISH_CACOPHONY = 197980,
    SPELL_MIASMA = 205611,
};


struct boss_ursoc : public BossAI
{
    boss_ursoc(Creature* creature) : BossAI(creature, DATA_URSOC)
    {
        targetGUID = ObjectGuid::Empty;
        hp30 = false;
        //SetDungeonEncounterID(1841);
    }

    void Reset() override
    {
        _Reset();
        targetGUID = ObjectGuid::Empty;
        hp30 = false;
    }

    void EnterCombat(Unit* /*attacker*/) override
    {
        _EnterCombat();
        Talk(0);
        events.ScheduleEvent(SPELL_FOCUSED_GAZE, 40s);
        events.ScheduleEvent(SPELL_OVERWHELM, 10s);
        events.ScheduleEvent(SPELL_REND_FLESH, 20s);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        if (!hp30 && HealthBelowPct(30))
        {
            Talk(3);
            DoCastSelf(SPELL_BLOOD_FRENZY);
            hp30 = true;
        }

        switch (eventId)
        {
        case SPELL_FOCUSED_GAZE:
        {
            Talk(1);
            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me)))
            {
                targetGUID = target->GetGUID();
                DoCast(target, SPELL_FOCUSED_GAZE);
            }
            events.ScheduleEvent(SPELL_TRAMPLING_SLAM, 6s);
            events.Repeat(40s);
            break;
        }
        case SPELL_TRAMPLING_SLAM:
        {
            if (Unit* target = ObjectAccessor::GetUnit(*me, targetGUID))
            {
                DoCast(target, SPELL_TRAMPLING_SLAM);
                DoCast(target, SPELL_BARRELING_IMPACT);
                DoCast(target, SPELL_MOMENTUM);

                DoCast(target, SPELL_ROARING_CACOPHONY);
                if(IsHeroic()|| IsMythic())
                    me->SummonCreature(NPC_NIGHTMARE_IMAGE, me->GetPosition(), TEMPSUMMON_MANUAL_DESPAWN, 7200000);
                DoCast(target, SPELL_ECHOING_DISCHORD);
                targetGUID = ObjectGuid::Empty;
            }
            break;
        }
        case SPELL_OVERWHELM:
        {
            DoCast(SPELL_OVERWHELM);
            events.Repeat(10s);
            break;
        }
        case SPELL_REND_FLESH:
        {
            DoCast(SPELL_REND_FLESH);
            events.Repeat(20s);
            break;
        }
        default:
            break;
        }
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        me->RemoveAllAreaTriggers();
        Talk(5);
        instance->DoAddItemByClassOnPlayers(CLASS_HUNTER, 139557, 1);
    }
    bool hp30;
    ObjectGuid targetGUID;
};

void AddSC_ursoc()
{
    RegisterCreatureAI(boss_ursoc);
}
