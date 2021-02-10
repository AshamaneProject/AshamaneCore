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
#include "ScriptMgr.h"
#include "SpellAuras.h"
#include "SpellAuraEffects.h"
#include "the_underrot.h"

enum UnboundAbominationSpells
{
    // Unbound Abomination
    SPELL_BLOOD_BARRIER                     = 269185,
    SPELL_PUTRID_BLOOD_AURA                 = 269303,
    SPELL_VILE_EXPULSION                    = 269843,
    SPELL_VILE_EXPULSION_SPORE_DEATH_DAMAGE = 250950,
    SPELL_VILE_EXPULSION_AT_DAMAGE          = 269838,
    SPELL_VILE_EXPULSION_MISSILE_SPAWN      = 269813,
    SPELL_VILE_EXPULSION_SPAWN              = 269836,
    SPELL_DISOLVE_CORPSE                    = 265640,
    SPELL_CORPSE_TRANSFORM                  = 265635,
    SPELL_ROTTING_SPORE_SPAWN               = 270104,
    SPELL_ROTTING_SPORE_FIXATE              = 270107,
    SPELL_ROTTING_SPORE_DAMAGE              = 270108,

    // Blood Visage
    SPELL_BLOOD_CLONE_COSMETIC              = 272663,
    SPELL_FATAL_LINK                        = 269692,

    // Titan Keeper Hezrel
    // Pre-boss event
    SPELL_SHADOW_VISUAL                     = 279551,
    SPELL_HOLY_CHANNEL                      = 279250,
    SPELL_OPEN_WEB_DOOR                     = 279271,
    SPELL_UPDATE_INTERACTIONS               = 187114,

    // Boss fight
    SPELL_HOLY_BOLT                         = 269312,
    SPELL_CLEANSING_LIGHT                   = 269310,
    SPELL_PURGE_CORRUPTION                  = 269406,
    SPELL_PERMANENT_FEIGN_DEATH             = 29266,
};

// 133007
struct boss_unbound_abomination : public BossAI
{
    boss_unbound_abomination(Creature* creature) : BossAI(creature, DATA_UNBOUND_ABOMINATION) { }

    void Reset() override
    {
        _Reset();

        me->RemoveAurasDueToSpell(SPELL_PUTRID_BLOOD_AURA);

        me->CastSpell(me, SPELL_BLOOD_BARRIER, false);
        me->SetPowerType(POWER_ENERGY);
        me->SetPower(POWER_ENERGY, 0);

        if (Creature* hezrel = GetHezrel())
        {
            if (hezrel->isDead())
                hezrel->Respawn(true);

            hezrel->AI()->SetData(DATA_UNBOUND_ABOMINATION, NOT_STARTED);
        }
    }

    void EnterCombat(Unit* /*unit*/) override
    {
        _EnterCombat();

        me->CastSpell(me, SPELL_PUTRID_BLOOD_AURA, false);

        if (Creature* hezrel = GetHezrel())
            hezrel->AI()->SetData(DATA_UNBOUND_ABOMINATION, IN_PROGRESS);

        events.ScheduleEvent(SPELL_VILE_EXPULSION, 15s);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        switch (eventId)
        {
            case SPELL_VILE_EXPULSION:
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    me->CastSpell(target, SPELL_VILE_EXPULSION, false);

                events.Repeat(15s);
                break;
            }

        }
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();

        if (Creature* hezrel = GetHezrel())
            hezrel->AI()->SetData(DATA_UNBOUND_ABOMINATION, DONE);
    }

    void DoAction(int32 action) override
    {
        if (action == NPC_BLOOD_VISAGE)
        {
            Position centerPosition = { 1199.420044f, 1481.939941f, -181.505997f };
            Position summonPosition = centerPosition;
            GetRandPosFromCenterInDist(&centerPosition, 40.f, summonPosition);

            me->SetPower(POWER_ENERGY, 0);
            me->SummonCreature(NPC_BLOOD_VISAGE, summonPosition, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);

            me->RemoveAurasDueToSpell(SPELL_BLOOD_BARRIER);
            me->CastSpell(me, SPELL_BLOOD_BARRIER, true);
        }
    }

private:
    Creature* GetHezrel() const { return instance->GetCreature(DATA_BOSS_HERZEL); }
};

// 134419
struct npc_underrot_titan_keeper_hezrel : public ScriptedAI
{
    npc_underrot_titan_keeper_hezrel(Creature* creature) : ScriptedAI(creature) { }

    Position firstWaypoints[8] =
    {
        { 1034.255737f, 1169.260742f, 12.140393f },
        { 1034.920898f, 1164.862305f, 14.614284f },
        { 1042.535156f, 1145.444458f, 14.607360f },
        { 1063.567749f, 1144.828491f, 14.760351f },
        { 1077.910767f, 1157.091553f, 14.991093f },
        { 1077.984619f, 1160.333862f, 17.224142f },
        { 1077.937378f, 1188.073486f, 20.141348f },
        { 1075.895142f, 1226.188599f, 15.822451f },
    };

    Position secondWaypoints[3] =
    {
        { 1056.437012f, 1260.391968f, 11.439587f },
        { 1068.353882f, 1286.912842f,  9.131060f },
        { 1100.847412f, 1331.036255f,  5.608679f },
    };

    enum Talks
    {
        TALK_BREACH_DETECTED        = 0,
        TALK_MOTHER_NO_RESPONDING   = 1,
        TALK_PLANETARY_INFECTION    = 2,
        TALK_SPECIMEN_DETECTED      = 3,

        TALK_CLEANSING_LIGHT        = 4,
        TALK_CLEANSING_AREA         = 5,
        TALK_PURGE_PROTOCOL_ENGAGED = 6,
        TALK_CONTAGION_DETECTED     = 7,
        TALK_DEATH                  = 8,
    };

    void Reset() override
    {
        if (me->GetPositionZ() > -100.f)
            me->CastSpell(me, SPELL_SHADOW_VISUAL, true);
        else
            me->CastSpell(me, SPELL_HOLY_CHANNEL, true);
    }

    void SetData(uint32 type, uint32 action) override
    {
        if (type == DATA_EVENT_HERZEL)
        {
            if (action == 1)
            {
                Talk(TALK_BREACH_DETECTED);
                me->GetMotionMaster()->MoveSmoothPath(1, firstWaypoints, 8);
                me->RemoveAurasDueToSpell(SPELL_SHADOW_VISUAL);
                me->SetAIAnimKitId(0);
            }
            else
            {
                Talk(TALK_PLANETARY_INFECTION);
                me->GetMotionMaster()->MoveSmoothPath(2, secondWaypoints, 3);
            }
        }
        else if (type == DATA_UNBOUND_ABOMINATION)
        {
            switch (action)
            {
                case NOT_STARTED:
                case FAIL:
                    events.Reset();
                    me->GetMotionMaster()->MoveTargetedHome();
                    break;
                case IN_PROGRESS:
                    Talk(TALK_PURGE_PROTOCOL_ENGAGED);
                    events.ScheduleEvent(SPELL_HOLY_BOLT,           5s);
                    events.ScheduleEvent(SPELL_PURGE_CORRUPTION,    15s);
                    events.ScheduleEvent(SPELL_CLEANSING_LIGHT,     20s);
                    break;
                case DONE:
                    events.Reset();
                    Talk(TALK_DEATH);
                    me->CastSpell(me, SPELL_PERMANENT_FEIGN_DEATH, true);
                    break;
            }
        }
    }

    void MovementInform(uint32 /*type*/, uint32 pointId) override
    {
        if (pointId == 1)
            Talk(TALK_MOTHER_NO_RESPONDING);

        else if (pointId == 2)
        {
            Talk(TALK_SPECIMEN_DETECTED);
            me->CastSpell(nullptr, SPELL_OPEN_WEB_DOOR, false);
        }
        else if (pointId == SPELL_PURGE_CORRUPTION)
        {
            if (Creature* bloodVisage = me->FindNearestCreature(NPC_BLOOD_VISAGE, 25.f, true))
                me->CastSpell(bloodVisage, SPELL_PURGE_CORRUPTION, true);
        }
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        switch (events.ExecuteEvent())
        {
            case SPELL_HOLY_BOLT:
                me->CastSpell(nullptr, SPELL_HOLY_BOLT, false);
                events.Repeat(5s);
                break;
            case SPELL_PURGE_CORRUPTION:
                if (Creature* bloodVisage = me->FindNearestCreature(NPC_BLOOD_VISAGE, 25.f, true))
                {
                    if (me->GetDistance(bloodVisage) < 10.f)
                    {
                        Talk(TALK_CONTAGION_DETECTED);
                        me->CastSpell(bloodVisage, SPELL_PURGE_CORRUPTION, true);
                        events.Repeat(15s);
                    }
                    else
                    {
                        float x, y, z;
                        me->GetContactPoint(bloodVisage, x, y, z, 5.f);
                        me->GetMotionMaster()->MovePoint(SPELL_PURGE_CORRUPTION, x, y, z);

                        events.Repeat(20s);
                    }
                }
                else
                    events.Repeat(5s);
                break;
            case SPELL_CLEANSING_LIGHT:
                if (Creature* abomination = instance->GetCreature(NPC_UNBOUND_ABOMINATION))
                {
                    if (Unit* player = abomination->AI()->SelectTarget(SELECT_TARGET_RANDOM, 0, 0.f, true))
                    {
                        Talk(TALK_CLEANSING_LIGHT);
                        me->CastSpell(player, SPELL_CLEANSING_LIGHT, false);
                    }
                }

                events.Repeat(20s);
                break;
            default:
                break;
        }
    }
};

// 137103
struct npc_underrot_blood_visage : public ScriptedAI
{
    npc_underrot_blood_visage(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        me->SetInCombatWithZone();
        me->CastSpell(me, SPELL_BLOOD_CLONE_COSMETIC, true);
    }

    void JustDied(Unit* /*killer*/) override
    {
        me->CastSpell(me, SPELL_FATAL_LINK, true);
    }
};

// 137458
struct npc_underrot_rotting_spore : public ScriptedAI
{
    npc_underrot_rotting_spore(Creature* creature) : ScriptedAI(creature) { }

    void Reset() override
    {
        me->CastSpell(me, SPELL_ROTTING_SPORE_SPAWN, true);

        FixateNearPlayer();

        me->GetScheduler().Schedule(1s, [this](TaskContext context)
        {
            if (Player* player = me->SelectNearestPlayer(3.f))
            {
                me->CastSpell(player, SPELL_ROTTING_SPORE_DAMAGE, true);
                me->KillSelf();
            }
            else
                context.Repeat();

            if (me->GetMotionMaster()->empty())
                FixateNearPlayer();
        });
    }

    void JustDied(Unit* /*killer*/) override
    {
        me->CastSpell(nullptr, SPELL_VILE_EXPULSION_SPORE_DEATH_DAMAGE, true);

        if (Creature* abomination = instance->GetCreature(NPC_UNBOUND_ABOMINATION))
            abomination->CastSpell(me->GetPosition(), SPELL_VILE_EXPULSION_SPAWN, true);
    }

private:
    void FixateNearPlayer()
    {
        if (Player* player = me->SelectNearestPlayer(50.f))
        {
            me->CastSpell(player, SPELL_ROTTING_SPORE_FIXATE, false);
            me->GetMotionMaster()->MoveChase(player);
        }
    }
};

// Blood Barrier - 269185
class aura_unbound_abomination_blood_barrier : public AuraScript
{
    PrepareAuraScript(aura_unbound_abomination_blood_barrier);

    void HandleAbsorb(AuraEffect* aurEff, DamageInfo& dmgInfo, uint32& absorbAmount)
    {
        if (dmgInfo.GetSpellInfo() && dmgInfo.GetSpellInfo()->Id == SPELL_FATAL_LINK)
        {
            absorbAmount = 0;
            return;
        }

        int32 absorbLeft = aurEff->GetAmount();
        int32 totalAbsorb = aurEff->CalculateAmount(GetTarget());

        if (!totalAbsorb)
            return;

        int32 energy = (int32)std::ceil(float(totalAbsorb - absorbLeft) / float(totalAbsorb) * 100.f);
        GetTarget()->SetPower(POWER_ENERGY, energy);

        absorbAmount = dmgInfo.GetDamage();
    }

    void AfterRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_DEATH)
            return;

        if (Creature* targetCreature = GetTarget()->ToCreature())
            if (targetCreature->IsAIEnabled)
                targetCreature->AI()->DoAction(NPC_BLOOD_VISAGE);
    }

    void Register() override
    {
        OnEffectAbsorb += AuraEffectAbsorbFn(aura_unbound_abomination_blood_barrier::HandleAbsorb, EFFECT_0);
        AfterEffectRemove += AuraEffectRemoveFn(aura_unbound_abomination_blood_barrier::AfterRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
    }
};

// Vile Expulsion - 269843
class spell_underrot_vile_expulsion : public SpellScript
{
    PrepareSpellScript(spell_underrot_vile_expulsion);

    void HandleAfterCast()
    {
        for (uint8 i = 0; i < 5; ++i)
            GetCaster()->CastSpell(nullptr, SPELL_VILE_EXPULSION_MISSILE_SPAWN, true);
    }

    void Register() override
    {
        AfterCast += SpellCastFn(spell_underrot_vile_expulsion::HandleAfterCast);
    }
};

// Cleansing Light - 269310
class spell_underrot_cleansing_light : public SpellScript
{
    PrepareSpellScript(spell_underrot_cleansing_light);

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        WorldLocation* dest = GetHitDest();
        if (!dest)
            return;

        std::list<AreaTrigger*> areatriggers = GetCaster()->SelectNearestAreaTriggers(SPELL_VILE_EXPULSION_SPAWN, 100.f);
        for (AreaTrigger* at : areatriggers)
            if (at->GetDistance(*dest) < 10.f)
                at->SetDuration(0);
    }

    void Register() override
    {
        OnEffectHit += SpellEffectFn(spell_underrot_cleansing_light::HandleDummy, EFFECT_0, SPELL_EFFECT_REMOVE_AURA);
    }
};

// Vile Expulsion - 269836
// AT 17928
struct at_underrot_vile_expulsion : AreaTriggerAI
{
    at_underrot_vile_expulsion(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnInitialize() override
    {
        //at->SetPeriodicProcTimer(urand(20000, 40000));
    }

    void OnUnitEnter(Unit* unit) override
    {
        if (Unit* caster = at->GetCaster())
            if (caster->IsValidAttackTarget(unit))
                unit->CastSpell(unit, SPELL_VILE_EXPULSION_AT_DAMAGE, true);
    }

    void OnUnitExit(Unit* unit) override
    {
        unit->RemoveAurasDueToSpell(SPELL_VILE_EXPULSION_AT_DAMAGE);
    }

    void OnPeriodicProc() override
    {
        at->SetDuration(0);

        if (Unit* caster = at->GetCaster())
            if (caster->GetMap()->IsHeroic())
                caster->SummonCreature(NPC_ROTTING_SPORE, at->GetPosition(), TEMPSUMMON_CORPSE_DESPAWN);
    }
};

void AddSC_boss_unbound_abomination()
{
    RegisterCreatureAI(boss_unbound_abomination);
    RegisterCreatureAI(npc_underrot_titan_keeper_hezrel);
    RegisterCreatureAI(npc_underrot_blood_visage);
    RegisterCreatureAI(npc_underrot_rotting_spore);

    RegisterAuraScript(aura_unbound_abomination_blood_barrier);
    RegisterSpellScript(spell_underrot_vile_expulsion);
    RegisterSpellScript(spell_underrot_cleansing_light);

    RegisterAreaTriggerAI(at_underrot_vile_expulsion);
}
