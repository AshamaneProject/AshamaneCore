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

#ifndef ATAL_DAZAR_H
#define ATAL_DAZAR_H

#define DataHeader "AD"

uint32 const EncounterCount = 4;

enum EncounterData
{
    DATA_PRIESTESS_ALUNZA       = 0,
    DATA_VOLKAAL                = 1,
    DATA_REZAN                  = 2,
    DATA_YAZMA                  = 3,
};

enum CreatureIds
{
    NPC_PRIESTESS_ALUNZA        = 122967,
    NPC_VOLKAAL                 = 122965,
    NPC_REZAN                   = 122963,
    NPC_YAZMA                   = 122968,
};

#endif // ATAL_DAZAR_H
