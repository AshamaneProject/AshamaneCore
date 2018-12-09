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

#include "ScriptMgr.h"
#include "the_underrot.h"

enum SporecallerZanchaSpells
{
    SPELL_FESTERING_HARVEST         = 259888,
    SPELL_FESTERING_HARVEST_DAMAGE  = 259732,
    SPELL_BOUNDLESS_ROT_ENTER_COMBAT= 277732,
    SPELL_BOUNDLESS_ROT             = 259830,
    SPELL_BOUNDLESS_ROT_AT          = 259727,
    SPELL_SHOCKWAVE                 = 272457,
    SPELL_UPHEAVAL_TARGET           = 259718,
    SPELL_UPHEAVAL                  = 274213,
    SPELL_UPHEAVAL_DAMAGE           = 259720,

    SPELL_SPORE_HIT_VISUAL          = 259862,
    SPELL_SPORE_BEAM                = 259968,
    SPELL_SPORE_DETONATION          = 259668,
    SPELL_SPORE_BIG_DETONATION      = 259958,
};

// 131383
struct boss_sporecaller_zancha : public BossAI
{
    boss_sporecaller_zancha(Creature* creature) : BossAI(creature, DATA_SPORECALLER_ZANCHA)
    {
        if (!instance->IsCreatureGroupWiped(SUMMON_GROUP_BLOODSWORN_DEFILER))
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
    }

    void Reset() override
    {
        _Reset();

        me->SetPowerType(POWER_ENERGY);
        me->SetPower(POWER_ENERGY, 25);

        me->RemoveAurasDueToSpell(SPELL_BOUNDLESS_ROT_ENTER_COMBAT);
        me->RemoveAurasDueToSpell(SPELL_BOUNDLESS_ROT);
    }

    void EnterCombat(Unit* /*attacker*/) override
    {
        _EnterCombat();

        me->CastSpell(me, SPELL_FESTERING_HARVEST, true);
        me->CastSpell(me, SPELL_BOUNDLESS_ROT_ENTER_COMBAT, true);

        events.ScheduleEvent(SPELL_SHOCKWAVE, 10s);
        events.ScheduleEvent(SPELL_UPHEAVAL_TARGET, 13s);
    }

    void DoAction(int32 action) override
    {
        if (action == SPELL_FESTERING_HARVEST_DAMAGE)
        {
            me->RemoveAurasDueToSpell(SPELL_FESTERING_HARVEST);
            events.RescheduleEvent(SPELL_FESTERING_HARVEST_DAMAGE, 1s);
        }
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
            case SPELL_FESTERING_HARVEST_DAMAGE:
            {
                me->CastSpell(me, SPELL_FESTERING_HARVEST_DAMAGE, false);
                me->SetPower(POWER_ENERGY, 0);

                me->GetScheduler().Schedule(6s, [](TaskContext context)
                {
                    GetContextCreature()->AI()->Talk(5);
                    GetContextUnit()->CastSpell(nullptr, SPELL_BOUNDLESS_ROT, true);
                    GetContextUnit()->CastSpell(GetContextUnit(), SPELL_FESTERING_HARVEST, true);
                });
                break;
            }
            case SPELL_SHOCKWAVE:
                if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
                    me->CastSpell(target, SPELL_SHOCKWAVE, false);

                events.Repeat(15s);
                break;
            case SPELL_UPHEAVAL_TARGET:
            {
                for (uint8 i = 0; i < 2; ++i)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 0.f, true, -SPELL_UPHEAVAL_TARGET))
                    {
                        me->CastSpell(target, SPELL_UPHEAVAL_TARGET, true);
                        Talk(4, target);
                    }
                }

                events.ScheduleEvent(SPELL_UPHEAVAL, 6s); // Needs to be handle with spellscripts/aurascripts !!!
                events.Repeat(26s);
                break;
            }
            case SPELL_UPHEAVAL:
            {
                for (uint8 i = 0; i < 2; ++i)
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.f, true, SPELL_UPHEAVAL_TARGET))
                        me->CastSpell(target, SPELL_UPHEAVAL, true);

                break;
            }
        }
    }
};

// 131597
struct npc_underrot_spore_pod : public ScriptedAI
{
    npc_underrot_spore_pod(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        me->SetReactState(REACT_PASSIVE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
        me->CastSpell(me, SPELL_BOUNDLESS_ROT_AT, true);
    }

    void MoveInLineOfSight(Unit* seer) override
    {
        if (seer->IsPlayer() && me->GetDistance(seer) <= 0.5f)
        {
            me->CastSpell(nullptr, SPELL_SPORE_DETONATION, true);
            me->ForcedDespawn();
        }
    }

    void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
    {
        switch (spell->Id)
        {
            case SPELL_FESTERING_HARVEST_DAMAGE:
                me->CastSpell(nullptr, SPELL_SPORE_BIG_DETONATION, true);
                me->ForcedDespawn();
                break;
            case SPELL_SHOCKWAVE:
            case SPELL_UPHEAVAL_DAMAGE:
                me->CastSpell(me, SPELL_SPORE_HIT_VISUAL, true);
                me->ForcedDespawn();
            default:
                break;
        }
    }
};

// 259888
class aura_zancha_festering_harvest : public AuraScript
{
    PrepareAuraScript(aura_zancha_festering_harvest);

    void HandlePeriodicTick(AuraEffect const* /*aurEff*/)
    {
        if (Unit* caster = GetCaster())
        {
            bool had100Energy = caster->GetPower(POWER_ENERGY) == 100;

            caster->ModifyPower(POWER_ENERGY, 2);

            if (!had100Energy && caster->IsCreature() && caster->IsAIEnabled && caster->GetPower(POWER_ENERGY) == 100)
                caster->ToCreature()->AI()->DoAction(SPELL_FESTERING_HARVEST_DAMAGE);
        }
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(aura_zancha_festering_harvest::HandlePeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
    }
};

void AddSC_boss_sporecaller_zancha()
{
    RegisterCreatureAI(boss_sporecaller_zancha);
    RegisterCreatureAI(npc_underrot_spore_pod);

    RegisterAuraScript(aura_zancha_festering_harvest);
}
