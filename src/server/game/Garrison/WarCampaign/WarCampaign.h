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

#ifndef WarCampaign_h__
#define WarCampaign_h__

#include "Player.h"
#include "Garrison.h"

class GameObject;
class Map;

class TC_GAME_API WarCampaign : public Garrison
{
public:

    explicit WarCampaign(Player* owner);
    ~WarCampaign() {};

    bool LoadFromDB() override;
    void SaveToDB(CharacterDatabaseTransaction& trans) override;

    bool Create(uint32 garrSiteId) override;
    void Delete() override;

    bool IsAllowedArea(AreaTableEntry const* area) const override;
};

#endif // WarCampaign_h__
