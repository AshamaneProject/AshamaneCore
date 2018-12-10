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

#include "ScriptMgr.h"
#include "Player.h"
#include "InstanceScript.h"
#include "temple_of_sethraliss.h"

class instance_temple_of_sethraliss : public InstanceMapScript
{
    public:
        instance_temple_of_sethraliss() : InstanceMapScript("instance_temple_of_sethraliss", 1877) { }

        struct instance_temple_of_sethraliss_InstanceMapScript : public InstanceScript
        {
            instance_temple_of_sethraliss_InstanceMapScript(InstanceMap* map) : InstanceScript(map)
            {
                SetHeaders(DataHeader);
                SetBossNumber(EncounterCount);
            }
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_temple_of_sethraliss_InstanceMapScript(map);
        }
};

void AddSC_instance_temple_of_sethraliss()
{
    new instance_temple_of_sethraliss();
}
