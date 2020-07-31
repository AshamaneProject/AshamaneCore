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
#include "ScriptedGossip.h"
#include "vault_of_the_wardens.h"

enum Spells
{
    SPELL_ELUNES_LIGHT = 201359,

    SPELL_DEEPENING_SHADOWS = 213583,
    SPELL_DETONATION = 197541,
    SPELL_FEL_GLAIVE = 197333,
    SPELL_KNOCKDOWN_KICK = 214989, //197251,
    SPELL_TURN_KICK = 197250,

    SPELL_SHADOWSTEP = 197823,
    SPELL_VENGEANCE = 205004,//to do
    //
    SPELL_CREEPING_DOOM = 213685,

    //remove
    SPELL_ELUNES_LIGHT_2 = 192656,
    SPELL_ELUNES_LIGHT_AURA = 197941,
};

enum Events
{
    // Intro
    EVENT_INTRO = 1,
    EVENT_DIE_INTRO = 2,
};

enum Phases
{
    PHASE_1,
    PHASE_2,
    PHASE_INTRO
};

struct boss_cordana_felsong : public BossAI
{
    boss_cordana_felsong(Creature* creature) : BossAI(creature, DATA_CORDANA) { Initialize(); }

    void Initialize()
    {
        PhaseStatus = Phases::PHASE_INTRO;
        hp40 = false;
    }

    void Reset() override
    {
        _Reset();
        hp40 = false;
    }

    void JustDied(Unit* /*killer*/) override
    {
        _JustDied();
        instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_ELUNES_LIGHT_2);
        instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_ELUNES_LIGHT_AURA);
        //https://cn.wowhead.com/currency=1314/ÅÇ»²Ö®»êËéÆ¬
        instance->DoModifyPlayerCurrencies(1314, 1);
        if (Creature* delanni = me->FindNearestCreature(103860, 100.0f, true))
            delanni->AI()->DoAction(1);
    }

    void ScheduleTasks() override
    {
        events.ScheduleEvent(SPELL_KNOCKDOWN_KICK, 5000);
        events.ScheduleEvent(SPELL_DEEPENING_SHADOWS, 5000);
        events.ScheduleEvent(SPELL_DETONATION, 5000);
        events.ScheduleEvent(SPELL_FEL_GLAIVE, 5000);

        events.ScheduleEvent(SPELL_SHADOWSTEP, 60000);
    }

    void ExecuteEvent(uint32 eventId) override
    {
        if (!hp40 && HealthBelowPct(40))
        {
            hp40 = true;
            if (IsHeroic() || IsMythic() || IsChallengeMode())
                events.ScheduleEvent(SPELL_CREEPING_DOOM, 1000);
        }
        switch (eventId)
        {
        case SPELL_KNOCKDOWN_KICK:
        {
            DoCast(SPELL_KNOCKDOWN_KICK);
            events.Repeat(10s);
            break;
        }
        case SPELL_DEEPENING_SHADOWS:
        {
            if (Unit* target1 = SelectTarget(SELECT_TARGET_RANDOM, 0.0, 0.0, true))
                me->CastSpell(target1, SPELL_DEEPENING_SHADOWS, false);
            events.Repeat(10s);
            break;
        }
        case SPELL_DETONATION:
        {
            DoCast(SPELL_DETONATION);
            events.Repeat(10s);
            break;
        }
        case SPELL_FEL_GLAIVE:
        {
            DoCast(SPELL_FEL_GLAIVE);
            events.Repeat(10s);
            break;
        }
        case SPELL_SHADOWSTEP:
        {
            DoCast(SPELL_SHADOWSTEP);
            events.Repeat(120s);
            break;
        }
        case SPELL_CREEPING_DOOM:
        {
            DoCast(SPELL_CREEPING_DOOM);
            events.Repeat(70000s);
            break;
        }
        default:
            break;
        }
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (!who || !me->IsWithinDist(who, 150.0f, false))
            return;

        Player* player = who->GetCharmerOrOwnerPlayerOrPlayerItself();
        if (!player)
            return;
        if (!IsLock)
        {
            IsLock = true;
            instance->DoPlayConversation(831);
            me->GetScheduler().Schedule(Milliseconds(5000), [](TaskContext context)
            {
                GetContextCreature()->RemoveUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC));
            });
        }
    }

    uint8 PhaseStatus;
    bool hp40;
};


struct npc_drelanim_whisperwind_103860 : public ScriptedAI
{
    npc_drelanim_whisperwind_103860(Creature* creature) : ScriptedAI(creature) { Initialize(); }

    void DoAction(int32 param)
    {
        switch (param)
        {
        case 1:
            me->SetHomePosition(Position(4050.29f, -297.5246f, -281.5895f, 0.0746f));
            me->GetMotionMaster()->MoveTargetedHome();
            me->GetScheduler().Schedule(Milliseconds(6000), [this](TaskContext context)
            {
                Talk(0);
                me->AddNpcFlag(UNIT_NPC_FLAG_GOSSIP);
                IsComplete = true;
            });
            break;
        }
    }

    bool GossipHello(Player* player) override
    {
        if (IsComplete)
        {
            ClearGossipMenuFor(player);
            player->TeleportTo(1220, Position(-1809.0f, 6670.0f, 148.0f));
        }

        return false;
    }

    void Initialize()
    {
        instance = me->GetInstanceScript();
        IsComplete = false;
    }

private:
    InstanceScript * instance;
    bool IsComplete;
};


void AddSC_boss_cordana_felsong()
{
    RegisterCreatureAI(boss_cordana_felsong);
    RegisterCreatureAI(npc_drelanim_whisperwind_103860);
}
