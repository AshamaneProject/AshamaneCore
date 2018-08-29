UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 34696;

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 34696);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(34696, 0, 0, 0, 1, 0, 100, 1, 3000, 5000, 0, 0, '', 11, 11939, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Summon Imp OOC'),
(34696, 0, 1, 0, 1, 0, 100, 0, 10000, 10000, 20000, 20000, '', 11, 69607, 0, 0, 0, 0, 0, 9, 34689, 15, 25, 0, 0, 0, 0, 'Cast Fireball OOC'),
(34696, 0, 2, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Play Emote on Gossip');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 34689;

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 34689);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(34689, 0, 0, 0, 1, 0, 100, 0, 5000, 5000, 15000, 15000, '', 11, 69608, 0, 0, 0, 0, 0, 9, 34696, 15, 25, 0, 0, 0, 0, 'Cast Fireball OOC'),
(34689, 0, 1, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Play Emote on Gossip'),
(34689, 0, 2, 0, 19, 0, 100, 0, 14008, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Say Text on Quest Add');

UPDATE `creature_template_addon` SET `bytes1` = 0, `bytes2` = 0, `auras` = '' WHERE (entry = 34830);

DELETE FROM `creature_equip_template` WHERE `CreatureID` = 34830;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`) VALUES
(34830, 3, 1910);

UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=35212; -- Gobber
UPDATE `creature_template` SET `minlevel`=1 WHERE `entry`=48805; -- KTC Waiter
UPDATE `creature_template` SET `minlevel`=2, `maxlevel`=2 WHERE `entry`=48806; -- KTC Waitress
UPDATE `creature_template` SET `unit_flags`=32768 WHERE `entry`=35202; -- Kezan Partygoer
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=35209; -- Gobber
UPDATE `creature_template` SET `unit_flags2`=2099200 WHERE `entry`=24110; -- ELM General Purpose Bunny Large
UPDATE `creature_template` SET `minlevel`=1 WHERE `entry`=48721; -- KTC Waitress
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=48341; -- Goblin Cocktail
UPDATE `creature_template` SET `maxlevel`=2 WHERE `entry`=48719; -- KTC Waiter
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=48342; -- Goblin Cocktail
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=48343; -- Goblin Cocktail
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=48340; -- Drink Tray
UPDATE `creature_template` SET `faction`=2159, `unit_flags3`=16 WHERE `entry`=35175; -- Kezan Partygoer
UPDATE `creature_template` SET `faction`=35, `unit_flags`=33554432, `unit_flags2`=4196352 WHERE `entry`=37203; -- Fourth And Goal Target
UPDATE `creature_template` SET `speed_run`=1.142857, `unit_flags2`=35653632 WHERE `entry`=34;
UPDATE `creature_template` SET `unit_flags2`=35653632 WHERE `entry`=34876; -- Frankie Gearslipper
UPDATE `creature_template` SET `speed_run`=1.142857, `unit_flags3`=16 WHERE `entry`=48526; -- Bilgewater Buccaneer
UPDATE `creature_template` SET `unit_flags`=32768 WHERE `entry`=37054; -- Goblin Supermodel
UPDATE `creature_template` SET `unit_flags2`=2099200 WHERE `entry`=34892; -- Ace
UPDATE `creature_template` SET `speed_run`=1.142857, `unit_flags2`=2099200 WHERE `entry`=34954; -- Gobber
UPDATE `creature_template` SET `unit_flags2`=35653632 WHERE `entry`=34878; -- Sudsy Magee
UPDATE `creature_template` SET `unit_flags2`=2099200 WHERE `entry`=34890; -- Izzy
UPDATE `creature_template` SET `unit_flags`=33024, `unit_flags3`=16 WHERE `entry`=34830; -- Defiant Troll
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=35304; -- Brute Enforcer
UPDATE `creature_template` SET `unit_flags2`=35653632 WHERE `entry`=34835; -- Bruno Flameretardant
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=68989; -- Beastblast Babblesnaff
UPDATE `creature_template` SET `unit_flags3`=17 WHERE `entry`=48304; -- Training Dummy
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=49150; -- Subject Nine
UPDATE `creature_template` SET `unit_flags2`=0 WHERE `entry`=48305; -- Injured Employee
UPDATE `creature_template` SET `unit_flags3`=16 WHERE `entry`=34874; -- Megs Dreadshredder
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=4076; -- Roach
UPDATE `creature_template` SET `unit_flags`=32768 WHERE `entry`=37056; -- Goblin Supermodel
UPDATE `creature_template` SET `unit_flags`=32768 WHERE `entry`=37057; -- Goblin Supermodel
UPDATE `creature_template` SET `unit_flags`=32768 WHERE `entry`=37055; -- Goblin Supermodel
UPDATE `creature_template` SET `unit_flags2`=2099200 WHERE `entry`=49133; -- Goblin Epic Trike
UPDATE `creature_template` SET `unit_flags2`=2099200 WHERE `entry`=49132; -- Goblin Trike
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1.142857, `unit_flags2`=4196352 WHERE `entry`=37804; -- Kaja'Cola Balloon
UPDATE `creature_template` SET `unit_flags2`=1073743872 WHERE `entry`=42196; -- ELM General Purpose Bunny Infinite (scale x2.5)

DELETE FROM creature_queststarter WHERE quest IN (14007, 14008, 14009, 14010, 14011, 14012, 14013, 28607, 28606, 24503);
DELETE FROM creature_questender WHERE quest IN (14007, 14008, 14009, 14010, 14011, 14012, 14013, 28607, 28606);

UPDATE `quest_template` SET `RewardBonusMoney`=30, `RewardSpell`=66607, `RewardFactionOverride1`=0, `VerifiedBuild`=27404 WHERE `ID`=14071; -- Rolling with my Homies
UPDATE `quest_template` SET `RewardFactionOverride1`=0, `VerifiedBuild`=27404 WHERE `ID`=28349; -- Megs in Marketing
UPDATE `quest_template` SET `RewardFactionOverride1`=0, `VerifiedBuild`=27404 WHERE `ID`=25473; -- Kaja'Cola
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `VerifiedBuild`=27404 WHERE `ID`=14069; -- Good Help is Hard to Find
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `VerifiedBuild`=27404 WHERE `ID`=14075; -- Trouble in the Mines
UPDATE `quest_template` SET `RewardFactionOverride1`=0, `VerifiedBuild`=27404 WHERE `ID`=14138; -- Taking Care of Business

DELETE FROM `quest_objectives` WHERE `ID` IN (265518 /*265518*/, 265517 /*265517*/, 265516 /*265516*/);
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(265518, 14071, 0, 3, 3, 34958, 1, 0, 0, 0, 'Gobber picked up', 27404), -- 265518
(265517, 14071, 0, 2, 2, 34957, 1, 0, 0, 0, 'Ace picked up', 27404), -- 265517
(265516, 14071, 0, 1, 1, 34959, 1, 0, 0, 0, 'Izzy picked up', 27404); -- 265516

UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=265515; -- 265515
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=253185; -- 253185
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269048; -- 269048
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=265334; -- 265334
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=264755; -- 264755
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=265662; -- 265662
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=289536; -- 289536
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=289535; -- 289535
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=289167; -- 289167
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=270529; -- 270529
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269180; -- 269180
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269179; -- 269179
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269178; -- 269178
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269177; -- 269177
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269176; -- 269176
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269150; -- 269150
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269149; -- 269149
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269148; -- 269148
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269147; -- 269147
UPDATE `quest_objectives` SET `VerifiedBuild`=27404 WHERE `ID`=269145; -- 269145


UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269048 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=265334 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269180 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269179 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269178 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269177 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269176 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269150 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269149 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269148 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269147 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27404 WHERE (`ID`=269145 AND `Index`=0);

UPDATE `creature_template` SET scriptname = "npc_hot_rod_rolling_my_homies" WHERE entry = 34840;
UPDATE `creature_template` SET scriptname = "npc_homies" WHERE entry IN (34892, 34954, 34890);
UPDATE `creature_template` SET scriptname = "npc_homies_summon" WHERE entry IN (34957, 34958, 34959);
UPDATE `creature_template` SET scriptname = "npc_citoyen_gob" WHERE entry IN (35063, 35075, 35234);
UPDATE `creature_template` SET scriptname = "npc_boucanier_gob" WHERE entry IN (37179, 37213);

UPDATE creature_template SET inhabitType = 4 WHERE entry IN (37203, 48572, 37804);
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE (entry = 37490);
UPDATE `creature_template_addon` SET `auras` = '' WHERE (entry = 37490);


UPDATE `quest_template_addon` SET scriptname = "quest_rolling_with_my_homies" WHERE id = 14071;
UPDATE `quest_template_addon` SET scriptname = "quest_fourth_and_goal" WHERE id IN (24503, 28414);

DELETE FROM `spell_area` WHERE spell IN (49416, 49417, 60922, 90161) AND `area` IN (4737, 4822);
INSERT INTO `spell_area` (`spell`, `area`, `flags`) VALUES
(49416, 4737, 0),
(49417, 4737, 0),
(60922, 4737, 0),
(90161, 4822, 3);

DELETE FROM `spell_area` WHERE spell IN (67435) AND `area` IN (4768);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_status`) VALUES
(67435, 4768, 14123, 10);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (66597, 66599, 66600, 66301, 70015, 70075, 69987, 66322, 66999, 91234, 91235, 91236, 91237);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
-- Homies summon
(13, 1,     66597, 0, 31,   3,      34892),
(13, 1,     66599, 0, 31,   3,      34954),
(13, 1,     66600, 0, 31,   3,      34890),
-- Citizen knockback by car
(13, 1,     66301, 1, 31,   3,      35063),
(13, 1,     66301, 2, 31,   3,      35075),
(13, 1,     66301, 3, 31,   3,      35234),
-- Bilgewater Buccaneer
(13, 1,     70015, 0, 31,   3,      48526),
(13, 1,     70075, 0, 31,   3,      48526),
(13, 1,     69987, 0, 31,   3,      37114),
(13, 1,     66322, 0, 31,   3,      37490),
-- Mook disguise beams
(13, 1,     66999, 0, 31,   3,      48925),
(13, 1,     91234, 0, 31,   3,      48925),
(13, 1,     91235, 0, 31,   3,      48925),
(13, 1,     91236, 0, 31,   3,      48925),
(13, 1,     91237, 0, 31,   3,      48925);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (26711, 26712, 14153, 14113);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES
(19, 26711, 20, 1),
(19, 26712, 20, 0),
(19, 14153, 20, 1),
(19, 14113, 20, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (12494);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
(15, 12494, 47, 14126, 10);

UPDATE `creature_template` SET `IconName` = '', `speed_run`=1.142857, `npcflag` = 0, `unit_flags3`=16 WHERE `entry`=48526; -- Bilgewater Buccaneer

DELETE FROM `creature_text` WHERE `CreatureID` IN (35063, 37680);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35063, 0, 0, 'My neck! I\'m gonna sue!', 14, 0, 100, 0, 0, 0, 35313, 'Kezan Citizen to Player'),
(35063, 1, 0, 'I\'ll get you, $n!', 14, 0, 100, 0, 0, 0, 35314, 'Kezan Citizen to Player'),
(35063, 2, 0, 'The Trade Prince will hear about this, $n!', 14, 0, 100, 0, 0, 0, 35316, 'Kezan Citizen to Player'),
(35063, 3, 0, 'Learn how to drive you maniac!', 14, 0, 100, 0, 0, 0, 35311, 'Kezan Citizen to Player'),
(35063, 4, 0, 'Watch where you\'re going!', 14, 0, 100, 0, 0, 0, 35310, 'Kezan Citizen to Player'),
(35063, 5, 0, 'You\'re a public nuisance, $n!', 14, 0, 100, 0, 0, 0, 35315, 'Kezan Citizen to Player'),
(35063, 6, 0, 'You\'re gonna hear from my lawyer!', 14, 0, 100, 0, 0, 0, 35309, 'Kezan Citizen to Player'),
(35063, 7, 0, 'Ouch!', 14, 0, 100, 0, 0, 0, 35312, 'Kezan Citizen to Player'),
(37680, 0, 0, 'We\'ll have to go around.', 12, 0, 100, 0, 0, 0, 37257, 'Sassy Hardwrench to Player'),
(37680, 1, 0, 'OUT OF THE WAY!', 14, 0, 100, 0, 0, 0, 37258, 'Sassy Hardwrench to Player'),
(37680, 2, 0, 'Here we are, safe and... OH NO! We\'ve been double-crossed!', 12, 0, 100, 0, 0, 0, 37259, 'Sassy Hardwrench to Player');

UPDATE `gossip_menu` SET `VerifiedBuild`=27404 WHERE (`MenuId`=12494 AND `TextId`=17576);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=37228, `VerifiedBuild`=27404 WHERE (`MenuId`=12494 AND `OptionIndex`=0);
UPDATE `creature_template` SET gossip_menu_id = 12494 WHERE entry = 34668;

DELETE FROM spell_script_names WHERE scriptname IN ("spell_kezan_despawn_sharks",
                                                    "npc_fourth_and_goal_kick_footbomb",
                                                    "spell_kezan_fireworks",
                                                    "spell_great_bank_heist_vault_interact",
                                                    "aura_hobart_ingenious_cap_of_mook_foolery",
                                                    "spell_life_saving_complete");
INSERT INTO spell_script_names VALUES
(69987, "spell_kezan_despawn_sharks"),
(70052, "npc_fourth_and_goal_kick_footbomb"),
(66912, "spell_kezan_fireworks"),
(67555, "spell_great_bank_heist_vault_interact"),
(67435, "aura_hobart_ingenious_cap_of_mook_foolery"),
(91847, "spell_life_saving_complete");

UPDATE `spell_area` SET `quest_end_status` = 64 WHERE `quest_start` IN (14153, 14113);

DELETE FROM spell_area WHERE spell IN (66985);
DELETE FROM spell_area WHERE spell IN (49416) AND `area` = 4737 AND `quest_start` = 14125;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `flags`, `quest_start_status`, `quest_end_status`) VALUES
(66985, 4765, 14113, 14113, 2, 8, 64),
(66985, 4765, 14153, 14153, 2, 8, 64),
(49416, 4737, 14125, 14125, 3, 2, 64);

UPDATE `creature_template` SET `ScriptName` = 'npc_kezan_partygoer' WHERE entry IN (35175, 35186);
UPDATE `creature_template` SET `unit_flags2` = 0, `ScriptName` = 'npc_first_bank_of_kezan_vault' WHERE entry = 35486;
UPDATE `creature_template` SET `ScriptName` = 'npc_coach_crosscheck' WHERE entry = 37106;
UPDATE `creature_template` SET `ScriptName` = 'npc_end_hot_rod' WHERE entry = 37676;

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (37676, 37598);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(37676, 37680, 0, 1, 'Hot Rod - Sassy Hardwrench', 5, 0), -- Hot Rod - Sassy Hardwrench
(37598, 37599, 3, 1, 'Gasbot - Gasbot Gas Target', 5, 0), -- Gasbot - Gasbot Gas Target
(37598, 37599, 2, 1, 'Gasbot - Gasbot Gas Target', 5, 0), -- Gasbot - Gasbot Gas Target
(37598, 37599, 1, 1, 'Gasbot - Gasbot Gas Target', 5, 0), -- Gasbot - Gasbot Gas Target
(37598, 37599, 0, 1, 'Gasbot - Gasbot Gas Target', 5, 0); -- Gasbot - Gasbot Gas Target

UPDATE `gameobject_template` SET `ScriptName` = '' WHERE entry = 201736;

UPDATE creature_template_addon SET auras = '' WHERE entry IN (35186, 35175);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (35186, 35175));
UPDATE creature SET spawndist = 0, movementType = 0 WHERE id IN (35186, 35175, 35609);
DELETE FROM creature WHERE guid = 21016389 OR id = 35613;

DELETE FROM `creature_text` WHERE `CreatureID` IN (35175, 35486);
insert into `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) values
(35175, 0, 0, 'If only I had someone to dance with.', 12, 0, 100, 0, 0, 0, 40224, 0, 'Kezan Partygoer'),
(35175, 1, 0, 'Ugh... I need a bucket!', 12, 0, 100, 0, 0, 0, 40223, 0, 'Kezan Partygoer'),
(35175, 2, 0, 'I could really use a refill on my drink here.', 12, 0, 100, 0, 0, 0, 40222, 0, 'Kezan Partygoer'),
(35175, 3, 0, 'I love fireworks!', 12, 0, 100, 0, 0, 0, 40225, 0, 'Kezan Partygoer'),
(35175, 4, 0, 'This is delicious! Are there more hors d\'oeuvres?', 12, 0, 100, 0, 0, 0, 40226, 0, 'Kezan Partygoer'),
(35175, 5, 0, 'A fresh glass of bubbly. Just what the doctor ordered,  $n.', 12, 0, 100, 0, 0, 0, 35417, 0, 'Kezan Partygoer'),
(35175, 5, 1, 'Thanks for the refill,  $g sir : ma\'am;!', 12, 0, 100, 0, 0, 0, 35418, 0, 'Kezan Partygoer'),
(35175, 5, 2, 'This sparkling white wine is delicious! Wherever did you get it?', 12, 0, 100, 0, 0, 0, 35419, 0, 'Kezan Partygoer'),
(35175, 5, 3, 'I think this one will have to be my last. I\'m driving home after the party.', 12, 0, 100, 0, 0, 0, 35420, 0, 'Kezan Partygoer'),
(35175, 5, 4, 'Thanksh!', 12, 0, 100, 0, 0, 0, 35421, 0, 'Kezan Partygoer'),
(35175, 6, 0, 'I feel much better now...hic!', 12, 0, 100, 0, 0, 0, 35422, 0, 'Kezan Partygoer'),
(35175, 6, 1, 'Oh,  my head hurtsh.', 12, 0, 100, 0, 0, 0, 35423, 0, 'Kezan Partygoer'),
(35175, 6, 2, 'Shorry about your shoes.', 12, 0, 100, 0, 0, 0, 35424, 0, 'Kezan Partygoer'),
(35175, 7, 0, 'A disco ball?! Groovy!', 12, 0, 100, 0, 0, 0, 35425, 0, 'Kezan Partygoer'),
(35175, 7, 1, 'How do you like my moves,  $n?', 12, 0, 100, 0, 0, 0, 35426, 0, 'Kezan Partygoer'),
(35175, 7, 2, 'We should totally have a pants-off dance-off!', 12, 0, 100, 0, 0, 0, 35427, 0, 'Kezan Partygoer'),
(35175, 7, 3, 'Shake it like a goblinoid picture!', 12, 0, 100, 0, 0, 0, 35428, 0, 'Kezan Partygoer'),
(35175, 8, 0, 'Wow! That sure beats this puny,  little sparkler!', 12, 0, 100, 0, 0, 0, 35429, 0, 'Kezan Partygoer'),
(35175, 8, 1, 'You really stop at no expense,  $n! Amazing!', 12, 0, 100, 0, 0, 0, 35430, 0, 'Kezan Partygoer'),
(35175, 8, 2, 'Best... Party... Evar!', 12, 0, 100, 0, 0, 0, 35431, 0, 'Kezan Partygoer'),
(35175, 8, 3, 'Woo hoo,  fireworks! More,  more!', 12, 0, 100, 0, 0, 0, 35432, 0, 'Kezan Partygoer'),
(35175, 9, 0, 'Thanks. I was almost out. So hungry!', 12, 0, 100, 0, 0, 0, 35433, 0, 'Kezan Partygoer'),
(35175, 9, 1, 'These are the most delicious hors d\'oeurves I have ever tasted. You must share your recipe,  $n!', 12, 0, 100, 0, 0, 0, 35434, 0, 'Kezan Partygoer'),
(35175, 9, 2, 'Finger licking good!', 12, 0, 100, 0, 0, 0, 35435, 0, 'Kezan Partygoer'),
(35175, 9, 3, 'Nom,  nom,  nom!', 12, 0, 100, 0, 0, 0, 35436, 0, 'Kezan Partygoer'),
(35486, 0, 0, '...', 42, 0, 100, 0, 0, 0, 38461, 0, 'First Bank of Kezan Vault to Player'),
(35486, 1, 0, 'You are breaking into the vault to retrieve your Personal Riches!', 42, 0, 100, 0, 0, 0, 35566, 0, 'First Bank of Kezan Vault to Player'),
(35486, 2, 0, 'Use what is called for in your Goblin All-In-1-Der Belt below to crack open the vault!$B|TInterface\\Icons\\INV_Misc_EngGizmos_20.blp:64|t |TInterface\\Icons\\INV_Misc_Bomb_07.blp:64|t |TInterface\\Icons\\INV_Misc_Ear_NightElf_02.blp:64|t |TInterface\\Icons\\INV_Misc_EngGizmos_swissArmy.blp:64|t |TInterface\\Icons\\INV_Weapon_ShortBlade_21.blp:64|t', 42, 0, 100, 0, 0, 0, 35567, 0, 'First Bank of Kezan Vault to Player'),
(35486, 3, 0, 'The vault will be cracked once the |cFFFF2222Vault Breaking progress bar reaches 100 percent!|r$B|TInterface\\Icons\\INV_Misc_coin_02.blp:64|t$BDoing the wrong thing at the wrong time will reduce the progress of the bar.', 42, 0, 100, 0, 0, 0, 35568, 0, 'First Bank of Kezan Vault to Player'),
(35486, 4, 0, 'Good luck!', 42, 0, 100, 0, 0, 0, 35569, 0, 'First Bank of Kezan Vault to Player'),
(35486, 5, 0, 'Correct!', 42, 0, 100, 0, 0, 0, 35702, 0, 'First Bank of Kezan Vault to Player'),
(35486, 6, 0, 'Timed Out!', 42, 0, 100, 0, 0, 0, 35773, 0, 'First Bank of Kezan Vault to Player'),
(35486, 7, 0, 'Incorrect!', 42, 0, 100, 0, 0, 0, 35704, 0, 'First Bank of Kezan Vault to Player'),
(35486, 8, 0, 'Use your |cFFFF2222Blastcrackers!|r$B|TInterface\\Icons\\INV_Misc_Bomb_07.blp:64|t', 42, 0, 100, 0, 0, 0, 35577, 0, 'First Bank of Kezan Vault to Player'),
(35486, 9, 0, 'Use your |cFFFF2222Ear-O-Scope!|r$B|TInterface\\Icons\\INV_Misc_Ear_NightElf_02.blp:64|t', 42, 0, 100, 0, 0, 0, 35578, 0, 'First Bank of Kezan Vault to Player'),
(35486, 10, 0, 'Use your |cFFFF2222Infinifold Lockpick!|r$B|TInterface\\Icons\\INV_Misc_EngGizmos_swissArmy.blp:64|t', 42, 0, 100, 0, 0, 0, 35579, 0, 'First Bank of Kezan Vault to Player'),
(35486, 11, 0, 'Use your |cFFFF2222Kaja\'mite Drill!|r$B|TInterface\\Icons\\INV_Weapon_ShortBlade_21.blp:64|t', 42, 0, 100, 0, 0, 0, 35576, 0, 'First Bank of Kezan Vault to Player'),
(35486, 12, 0, 'Use your |cFFFF2222Amazing G-Ray!|r$B|TInterface\\Icons\\INV_Misc_EngGizmos_20.blp:64|t', 42, 0, 100, 0, 0, 0, 35700, 0, 'First Bank of Kezan Vault to Player'),
(35486, 13, 0, 'Success! You have your Personal Riches!$B$B|TInterface\\Icons\\INV_Misc_coin_02.blp:64|t', 42, 0, 100, 0, 0, 0, 35852, 0, 'First Bank of Kezan Vault to Player');

UPDATE `creature_template` SET `InhabitType` = 2 WHERE entry = 35185;

DELETE FROM `creature` WHERE `guid` = 210219202;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(210219202,35222,648,4737,4765,1,0,381,0,-1,0,0,-8423.76,1362.04,116.862,4.71,300,0,0,262680,89080,0,0,134250496,0,0,0,'',0);


DELETE FROM phase_area WHERE AreaId IN (4765, 4737);
INSERT INTO phase_area VALUE
(4737, 169, "Kezan default phase"),
(4765, 379, "KTC headquarter party"),
(4765, 380, "KTC headquarter party pirates"),
(4765, 381, "KTC headquarter Gallywix"),
(4765, 382, "KTC headquarter Post-Gallywix"),
(4737, 383, "Kezan Burning 1"),
(4737, 384, "Kezan Burning 2");


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceEntry` IN (4765, 4737);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`) VALUES
(26, 379, 4765, 0, 47,   14113,      10, 0),
(26, 379, 4765, 1, 47,   14153,      10, 0),

(26, 380, 4765, 0, 47,   14115,      10, 0),

(26, 169, 4737, 0, 47,   14116,      11, 0),
(26, 381, 4765, 0, 47,   14116,      64, 1),

(26, 382, 4765, 0, 47,   14116,      64, 0),

(26, 383, 4737, 0, 47,   14116,      64, 0),
(26, 383, 4737, 0, 47,   14125,      9, 0),

(26, 384, 4737, 0, 47,   14125,      66, 0);

UPDATE `creature_template` SET `VehicleId` = 1362 WHERE `entry` = 48925;

DELETE FROM `waypoint_data` WHERE `id` = 2102191151;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(2102191151, 1,  -8424.31, 1334.04, 102.364, 0, 0, 1, 0, 100, 0),
(2102191151, 2,  -8395.26, 1339.11, 101.928, 0, 0, 1, 0, 100, 0),
(2102191151, 3,  -8377.55, 1350.08, 102.145, 0, 0, 1, 0, 100, 0),
(2102191151, 4,  -8363.19, 1347.12, 100.045, 0, 0, 1, 0, 100, 0),
(2102191151, 5,  -8344.14, 1338.37, 89.6854, 0, 0, 1, 0, 100, 0),
(2102191151, 6,  -8320.57, 1321.89, 87.9474, 0, 0, 1, 0, 100, 0),
(2102191151, 7,  -8307.73, 1313.42, 84.2066, 0, 0, 1, 0, 100, 0),
(2102191151, 8,  -8295.22, 1307.14, 76.8203, 0, 0, 1, 0, 100, 0),
(2102191151, 9,  -8274.81, 1298.73, 58.8299, 0, 0, 1, 0, 100, 0),
(2102191151, 10, -8250.19, 1293.47, 44.3981, 0, 0, 1, 0, 100, 0),
(2102191151, 11, -8213.84, 1291.52, 31.8984, 0, 0, 1, 0, 100, 0),
(2102191151, 12, -8190.75, 1292.87, 28.6014, 0, 0, 1, 0, 100, 0),
(2102191151, 13, -8164.21, 1296.02, 24.587,  0, 0, 1, 0, 100, 0),
(2102191151, 14, -8140.45, 1297.16, 21.037,  0, 0, 1, 0, 100, 0),
(2102191151, 15, -8133.45, 1297.25, 20.4148, 0, 0, 1, 0, 100, 0),
(2102191151, 16, -8130.83, 1312.85, 19.228,  0, 0, 1, 0, 100, 0),
(2102191151, 17, -8125.35, 1357.09, 18.6857, 0, 0, 1, 0, 100, 0),
(2102191151, 18, -8122.24, 1383.68, 23.6738, 0, 0, 1, 0, 100, 0),
(2102191151, 19, -8119.39, 1402.93, 21.8595, 0, 0, 1, 0, 100, 0),
(2102191151, 20, -8112.72, 1436.86, 11.3698, 0, 100, 1, 0, 100, 0),
(2102191151, 21, -8108.13, 1466.51, 10.096,  0, 0, 1, 0, 100, 0),
(2102191151, 22, -8119.96, 1482.16, 10.4551, 0, 0, 1, 0, 100, 0),
(2102191151, 23, -8105.09, 1496.53, 9.9918,  0, 0, 1, 0, 100, 0),
(2102191151, 24, -8101.6,  1537.49, 9.30604, 0, 0, 1, 0, 100, 0),
(2102191151, 25, -8100.56, 1564.91, 8.77478, 0, 0, 1, 0, 100, 0),
(2102191151, 26, -8099.34, 1605.21, 8.71264, 0, 0, 1, 0, 100, 0),
(2102191151, 27, -8099.08, 1633.49, 8.9904,  0, 0, 1, 0, 100, 0),
(2102191151, 28, -8100.52, 1667.15, 11.9768, 0, 0, 1, 0, 100, 0),
(2102191151, 29, -8105.33, 1693.5,  15.5051, 0, 0, 1, 0, 100, 0),
(2102191151, 30, -8122.26, 1707.98, 25.4757, 0, 0, 1, 0, 100, 0),
(2102191151, 31, -8134.12, 1724.65, 32.6605, 0, 0, 1, 0, 100, 0),
(2102191151, 32, -8137.79, 1743.64, 35.0798, 0, 0, 1, 0, 100, 0),
(2102191151, 33, -8128.81, 1768.88, 32.0084, 0, 0, 1, 0, 100, 0),
(2102191151, 34, -8111.32, 1785.55, 28.8177, 0, 0, 1, 0, 100, 0),
(2102191151, 35, -8100.22, 1798.32, 31.8748, 0, 0, 1, 0, 100, 0),
(2102191151, 36, -8082.41, 1822.76, 40.0052, 0, 0, 1, 0, 100, 0),
(2102191151, 37, -8067.03, 1823.19, 42.8797, 0, 0, 1, 0, 100, 0),
(2102191151, 38, -8041.84, 1822.83, 41.9796, 0, 0, 1, 0, 100, 0),
(2102191151, 39, -8019.45, 1822.06, 32.2842, 0, 0, 1, 0, 100, 0),
(2102191151, 40, -7995.66, 1821.51, 22.5476, 0, 100, 1, 0, 100, 0),
(2102191151, 41, -7977.23, 1828.2,  14.1152, 0, 0, 1, 0, 100, 0),
(2102191151, 42, -7961.44, 1833.92, 10.3923, 0, 0, 1, 0, 100, 0),
(2102191151, 43, -7947.59, 1835.62, 6.62476, 0, 0, 1, 0, 100, 0),
(2102191151, 44, -7922.4,  1835.76, 5.6916,  0, 0, 1, 0, 100, 0),
(2102191151, 45, -7901.27, 1835.24, 4.90805, 0, 0, 1, 0, 100, 0),
(2102191151, 46, -7881.67, 1834.74, 4.182,   0, 0, 3, 0, 100, 0),
(2102191151, 47, -7875.67, 1835.35, 9.73849, 0, 0, 1, 0, 100, 0),
(2102191151, 48, -7863.19, 1837.04, 15.3964, 0, 0, 1, 0, 100, 0),
(2102191151, 49, -7852.21, 1839.83, 7.62995, 0, 0, 2, 0, 100, 0);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 34668 AND `id` = 17;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_param1`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34668, 17, 62, 12494, 11, 70319, 7, 'Sassy Hardwrench - On Gossip Option 0 Selected - Cast \'70319\'');
