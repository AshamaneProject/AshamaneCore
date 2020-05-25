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

#ifndef DEF_VAULT_OF_THE_WARDENS_H
#define DEF_VAULT_OF_THE_WARDENS_H

#define DataHeader "VOTW"
uint32 const EncounterCount = 5;
enum DataTypes
{
    DATA_TIRATHON           = 0,
    DATA_INQUISITOR         = 1,
    DATA_GLAZER             = 2,
    DATA_ASHGOLM            = 3,
    DATA_CORDANA            = 4,

    DATA_MAX_ENCOUNTERS     = 5
};

enum Creatures
{
    NPC_TIRATHON_SALTHERIL      = 95885,
    NPC_INQUISITOR_TORMENTORUM  = 96015,
    NPC_GLAZER                  = 95887,
    NPC_ASH_GOLM                = 95886,
    NPC_CORDANA_FELSONG         = 95888,

    NPC_DRELANIM_WHISPERWIND = 99013,
};

enum GameObjects
{
    GO_BOSS01_FIRWALL_1 = 247082,
    GO_BOSS01_FIRWALL_2 = 247081,
    GO_BOSS01_DOOR_1 = 246054,
    GO_BOSS01_DOOR_2 = 246053,
    GO_AFTER_BOSS01_DOOR = 247080,
    GO_DOOR_1 = 246112,
};

#endif
