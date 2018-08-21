DELETE FROM `gameobject_template_addon` WHERE  `entry` IN (235794,280650);
UPDATE `creature_template` SET `spell1`='0' WHERE  `entry`=29264;
UPDATE `creature_template_addon` SET `auras`='' WHERE  `entry` IN (42010,41366,43273);
UPDATE `creature_template_addon` SET `auras`='80855 16245' WHERE  `entry`=43279;
UPDATE `creature` SET `spawndist`='0' WHERE  `guid` IN (183746,183806);
UPDATE `gameobject` SET `spawnMask`='1' WHERE  `guid`=20000097;
UPDATE `quest_template` SET `RewardSpell`='0' WHERE  `ID`=24974;
UPDATE `creature_template` SET `npcflag`='0' WHERE  `entry`=130758;
UPDATE `creature_template` SET `lootid`='0' WHERE  `entry`=36756;
UPDATE `gameobject_template` SET `Data1`='204281' WHERE  `entry`=204281;
UPDATE `gameobject_template` SET `Data1`='203751' WHERE  `entry`=203751;
UPDATE `gameobject_template` SET `Data1`='203801' WHERE  `entry`=203801;
UPDATE `gameobject_template` SET `Data1`='203762' WHERE  `entry`=203762;
DELETE FROM `spell_loot_template` WHERE  `Entry` IN (263148,263149,263150,263151,263152,263153,263154);
UPDATE `npc_vendor` SET `maxcount`='0' WHERE  `entry`=111903 AND `item`=138295 AND `ExtendedCost`=0 AND `type`=1;
DELETE FROM `creature_formations` WHERE  `leaderGUID` IN (370509,370570);
DELETE FROM `creature_formations` WHERE  `memberGUID` IN (370510,370571);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=42175;
UPDATE `areatrigger` SET `spawn_mask` = 8388870 WHERE  `guid` IN (4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,33,35,45,47);
DELETE FROM `spell_linked_spell` WHERE  `spell_trigger`=108936 AND `spell_effect`=108943 AND `type`=0;
DELETE FROM `areatrigger_scripts` WHERE  `entry` IN (1520,149959);
UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry` IN (26401,26520,121247,49481);
DELETE FROM `spell_script_names` WHERE  `spell_id`=196771 AND `ScriptName`='spell_dk_remorseless_winter';
DELETE FROM `spell_script_names` WHERE  `spell_id`=119051 AND `ScriptName`='spell_monk_transcendence_clone_visual';
DELETE FROM `spell_script_names` WHERE  `spell_id`=196408 AND `ScriptName`='spell_warl_fire_and_brimstone';

DELETE FROM `creature_equip_template` WHERE `CreatureID`=132659 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES 
(132659, 1, 33295, 0, 0, 33295, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_template` WHERE `entry`=528840;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(528840, 0, 0, 0, 0, 0, 17519, 11686, 0, 0, 'Core Trigger', '', '', NULL, '', 0, 60, 60, 0, 0, 0, 14, 0, 1, 1.14286, 1, 0, 0, 2000, 2000, 0, 0, 1, 33536, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 128, 'npc_flame_protection_rune1', 26365);

DELETE FROM `smart_scripts` WHERE `entryorguid`=77034;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(77034, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 12000, 15000, '', 11, 155581, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Black Iron Veteran - Cast Sunder Armor'),
(77034, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 20000, 30000, '', 11, 155575, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Black Iron Veteran - Cast Shield Smash');

DELETE FROM `smart_scripts` WHERE `entryorguid`=84462;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(84462, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 12000, 15000, '', 11, 155581, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Black Iron Veteran - Cast Sunder Armor'),
(84462, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 20000, 30000, '', 11, 155575, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Black Iron Veteran - Cast Shield Smash');

DELETE FROM `npc_text` WHERE `ID`=15442;
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`, `VerifiedBuild`) VALUES 
(15442, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25549);

DELETE FROM `creature_text` WHERE `CreatureID`=131345 AND `GroupID`=3 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(131345, 3, 0, 'It\'s possible.', 12, 0, 100, 1, 0, 0, 0, 0, '');

DELETE FROM `creature_text` WHERE `CreatureID`=132382 AND `GroupID`=1 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(132382, 1, 0, 'Maybe.', 12, 0, 100, 1, 0, 0, 0, 0, '');

DELETE FROM `instance_template` WHERE `map`=1009;
INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`, `insideResurrection`) VALUES 
(1009, 0, 'instance_heart_of_fear', 0, 0);

UPDATE `gameobject_template` SET `ScriptName`='go_krithik_weapon_rack' WHERE  `entry`=211675;
UPDATE `gameobject_template` SET `ScriptName`='go_mardum_legion_banner_1' WHERE  `entry`=250560;

UPDATE `creature_template` SET `ScriptName`='boss_garalon' WHERE  `entry`=62164;
UPDATE `creature_template` SET `ScriptName`='boss_jin_qin_xi' WHERE  `entry` IN (60399,60400);
UPDATE `creature_template` SET `ScriptName`='boss_shekzeer' WHERE  `entry`=62837;
UPDATE `creature_template` SET `ScriptName`='boss_tayak' WHERE  `entry`=62543;
UPDATE `creature_template` SET `ScriptName`='boss_unsok' WHERE  `entry`=62511;
UPDATE `creature_template` SET `ScriptName`='boss_wind_lord_meljarak' WHERE  `entry`=62397;
UPDATE `creature_template` SET `ScriptName`='boss_zorlok' WHERE  `entry`=62980;
UPDATE `creature_template` SET `ScriptName`='mob_add_setthik_windblade' WHERE  `entry`=63589;
UPDATE `creature_template` SET `ScriptName`='mob_amber_globule' WHERE  `entry`=64283;
UPDATE `creature_template` SET `ScriptName`='mob_amber_monstruosity' WHERE  `entry`=62711;
UPDATE `creature_template` SET `ScriptName`='mob_amber_pool_stalker' WHERE  `entry`=62762;
UPDATE `creature_template` SET `ScriptName`='mob_amber_scalpel' WHERE  `entry`=62510;
UPDATE `creature_template` SET `ScriptName`='mob_amber_searsting' WHERE  `entry`=63569;
UPDATE `creature_template` SET `ScriptName`='mob_amber_trap' WHERE  `entry`=64351;
UPDATE `creature_template` SET `ScriptName`='mob_amberridden_mushan' WHERE  `entry`=63568;
UPDATE `creature_template` SET `ScriptName`='mob_coagulated_amber' WHERE  `entry` IN (63597,63594);
UPDATE `creature_template` SET `ScriptName`='mob_cobalt_mine' WHERE  `entry`=65803;
UPDATE `creature_template` SET `ScriptName`='mob_cursed_mogu_sculture' WHERE  `entry` IN (61334,61989);
UPDATE `creature_template` SET `ScriptName`='mob_dissonance_field' WHERE  `entry`=62847;
UPDATE `creature_template` SET `ScriptName`='mob_enslaved_bonesmasher' WHERE  `entry`=63030;
UPDATE `creature_template` SET `ScriptName`='mob_gale_winds_stalker' WHERE  `entry`=63292;
UPDATE `creature_template` SET `ScriptName`='mob_general_purpose_bunnyJMF' WHERE  `entry`=55091;
UPDATE `creature_template` SET `ScriptName`='mob_heart_of_fear' WHERE  `entry`=63445;
UPDATE `creature_template` SET `ScriptName`='mob_instructor_kli_thak' WHERE  `entry`=64338;
UPDATE `creature_template` SET `ScriptName`='mob_instructor_maltik' WHERE  `entry`=64340;
UPDATE `creature_template` SET `ScriptName`='mob_instructor_tak_thok' WHERE  `entry`=64339;
UPDATE `creature_template` SET `ScriptName`='mob_instructor_zarik' WHERE  `entry`=64341;
UPDATE `creature_template` SET `ScriptName`='mob_kor_thik_extremist' WHERE  `entry`=63036;
UPDATE `creature_template` SET `ScriptName`='mob_kor_thik_silentwing' WHERE  `entry`=64355;
UPDATE `creature_template` SET `ScriptName`='mob_kor_thik_slicer' WHERE  `entry`=63048;
UPDATE `creature_template` SET `ScriptName`='mob_kor_thik_swarmer' WHERE  `entry`=64357;
UPDATE `creature_template` SET `ScriptName`='mob_korthik_fleshrender' WHERE  `entry`=64902;
UPDATE `creature_template` SET `ScriptName`='mob_korthik_reaver' WHERE  `entry`=63591;
UPDATE `creature_template` SET `ScriptName`='mob_korthik_swarmguard' WHERE  `entry`=64916;
UPDATE `creature_template` SET `ScriptName`='mob_korthik_warsinger' WHERE  `entry`=64458;
UPDATE `creature_template` SET `ScriptName`='mob_living_amber' WHERE  `entry`=62691;
UPDATE `creature_template` SET `ScriptName`='mob_living_crystal' WHERE  `entry` IN (60304,60306,60307,60308);
UPDATE `creature_template` SET `ScriptName`='mob_mutated_construct' WHERE  `entry`=62701;
UPDATE `creature_template` SET `ScriptName`='mob_pinning_arrow' WHERE  `entry`=60958;
UPDATE `creature_template` SET `ScriptName`='mob_set_thik_fanatic' WHERE  `entry`=63031;
UPDATE `creature_template` SET `ScriptName`='mob_set_thik_gale_slicer' WHERE  `entry`=64353;
UPDATE `creature_template` SET `ScriptName`='mob_set_thik_gustwing' WHERE  `entry`=63592;
UPDATE `creature_template` SET `ScriptName`='mob_set_thik_swiftblade' WHERE  `entry`=63049;
UPDATE `creature_template` SET `ScriptName`='mob_set_thik_tempest' WHERE  `entry`=64358;
UPDATE `creature_template` SET `ScriptName`='mob_set_thik_zephyrian' WHERE  `entry`=63593;
UPDATE `creature_template` SET `ScriptName`='mob_setthik_windblade' WHERE  `entry`=64453;
UPDATE `creature_template` SET `ScriptName`='mob_sha_of_fear' WHERE  `entry`=63942;
UPDATE `creature_template` SET `ScriptName`='mob_sonic_pulse' WHERE  `entry`=63837;
UPDATE `creature_template` SET `ScriptName`='mob_sonic_ring' WHERE  `entry`=62689;
UPDATE `creature_template` SET `ScriptName`='mob_sra_thik_shield_master' WHERE  `entry`=63032;
UPDATE `creature_template` SET `ScriptName`='mob_srathik_ambercaller' WHERE  `entry`=64917;
UPDATE `creature_template` SET `ScriptName`='mob_srathik_pooltender' WHERE  `entry`=63570;
UPDATE `creature_template` SET `ScriptName`='mob_sticky_resin' WHERE  `entry`=63730;
UPDATE `creature_template` SET `ScriptName`='mob_tiling_creature' WHERE  `entry`=62026;
UPDATE `creature_template` SET `ScriptName`='mob_undying_shadow' WHERE  `entry`=60731;
UPDATE `creature_template` SET `ScriptName`='mob_woe_add_generic' WHERE  `entry` IN (60396,60397,60398);
UPDATE `creature_template` SET `ScriptName`='mob_zar_thik_supplicant' WHERE  `entry` IN (67177,66181,63853);
UPDATE `creature_template` SET `ScriptName`='mob_zar_thik_zealot' WHERE  `entry`=63035;
UPDATE `creature_template` SET `ScriptName`='mob_zarthik_augurer' WHERE  `entry`=64454;
UPDATE `creature_template` SET `ScriptName`='mob_zephyr' WHERE  `entry`=63599;
UPDATE `creature_template` SET `ScriptName`='npc_amber_prison_meljarak' WHERE  `entry`=62531;
UPDATE `creature_template` SET `ScriptName`='npc_corrosive_resin_pool' WHERE  `entry`=67046;
UPDATE `creature_template` SET `ScriptName`='npc_garalon_leg' WHERE  `entry`=63053;
UPDATE `creature_template` SET `ScriptName`='npc_korthik_elite_blademaster' WHERE  `entry`=62402;
UPDATE `creature_template` SET `ScriptName`='npc_pheromone_trail' WHERE  `entry`=63021;
UPDATE `creature_template` SET `ScriptName`='npc_srathik_amber_trapper' WHERE  `entry`=62405;
UPDATE `creature_template` SET `ScriptName`='npc_storm_unleashed_tornado' WHERE  `entry`=63278;
UPDATE `creature_template` SET `ScriptName`='npc_tempest_slash_tornado' WHERE  `entry`=62908;
UPDATE `creature_template` SET `ScriptName`='npc_whirling_blade' WHERE  `entry`=63930;
UPDATE `creature_template` SET `ScriptName`='npc_wind_bomb_meljarak' WHERE  `entry`=67053;
UPDATE `creature_template` SET `ScriptName`='npc_zarthik_battle_mender' WHERE  `entry`=62408;
UPDATE `creature_template` SET `ScriptName`='npc_mardum_allari' WHERE  `entry`=94410;
UPDATE `creature_template` SET `ScriptName`='npc_hatecoil_arcanist' WHERE  `entry`=97171;
UPDATE `creature_template` SET `ScriptName`='npc_icycle_dm' WHERE  `entry`=49481;
UPDATE `creature_template` SET `ScriptName`='npc_vics_flying_machine' WHERE  `entry`=28710;

DELETE FROM `spell_script_names` WHERE `spell_id`=124843 AND `ScriptName`='spell_amassing_darkness';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(124843, 'spell_amassing_darkness');

DELETE FROM `spell_script_names` WHERE `spell_id`=121995 AND `ScriptName`='spell_amber_scalpel';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(121995, 'spell_amber_scalpel');

DELETE FROM `spell_script_names` WHERE `spell_id`=122440 AND `ScriptName`='spell_attenuation';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122440, 'spell_attenuation');

DELETE FROM `spell_script_names` WHERE `spell_id`=125310 AND `ScriptName`='spell_blade_tempest';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(125310, 'spell_blade_tempest');

DELETE FROM `spell_script_names` WHERE `spell_id`=123060 AND `ScriptName`='spell_break_free';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123060, 'spell_break_free');

DELETE FROM `spell_script_names` WHERE `spell_id`=124845 AND `ScriptName`='spell_calamity';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(124845, 'spell_calamity');

DELETE FROM `spell_script_names` WHERE `spell_id`=117558 AND `ScriptName`='spell_coalescing_shadow';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(117558, 'spell_coalescing_shadow');

DELETE FROM `spell_script_names` WHERE `spell_id`=123156 AND `ScriptName`='spell_consume_amber';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123156, 'spell_consume_amber');

DELETE FROM `spell_script_names` WHERE `spell_id`=122740 AND `ScriptName`='spell_convert';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122740, 'spell_convert');

DELETE FROM `spell_script_names` WHERE `spell_id`=117756 AND `ScriptName`='spell_crazed_cowardice';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(117756, 'spell_crazed_cowardice');

DELETE FROM `spell_script_names` WHERE `spell_id`=117737 AND `ScriptName`='spell_crazed_cowardice';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(117737, 'spell_crazed_cowardice');

DELETE FROM `spell_script_names` WHERE `spell_id`=117833 AND `ScriptName`='spell_crazy_thought';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(117833, 'spell_crazy_thought');

DELETE FROM `spell_script_names` WHERE `spell_id`=123792 AND `ScriptName`='spell_cry_of_terror';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123792, 'spell_cry_of_terror');

DELETE FROM `spell_script_names` WHERE `spell_id`=116541 AND `ScriptName`='spell_energized_tiles';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(116541, 'spell_energized_tiles');

DELETE FROM `spell_script_names` WHERE `spell_id`=123707 AND `ScriptName`='spell_eyes_of_the_empress';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123707, 'spell_eyes_of_the_empress');

DELETE FROM `spell_script_names` WHERE `spell_id`=122413 AND `ScriptName`='spell_fling';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122413, 'spell_fling');

DELETE FROM `spell_script_names` WHERE `spell_id`=122420 AND `ScriptName`='spell_fling_thrown';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122420, 'spell_fling_thrown');

DELETE FROM `spell_script_names` WHERE `spell_id`=122718 AND `ScriptName`='spell_force_verve';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122718, 'spell_force_verve');

DELETE FROM `spell_script_names` WHERE `spell_id`=123633 AND `ScriptName`='spell_gale_winds';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123633, 'spell_gale_winds');

DELETE FROM `spell_script_names` WHERE `spell_id`=122786 AND `ScriptName`='spell_garalon_broken_leg';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122786, 'spell_garalon_broken_leg');

DELETE FROM `spell_script_names` WHERE `spell_id`=117709 AND `ScriptName`='spell_garalon_crush_trigger';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(117709, 'spell_garalon_crush_trigger');

DELETE FROM `spell_script_names` WHERE `spell_id`=123818 AND `ScriptName`='spell_garalon_damaged';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123818, 'spell_garalon_damaged');

DELETE FROM `spell_script_names` WHERE `spell_id`=122735 AND `ScriptName`='spell_garalon_furious_swipe';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122735, 'spell_garalon_furious_swipe');

DELETE FROM `spell_script_names` WHERE `spell_id`=123495 AND `ScriptName`='spell_garalon_mend_leg';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123495, 'spell_garalon_mend_leg');

DELETE FROM `spell_script_names` WHERE `spell_id`=123808 AND `ScriptName`='spell_garalon_pheromones_forcecast';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123808, 'spell_garalon_pheromones_forcecast');

DELETE FROM `spell_script_names` WHERE `spell_id`=128573 AND `ScriptName`='spell_garalon_pheromones_summon';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(128573, 'spell_garalon_pheromones_summon');

DELETE FROM `spell_script_names` WHERE `spell_id`=123100 AND `ScriptName`='spell_garalon_pheromones_switch';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123100, 'spell_garalon_pheromones_switch');

DELETE FROM `spell_script_names` WHERE `spell_id`=123109 AND `ScriptName`='spell_garalon_pheromones_taunt';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123109, 'spell_garalon_pheromones_taunt');

DELETE FROM `spell_script_names` WHERE `spell_id`=123120 AND `ScriptName`='spell_garalon_pheromones_trail_dmg';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123120, 'spell_garalon_pheromones_trail_dmg');

DELETE FROM `spell_script_names` WHERE `spell_id`=123081 AND `ScriptName`='spell_garalon_pungency';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123081, 'spell_garalon_pungency');

DELETE FROM `spell_script_names` WHERE `spell_id`=122415 AND `ScriptName`='spell_grab';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122415, 'spell_grab');

DELETE FROM `spell_script_names` WHERE `spell_id`=122852 AND `ScriptName`='spell_inhale_zorlok';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122852, 'spell_inhale_zorlok');

DELETE FROM `spell_script_names` WHERE `spell_id`=130395 AND `ScriptName`='spell_jasper_chains';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(130395, 'spell_jasper_chains');

DELETE FROM `spell_script_names` WHERE `spell_id`=130404 AND `ScriptName`='spell_jasper_chains_damage';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(130404, 'spell_jasper_chains_damage');

DELETE FROM `spell_script_names` WHERE `spell_id`=117708 AND `ScriptName`='spell_maddening_shout';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(117708, 'spell_maddening_shout');

DELETE FROM `spell_script_names` WHERE `spell_id`=117921 AND `ScriptName`='spell_massive_attacks';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(117921, 'spell_massive_attacks');

DELETE FROM `spell_script_names` WHERE `spell_id`=122064 AND `ScriptName`='spell_meljarak_corrosive_resin';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122064, 'spell_meljarak_corrosive_resin');

DELETE FROM `spell_script_names` WHERE `spell_id`=122147 AND `ScriptName`='spell_mending';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122147, 'spell_mending');

DELETE FROM `spell_script_names` WHERE `spell_id`=115852 AND `ScriptName`='spell_petrification';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(115852, 'spell_petrification');

DELETE FROM `spell_script_names` WHERE `spell_id`=116006 AND `ScriptName`='spell_petrification';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(116006, 'spell_petrification');

DELETE FROM `spell_script_names` WHERE `spell_id`=116036 AND `ScriptName`='spell_petrification';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(116036, 'spell_petrification');

DELETE FROM `spell_script_names` WHERE `spell_id`=116057 AND `ScriptName`='spell_petrification';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(116057, 'spell_petrification');

DELETE FROM `spell_script_names` WHERE `spell_id`=118145 AND `ScriptName`='spell_pinned_down';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(118145, 'spell_pinned_down');

DELETE FROM `spell_script_names` WHERE `spell_id`=123713 AND `ScriptName`='spell_servant_of_the_empress';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123713, 'spell_servant_of_the_empress');

DELETE FROM `spell_script_names` WHERE `spell_id`=117697 AND `ScriptName`='spell_shield_of_darkness';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(117697, 'spell_shield_of_darkness');

DELETE FROM `spell_script_names` WHERE `spell_id`=118163 AND `ScriptName`='spell_sleight_of_hand';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(118163, 'spell_sleight_of_hand');

DELETE FROM `spell_script_names` WHERE `spell_id`=124673 AND `ScriptName`='spell_sonic_pulse';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(124673, 'spell_sonic_pulse');

DELETE FROM `spell_script_names` WHERE `spell_id`=122336 AND `ScriptName`='spell_sonic_ring';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122336, 'spell_sonic_ring');

DELETE FROM `spell_script_names` WHERE `spell_id`=122395 AND `ScriptName`='spell_struggle_for_control';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122395, 'spell_struggle_for_control');

DELETE FROM `spell_script_names` WHERE `spell_id`=123616 AND `ScriptName`='spell_su_dumaura';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123616, 'spell_su_dumaura');

DELETE FROM `spell_script_names` WHERE `spell_id`=123600 AND `ScriptName`='spell_su_dummy';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123600, 'spell_su_dummy');

DELETE FROM `spell_script_names` WHERE `spell_id`=124024 AND `ScriptName`='spell_su_dummy_visual';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(124024, 'spell_su_dummy_visual');

DELETE FROM `spell_script_names` WHERE `spell_id`=124783 AND `ScriptName`='spell_tayak_storm_unleashed_dmg';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(124783, 'spell_tayak_storm_unleashed_dmg');

DELETE FROM `spell_script_names` WHERE `spell_id`=124258 AND `ScriptName`='spell_tayak_storms_vehicle';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(124258, 'spell_tayak_storms_vehicle');

DELETE FROM `spell_script_names` WHERE `spell_id`=123814 AND `ScriptName`='spell_tayak_su_visual';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123814, 'spell_tayak_su_visual');

DELETE FROM `spell_script_names` WHERE `spell_id`=123459 AND `ScriptName`='spell_tayak_wind_step';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123459, 'spell_tayak_wind_step');

DELETE FROM `spell_script_names` WHERE `spell_id`=122853 AND `ScriptName`='spell_tempest_slash';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122853, 'spell_tempest_slash');

DELETE FROM `spell_script_names` WHERE `spell_id`=122982 AND `ScriptName`='spell_unseen_strike';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122982, 'spell_unseen_strike');

DELETE FROM `spell_script_names` WHERE `spell_id`=122994 AND `ScriptName`='spell_unseen_strike_dmg';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122994, 'spell_unseen_strike_dmg');

DELETE FROM `spell_script_names` WHERE `spell_id`=122547 AND `ScriptName`='spell_unsok_draw_power';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122547, 'spell_unsok_draw_power');

DELETE FROM `spell_script_names` WHERE `spell_id`=124862 AND `ScriptName`='spell_visions_of_demise';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(124862, 'spell_visions_of_demise');

DELETE FROM `spell_script_names` WHERE `spell_id`=123421 AND `ScriptName`='spell_vital_strikes';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123421, 'spell_vital_strikes');

DELETE FROM `spell_script_names` WHERE `spell_id`=123014 AND `ScriptName`='spell_volatile_amber';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123014, 'spell_volatile_amber');

DELETE FROM `spell_script_names` WHERE `spell_id`=118094 AND `ScriptName`='spell_volley';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(118094, 'spell_volley');

DELETE FROM `spell_script_names` WHERE `spell_id`=118105 AND `ScriptName`='spell_volley';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(118105, 'spell_volley');

DELETE FROM `spell_script_names` WHERE `spell_id`=118106 AND `ScriptName`='spell_volley';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(118106, 'spell_volley');

DELETE FROM `spell_script_names` WHERE `spell_id`=121898 AND `ScriptName`='spell_whirling_blade_damages';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(121898, 'spell_whirling_blade_damages');

DELETE FROM `spell_script_names` WHERE `spell_id`=121897 AND `ScriptName`='spell_whirling_blade_sword';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(121897, 'spell_whirling_blade_sword');

DELETE FROM `spell_script_names` WHERE `spell_id`=123175 AND `ScriptName`='spell_wind_step';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(123175, 'spell_wind_step');

DELETE FROM `spell_script_names` WHERE `spell_id`=122761 AND `ScriptName`='spell_zorlok_exhale';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122761, 'spell_zorlok_exhale');

DELETE FROM `spell_script_names` WHERE `spell_id`=122760 AND `ScriptName`='spell_zorlok_exhale_damage';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(122760, 'spell_zorlok_exhale_damage');

DELETE FROM `areatrigger_template` WHERE `Id`=5302;
INSERT INTO `areatrigger_template` (`Id`, `Type`, `Flags`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `ScriptName`, `VerifiedBuild`) VALUES 
(5302, 0, 8, 5, 5, 0, 0, 0, 0, 'at_monk_chi_burst_damage', 26365);

DELETE FROM `spell_script_names` WHERE `spell_id`=11196 AND `ScriptName`='spell_gen_bandage';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(11196, 'spell_gen_bandage');

DELETE FROM `spell_script_names` WHERE `spell_id`=100780 AND `ScriptName`='spell_monk_tiger_palm';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(100780, 'spell_monk_tiger_palm');

