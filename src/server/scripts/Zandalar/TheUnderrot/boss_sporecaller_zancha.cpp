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
    SPELL_FESTERING_HARVEST_DAMAGE  = 259732, // Need conditions
    SPELL_BOUNDLESS_ROT_ENTER_COMBAT= 277732,
    SPELL_BOUNDLESS_ROT             = 259830,
    SPELL_BOUNDLESS_ROT_AT          = 259727,
    SPELL_SHOCKWAVE                 = 272457,
    SPELL_UPHEAVAL                  = 274213,
    SPELL_UPHEAVAL_DAMAGE           = 259720, // Need conditions

    SPELL_SPORE_HIT_VISUAL          = 259862,
    SPELL_SPORE_BEAM                = 259968,
    SPELL_SPORE_DETONATION          = 259668,
    SPELL_SPORE_BIG_DETONATION      = 259958,
};

// 131383
struct boss_sporecaller_zancha : public BossAI
{
    boss_sporecaller_zancha(Creature* creature) : BossAI(creature, DATA_SPORECALLER_ZANCHA) { }

    void Reset() override
    {
        me->SetPowerType(POWER_ENERGY);
        me->SetPower(POWER_ENERGY, 25);
    }

    void EnterCombat(Unit* /*attacker*/) override
    {
        _EnterCombat();

        me->CastSpell(me, SPELL_FESTERING_HARVEST, true);
        me->CastSpell(me, SPELL_BOUNDLESS_ROT_ENTER_COMBAT, true);

        events.ScheduleEvent(10s, SPELL_SHOCKWAVE);
        events.ScheduleEvent(20s, SPELL_UPHEAVAL);
    }

    void OnPowerChanged(Powers power, int32 /*oldValue*/, int32& newValue) override
    {
        if (power == POWER_ENERGY && newValue == 100)
        {
            events.Schedule(1s, SPELL_FESTERING_HARVEST_DAMAGE);
        }
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
            case SPELL_FESTERING_HARVEST_DAMAGE:
            {
                me->CastSpell(me, SPELL_FESTERING_HARVEST_DAMAGE, false);

                me->GetScheduler(6s, [](TaskContext context)
                {
                    GetContextUnit()->CastSpell(nullptr, SPELL_BOUNDLESS_ROT, true);
                });
                break;
            }
            case SPELL_SHOCKWAVE:
                if (Unit* target = SelectTarget(TARGET_SELECT_TOPAGGRO))
                    me->CastSpell(target, SPELL_SHOCKWAVE, false);
                break;
            case SPELL_UPHEAVAL:
                if (Unit* target = SelectTarget(TARGET_SELECT_RANDOM, 1))
                    me->CastSpell(me, SPELL_UPHEAVAL, false);
                break;
        }
    }
};

// 131597
struct npc_underrot_spore_pod : public ScriptedAI
{
    npc_underrot_spore_pod(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        me->CastSpell(me, SPELL_BOUNDLESS_ROT_AT, true);
    }

    void MoveInLineOfSight(Unit* seer) override
    {
        if (seer->IsPlayer() && me->GetDistance(seer) <= 2.f)
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
        if (!GetCaster())
            return;

        GetCaster()->ModifyPower(POWER_ENERGY, 2);
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
