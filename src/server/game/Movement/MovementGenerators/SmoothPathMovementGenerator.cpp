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

#include "SmoothPathMovementGenerator.h"
#include "ObjectMgr.h"
#include "Transport.h"
#include "MapManager.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "CreatureGroups.h"
#include "Player.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Creature.h"
#include "Map.h"
#include "PathGenerator.h"

void SmoothPathMovementGenerator<Creature>::LoadPath(Creature* creature)
{
    if (!i_path)
    {
		i_path = sSmartWaypointMgr->GetPath(_pathId);
        if (!i_path || i_path->empty())
			TC_LOG_ERROR("sql.sql", "SmoothPathMovementGenerator::LoadPath: creature %s (%s DB GUID: " UI64FMTD ") doesn't have waypoint path id: %u", creature->GetName().c_str(), creature->GetGUID().ToString().c_str(), creature->GetSpawnId(), _pathId);
        return;
    }

    StartMoveNow(creature);
}

void SmoothPathMovementGenerator<Creature>::DoInitialize(Creature* creature)
{
    LoadPath(creature);
    creature->AddUnitState(UNIT_STATE_ROAMING|UNIT_STATE_ROAMING_MOVE);
}

void SmoothPathMovementGenerator<Creature>::DoFinalize(Creature* creature)
{
    creature->ClearUnitState(UNIT_STATE_ROAMING|UNIT_STATE_ROAMING_MOVE);
    creature->SetWalk(false);
}

void SmoothPathMovementGenerator<Creature>::DoReset(Creature* creature)
{
    creature->AddUnitState(UNIT_STATE_ROAMING|UNIT_STATE_ROAMING_MOVE);
    StartMoveNow(creature);
}

void SmoothPathMovementGenerator<Creature>::OnArrived(Creature* creature)
{
    if (!i_path || i_path->empty())
        return;
    if (m_isArrivalDone)
        return;

    m_isArrivalDone = true;

    // Inform script
    MovementInform(creature);
    creature->UpdateWaypointID(i_currentNode);
}

bool SmoothPathMovementGenerator<Creature>::StartMove(Creature* creature)
{
	if (!i_path || i_path->empty())
        return false;

    if (Stopped() || stay)
        return true;

    bool transportPath = creature->GetTransport() != NULL;

    WayPoint lastNode = i_path->at(i_currentNode);
    
    if (m_isArrivalDone)
    {
        if ((i_currentNode == i_path->size() - 1) && !repeating) // If that's our last waypoint
        {
            float x = i_path->at(i_currentNode).x;
            float y = i_path->at(i_currentNode).y;
            float z = i_path->at(i_currentNode).z;
            float o = creature->GetOrientation();

            if (!transportPath)
                creature->SetHomePosition(x, y, z, o);
            else
            {
                if (Transport* trans = creature->GetTransport())
                {
                    o -= trans->GetOrientation();
                    creature->SetTransportHomePosition(x, y, z, o);
                    trans->CalculatePassengerPosition(x, y, z, &o);
                    creature->SetHomePosition(x, y, z, o);
                }
                else
                    transportPath = false;
                // else if (vehicle) - this should never happen, vehicle offsets are const
            }

            creature->GetMotionMaster()->Initialize();
            return false;
        }

        i_currentNode = (i_currentNode+1) % i_path->size();
    }

    WayPoint node = i_path->at(i_currentNode);
    
    m_isArrivalDone = false;

    creature->AddUnitState(UNIT_STATE_ROAMING_MOVE);

    Movement::Location formationDest(node.x, node.y, node.z, 0.0f);
    Movement::MoveSplineInit init(creature);

    //! If creature is on transport, we assume waypoints set in DB are already transport offsets
    if (transportPath)
    {
        init.DisableTransportPathTransformations();
        if (TransportBase* trans = creature->GetDirectTransport())
            trans->CalculatePassengerPosition(formationDest.x, formationDest.y, formationDest.z, &formationDest.orientation);
    }

    if (node.id != lastNode.id)
    {
        PathGenerator pathgen(creature);
        pathgen.CalculatePath(lastNode.x, lastNode.y, lastNode.z, node.x, node.y, node.z);
        pathgen.AddPathStartPoint(creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ());
        init.MovebyPath(pathgen.GetPath());
    }
    else
    {
        //! Do not use formationDest here, MoveTo requires transport offsets due to DisableTransportPathTransformations() call
        //! but formationDest contains global coordinates
        init.MoveTo(node.x, node.y, node.z);
    }

    // TODO init.SetFacing if path has end orientation
	init.SetWalk(walk);
    init.Launch();

    timeTo = creature->movespline->Duration();

    //Call for creature group update
    if (creature->GetFormation() && creature->GetFormation()->getLeader() == creature)
    {
		creature->SetWalk(walk);
        creature->GetFormation()->LeaderMoveTo(formationDest.x, formationDest.y, formationDest.z);
    }

    return true;
}

bool SmoothPathMovementGenerator<Creature>::DoUpdate(Creature* creature, uint32 diff)
{
    // Waypoint movement can be switched on/off
    // This is quite handy for escort quests and other stuff
    if (creature->HasUnitState(UNIT_STATE_NOT_MOVE))
    {
        creature->ClearUnitState(UNIT_STATE_ROAMING_MOVE);
        return true;
    }
    // prevent a crash at empty waypoint path.
	if (!i_path || i_path->empty())
        return false;

    if (stay)
        return true;

    if (Stopped())
    {
        if (CanMove(diff))
            return StartMove(creature);
    }
    else
    {
        // Set home position at place on waypoint movement.
        if (!creature->GetTransGUID())
            creature->SetHomePosition(creature->GetPosition());

        if (creature->IsStopped())
            Stop(sWorld->getIntConfig(CONFIG_CREATURE_STOP_FOR_PLAYER));
        else
        {
            bool arrived = false;
            if (timeTo <= diff + 800)
            {
                arrived = true;
            } else timeTo -= diff;

            if (!arrived)
            {
                WayPoint node = i_path->at(i_currentNode);
                float dist = creature->GetDistance(node.x, node.y, node.z);
                if (dist <= 2.0f)
                    arrived = true;
            }
            if (arrived)
            {
                OnArrived(creature);
                return StartMove(creature);
            }
        }
    }
     return true;
 }

void SmoothPathMovementGenerator<Creature>::MovementInform(Creature* creature)
{
    // We only signal waypoint reached at path end!
    if ((i_currentNode == i_path->size() - 1))
    {
		if (!repeating)
		{
			if (creature->AI())
				creature->AI()->MovementInform(WAYPOINT_MOTION_TYPE, i_currentNode);
		}
    }
}

bool SmoothPathMovementGenerator<Creature>::GetResetPos(Creature*, float& x, float& y, float& z)
{
    // prevent a crash at empty waypoint path.
	if (!i_path || i_path->empty())
        return false;

    WayPoint node = i_path->at(i_currentNode);
    x = node.x;
	y = node.y;
	z = node.z;
    return true;
}

void SmoothPathMovementGenerator<Creature>::Resume()
{
    Stop(0);
    stay = false;
}

void SmoothPathMovementGenerator<Creature>::Pause(uint32 time)
{
    Stop(time);
}

void SmoothPathMovementGenerator<Creature>::Stay()
{
    stay = true;
}
