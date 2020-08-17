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
#include "GameObject.h"
#include "ScriptMgr.h"
#include "SpellAuras.h"
#include "halls_of_valor.h"
#include "SpellAuraEffects.h"
#include "Position.h"

enum godKingKovaldSpells
{
    SPELL_AEGIS_OF_AGGRAMAR         = 193765,
    SPELL_AEGIS_OF_AGGRAMAR_ABS     = 193743,
    SPELL_AEGIS_SHIELD_VISUAL       = 194214,
    SPELL_AEGIS_SUMMON              = 193781,
    SPELL_AEGIS_SPAWN_OBJECT        = 193940,
    SPELL_AEGIS_SPAWN               = 193769,
    SPELL_CLAIM_THE_AEGIS           = 194112,
    SPELL_AEGIS_RANDOM_POINT        = 193991,
    SPELL_AEGIS_SHIELD_PLAYER       = 193783,
    SPELL_RAGNAROK_CHANNEL          = 193826,
    SPELL_RAGNAROK_DAMAGE           = 193827,
    SPELL_FELBLAZE_RUSH             = 193659,
    SPELL_INFERNAL_FLAMES           = 193702,
    SPELL_INFERNAL_FLAMES_AT        = 193704,
    SPELL_INFERNAL_FLAMES_DAMAGE    = 193701,
    SPELL_FLAME_OF_WOE              = 193706, // HEROIC
    SPELL_CONSUMING_FLAME           = 221093,
    SPELL_SAVAGE_BLADE              = 193668,
    SPELL_RAGGED_SLASH              = 193686
};

enum godKingKovaldEvents
{
    EVENT_AEGIS_OF_AGGRAMAR = 1,
    EVENT_RAGNAROK,
    EVENT_FELBLAZE_RUSH,
    EVENT_FLAME_OF_WOE, // HEROIC
    EVENT_SAVAGE_BLADE,
    EVENT_CLAIM_THE_AEGIS,
    EVENT_SUMMON_AEGIS,
    EVENT_START_TALK,
    EVENT_START_COMBAT,
    EVENT_REMOVE_AEGIS_FROM_PLAYERS,
    EVENT_PICKUP_AEGIS,
};

enum godKingKovaldSays
{
    SAY_EVENT_1 = 7,
    SAY_EVENT_2 = 8,
    SAY_ENTER_COMBAT = 0,
    SAY_ETERNAL = 2,
    SAY_POWER = 4,
    SAY_RAGNAROK = 3,
    SAY_DIE = 6,
};

struct boss_god_king_kovald : public BossAI
{
    boss_god_king_kovald(Creature* creature) : BossAI(creature, DATA_GODKING_SKOVALD)
    {
        me->AddUnitFlag(UnitFlags(UNIT_FLAG_NON_ATTACKABLE));
        me->AddUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE));
        me->SetReactState(REACT_DEFENSIVE);
        me->SetVisible(false);
    }

    void Reset() override
    {
        _Reset();

        me->SetReactState(REACT_DEFENSIVE);
        me->SetPower(POWER_ENERGY, 80);
        powerTimer = 1000;

        if (instance->GetCreature(NPC_AEGIS) == NULL)
            if (!me->HasUnitFlag(UNIT_FLAG_NOT_SELECTABLE))
                if (Creature* odyn = instance->GetCreature(BOSS_ODYN))
                    odyn->CastSpell(odyn, SPELL_AEGIS_SPAWN_OBJECT, true);
    }


    void JustDied(Unit* killer) override
    {
        _JustDied();
        me->RemoveAllAreaTriggers();
        instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_AEGIS_SHIELD_PLAYER);
    }

    void EnterCombat(Unit* /*who*/) override
    {
        _EnterCombat();

        me->SetWalk(true);

        events.ScheduleEvent(EVENT_FELBLAZE_RUSH, 7000);
        events.ScheduleEvent(EVENT_SAVAGE_BLADE, 24000);
    }

    void SpellHitTarget(Unit* target, SpellInfo const* spellInfo) override
    {
        switch (spellInfo->Id)
        {
        case SPELL_SAVAGE_BLADE:
        {
            if (target->IsPlayer())
                DoCast(target, 193686, true);
            break;
        }
        default:
            break;
        }
    }

    void OnSpellCasted(SpellInfo const* spellInfo) override
    {
        if (spellInfo->Id == SPELL_CLAIM_THE_AEGIS)
        {
            me->SetReactState(REACT_AGGRESSIVE);
            if (Unit* topAggro = SelectTarget(SELECT_TARGET_MAXTHREAT))
                me->SetFacingToObject(topAggro);

            AddTimedDelayedOperation(10, [this]() -> void
            {
                me->AddUnitFlag2(UNIT_FLAG2_DISABLE_TURN);
                DoCast(me, 193983, true);

                AddTimedDelayedOperation(10, [this]() -> void
                {
                    me->SetReactState(REACT_AGGRESSIVE);
                    me->RemoveUnitFlag2(UNIT_FLAG2_DISABLE_TURN);
                });
            });
        }
    }

    bool PlayerHasAegisAura()
    {
        Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player *player = i->GetSource())
                if (player->IsAlive() && player->GetDistance(me) <= 150.0f)
                    if (player->HasAura(202711))
                        return true;

        return false;
    }

    Player* PlayerWithAegisAura()
    {
        Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player *player = i->GetSource())
                if (player->IsAlive() && player->GetDistance(me) <= 150.0f)
                    if (player->HasAura(202711))
                        return player;

        return NULL;
    }

    void DoAction(int32 action) override
    {
        if (action == ACTION_EVENT_START)
        {
            me->SetReactState(REACT_DEFENSIVE);
            instance->SetBossState(DATA_GODKING_SKOVALD, NOT_STARTED);
            me->SetVisible(true);
            Talk(SAY_EVENT_1);
            me->SetWalk(false);
            me->GetMotionMaster()->MovePoint(0, 2402.76f, 528.64f, 748.99f, true);
            events.ScheduleEvent(EVENT_START_TALK, 25 * IN_MILLISECONDS);
            me->SetPower(POWER_ENERGY, 80);
        }
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim() && me->IsInCombat())
            return;

        events.Update(diff);

        if (me->IsInCombat())
        {
            if (powerTimer <= diff)
            {
                power = me->GetPower(POWER_ENERGY);

                if (power < 100)
                {
                    if (powerGrowth < 2)
                    {
                        powerGrowth++;
                        me->SetPower(POWER_ENERGY, power + 2);
                    }
                    else
                    {
                        powerGrowth = 0;
                        me->SetPower(POWER_ENERGY, power + 1);
                    }
                }
                else if (!events.HasEvent(EVENT_RAGNAROK))
                    events.ScheduleEvent(EVENT_RAGNAROK, 12000);

                powerTimer = 1000;
            }
            else
                powerTimer -= diff;
        }

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_RAGNAROK:
                if (roll_chance_i(50))
                    Talk(SAY_ETERNAL);
                else
                    Talk(SAY_POWER);

                Talk(SAY_RAGNAROK);
                me->CastSpell(me, SPELL_RAGNAROK_CHANNEL);
               // events.ScheduleEvent(EVENT_REMOVE_AEGIS_FROM_PLAYERS, 3000);
                break;

            case EVENT_FELBLAZE_RUSH:
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 5.0f, true, 0))
                    me->CastSpell(target, SPELL_FELBLAZE_RUSH, true);

                break;

            case EVENT_SAVAGE_BLADE:
                if (Unit* target = me->GetVictim())
                {
                    me->CastSpell(target, SPELL_SAVAGE_BLADE, true);
                    me->CastSpell(target, SPELL_RAGGED_SLASH, true);
                }

                events.ScheduleEvent(EVENT_SAVAGE_BLADE, 12000);
                break;

            case EVENT_START_TALK:
                Talk(SAY_EVENT_2);
                me->SetHomePosition(me->GetPosition());
                events.ScheduleEvent(EVENT_START_COMBAT, 5 * IN_MILLISECONDS);
                break;

            case EVENT_START_COMBAT:
                me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NON_ATTACKABLE));
                me->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE));
                break;

            default:
                break;
            }
        }

        DoMeleeAttackIfReady();
    }

    private:
        int32 power;
        uint32 powerTimer;
        uint32 powerGrowth;
};

// 98364 - Aegis of Aggramar
struct npc_aegis_of_aggramar : public ScriptedAI
{
    npc_aegis_of_aggramar(Creature* creature) : ScriptedAI(creature)
    {
        me->SetReactState(REACT_PASSIVE);
        me->AddUnitFlag(UnitFlags(UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NON_ATTACKABLE));
    }

    void OnSpellClick(Unit* clicker, bool& /*result*/) override
    {
        if (!clicked)
        {
            clicker->CastSpell(clicker, SPELL_AEGIS_SHIELD_PLAYER, true);
            clicked = true;
            me->ForcedDespawn(0);
        }
    }

    void SpellHit(Unit* caster, SpellInfo const* spellInfo) override
    {
        if (spellInfo->Id == SPELL_CLAIM_THE_AEGIS)
        {
            DoCast(caster, 193988, true);
            me->DespawnOrUnsummon();
        }
    }

    void IsSummonedBy(Unit* summoner) override
    {
        clicked = false;
        me->CastSpell(me, SPELL_AEGIS_SPAWN, true);
        //me->CastSpell(me, SPELL_AEGIS_RANDOM_POINT, true);

        me->AddNpcFlag(UNIT_NPC_FLAG_SPELLCLICK);

        me->SetInteractSpellId(SPELL_AEGIS_SHIELD_PLAYER);

        if (summoner->IsPlayer())
        {
            me->AddUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE));
        }
    }

private:
    bool clicked;
};

// 193826 - Ragnarok
class spell_ragnarok : public AuraScript
{
    PrepareAuraScript(spell_ragnarok);

    void OnPeriodic(AuraEffect const* aurEff)
    {
        if (Unit* caster = GetCaster())
        {
            caster->CastSpell(caster, 193827, TRIGGERED_CAN_CAST_WHILE_CASTING_MASK);
            caster->CastSpell(caster, 202494, TRIGGERED_CAN_CAST_WHILE_CASTING_MASK);
        }
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_ragnarok::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
    }
};

// 193827 - Ragnarok Damage
class spell_ragnarok_damage : public SpellScript
{
    PrepareSpellScript(spell_ragnarok_damage);

    void RagnarokDamage(SpellMissInfo /*missInfo*/)
    {
        if (Unit* target = GetHitUnit())
        {
            if (target->HasAura(SPELL_AEGIS_OF_AGGRAMAR_ABS))
                SetHitDamage(0);
        }
        else
        {
            if (Unit* caster = GetCaster())
                if (Aura* aura = caster->GetAura(202494))
                    SetHitDamage(GetHitDamage() + GetHitDamage() * aura->GetCharges());
        }
    }

    void Register() override
    {
        BeforeHit += BeforeSpellHitFn(spell_ragnarok_damage::RagnarokDamage);
    }
};

// 193828 - Ragnarok
class spell_kovald_ragnarok : public SpellScript
{
    PrepareSpellScript(spell_kovald_ragnarok);

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        if (Unit* caster = GetCaster())
            if (WorldLocation* dest = GetHitDest())
                caster->CastSpell(dest->GetPositionX(), dest->GetPositionY(), dest->GetPositionZ(), SPELL_RAGNAROK_DAMAGE, TRIGGERED_CAN_CAST_WHILE_CASTING_MASK);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_kovald_ragnarok::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 9758 - Aegis of Aggramar AT
struct areatrigger_aegis_of_aggramar : AreaTriggerAI
{
    areatrigger_aegis_of_aggramar(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnCreate() override
    {
        at->SetDuration(12000);
    }

    void OnUnitEnter(Unit* target) override
    {
        if (!target->HasAura(SPELL_AEGIS_OF_AGGRAMAR_ABS))
            target->CastSpell(target, SPELL_AEGIS_OF_AGGRAMAR_ABS, true);
    }

    void OnUnitExit(Unit* target) override
    {
        target->RemoveAurasDueToSpell(SPELL_AEGIS_OF_AGGRAMAR_ABS);
    }
};

// 194222 - Infernal flames
class spell_kovald_infernal_flames : public SpellScript
{
    PrepareSpellScript(spell_kovald_infernal_flames);

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        if (Unit* caster = GetCaster())
        {
            Position dest;
            caster->GetRandomPoint(dest, 100.0f);
            caster->CastSpell(dest.GetPositionX(), dest.GetPositionY(), dest.GetPositionZ(), SPELL_INFERNAL_FLAMES_AT, true);

            if (caster->GetMap()->IsHeroic())
            {
                caster->CastSpell(caster, 207509, true);
                caster->CastSpell(dest.GetPositionX(), dest.GetPositionY(), dest.GetPositionZ(), SPELL_FLAME_OF_WOE, true);
            }
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_kovald_infernal_flames::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 9758 - Aegis of Aggramar AT
struct areatrigger_infernal_flames : AreaTriggerAI
{
    areatrigger_infernal_flames(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUnitEnter(Unit* target) override
    {
        if (!target->HasAura(SPELL_INFERNAL_FLAMES))
            target->CastSpell(target, SPELL_INFERNAL_FLAMES_DAMAGE, true);

        if (Aura* aura = target->GetAura(SPELL_INFERNAL_FLAMES))
            aura->SetDuration(12000);
    }

    void OnUnitExit(Unit* target) override
    {
        target->RemoveAurasDueToSpell(SPELL_INFERNAL_FLAMES_DAMAGE);
    }
};

// 104822 - Flame of Woe
struct npc_flame_of_woe : public ScriptedAI
{
    npc_flame_of_woe(Creature* creature) : ScriptedAI(creature) { }

    ObjectGuid targetGuid;

    void Reset() override
    {
        me->SetLevel(110);
        me->CastSpell(me, 221093, true);

        events.Reset();

        if (Unit* target = me->SelectNearestPlayer(300.0f))
        {
            targetGuid = target->GetGUID();
            me->Attack(target, true);
        }

        events.ScheduleEvent(EVENT_FLAME_OF_WOE, 1000);
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;

        if (me->GetVictim() && me->GetVictim()->GetGUID() != targetGuid && targetGuid != ObjectGuid::Empty)
            me->SetTarget(targetGuid);
        else if (Unit* target = me->SelectNearestPlayer(300.0f))
        {
            targetGuid = target->GetGUID();
            me->Attack(target, true);
        }

        events.Update(diff);

        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {

            case EVENT_FLAME_OF_WOE:
                me->CastSpell(me, 193661, true);

                events.ScheduleEvent(EVENT_SUMMON_AEGIS, 1000);
                break;
            }
        }

        DoMeleeAttackIfReady();
    }
};

// 5029 - Flame of WoE AT
struct areatrigger_flame_of_woe : AreaTriggerAI
{
    areatrigger_flame_of_woe(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUnitEnter(Unit* target) override
    {
        if (!target->HasAura(SPELL_INFERNAL_FLAMES))
            target->CastSpell(target, SPELL_INFERNAL_FLAMES_DAMAGE, true);
    }
};

// 202709 - aegis of aggramar
class spell_aegis_of_agamar : public SpellScript
{
    PrepareSpellScript(spell_aegis_of_agamar);

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        if (Unit* caster = GetCaster())
        {
            caster->CastSpell(caster, 202711);
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_aegis_of_agamar::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

//193940 spawn aegis
class spell_spawn_aegis : public SpellScript
{
    PrepareSpellScript(spell_spawn_aegis);

    void DoBeforeCast()
    {
        WorldLocation loc;
        loc.m_positionX = 2402.76f;
        loc.m_positionY = 528.64f;
        loc.m_positionZ = 748.994f;
        SetExplTargetDest(loc);
    }

    void Register() override
    {
        BeforeCast += SpellCastFn(spell_spawn_aegis::DoBeforeCast);
    }
};



void AddSC_boss_godking_skovald()
{
    RegisterCreatureAI(boss_god_king_kovald);
    RegisterCreatureAI(npc_aegis_of_aggramar);
    RegisterSpellScript(spell_kovald_ragnarok);
    RegisterAreaTriggerAI(areatrigger_aegis_of_aggramar);
    RegisterSpellScript(spell_kovald_infernal_flames);
    RegisterAreaTriggerAI(areatrigger_infernal_flames);
    RegisterAreaTriggerAI(areatrigger_flame_of_woe);
    RegisterCreatureAI(npc_flame_of_woe);
    RegisterSpellScript(spell_aegis_of_agamar);
    RegisterAuraScript(spell_ragnarok);
    RegisterSpellScript(spell_ragnarok_damage);
    RegisterSpellScript(spell_spawn_aegis);
}
