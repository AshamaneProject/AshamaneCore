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
#include "the_underrot.h"

struct instance_the_underrot : public InstanceScript
{
    instance_the_underrot(InstanceMap* map) : InstanceScript(map)
    {
        SetHeaders(DataHeader);
        SetBossNumber(EncounterCount);
    }

    void OnCreatureCreate(Creature* creature) override
    {
        InstanceScript::OnCreatureCreate(creature);

        switch (creature->GetEntry())
        {
            case NPC_TITAN_KEEPER_HEZREL:
            {
                if (creature->GetPositionZ() < -100.f)
                    AddObject(creature, DATA_BOSS_HERZEL, true);

                break;
            }
            default:
                break;
        }
    }
};

void AddSC_instance_shrine_of_the_storm()
{
    RegisterInstanceScript(instance_the_underrot, 1841);
}
