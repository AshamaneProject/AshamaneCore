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

#include "AreaBoundary.h"
#include "GameObject.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "the_motherlode.h"


struct instance_the_motherlode : public InstanceScript
{
    instance_the_motherlode(InstanceMap* map) : InstanceScript(map)
    {
        SetHeaders(DataHeader);
        SetBossNumber(EncounterCount);
    }

    void OnCreatureCreate(Creature* creature) override
    {
        InstanceScript::OnCreatureCreate(creature);

        switch (creature->GetEntry())
        {
            case NPC_AZEROKK:
            {
                    AddObject(creature, DATA_AZEROKK, true);
                break;
            }
            default:
                break;
        }
    }

    void OnUnitDeath(Unit* unit) override
    {
        switch (unit->GetEntry())
        {
            case NPC_AZEROKK:
            {

            }
            default:
                break;
        }
    }

    void SetData(uint32 type, uint32 data) override
    {
        switch (type)
        {
            case DATA_AZEROKK:
            {

                break;
            }

        }

        InstanceScript::SetData(type, data);
    }
};

void AddSC_instance_the_motherlode()
{
    RegisterInstanceScript(instance_the_motherlode, 1594);
}
