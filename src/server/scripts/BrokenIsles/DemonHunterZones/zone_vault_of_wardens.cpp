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
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "MotionMaster.h"
#include "Vehicle.h"

 // 197180
struct npc_vault_of_the_wardens_sledge_or_crusher : public ScriptedAI
{
    npc_vault_of_the_wardens_sledge_or_crusher(Creature* creature) : ScriptedAI(creature) { }

    enum Quest
    {
        QUEST_STOP_GULDAN_DMG_SPEC = 38723,
        QUEST_STOP_GULDAN_TANK_SPEC = 40253,
    };

    void EnterCombat(Unit*) override
    {

    }

    void JustDied(Unit* /*killer*/) override
    {
        std::list<Player*> players;
        me->GetPlayerListInGrid(players, 50.0f);

        for (Player* player : players)
        {
            player->ForceCompleteQuest(QUEST_STOP_GULDAN_DMG_SPEC);
            player->ForceCompleteQuest(QUEST_STOP_GULDAN_TANK_SPEC);
        }
    }
};

Position const secondStagePath[] =
{
    { 4438.449f, -290.577f, -244.036f },
    { 4444.083f, -301.119f, -239.666f },
    { 4450.647f, -320.770f, -235.952f },
    { 4450.647f, -320.770f, -197.235f },
    { 4450.647f, -320.770f, -158.749f },
    { 4450.647f, -320.770f, -107.313f },
    { 4450.647f, -320.770f, -47.358f },
    { 4450.647f, -320.770f, -5.029f },
    { 4450.647f, -320.770f, 37.068f },
    { 4450.647f, -320.770f, 97.366f },
    { 4450.647f, -320.770f, 127.221f },
    { 4450.647f, -320.770f, 130.252f },
    { 4450.646f, -344.573f, 128.044f }
};

size_t const pathSize = std::extent<decltype(secondStagePath)>::value;

/// 99443
struct npc_vault_of_the_wardens_vampiric_felbat : public ScriptedAI
{
    npc_vault_of_the_wardens_vampiric_felbat(Creature* creature) : ScriptedAI(creature) { }

    enum eFelBal 
    {
        EVENT_START_PATH = 1,
        EVENT_DESPAWN = 2
    };


    void Initialize()
    {
        me->SetCanFly(true);
        me->SetSpeed(MOVE_FLIGHT, 26);
        me->SetReactState(REACT_PASSIVE);
        me->SetMovementAnimKitId(3);
        me->SetSpeed(MOVE_FLIGHT, 75);
    }

    void Reset() override
    {
        _events.Reset();
        Initialize();
        _playerGUID = ObjectGuid::Empty;
    }

    void PassengerBoarded(Unit* passenger, int8 /*seatId*/, bool apply) override
    {
        if (apply && passenger->GetTypeId() == TYPEID_PLAYER) {
            _playerGUID = passenger->ToPlayer()->GetGUID();
            _events.ScheduleEvent(EVENT_START_PATH, Seconds(1));
        }
    }

    void MovementInform(uint32 type, uint32 pointId) override
    {
        if (type == EFFECT_MOTION_TYPE && pointId == pathSize)
            _events.ScheduleEvent(EVENT_DESPAWN, 200);
    }

    void UpdateAI(uint32 diff) override
    {
        _events.Update(diff);

         if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        while (uint32 eventId = _events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_START_PATH:
                me->GetMotionMaster()->MoveSmoothPath(uint32(pathSize), secondStagePath, pathSize, false, true);
                break;
            case EVENT_DESPAWN:
                me->RemoveAllAuras();
                if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID))
                    player->KilledMonsterCredit(96659, ObjectGuid::Empty);
                me->DespawnOrUnsummon();
                break;
            default:
                break;
            }
        }
    }
private:
    EventMap _events;
    ObjectGuid _playerGUID;
};

void AddSC_zone_vault_of_wardens()
{
    RegisterCreatureAI(npc_vault_of_the_wardens_sledge_or_crusher);
    RegisterCreatureAI(npc_vault_of_the_wardens_vampiric_felbat);
}
