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
#include "AreaTriggerAI.h"
#include "ScriptMgr.h"
#include "SpellAuras.h"
#include "the_underrot.h"

enum CragmawInfestedSpells
{
    SPELL_CRAWG_EATING                  = 279156,

    SPELL_INFESTED                      = 260477,
    SPELL_CHARGE                        = 260292,
    SPELL_CHARGE_DAMAGE                 = 260312,
    SPELL_INDIGESTION                   = 260793,
    SPELL_TANTRUM                       = 260333,

    SPELL_LARVA_SUMMON_VISUAL           = 260411,
    SPELL_LARVA_SUMMON_BLOOD_TICK       = 260353,
    SPELL_LARVA_METAMORPHOSIS           = 260416,
    SPELL_LARVA_METAMORPHOSIS_2         = 260766,
    SPELL_LARVA_DESTROY                 = 260418,

    SPELL_BLOOD_TICK_SPAWN              = 260768,
    SPELL_BLOOD_TICK_SERRATED_FANGS     = 260768,
    SPELL_BLOOD_TICK_BLOOD_BURST        = 260768,
    SPELL_BLOOD_TICK_BLOOD_BURST_DAMAGE = 278637,
};

// 131817
struct boss_cragmaw_infested : public BossAI
{
    boss_cragmaw_infested(Creature* creature) : BossAI(creature, DATA_CRAGMAW_THE_INFESTED) { }

    void Reset() override
    {
        me->CastSpell(me, SPELL_INFESTED, true);
    }

    void EnterCombat(Unit* /*unit*/) override
    {
        events.ScheduleEvent(SPELL_INDIGESTION, 8s);
        events.ScheduleEvent(SPELL_CHARGE, 20s);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
            case SPELL_INDIGESTION:
                if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO, 0))
                    me->CastSpell(target, SPELL_INDIGESTION, false);

                events.Repeat(30s);
                break;
                break;
            case SPELL_CHARGE:
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1))
                    me->CastSpell(target, SPELL_CHARGE, false);

                events.Repeat(20s);
                break;
        }
    }
};

// 132080
struct npc_cragmaw_larva : public ScriptedAI
{
    npc_cragmaw_larva(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        me->SetReactState(REACT_PASSIVE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
        me->CastSpell(me, SPELL_LARVA_SUMMON_VISUAL, true);
        me->CastSpell(me, SPELL_LARVA_METAMORPHOSIS, true);
    }
};

// 132051
struct npc_cragmaw_blood_tick : public ScriptedAI
{
    npc_cragmaw_blood_tick(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        DoZoneInCombat();
        me->CastSpell(me, SPELL_LARVA_SUMMON_VISUAL, true);
        me->CastSpell(me, SPELL_BLOOD_TICK_BLOOD_BURST, true);
    }

    void JustDied(Unit* /*killer*/) override
    {
        me->CastSpell(nullptr, SPELL_BLOOD_TICK_BLOOD_BURST_DAMAGE, true);
    }
};

// 260416
class aura_cragmaw_larva_transformation : public AuraScript
{
    PrepareAuraScript(aura_cragmaw_larva_transformation);

    void HandleEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_EXPIRE)
        {
            if (Unit* caster = GetCaster())
            {
                if (Creature* creature = caster->ToCreature())
                {
                    creature->CastSpell(creature, SPELL_LARVA_SUMMON_BLOOD_TICK, true);
                    creature->ForcedDespawn();
                }
            }
        }
    }

    void Register() override
    {
        AfterEffectRemove += AuraEffectRemoveFn(aura_cragmaw_larva_transformation::HandleEffectRemove, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
    }
};

// Charge - 260292
// at 17014
struct at_cragmaw_charge : AreaTriggerAI
{
    at_cragmaw_charge(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUnitEnter(Unit* unit) override
    {
        if (Unit* caster = at->GetCaster())
            if (caster->IsValidAttackTarget(unit))
                caster->CastSpell(unit, SPELL_CHARGE_DAMAGE, true);
    }
};

// Summon Larva - 260411
// at 17026
struct at_cragmaw_larva : AreaTriggerAI
{
    at_cragmaw_larva(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUnitEnter(Unit* unit) override
    {
        if (unit->IsPlayer())
            if (Unit* caster = at->GetCaster())
                if (caster->IsCreature())
                {
                    caster->CastSpell(caster, SPELL_LARVA_DESTROY, true);
                    caster->ToCreature()->ForcedDespawn();
                }
    }
};

void AddSC_boss_cragmaw_infested()
{
    RegisterCreatureAI(boss_cragmaw_infested);
    RegisterCreatureAI(npc_cragmaw_larva);
    RegisterCreatureAI(npc_cragmaw_blood_tick);

    RegisterAuraScript(aura_cragmaw_larva_transformation);

    RegisterAreaTriggerAI(at_cragmaw_charge);
    RegisterAreaTriggerAI(at_cragmaw_larva);
}
