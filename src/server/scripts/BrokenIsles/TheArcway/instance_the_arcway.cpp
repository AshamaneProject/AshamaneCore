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
#include "InstanceScript.h"
#include "the_arcway.h"

class instance_the_arcway : public InstanceMapScript
{
public:
    instance_the_arcway() : InstanceMapScript(ArcwayScriptName, ArcwayMapId) { }

    struct instance_the_arcway_InstanceMapScript : public InstanceScript
    {
    public:
        instance_the_arcway_InstanceMapScript(InstanceMap *map) : InstanceScript(map)
        {
            SetHeaders(ArcwayDataHeaders);
            SetBossNumber(EncounterCount);
        }

        void OnCreatureCreate(Creature *creature)
        {
            switch (creature->GetEntry())
            {
            case NPC_CORSTILAX:
                corstilaxGUID = creature->GetGUID();
                break;
            }
        }

    protected:
        ObjectGuid corstilaxGUID;
    };

    InstanceScript *GetInstanceScript(InstanceMap *map) const override
    {
        return new instance_the_arcway_InstanceMapScript(map);
    }
};

void AddSC_instance_the_arcway()
{
    new instance_the_arcway();
}
