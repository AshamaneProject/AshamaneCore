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

#ifndef _AREA_H
#define _AREA_H

#include "ZoneScript.h"
#include "DB2Structure.h"

class Area;
class ZoneScript;

class TC_GAME_API AreaMgr
{
public:
    static AreaMgr* instance();

    Area* GetArea(uint32 areaId);

private:
    std::map<uint32, Area*> m_areas;
};

#define sAreaMgr AreaMgr::instance()

class TC_GAME_API Area
{
public:
    Area(AreaTableEntry const* areaTableEntry): m_areaTableEntry(areaTableEntry) { }

    AreaTableEntry const* GetEntry() const { return m_areaTableEntry; }
    uint32 GetId() const { return GetEntry()->ID; }

    bool IsArea() const { return m_areaTableEntry->ParentAreaID != 0; }
    bool IsZone() const { return m_areaTableEntry->ParentAreaID == 0; }

    Area* GetZone();
    std::vector<Area*> GetTree();

private:
    AreaTableEntry const* m_areaTableEntry;
    ZoneScript* m_zoneScript;
};

#endif
