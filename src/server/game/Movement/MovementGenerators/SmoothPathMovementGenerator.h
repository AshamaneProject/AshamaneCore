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

#ifndef TRINITY_SMOOTHTPATHMOVEMENTGENERATOR_H
#define TRINITY_SMOOTHTPATHMOVEMENTGENERATOR_H

/** @page PathMovementGenerator is used to generate movements
 * of waypoints and flight paths.  Each serves the purpose
 * of generate activities so that it generates updated
 * packets for the players.
 */

#include "MovementGenerator.h"
#include "WaypointManager.h"
#include "Player.h"
#include "SmartScriptMgr.h"
#include "World.h"

#define TIMEDIFF_NEXT_WP      250

template<class T>
class SmoothPathMovementGenerator;

template<>
class SmoothPathMovementGenerator<Creature> : public MovementGeneratorMedium< Creature, SmoothPathMovementGenerator<Creature> >
{
    public:
		SmoothPathMovementGenerator(uint32 pathId, bool _repeating = false, bool _walk = false)
            : i_nextMoveTime(0), m_isArrivalDone(false), _pathId(pathId), repeating(_repeating), walk(_walk), paused(false), i_currentNode(0), timeTo(0), stay(false), i_path(nullptr) { }
        ~SmoothPathMovementGenerator() { }
        void DoInitialize(Creature*);
        void DoFinalize(Creature*);
        void DoReset(Creature*);
        bool DoUpdate(Creature*, uint32 diff);

        void MovementInform(Creature*);
        MovementGeneratorType GetMovementGeneratorType() const override { return WAYPOINT_MOTION_TYPE; }

        // now path movement implmementation
        void LoadPath(Creature*);

        bool GetResetPos(Creature*, float& x, float& y, float& z);

        void Resume() override;
        void Pause(uint32 time) override;
        void Stay() override;

    private:

        void Stop(int32 time) { i_nextMoveTime.Reset(time);}

        bool Stopped() { return !i_nextMoveTime.Passed();}

        bool CanMove(int32 diff)
        {
            i_nextMoveTime.Update(diff);
            return i_nextMoveTime.Passed();
        }

        void OnArrived(Creature*);
        bool StartMove(Creature*);

        void StartMoveNow(Creature* creature)
        {
            i_nextMoveTime.Reset(0);
            StartMove(creature);
        }

        TimeTrackerSmall i_nextMoveTime;
        bool m_isArrivalDone;
        bool repeating;
		bool walk;
        bool paused;
        bool stay;

		uint32 _pathId;
		WPPath const* i_path;
        uint32 i_currentNode;
        uint32 timeTo;
};

#endif
