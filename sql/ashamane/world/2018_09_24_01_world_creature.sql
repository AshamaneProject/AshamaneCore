-- Table `creature_template`
UPDATE `creature_template` SET `npcflag` = 268435585 WHERE entry IN (54442, 54473);

UPDATE `creature_template` SET `minlevel` = 0, `maxlevel` = 0 WHERE (entry = 3296);

REPLACE INTO `gameobject_template` VALUES
(1617, 50, 270, 'Silverleaf', '', '', '', 0.6, 29, 1414, 0, 0, 50, 100, 30, 0, 0, 0, 0, 0, 683, 1, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 27602),
(1618, 50, 269, 'Peacebloom', '', '', '', 0.5, 29, 1415, 0, 0, 50, 100, 30, 0, 0, 0, 0, 0, 683, 1, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 27602),
(1731, 50, 310, 'Copper Vein', '', '', '', 0.5, 38, 1502, 0, 0, 50, 100, 30, 0, 0, 0, 0, 0, 683, 1, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 27602);
