/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
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

#ifndef TRINITYCORE_AREATRIGGER_H
#define TRINITYCORE_AREATRIGGER_H

#include "Object.h"
#include "MapObject.h"
#include "AreaTriggerTemplate.h"

class AuraEffect;
class AreaTriggerAI;
class SpellInfo;
class Unit;

namespace G3D
{
    class Vector2;
    class Vector3;
}
namespace Movement
{
    template<typename length_type>
    class Spline;
}

typedef std::list<AreaTrigger*> AreaTriggerList;

class TC_GAME_API AreaTrigger : public WorldObject, public GridObject<AreaTrigger>, public MapObject
{
    public:
        AreaTrigger();
        ~AreaTrigger();

    protected:
        void BuildValuesCreate(ByteBuffer* data, Player const* target) const override;
        void BuildValuesUpdate(ByteBuffer* data, Player const* target) const override;
        void ClearUpdateMask(bool remove) override;

    public:
        void BuildValuesUpdateForPlayerWithMask(UpdateData* data, UF::ObjectData::Mask const& requestedObjectMask,
            UF::AreaTriggerData::Mask const& requestedAreaTriggerMask, Player const* target) const;

        void AddToWorld() override;
        void RemoveFromWorld() override;

        void AI_Initialize();
        void AI_Destroy();

        AreaTriggerAI* AI() { return _ai.get(); }

    private:
        bool Create(uint32 spellMiscId, Unit* caster, Unit* target, SpellInfo const* spell, Position const& pos, int32 duration, SpellCastVisual spellVisual, ObjectGuid const& castId, AuraEffect const* aurEff, AreaTriggerOrbitInfo* customOrbitInfo = nullptr);
        bool CreateStaticAreaTrigger(uint32 entry, ObjectGuid::LowType guidLow, Position const& p_Pos, Map* p_Map, uint32 scriptId = 0);
    public:
        static AreaTrigger* CreateAreaTrigger(uint32 spellMiscId, Unit* caster, Unit* target, SpellInfo const* spell, Position const& pos, int32 duration, SpellCastVisual spellVisual, ObjectGuid const& castId = ObjectGuid::Empty, AuraEffect const* aurEff = nullptr);
        static AreaTrigger* CreateAreaTrigger(uint32 spellMiscId, Unit* caster, uint32 spellId, Position const& pos, int32 duration, float radius, float angle, uint32 timeToTarget, bool canLoop = true, bool counterClockwise = false);
        bool LoadFromDB(ObjectGuid::LowType guid, Map* map, bool addToMap, bool allowDuplicate);

        void Update(uint32 diff) override;
        void Remove();
        bool IsRemoved() const { return _isRemoved; }
        uint32 GetSpellId() const { return m_areaTriggerData->SpellID; }
        AuraEffect const* GetAuraEffect() const { return _aurEff; }
        uint32 GetTimeSinceCreated() const { return _timeSinceCreated; }

        uint32 GetTimeToTarget() const { return m_areaTriggerData->TimeToTarget; }
        void SetTimeToTarget(uint32 timeToTarget) { SetUpdateFieldValue(m_values.ModifyValue(&AreaTrigger::m_areaTriggerData).ModifyValue(&UF::AreaTriggerData::TimeToTarget), timeToTarget); }

        uint32 GetTimeToTargetScale() const { return m_areaTriggerData->TimeToTargetScale; }
        void SetTimeToTargetScale(uint32 timeToTargetScale) { SetUpdateFieldValue(m_values.ModifyValue(&AreaTrigger::m_areaTriggerData).ModifyValue(&UF::AreaTriggerData::TimeToTargetScale), timeToTargetScale); }

        void UpdateTimeToTarget(uint32 timeToTarget);
        int32 GetDuration() const { return _duration; }
        int32 GetTotalDuration() const { return _totalDuration; }
        void SetDuration(int32 newDuration);
        void Delay(int32 delaytime) { SetDuration(GetDuration() - delaytime); }
        void SetPeriodicProcTimer(uint32 periodicProctimer) { _basePeriodicProcTimer = periodicProctimer; _periodicProcTimer = periodicProctimer; }

        GuidUnorderedSet const& GetInsideUnits() const { return _insideUnits; }

        AreaTriggerMiscTemplate const* GetMiscTemplate() const { return _areaTriggerMiscTemplate; }
        AreaTriggerTemplate const* GetTemplate() const;
        ObjectGuid::LowType GetSpawnId() const { return _spawnId; }
        uint32 GetScriptId() const;

        ObjectGuid const& GetCasterGuid() const { return m_areaTriggerData->Caster; }
        Unit* GetCaster() const;
        Unit* GetTarget() const;

        Position const& GetRollPitchYaw() const;
        Position const& GetTargetRollPitchYaw() const;
        void InitSplineOffsets(std::vector<Position> const& offsets, uint32 timeToTarget);
        void InitSplines(std::vector<G3D::Vector3> splinePoints, uint32 timeToTarget);
        bool HasSplines() const;
        bool SetDestination(Position const& pos, uint32 timeToTarget);
        ::Movement::Spline<int32> const& GetSpline() const { return *_spline; }
        uint32 GetElapsedTimeForMovement() const { return GetTimeSinceCreated(); } /// @todo: research the right value, in sniffs both timers are nearly identical

        void InitOrbit(AreaTriggerOrbitInfo const& cmi, uint32 timeToTarget);
        bool HasOrbit() const;
        Optional<AreaTriggerOrbitInfo> const& GetCircularMovementInfo() const { return _orbitInfo; }

        void SetDecalPropertiesID(uint32 decalPropertiesID);
        void SetSpellXSpellVisualId(uint32 spellXSpellVisualId);

        void UpdateShape();

        UF::UpdateField<UF::AreaTriggerData, 0, TYPEID_AREATRIGGER> m_areaTriggerData;

    protected:
        void _UpdateDuration(int32 newDuration);
        float GetProgress() const;

        void UpdateTargetList();
        void SearchUnitInSphere(std::list<Unit*>& targetList);
        void SearchUnitInBox(std::list<Unit*>& targetList);
        void SearchUnitInPolygon(std::list<Unit*>& targetList);
        void SearchUnitInCylinder(std::list<Unit*>& targetList);
        bool CheckIsInPolygon2D(Position const* pos) const;
        void HandleUnitEnterExit(std::list<Unit*> const& targetList);

        float GetCurrentTimePercent();

        void DoActions(Unit* unit);
        void UndoActions(Unit* unit);

        void UpdatePolygonOrientation();
        void UpdateOrbitPosition(uint32 diff);
        void UpdateSplinePosition(uint32 diff);

        Position const* GetOrbitCenterPosition() const;
        Position CalculateOrbitPosition() const;

        void DebugVisualizePosition(); // Debug purpose only

        ObjectGuid _targetGuid;

        AuraEffect const* _aurEff;

        int32 _duration;
        int32 _totalDuration;
        uint32 _timeSinceCreated;
        uint32 _periodicProcTimer;
        uint32 _basePeriodicProcTimer;
        float _previousCheckOrientation;
        bool _isBeingRemoved;
        bool _isRemoved;

        std::vector<Position> _polygonVertices;
        std::unique_ptr<::Movement::Spline<int32>> _spline;

        bool _reachedDestination;
        int32 _lastSplineIndex;
        uint32 _movementTime;

        AreaTriggerTemplate const* _areaTriggerTemplate;
        Optional<AreaTriggerOrbitInfo> _orbitInfo;

        AreaTriggerMiscTemplate const* _areaTriggerMiscTemplate;
        GuidUnorderedSet _insideUnits;

        ObjectGuid::LowType _spawnId;
        uint32 _guidScriptId;
        std::unique_ptr<AreaTriggerAI> _ai;

        ObjectGuid _circularMovementCenterGUID;
        Position _circularMovementCenterPosition;
};

#endif
