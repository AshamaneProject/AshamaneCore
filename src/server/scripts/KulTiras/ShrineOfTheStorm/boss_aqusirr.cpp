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
#include "shrine_of_the_storm.h"

enum Aquasirr
{
    SPELL_SEA_BLAST             = 265001,
    SPELL_CHOKING_BRINE         = 264560,
    SPELL_SURGING_RUSH          = 264155,
    SPELL_UNDERTOW              = 264144,
    SPELL_GRASP_FROM_THE_DEPTHS = 264526,

    SPELL_ERUPTING_WATER        = 264903,
    SPELL_DIMINISH              = 264899,

    NPC_AQUALING                = 134828,

    PHASE_NORMAL                = 1,
    PHASE_AQUALINGS             = 2,
};

// 134056
struct boss_aquasirr : public StaticBossAI
{
    boss_aquasirr(Creature* creature) : StaticBossAI(creature, DATA_AQUSIRR, SPELL_SEA_BLAST)
    {
        damageEvents.ScheduleEventBelowHealthPct(SPELL_ERUPTING_WATER, 66);
    }

    void ScheduleTasks() override
    {
        events.ScheduleEvent(SPELL_CHOKING_BRINE,   12s, PHASE_NORMAL);
        events.ScheduleEvent(SPELL_SURGING_RUSH,    7s,  PHASE_NORMAL);
        events.ScheduleEvent(SPELL_UNDERTOW,        8s,  PHASE_NORMAL);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
            case SPELL_CHOKING_BRINE:
                break;
            case SPELL_SURGING_RUSH:
                break;
            case SPELL_UNDERTOW:
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 0.0f, true, true, -SPELL_UNDERTOW))
                    me->CastSpell(target, SPELL_UNDERTOW, false);
                break;
            case SPELL_ERUPTING_WATER:
                me->CastStop();
                events.CancelEventGroup(PHASE_NORMAL);
                me->CastSpell(nullptr, SPELL_ERUPTING_WATER, false);
                break;
        }
    }
};

// 134828
struct npc_aqualing : public ScriptedAI
{
    npc_aqualing(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        ScriptedAI::Reset();
        SetCombatMovement(false);
    }
};

// Spell 264144
// AT 17427
struct at_aquasirr_undertow : AreaTriggerAI
{
    at_aquasirr_undertow(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUnitEnter(Unit* unit) override
    {
        if (unit->HasAura(SPELL_UNDERTOW, at->GetCasterGuid()))
            unit->ApplyMovementForce(at->GetGUID(), *at->GetCaster(), -5.f, 0);
    }

    void OnUnitExit(Unit* unit) override
    {
        unit->RemoveMovementForce(at->GetGUID());
    }
};

void AddSC_boss_aqusirr()
{
    RegisterCreatureAI(boss_aquasirr);
    RegisterCreatureAI(npc_aqualing);

    RegisterAreaTriggerAI(at_aquasirr_undertow);
}
