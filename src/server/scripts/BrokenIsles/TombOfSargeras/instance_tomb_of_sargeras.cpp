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

#include "Creature.h"
#include "tomb_of_sargeras.h"
#include "GameObject.h"
#include "InstanceScript.h"
#include "Map.h"
#include "ScriptedCreature.h"
#include "ScriptMgr.h"


DoorData const doorData[] =
{
    { GO_DOOR_ROOM_GOROTH_S,    DATA_GOROTH,   DOOR_TYPE_ROOM       },
    { GO_DOOR_ROOM_GOROTH_N,    DATA_GOROTH,   DOOR_TYPE_PASSAGE    },
    { GO_DOOR_ROOM_GOROTH_E,    DATA_GOROTH,   DOOR_TYPE_PASSAGE    },
};

class instance_tomb_of_sargeras : public InstanceMapScript
{
    public:
        instance_tomb_of_sargeras() : InstanceMapScript("instance_tomb_of_sargeras", 1676) { }

        struct instance_tomb_of_sargeras_InstanceMapScript : public InstanceScript
        {
            instance_tomb_of_sargeras_InstanceMapScript(InstanceMap* map) : InstanceScript(map) { }

            void Initialize() override
            {
                SetBossNumber(ENCOUNTER_COUNT);
                LoadDoorData(doorData);
            }

            void OnCreatureCreate(Creature* creature) override
            {
                switch (creature->GetEntry())
                {
                case BOSS_GOROTH:
                    creature->SetVisible(false);
                    creature->setActive(false);
                    GorothGUID = creature->GetGUID();

                    break;

                case BOSS_ATRIGAN:
                    AtriganGUID = creature->GetGUID();
                    break;

                case BOSS_BELAC:
                    BelacGUID = creature->GetGUID();
                    break;

                    case BOSS_HARJATAN:
                    case NPC_HUNTRESS_KASPARIAN:
                    case NPC_CAPTAIN_YATHAE_MOONSTRIKE:
                    case NPC_PRIESTESS_LUNASPYRE:
                    case NPC_SASSZINE:
                    case NPC_ENGINE_OF_SOULS:
                    case NPC_SOUL_QUEEN_DEJAHNA:
                    case NPC_DESOLATE_HOST:
                    case NPC_MAIDEN_OF_VIGILANCE:
                    case NPC_FALLEN_AVATAR:
                    case NPC_KILJAEDEN:
                        AddObject(creature, true);
                        break;
                    default:
                        break;
                }
            }

            void OnGameObjectCreate(GameObject* go) override
            {
                switch (go->GetEntry())
                {
                 case GO_DESTRUCTIBLE_1:
                    DestructibleGUID[0] = go->GetGUID();

                    if (GetBossState(DATA_GOROTH) == DONE)
                        go->UseDoorOrButton(1000000, true);
                    break;

                 case GO_DESTRUCTIBLE_2:
                    DestructibleGUID[1] = go->GetGUID();

                    if (GetBossState(DATA_GOROTH) == DONE)
                        go->UseDoorOrButton(1000000, true);

                    break;

                 case GO_DESTRUCTIBLE_3:
                    DestructibleGUID[2] = go->GetGUID();

                    if (GetBossState(DATA_GOROTH) == DONE)
                        go->UseDoorOrButton(1000000, true);

                    break;

                 case GO_DOOR_TO_MISTRESS:
                 case GO_DOOR_TO_MISTRESS2:
                    if (GetBossState(DATA_HARJATAN) == DONE)
                        go->UseDoorOrButton(1000000, true);

                    break;

                    case GO_DOOR_ROOM_GOROTH_S:
                    case GO_DOOR_ROOM_GOROTH_N:
                    case GO_DOOR_ROOM_GOROTH_E:
                        AddDoor(go, true);
                        break;
                    default:
                        break;
                }
            }

           ObjectGuid GetGuidData(uint32 type) const override
           {
              switch (type)
              {
                case DATA_GOROTH:
                    return GorothGUID;

                case DATA_ATRIGAN:
                    return AtriganGUID;

                case DATA_BELAC:
                    return BelacGUID;

                default:
                    break;
              }

            return ObjectGuid::Empty;
          }

    protected:
        EventMap events;
        ObjectGuid GorothGUID;
        ObjectGuid AtriganGUID;
        ObjectGuid BelacGUID;
        ObjectGuid DestructibleGUID[3];
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_tomb_of_sargeras_InstanceMapScript(map);
        }
};

void AddSC_instance_tomb_of_sargeras()
{
    new instance_tomb_of_sargeras();
}
