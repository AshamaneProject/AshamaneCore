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

#ifndef TOMB_OF_SARGERAS_H
#define TOMB_OF_SARGERAS_H

#define DataHeader "TOS"
#define TombOfSargerasScriptName "instance_tomb_of_sargeras"

#include "InstanceScript.h"
#include "AreaTriggerTemplate.h"
#include "AreaTriggerAI.h"
#include "ScriptMgr.h"
#include "SpellScript.h"
#include "EventMap.h"
#include "SpellAuras.h"
#include "Unit.h"
#include "GameObject.h"
#include "ScriptedCreature.h"
#include "Vehicle.h"
#include "VehicleDefines.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "TemporarySummon.h"
#include "Player.h"
#include "Map.h"
#include "GameObjectAI.h"
#include "MapManager.h"
#include "GridNotifiers.h"
#include "InstanceSaveMgr.h"
#include "ObjectMgr.h"

uint32 const EncounterCount = 10;

enum tosDataTypes
{
    DATA_GOROTH,
    DATA_HARJATAN,
    DATA_MISTRESS_SASSZINE,
    DATA_ATRIGAN,
    DATA_BELAC,
    DATA_SISTERS_OF_THE_MOON,
    DATA_THE_DESOLATE_HOST,
    DATA_MAIDEN_OF_VIGILANCE,
    DATA_FALLEN_AVATAR,
    DATA_HUNTRESS_KASPARIAN,
    DATA_CAPTAIN_YATHAE_MOONSTRIKE,
    DATA_PRIESTESS_LUNASPYRE,
    DATA_KILJAEDEN,

    ENCOUNTER_COUNT,
};

enum Creatures
{
    BOSS_GOROTH                     = 115844,
    BOSS_ATRIGAN                    = 120996,

    // Demonic Inquisition
    BOSS_BELAC                      = 116691,
    BOSS_HARJATAN                   = 116407,

    // Sisters of the Moon
    NPC_HUNTRESS_KASPARIAN          = 118523,
    NPC_CAPTAIN_YATHAE_MOONSTRIKE   = 118374,
    NPC_PRIESTESS_LUNASPYRE         = 118518,

    NPC_SASSZINE                    = 115767,

    // Desolate Host
    NPC_ENGINE_OF_SOULS             = 118460,
    NPC_SOUL_QUEEN_DEJAHNA          = 118462,
    NPC_DESOLATE_HOST               = 119072,

    NPC_MAIDEN_OF_VIGILANCE         = 118289,
    NPC_FALLEN_AVATAR               = 120436,
    NPC_KILJAEDEN                   = 117269,
    NPC_RAZORJAW_WAVEMENDER         = 116569,
    NPC_RAZORJAW_GLADIATOR          = 117596,
    NPC_INFERNAL_CHAOSBRINGER       = 118022,
    NPC_BRIMSTONE_INFERNAL          = 119950,
    NPC_KHADGAR                     = 119726,
    NPC_VELEN                       = 119728,
    NPC_ILLIDAN                     = 119729,
    NPC_ATRIGAN                     = 120996,
};

enum CosmeticSpells
{
    SPELL_COSMETIC_TELEPORT         = 240923,   // Used by Kil'jaeden after Fallen Avatar activation
    SPELL_AWAKEN                    = 240897,   // Kil'jaeden activate Fallen Avatar spell.
    SPELL_FEL_INFUSION              = 236682,   // Used by Maiden of Valor.
};

enum tosSpells
{
    SPELL_SUMMON                = 241227,
    SPELL_IMPACT                = 242924,
    SPELL_PILLAR_COSMETIC       = 243149,
    SPELL_GOROTH_INTRO          = 247931,
};

enum tosSounds
{
    SOUND_INTRO                 = 81787,
    SOUND_GOROTH2               = 81789,
};

enum Gameobjects
{
    GO_MOON_CHAMBER_WINDOW          = 269842,

    GO_DOOR_ROOM_GOROTH_S           = 269974,
    GO_DOOR_ROOM_GOROTH_N           = 269975,
    GO_DOOR_ROOM_GOROTH_E           = 269973,
    GO_DOOR_ROOM_GOROTH_4           = 268580,

    GO_DOOR_HARJATAN_1 = 269120,
    GO_DOOR_HARJATAN_2 = 269192,

    GO_DOOR_AFTER_SASSZINE_1 = 268752,
    GO_DOOR_SISTERS_OF_THE_MOON_1 = 268750,
    GO_DOOR_SISTERS_OF_THE_MOON_2 = 268514,
    GO_DOOR_SISTERS_OF_THE_MOON_3 = 268751,
    GO_DOOR_SISTERS_OF_THE_MOON_4 = 268749,
    GO_DOOR_DEMONIC_INQUISITION_1 = 268579,
    GO_DOOR_MAIDEN_OF_VIGILANCE_1 = 269164,
    GO_DOOR_MAIDEN_OF_VIGILANCE_2 = 269261,
    GO_DOOR_MAIDEN_OF_VIGILANCE_3 = 269262,
    GO_DOOR_FALLEN_AVATAR         = 267934,

    GO_DOOR_FELSTORM_COLLISION_01 = 269987,
    GO_DESTRUCTIBLE_1             = 269842,
    GO_DESTRUCTIBLE_2             = 269839,
    GO_DESTRUCTIBLE_3             = 269838,
    GO_DOOR_TO_MISTRESS           = 269120,
    GO_DOOR_TO_MISTRESS2          = 270940,
};

template<class AI>
CreatureAI* GetTombOfSargerasAI(Creature* creature)
{
    return GetInstanceAI<AI>(creature, TombOfSargerasScriptName);
}

#endif
