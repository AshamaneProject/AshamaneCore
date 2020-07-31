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
#include "ScriptedCreature.h"
#include "ScriptMgr.h"
#include "ScriptedGossip.h"
#include "emerald_nightmare.h"
#include "Log.h"

struct npc_malfurion_stormrage_106482 : public ScriptedAI
{
    npc_malfurion_stormrage_106482(Creature* creature) : ScriptedAI(creature) { Initialize(); }

    void Initialize()
    {
        IsLock = false;
        instance = me->GetInstanceScript();
        me->AddNpcFlag(UNIT_NPC_FLAG_GOSSIP);
    }
    //cast 214713,212630,212639
    void DoAction(int32 param)
    {
        switch (param)
        {
        case 1:
            if (Creature* target = me->FindNearestCreature(104636, 1000.0f, true))
            {
                me->NearTeleportTo(Position(11362.3f, -12698.02f, 487.034f));
                me->GetScheduler().Schedule(Milliseconds(2000), [this, target](TaskContext context)
                {
                    me->RemoveAurasDueToSpell(223184);
                    me->SetFacingToObject(target);
                    me->SetHomePosition(me->GetPosition());
                });
            }
            else
            {
                Talk(0);
                me->GetScheduler().Schedule(Milliseconds(2000), [this](TaskContext context)
                {
                    Talk(1);
                });
            }
            break;
        case 2:
            me->CastSpell(me, 225790, true);
            Talk(2);
            me->GetScheduler().Schedule(Milliseconds(4000), [this](TaskContext context)
            {
                Talk(3);
            });
            me->GetScheduler().Schedule(Milliseconds(6000), [this](TaskContext context)
            {
                Talk(4);
            });
            me->GetScheduler().Schedule(Milliseconds(8000), [this](TaskContext context)
            {
                Talk(5);
            });
            break;
        }
    }

    bool GossipHello(Player* player) override
    {

        ClearGossipMenuFor(player);
        std::string tempstr;
        consoleToUtf8("¿ªÊ¼", tempstr);
        AddGossipItemFor(player, GOSSIP_ICON_CHAT, tempstr, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        SendGossipMenuFor(player, player->GetGossipTextId(me), me->GetGUID());

        return false;
    }

    bool GossipSelect(Player* player, uint32 /*menuId*/, uint32 gossipListId)
    {
        CloseGossipMenuFor(player);
        if (instance)
            player->TeleportTo(1520, Position(11196.4f, -12614.2f, 549.707f, 20.4509f));

        return false;
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (!who || !who->IsInWorld() || !me->IsWithinDist(who, 15.0f, false))
            return;

        Player* player = who->GetCharmerOrOwnerPlayerOrPlayerItself();
        if (!player || !instance)
            return;

        if (!IsLock && instance->GetBossState(DATA_URSOC) != DONE && instance->GetBossState(DATA_ILGYNOTH) != DONE && instance->GetBossState(DATA_ELERETHE_RENFERAL) != DONE && instance->GetBossState(DATA_DRAGONS_OF_NIGHTMARE) != DONE)
        {
            IsLock = true;
            instance->DoPlayConversation(3608);
            SetUnlock(120000);
        }
        if (!IsLock && instance->GetBossState(DATA_URSOC) == DONE && instance->GetBossState(DATA_ILGYNOTH) == DONE && instance->GetBossState(DATA_ELERETHE_RENFERAL) == DONE && instance->GetBossState(DATA_DRAGONS_OF_NIGHTMARE) == DONE)
        {
            IsLock = true;
            instance->DoPlayConversation(3620);
            SetUnlock(120000);
        }
        if (!IsLock && instance->GetBossState(DATA_CENARIUS) != DONE)
        {
            IsLock = true;
            DoAction(1);
            SetUnlock(120000);
        }
    }
private:
    InstanceScript * instance;
};

enum
{
    SPELL_CRUSH_ARMOR = 223912,
    SPELL_INTIMIDATING_ROAR = 223914,
};
struct npc_bolan_the_marked_111860 : public ScriptedAI
{
    npc_bolan_the_marked_111860(Creature* creature) : ScriptedAI(creature) { }

    void EnterCombat(Unit* victim)
    {
        events.ScheduleEvent(SPELL_CRUSH_ARMOR, 3s, 5s);
    }

    void DamageTaken(Unit* /*attacker*/, uint32& damage) override
    {
        if(me->HealthWillBeBelowPctDamaged(40, damage))
            events.ScheduleEvent(SPELL_INTIMIDATING_ROAR, 2s);
    }

    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);

        if (!UpdateVictim())
            return;

        if (me->HasUnitState(UNIT_STATE_CASTING))
           return;

        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case SPELL_CRUSH_ARMOR:
            {
                DoCast(SPELL_CRUSH_ARMOR);
                events.Repeat(12s, 15s);
                break;
            }
            case SPELL_INTIMIDATING_ROAR:
            {
                DoCast(SPELL_INTIMIDATING_ROAR);
                events.Repeat(22s, 25s);
                break;
            }
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_corrupted_feeler_113088 : public ScriptedAI
{
    npc_corrupted_feeler_113088(Creature* creature) : ScriptedAI(creature) {}

    void Reset() override
    {
        SetCombatMovement(false);
    }

    enum Spells
    {
        SPELL_CORRUPT = 225042,
    };

    void EnterCombat(Unit* /*attacker*/) override
    {
        events.ScheduleEvent(SPELL_CORRUPT, 5s);
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;
        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;
        events.Update(diff);
        switch (events.ExecuteEvent())
        {
        case SPELL_CORRUPT:
        {
            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.f, true))
                me->CastSpell(target, SPELL_CORRUPT, true);
            events.Repeat(12s, 15s);
            break;
        }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_flail_of_ilgynoth_113920 : public ScriptedAI
{
    npc_flail_of_ilgynoth_113920(Creature* creature) : ScriptedAI(creature) {}

    void Reset() override
    {
        SetCombatMovement(false);
    }

    enum Spells
    {
        SPELL_SPEW_ICHOR = 226936,
        SPELL_WILD_FLAIL = 226935,
    };

    void EnterCombat(Unit* /*attacker*/) override
    {
        events.ScheduleEvent(SPELL_SPEW_ICHOR, 5s);
        events.ScheduleEvent(SPELL_WILD_FLAIL, 5s, 8s);
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;
        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;
        events.Update(diff);
        switch (events.ExecuteEvent())
        {
        case SPELL_SPEW_ICHOR:
        {
            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.f, true))
                me->CastSpell(target, SPELL_SPEW_ICHOR, true);
            events.Repeat(5s, 8s);
            break;
        }
        case SPELL_WILD_FLAIL:
        {
            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.f, true))
                me->CastSpell(target, SPELL_WILD_FLAIL, true);
            events.Repeat(5s, 8s);
            break;
        }
        }
        DoMeleeAttackIfReady();
    }
};

void AddSC_emerald_nightmare()
{
    RegisterCreatureAI(npc_malfurion_stormrage_106482);
    RegisterCreatureAI(npc_bolan_the_marked_111860);
    RegisterCreatureAI(npc_corrupted_feeler_113088);
    RegisterCreatureAI(npc_flail_of_ilgynoth_113920);
}
