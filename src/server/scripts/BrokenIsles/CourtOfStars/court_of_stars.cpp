/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Vehicle.h"

constexpr uint32 PATH_TO_PLAYERS    = 10526410;
constexpr uint32 PATH_TO_DOCK       = 10526411;

enum Spells
{
    SPELL_SUMMON_NARRATOR       = 215170,
    SPELL_SIGNAL_LANTERN        = 209524,
    SPELL_FORCE_RIDE_VEHICLE    = 213507,
    SPELL_TELEPORT_VISUAL       = 83369,
};

enum Events
{
    EVENT_ABORD_BOAT = 1,
    EVENT_MOVE_POINT = 2,
};

enum Points
{
    POINT_DOCK  = 14,
    POINT_PLAYER = 10,
};

const Position TeleportDockPos = { 971.646f, 3453.642f, 2.114042f, 5.427017f };

class npc_cos_nightborne_boat : public CreatureScript
{
    public:
        npc_cos_nightborne_boat() : CreatureScript("npc_cos_nightborne_boat")
        {}

        struct npc_cos_nightborne_boat_AI : public ScriptedAI
        {
            explicit npc_cos_nightborne_boat_AI(Creature* creature) : ScriptedAI(creature)
            {
                _notPassenger = false;
                _pathId = 0;
                me->SetCollision(true);
                me->SetWaterWalking(true);
                me->AddUnitMovementFlag(MOVEMENTFLAG_FORWARD | MOVEMENTFLAG_WATERWALKING);
                me->AddExtraUnitMovementFlag(MOVEMENTFLAG2_NO_STRAFE | MOVEMENTFLAG2_NO_JUMPING | MOVEMENTFLAG2_VEHICLE_PASSENGER_IS_TRANSITION_ALLOWED);
            }

            void IsSummonedBy(Unit* summoner) override
            {
                if (!summoner)
                    return;

                _summoner = summoner->GetGUID();
                me->SetOrientation(5.348283f);

                me->GetMotionMaster()->MovePath(PATH_TO_PLAYERS, false);
            }

            void MovementInform(uint32 type, uint32 id) override
            {
                if (type == WAYPOINT_MOTION_TYPE)
                {
                    if (id == POINT_PLAYER && !_notPassenger)
                    {
                        Player* ptr = ObjectAccessor::GetPlayer(*me, _summoner);

                        if (ptr)
                        {
                            _notPassenger = true;
                            _events.ScheduleEvent(EVENT_ABORD_BOAT, Seconds(1));
                        }

                    }
                    else if (id == POINT_DOCK)
                    {
                        Player* ptr = ObjectAccessor::GetPlayer(*me, _summoner);

                        if (ptr)
                        {
                            ptr->RemoveAurasDueToSpell(SPELL_FORCE_RIDE_VEHICLE);
                            ptr->NearTeleportTo(TeleportDockPos, true);
                            ptr->CastSpell(ptr, SPELL_TELEPORT_VISUAL, true);
                            ptr->SetWaterWalking(false);
                            me->StopMoving();
                            me->DespawnOrUnsummon(500);
                        }
                    }
                }
            }

            void PassengerBoarded(Unit* passenger, int8 /*seatId*/, bool /*apply*/)
            {
                if (!passenger)
                    return;

                me->GetMotionMaster()->MovePath(PATH_TO_DOCK, false);
            }

            void UpdateAI(uint32 diff) override
            {
                _events.Update(diff);

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    if (eventId == EVENT_ABORD_BOAT)
                    {
                        Player* ptr = ObjectAccessor::GetPlayer(*me, _summoner);

                        if (ptr)
                        {
                            ptr->SetWaterWalking(true);
                            ptr->CastSpell(me, SPELL_FORCE_RIDE_VEHICLE, true);
                        }
                    }
                }
            }

            private:
                uint32 _pathId;
                EventMap _events;
                bool _notPassenger;
                ObjectGuid _summoner;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_cos_nightborne_boat_AI(creature);
        }
};

class npc_cos_signal_lantern : public CreatureScript
{
    public:
        npc_cos_signal_lantern() : CreatureScript("npc_cos_signal_lantern")
        {}

        bool OnGossipHello(Player* player, Creature* creature) override
        {
            if (!player || !creature)
                return false;

            player->PrepareGossipMenu(creature, creature->GetCreatureTemplate()->GossipMenuId, false);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Send a signal to Ly'leth Lunastre.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
        }

        bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 sender, uint32 action) override
        {
            if (!player)
                return false;

            if (action != GOSSIP_ACTION_INFO_DEF + 1)
                return false;

            ClearGossipMenuFor(player);
            player->CastSpell(player, SPELL_SIGNAL_LANTERN, false);
            CloseGossipMenuFor(player);
            return true;
        }
};

void AddSC_court_of_stars()
{
    new npc_cos_nightborne_boat();
    new npc_cos_signal_lantern();
}
