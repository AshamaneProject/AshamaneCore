DELETE FROM disables WHERE `sourceType` = 1 AND `entry` = 14474;
INSERT INTO `disables` (`sourceType`, `entry`) VALUES
(1, 14474); 

UPDATE creature_template SET scriptname = "npc_zapnozzle" WHERE entry IN (36608);
UPDATE gameobject_template SET scriptname = "gob_goblin_escape_pod" WHERE entry = 195188;
UPDATE creature_template SET `unit_flags` = 514, `InhabitType` = 2, scriptname = "npc_goblin_espace_pod" WHERE entry IN (34748, 35649);
UPDATE creature SET MovementType = 1, spawndist = 20 WHERE id = 34763;
UPDATE creature_template SET scriptname = "npc_bomb_monkey" WHERE entry IN (34699);

DELETE FROM phase_area WHERE AreaId IN (4720);
INSERT INTO phase_area VALUE
(4720, 169, "Lost Isles default phase"),
(4720, 170, "Lost Isles - Part 1");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceEntry` IN (4720);
-- INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`) VALUES
-- (26, 170, 4720, 0, 47, 14113, 10, 0);

DELETE FROM `creature_text` WHERE `CreatureID` IN (36600, 36608);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(36600, 0, 0, 'That\'s $n?! Sorry, Doc, I thought $g he : she; was dead!', 12, 0, 100, 0, 0, 0, 36577, 'Geargrinder Gizmo to Player'),
(36600, 1, 0, 'Yeah, there\'s tons of people still trapped in the escape pods, boss. Oh, wait. I guess you\'re not the boss anymore. Anyways, they\'re all probably going to drown if you don\'t get them out.', 12, 0, 100, 1, 0, 0, 49824, 'Geargrinder Gizmo to Player'),
(36608, 0, 0, 'Gizmo, what are you doing just sitting there? Don\'t you recognize who that is laying next to you?!', 12, 0, 100, 396, 0, 0, 36543, 'Doc Zapnozzle to Player'),
(36608, 1, 0, 'That\'s $n! $G He\'s : She\'s; the whole reason we\'re still breathing and not crispy fried critters back on Kezan.', 12, 0, 100, 396, 0, 0, 36544, 'Doc Zapnozzle to Player'),
(36608, 2, 0, 'Stay back, I\'m going to resuscitate $g him : her;! I hope these wet jumper cables don\'t kill us all!', 12, 0, 100, 396, 0, 0, 36545, 'Doc Zapnozzle to Player'),
(36608, 3, 0, 'Come on! Clear!', 12, 0, 100, 396, 0, 0, 36546, 'Doc Zapnozzle to Player'),
(36608, 4, 0, 'That\'s all I\'ve got. It\'s up to $g him : her; now. You hear me, $n? Come on, snap out of it! Don\'t go into the Light!', 12, 0, 100, 396, 0, 0, 36547, 'Doc Zapnozzle to Player'),
(36608, 5, 0, 'You made the right choice. We all owe you a great deal, $n. Try not to get yourself killed out here.', 12, 0, 100, 396, 0, 0, 36548, 'Doc Zapnozzle to Player'),
(36608, 6, 0, 'There are more survivors to tend to. I\'ll see you on the shore.', 12, 0, 100, 397, 0, 0, 36549, 'Doc Zapnozzle to Player');

DELETE FROM `spell_area` WHERE `spell` = 69010;
INSERT INTO `spell_area` (`spell`, `area`, `quest_end`, `quest_end_status`) VALUES
(69010, 4721, 14239, 64);

DELETE FROM spell_script_names WHERE scriptname IN ("spell_lost_isles_near_death", "spell_ctu_snapflash", "spell_ctu_bind_sight");
INSERT INTO spell_script_names VALUES
(69010, "spell_lost_isles_near_death"),
(68280, "spell_ctu_snapflash"),
(70641, "spell_ctu_bind_sight");

DELETE FROM creature WHERE guid = 280000018;
insert into `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
(280000018,28960,648,0,0,1,0,0,0,-1,0,0,551.205,3260.38,-1.15172,2.57184,300,0,0,26268,0,0,0,0,0,0,0,'',0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (69018, 70641, 68280, 68059);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`,`ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
(13, 1, 69018, 0, 31, 3, 28960),
(13, 1, 70641, 0, 31, 3, 23837),
(13, 1, 68280, 1, 31, 3, 37872),
(13, 1, 68280, 2, 31, 3, 37895),
(13, 1, 68280, 3, 31, 3, 37896),
(13, 1, 68280, 4, 31, 3, 37897),
(13, 1, 68059, 0, 31, 3, 35810);

UPDATE creature_template SET AIName = '', scriptname = "npc_foreman_dampwick" WHERE entry IN (35769);
UPDATE creature_template SET scriptname = "npc_frightened_miner_escort" WHERE entry IN (35813);
UPDATE `creature_template_addon` SET `bytes2` = 0, `auras` = '' WHERE `entry` = 35810; 
DELETE FROM creature_addon WHERE guid IN (40000244, 40000245);

DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 36600);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(36600, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Play Emote on Gossip'),
(36600, 0, 1, 0, 19, 0, 100, 0, 14001, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Say Text on Quest Add'),
(36600, 0, 2, 0, 19, 0, 100, 0, 14474, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Say Text on Quest Add');

UPDATE `gameobject_questitem` SET `VerifiedBuild`=27481 WHERE (`GameObjectEntry`=195201 AND `Idx`=0); -- Crate of Tools
DELETE FROM creature WHERE guid IN (40000011, 40000108, 40000298, 40000339, 40000351, 40000615, 40000712, 40000713, 40000720, 40000169, 40000269);
