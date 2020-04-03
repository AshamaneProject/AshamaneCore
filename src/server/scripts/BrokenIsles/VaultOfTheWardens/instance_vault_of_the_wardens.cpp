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
#include "vault_of_the_wardens.h"

DoorData const doorData[] =
{
    { GO_BOSS01_FIRWALL_1,          DATA_TIRATHON,   DOOR_TYPE_PASSAGE },
    { GO_BOSS01_FIRWALL_2,          DATA_TIRATHON,   DOOR_TYPE_PASSAGE },
    { GO_BOSS01_DOOR_1,             DATA_TIRATHON,   DOOR_TYPE_PASSAGE },
    { GO_BOSS01_DOOR_2,             DATA_TIRATHON,   DOOR_TYPE_PASSAGE },
    //{ GO_AFTER_BOSS01_DOOR,         DATA_TIRATHON,   DOOR_TYPE_PASSAGE },
    { GO_DOOR_1,                    DATA_INQUISITOR,   DOOR_TYPE_PASSAGE },
};

struct instance_vault_of_the_wardens : public InstanceScript
{
    instance_vault_of_the_wardens(InstanceMap* map) : InstanceScript(map)
    {
        SetHeaders(DataHeader);
        SetBossNumber(EncounterCount);
        LoadDoorData(doorData);
        //SetFontOfPowerPos({ 4184.534f, -756.3125f, 269.6668f, 4.67393f });
    }

    void OnCreatureCreate(Creature* creature) override
    {
        InstanceScript::OnCreatureCreate(creature);

        if (instance->IsHeroic())
            creature->SetBaseHealth(creature->GetMaxHealth() * 2.f);
        if (instance->IsMythic())
            creature->SetBaseHealth(creature->GetMaxHealth() * 1.33f);
    }
};


void AddSC_instance_vault_of_the_wardens()
{
    RegisterInstanceScript(instance_vault_of_the_wardens, 1493);
}
