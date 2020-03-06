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
#include "InstanceScript.h"
#include "Player.h"
#include "GameObject.h"
#include "PassiveAI.h"
#include "maw_of_souls.h"

DoorData const doorData[] =
{
    { GO_HARBARON_DOOR,      DATA_HARBARON_MAW,       DOOR_TYPE_PASSAGE },
    { GO_HARBARON_DOOR_2,    DATA_HARBARON_MAW,       DOOR_TYPE_ROOM    },
    { GO_SKJAL_INVIS_DOOR,   DATA_SKJAL,              DOOR_TYPE_PASSAGE },
    { GO_SKJAL_DOOR_1,       DATA_SKJAL,              DOOR_TYPE_PASSAGE },
    { GO_SKJAL_DOOR_2,       DATA_SKJAL,              DOOR_TYPE_PASSAGE },
};

struct instance_maw_of_souls : public InstanceScript
{
    instance_maw_of_souls(InstanceMap* map) : InstanceScript(map)
    {
        SetHeaders(DataHeader);
    }

    WorldLocation loc_res_pla;

    ObjectGuid YmironGUID;
    ObjectGuid YmironGornGUID;
    ObjectGuid helyaGUID;
    ObjectGuid shipGUID;
    ObjectGuid helyaChestGUID;
    ObjectGuid SkjalGUID;

    void Initialize() override
    {
        SetBossNumber(MAX_ENCOUNTER);
        LoadDoorData(doorData);
    }

    void OnCreatureCreate(Creature* creature) override
    {
        switch (creature->GetEntry())
        {
            case NPC_YMIRON_MAW:
                YmironGUID = creature->GetGUID(); 
                break;
            case NPC_SKJAL_MAW:
                SkjalGUID = creature->GetGUID(); 
                break;
            case NPC_HELYA_MAW:    
                helyaGUID = creature->GetGUID(); 
                break;
        }
    }

    void OnGameObjectCreate(GameObject* go) override
    {
        switch (go->GetEntry())
        {
            case GO_YMIRON_GORN:
                YmironGornGUID = go->GetGUID();
                go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                break;
            case GO_SHIP:
                shipGUID = go->GetGUID();
                break;
            case GO_HELYA_CHEST:
                helyaChestGUID = go->GetGUID();
                break;
            case GO_HARBARON_DOOR:
            case GO_HARBARON_DOOR_2:
            case GO_SKJAL_INVIS_DOOR:
            case GO_SKJAL_DOOR_1:
            case GO_SKJAL_DOOR_2:
                AddDoor(go, true);
                break;
            default:
                break;
        }
    }

    bool SetBossState(uint32 type, EncounterState state) override
    {
        if(!InstanceScript::SetBossState(type, state))
        {
            return false;
        }

        switch (type)
        {
            case DATA_HELYA_MAW:
            {
                if (state == DONE && instance->GetDifficultyID() != DIFFICULTY_MYTHIC_KEYSTONE)
                    if (GameObject* chest = instance->GetGameObject(helyaChestGUID))
                        chest->SetRespawnTime(86400);
                break;
            }
            default:
               break;
        }

        return true;
    }

    ObjectGuid GetGuidData(uint32 type) const override
    {
        switch (type)
        {
            case DATA_YMIRON_MAW:
                return YmironGUID;
            case DATA_YMIRON_GORN:   
                return YmironGornGUID;
            case DATA_SKJAL:
                return SkjalGUID;
            case DATA_HELYA_MAW:
                return helyaGUID;
            case DATA_SHIP:
                return shipGUID;
        }
        return ObjectGuid::Empty;
    }

    uint32 GetData(uint32 type) const override
    {
        return 0;
    }
};

void AddSC_instance_maw_of_souls()
{
    RegisterInstanceScript(instance_maw_of_souls, 1492);
}
