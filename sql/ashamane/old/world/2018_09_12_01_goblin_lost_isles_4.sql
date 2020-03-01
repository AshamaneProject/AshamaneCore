UPDATE creature_template SET InhabitType = 4 WHERE entry IN (39169, 38819, 39037);

DELETE FROM `terrain_swap_defaults` WHERE `MapId` = 648;
INSERT INTO `terrain_swap_defaults` (`MapId`, `TerrainSwapMap`, `Comment`) VALUES
(648, 661, 'Lost Isles - Town in the Box'),
(648, 659, 'Lost Isles - Volcano Eruption');

DELETE FROM spell_script_names WHERE scriptname IN ("spell_tiab_effect2");
INSERT INTO spell_script_names VALUES
(71091, "spell_tiab_effect2");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 25 AND `SourceEntry` IN (661, 659);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`) VALUES
(25, 661, 0, 47, 14245, 66, 0),
(25, 659, 0, 47, 14245, 32, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceEntry` = 4720 AND SourceGroup >= 180;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`) VALUES
(26, 180, 4720, 0, 47, 14245, 66, 0),
-- (26, 180, 4720, 0, 47, 14245, 32, 1),

(26, 181, 4720, 0, 47, 14245, 32, 0),
(26, 181, 4720, 0, 47, 14246, 32, 0),

(26, 182, 4720, 0, 47, 14245, 32, 0),
(26, 182, 4720, 0, 47, 14246, 32, 0),

(26, 183, 4720, 0, 47, 14245, 32, 0),
(26, 183, 4720, 0, 47, 14246, 32, 0),

(26, 184, 4720, 0, 47, 14245, 32, 0),
(26, 184, 4720, 0, 47, 14246, 32, 0),

(26, 185, 4720, 0, 47, 14245, 32, 0);

DELETE FROM creature WHERE guid IN (40001821);
UPDATE `creature` SET `PhaseId` = 179 WHERE `guid` = 40001788;
