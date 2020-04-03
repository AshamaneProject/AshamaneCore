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

#ifndef THE_ARCWAY_H
#define THE_ARCWAY_H

#define ArcwayScriptName "instance_the_arcway"
#define ArcwayMapId 1516
#define ArcwayDataHeaders "ARCWAY"

constexpr uint8 EncounterCount = 5;

enum ArcwayDataTypes
{
    DATA_CORSTILAX              = 0,
    DATA_GENERAL_XAKAL          = 1,
    DATA_NALTIRA                = 2,
    DATA_IVANYR                 = 3,
    DATA_ADVISOR_VANDROS        = 4,

    DATA_NIGHTWELL            = 1,
    DATA_NIGHTWELL_REMOVE    = 2,
};

enum ArcwayCreatureIds
{
    BOSS_ADVISOR_VANDROS    = 98208,
    BOSS_GENERAL_XAKAL      = 98206,
    BOSS_IVANYR             = 98203,
    BOSS_NALTIRA            = 98207,
    NPC_CORSTILAX           = 98205,
    NPC_DESTABILIZED_ORB    = 110863,    // Used in Corstilax encounter.
    NPC_QUARANTINE          = 99560        // Corstilax
};

struct NonMeleeTargetSelector : public std::unary_function<Unit*, bool>
{
    public:
        NonMeleeTargetSelector(Unit* source, bool playerOnly = true) : _source(source), _playerOnly(playerOnly) { }
        bool operator()(Unit const* target) const
        {
             if (!target)
                return false;

            if (_playerOnly && target->GetTypeId() != TYPEID_PLAYER)
                return false;

            return !_source->IsWithinMeleeRange(target);
        }

    private:
        Unit* _source;
        bool _playerOnly;
};

using SpellTargets = std::list<WorldObject*>;

#endif /* THE_ARCWAY_H */
