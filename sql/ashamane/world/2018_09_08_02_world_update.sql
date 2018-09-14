-- Condition for source Quest available condition type Skill
-- https://es.wowhead.com/quest=29481/maestro-en-elixires
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=29481 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 29481, 0, 0, 7, 0, 171, 475, 0, 0, 0, 0, '', 'Quest Elixir Master available if player must have reached 475 on skill Alchemy.');

-- Condition for source Quest available condition type Skill
-- https://es.wowhead.com/quest=29482/maestro-de-transmutaci%C3%B3n
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=29482 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 29482, 0, 0, 7, 0, 171, 475, 0, 0, 0, 0, '', 'Quest Transmutation Master available if player must have reached 475 on skill Alchemy.');

DELETE FROM pool_template WHERE entry=348;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(348, 1, "Jewelcrafting daily quest pool Alliance");

DELETE FROM pool_quest WHERE pool_entry = 348 OR entry IN (25105, 25154, 25155, 25156, 25157);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(25105, 348, "Nibbler! No!"),
(25154, 348, "A Present for Lila"),
(25155, 348, "Ogrezonians in the Mood"),
(25156, 348, "Elemental Goo"),
(25157, 348, "The Latest Fashion!");

-- You need Jewelcrafting 475 to take quests
-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25105 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25105, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest Nibbler!  No! available if player must have reached 475 on skill Jewelcrafting.');

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25154 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25154, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest A Present for Lila available if player must have reached 475 on skill Jewelcrafting.');

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25155 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25155, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest Ogrezonians in the Mood available if player must have reached 475 on skill Jewelcrafting.');

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25156 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25156, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest Elemental Goo available if player must have reached 475 on skill Jewelcrafting.');

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25157 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25157, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest The Latest Fashion! available if player must have reached 475 on skill Jewelcrafting.');

DELETE FROM pool_template WHERE entry=349;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(349, 1, "Jewelcrafting daily quest pool Horde");

DELETE FROM pool_quest WHERE pool_entry = 349 OR entry IN (25158, 25160, 25161, 25162, 25159);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(25158, 349, "Nibbler! No!"),
(25160, 349, "A Present for Lila"),
(25161, 349, "Ogrezonians in the Mood"),
(25162, 349, "Elemental Goo"),
(25159, 349, "The Latest Fashion!");

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25158 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25158, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest Nibbler!  No! available if player must have reached 475 on skill Jewelcrafting.');

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25160 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25160, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest A Present for Lila available if player must have reached 475 on skill Jewelcrafting.');

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25161 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25161, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest Ogrezonians in the Mood available if player must have reached 475 on skill Jewelcrafting.');

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25162 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25162, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest Elemental Goo available if player must have reached 475 on skill Jewelcrafting.');

-- Condition for source Quest available condition type Skill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=25159 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 25159, 0, 0, 7, 0, 755, 475, 0, 0, 0, 0, '', 'Quest The Latest Fashion! available if player must have reached 475 on skill Jewelcrafting.');