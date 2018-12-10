/*
 * Copyright (C) 2017-2018 AshamaneProject <https://github.com/AshamaneProject>
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

 // This is where scripts' loading functions should be declared:
void AddSC_zone_drustvar();
void AddSC_zone_stormsong_valley();
void AddSC_zone_tiragarde_sound();

void AddSC_boss_aqusirr();
void AddSC_boss_lord_stormsong();
void AddSC_boss_tidesage_council();
void AddSC_volzith_the_whisperer();
void AddSC_shrine_of_the_storm();
void AddSC_instance_shrine_of_the_storm();

void AddSC_boss_council_o_captains();
void AddSC_boss_ring_of_booty();
void AddSC_boss_skycapn_kragg();
void AddSC_boss_harlan_sweete();
void AddSC_freehold();
void AddSC_instance_freehold();

// The name of this function should match:
// void Add${NameOfDirectory}Scripts()
void AddKulTirasScripts()
{
    AddSC_zone_drustvar();
    AddSC_zone_stormsong_valley();
    AddSC_zone_tiragarde_sound();

    AddSC_boss_aqusirr();
    AddSC_boss_lord_stormsong();
    AddSC_boss_tidesage_council();
    AddSC_volzith_the_whisperer();
    AddSC_shrine_of_the_storm();
    AddSC_instance_shrine_of_the_storm();

    AddSC_boss_council_o_captains();
    AddSC_boss_ring_of_booty();
    AddSC_boss_skycapn_kragg();
    AddSC_boss_harlan_sweete();
    AddSC_freehold();
    AddSC_instance_freehold();
}
