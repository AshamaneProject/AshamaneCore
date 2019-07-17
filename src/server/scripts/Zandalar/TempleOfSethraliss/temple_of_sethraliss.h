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

#ifndef TEMPLE_OF_SETHRALISS_H
#define TEMPLE_OF_SETHRALISS_H

#define DataHeader "TOS"

uint32 const EncounterCount = 4;

enum EncounterData
{
    DATA_ADDERIS_AND_ASPIX      = 0,
    DATA_MEREKTHA               = 1,
    DATA_GALVAZZT               = 2,
    DATA_AVATAR_OF_SETHRALISS   = 3,
};

enum CreatureIds
{
    NPC_ADDERIS                 = 133379,
    NPC_ASPIX                   = 133944,
    NPC_MEREKTHA                = 133384,
    NPC_SGALVAZZT               = 133389,
    NPC_AVATAR_OF_SETHRALISS    = 133392,
};

#endif // TEMPLE_OF_SETHRALISS_H
