/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef COURTOFSTARS_H_
#define COURTOFSTARS_H_

#include "Map.h"
#include "Creature.h"
#include "ObjectMgr.h"

#define COSScriptName "instance_court_of_stars"
#define DataHeader "COS"

constexpr uint32 EncounterCount = 3;

enum COSDataTypes
{
    // Encounter States // Boss GUIDs
    DATA_PATROL_CAPTAIN_GERDO       = 0,
    DATA_TALIXAE_FLAMEWREATH        = 1,
    DATA_ADVISOR_MELANDRUS          = 2,

    DATA_FLASK_OF_THE_SOLEMN_NIGHT  = 3,

};

enum COSCreatureIds
{
    BOSS_PATROL_CAPTAIN_GERDO       = 104215,
    BOSS_TALIXAE_FLAMEWREATH        = 104217,
    BOSS_ADVISOR_MELANDRUS          = 104218,

    NPC_STREETSWEEPER               = 110403,
    NPC_ARCANE_BEACON               = 104245,
    NPC_VIGILANT_DUSKWATCH          = 104918,
    NPC_RESONANT_STALKER            = 104384,
    NPC_FLASK_OF_THE_SOLEMN_NIGHT   = 105117,

    NPC_BAALGAR                     = 104274,
    NPC_JAZSHARIU                   = 104273,
    NPC_IMACUTYA                    = 104275,
    NPC_FELBOUND_ENFORCER           = 104278,
};

template<class AI>
inline AI* GetCourtofStarsAI(Creature* creature)
{
    return GetInstanceAI<AI>(creature, COSScriptName);
}

#endif // COURTOFSTARS_H_
