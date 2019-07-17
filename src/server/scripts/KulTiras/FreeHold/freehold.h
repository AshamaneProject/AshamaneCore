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

#ifndef FREEHOLD_H
#define FREEHOLD_H

#define DataHeader "FH"

uint32 const EncounterCount = 4;

enum EncounterData
{
    DATA_SKYCAPN_KRAGG          = 0,
    DATA_COUNCIL_O_CAPTAINS     = 1,
    DATA_RING_OF_BOOTY          = 2,
    DATA_HARLAN_SWEETE          = 3,
};

enum CreatureIds
{
    NPC_SKYCAPN_KRAGG           = 126832,
    NPC_CAPTAIN_RAOUL           = 126847,
    NPC_CAPTAIN_EUDORA          = 126848,
    NPC_CAPTAIN_JOLLY           = 126845,
    NPC_LUDWIG_VON_TOROLLAN     = 129699,
    NPC_TROTHAK                 = 129696,
    NPC_HARLAN_SWEETE           = 126983,
};

#endif // FREEHOLD_H
