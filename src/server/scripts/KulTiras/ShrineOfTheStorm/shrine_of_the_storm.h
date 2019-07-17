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

#ifndef SHRINE_OF_THE_STORM_H
#define SHRINE_OF_THE_STORM_H

#define DataHeader "SOTS"

uint32 const EncounterCount = 4;

enum EncounterData
{
    DATA_AQUSIRR            = 0,
    DATA_TIDESAGE_COUNCIL   = 1,
    DATA_LORD_STORMSONG     = 2,
    DATA_VOLZITH            = 3,
};

enum CreatureIds
{
    NPC_AQUSIRR                 = 134056,
    NPC_BROTHER_IRONHULL        = 134063,
    NPC_GALECALLER_FAYE         = 134058,
    NPC_LORD_STORMSONG          = 139737,
    NPC_VOLZITH_THE_WHISPERER   = 134069,
};

#endif // SHRINE_OF_THE_STORM_H
