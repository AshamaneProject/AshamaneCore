/*
 * Copyright (C) 2017-2018 AshamaneProject <https://github.com/AshamaneProject>
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
#include "AreaTriggerAi.h"
#include "ScriptMgr.h"
#include "temple_of_sethraliss.h"

enum Spells
{
    SPELL_LOOSE_SPARKS = 268598,
    SPELL_LOOSE_SPARKS_DMG = 267483,
};

 // npc 136108
 // misc 13248
struct npc_loose_spark : public ScriptedAI
{
    npc_loose_spark(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        // Clockwise
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 10.0f, float(M_PI), 12000, true, false);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 6.0f, float(M_PI), 12000, true, false);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 2.0f, float(M_PI), 12000, true, false);

        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 10.0f, float(M_PI) / 2, 12000, true, false);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 6.0f, float(M_PI) / 2, 12000, true, false);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 2.0f, float(M_PI) / 2, 12000, true, false);

        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 10.0f, 0.0f, 12000, true, false);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 6.0f, 0.0f, 12000, true, false);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 2.0f, 0.0f, 12000, true, false);

        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 10.0f, -float(M_PI) / 2, 12000, true, false);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 6.0f, -float(M_PI) / 2, 12000, true, false);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 2.0f, -float(M_PI) / 2, 12000, true, false);

        // Counterclockwise
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 8.0f, float(M_PI), 12000, true, true);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 4.0f, float(M_PI), 12000, true, true);

        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 8.0f, float(M_PI) / 2, 12000, true, true);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 4.0f, float(M_PI) / 2, 12000, true, true);

        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 8.0f, 0.0f, 12000, true, true);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 4.0f, 0.0f, 12000, true, true);

        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 8.0f, -float(M_PI) / 2, 12000, true, true);
        AreaTrigger::CreateAreaTrigger(13248, me, SPELL_LOOSE_SPARKS, me->GetPosition(), -1, 4.0f, -float(M_PI) / 2, 12000, true, true);
    }

    void UpdateAI(uint32 diff) override { }
};



// 17715
class at_loose_sparks : public AreaTriggerEntityScript
{
public:
    at_loose_sparks() : AreaTriggerEntityScript("at_loose_sparks") { }

    struct at_loose_sparksAI : AreaTriggerAI
    {
        at_loose_sparksAI(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUnitEnter(Unit* unit) override
        {
            if (unit && unit->GetTypeId() == TYPEID_PLAYER)
                if (Unit* caster = at->GetCaster())
                    caster->CastSpell(unit, SPELL_LOOSE_SPARKS_DMG, true);
        }
    };

    AreaTriggerAI* GetAI(AreaTrigger* areatrigger) const override
    {
        return new at_loose_sparksAI(areatrigger);
    }
};

void AddSC_temple_of_sethraliss()
{
    RegisterCreatureAI(npc_loose_spark);
    new at_loose_sparks();
}
