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

#ifndef WAYCREST_MANOR_H
#define WAYCREST_MANOR_H

#define DataHeader "WM"

uint32 const EncounterCount = 5;

enum EncounterData
{
    DATA_HEARTSBANE_TRIAD       = 0,
    DATA_SOULBOUND_GOLIATH      = 1,
    DATA_RAAL_THE_GLUTTONOUS    = 2,
    DATA_LORD_AND_LADY_WAYCRES  = 3,
    DATA_GORAK_TUL              = 4,
};

enum CreatureIds
{
    NPC_SOULBOUND_GOLIATH       = 131667,
    NPC_RAAL_THE_GLUTTONOUS     = 131863,
    NPC_GORAK_TUL               = 131864,
    NPC_LORD_WAYCREST           = 131527,
    NPC_LADY_WAYCREST           = 131545,
    NPC_SISTER_BRIAR            = 131825,
    NPC_SISTER_SOLENA           = 131824,
    NPC_SISTER_MALADY           = 131823,
    NPC_MATRON_BRYNDLE          = 135329,
};

#endif // WAYCREST_MANOR_H
