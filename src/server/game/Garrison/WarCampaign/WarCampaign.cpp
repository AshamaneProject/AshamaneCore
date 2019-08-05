/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 * Copyright (C) 2008-2017 TrinityCore <http://www.trinitycore.org/>
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

#include "WarCampaign.h"
#include "Creature.h"
#include "DatabaseEnv.h"
#include "GameObject.h"
#include "GarrisonMgr.h"
#include "Log.h"
#include "MapManager.h"
#include "ObjectMgr.h"

WarCampaign::WarCampaign(Player* owner) : Garrison(owner)
{
    _garrisonType = GARRISON_TYPE_WAR_CAMPAIGN;
}

bool WarCampaign::LoadFromDB()
{
    if (!Garrison::LoadFromDB())
        return false;

    return true;
}

void WarCampaign::SaveToDB(CharacterDatabaseTransaction& trans)
{
    Garrison::SaveToDB(trans);
}

bool WarCampaign::Create(uint32 garrSiteId)
{
    if (!Garrison::Create(garrSiteId))
        return false;

    return true;
}

void WarCampaign::Delete()
{
    CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();
    DeleteFromDB(trans);
    CharacterDatabase.CommitTransaction(trans);

    Garrison::Delete();
}

bool WarCampaign::IsAllowedArea(AreaTableEntry const* /*area*/) const
{
    return false;
}
