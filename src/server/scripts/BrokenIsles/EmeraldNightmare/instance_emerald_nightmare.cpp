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
#include "emerald_nightmare.h"
#include "GameObject.h"
#include "InstanceScript.h"
#include "Map.h"
#include "ScriptedCreature.h"
#include "ScriptMgr.h"

DoorData const doorData[] =
{
    { GOB_NYTHENDRA_ENTRANCE_1,     DATA_NYTHENDRA,     DOOR_TYPE_PASSAGE },
    { GOB_NYTHENDRA_ENTRANCE_2,     DATA_NYTHENDRA,     DOOR_TYPE_PASSAGE },
    { GOB_NYTHENDRA_ENTRANCE_3,     DATA_NYTHENDRA,     DOOR_TYPE_ROOM },
    { GOB_NYTHENDRA_ENTRANCE_4,     DATA_NYTHENDRA,     DOOR_TYPE_ROOM },
    { GOB_NYTHENDRA_ENTRANCE_5,     DATA_NYTHENDRA,     DOOR_TYPE_PASSAGE },
    { GOB_NYTHENDRA_ENTRANCE_6,     DATA_NYTHENDRA,     DOOR_TYPE_PASSAGE },
    { GOB_NYTHENDRA_ENTRANCE_7,     DATA_NYTHENDRA,     DOOR_TYPE_PASSAGE },
    { GOB_URSOC_DOOR,               DATA_URSOC,         DOOR_TYPE_ROOM },
    { GOB_ILGYNOTH_DOOR_1,          DATA_ILGYNOTH,      DOOR_TYPE_ROOM },
    { GOB_ILGYNOTH_DOOR_2,          DATA_ILGYNOTH,      DOOR_TYPE_ROOM },
    { GOB_ILGYNOTH_DOOR_3,          DATA_ILGYNOTH,      DOOR_TYPE_ROOM },
};

struct instance_emerald_nightmare : public InstanceScript
{
    instance_emerald_nightmare(InstanceMap* map) : InstanceScript(map) { }

    void Initialize() override
    {
        SetBossNumber(DATA_MAX_ENCOUNTERS);
        LoadDoorData(doorData);

        if (GetBossState(DATA_XAVIUS) != DONE)
            SetBossState(DATA_PRE_EVENT_XAVIUS, NOT_STARTED); // Reset event
    }

    void OnPlayerEnter(Player* player) override
    {
        if (GetBossState(DATA_XAVIUS) == IN_PROGRESS)
            player->CastSpell(player, 189960, true); //Alter power
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

void AddSC_instance_emerald_nightmare()
{
    RegisterInstanceScript(instance_emerald_nightmare, 1520);
}
