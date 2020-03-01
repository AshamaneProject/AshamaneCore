-- fix 8018 guthrum flight master not working
UPDATE `gossip_menu_option`
SET `OptionType` = 4,
`OptionNpcFlag` = 8192
WHERE `MenuId` = 11885;

-- fix for quest 26546 Razorbeak Friends
UPDATE `creature_template`
SET `ScriptName` = 'npc_trained_razorbeak'
WHERE `entry` = 2657;

-- fix Revantusk Stalker not attacking
UPDATE `creature_template`
SET `faction` = 876
WHERE `entry` = 42536;

-- stop mask spell bunny from moving for quest faces of evil 26521
UPDATE `creature`
SET `spawndist` = 0,
`MovementType` = 0
WHERE id = 42704;

-- create spell hook for quest faces of evil 26521
DELETE FROM `spell_script_names`
WHERE `spell_id` = 79513;

INSERT INTO spell_script_names VALUES
(79513, 'spell_tiki_torch');

-- fix looting of Sacrificed Vilebranch
UPDATE `creature_template`
SET `pickpocketloot` = 42857
WHERE `entry` = 42857;

DELETE FROM `pickpocketing_loot_template`
WHERE `Entry` = 42857;

INSERT INTO `pickpocketing_loot_template`
(`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
VALUES
(42857,58228,0,100,1,1,0,1,1,'');

-- remove umboda overspawn
DELETE FROM `creature`
WHERE `guid` = 191915;

-- fix quest 26523 all that skitters
-- adjust Skittering Spiderling
UPDATE creature_template
SET faction = 190,
npcflag = 16777216
WHERE entry = 42689;

UPDATE npc_spellclick_spells
SET cast_flags = 3
WHERE npc_entry = 42689;

-- adjust drop chance for fang of shadra
UPDATE `gameobject_loot_template`
SET `Chance` = 100
WHERE (`Entry` = 204120 AND `Item` = 58281);

-- create spell hook for quest summoning shadra 26531
DELETE FROM `spell_script_names`
WHERE `spell_id` = 80469;

INSERT INTO spell_script_names VALUES
(80469, 'spell_ritual_of_shadra');

-- fix some gameobjects
DELETE FROM `gameobject_template_addon` WHERE `entry` IN (204120 /*204120*/, 204275 /*204275*/, 181645 /*181645*/, 142712 /*142712*/, 144068 /*144068*/, 205890 /*205890*/, 205892 /*205892*/, 205891 /*205891*/, 204133 /*204133*/, 175889 /*175889*/);
INSERT INTO `gameobject_template_addon` (`entry`, `faction`, `flags`) VALUES
(204120, 0, 4), -- 204120
(204275, 0, 4), -- 204275
(181645, 0, 4), -- 181645
(142712, 83, 4), -- 142712
(144068, 0, 4), -- 144068
(205890, 0, 4), -- 205890
(205892, 0, 4), -- 205892
(205891, 0, 4), -- 205891
(204133, 0, 4), -- 204133
(175889, 0, 4); -- 175889

DELETE FROM `gameobject_questitem` WHERE (`GameObjectEntry`=204120 AND `Idx`=0) OR (`GameObjectEntry`=181645 AND `Idx`=0) OR (`GameObjectEntry`=205890 AND `Idx`=0) OR (`GameObjectEntry`=205892 AND `Idx`=0) OR (`GameObjectEntry`=205891 AND `Idx`=0) OR (`GameObjectEntry`=204133 AND `Idx`=0) OR (`GameObjectEntry`=175889 AND `Idx`=0);
INSERT INTO `gameobject_questitem` (`GameObjectEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(204120, 0, 58281, 24015), -- 204120
(181645, 0, 23694, 24015), -- 181645
(205890, 0, 61972, 24015), -- 205890
(205892, 0, 61974, 24015), -- 205892
(205891, 0, 61973, 24015), -- 205891
(204133, 0, 58282, 24015), -- 204133
(175889, 0, 12402, 24015); -- 175889

-- fix position of Highvale Records
UPDATE `gameobject`
SET `position_x` = 262.927,
`position_y` =-2803.76,
`position_z` = 123.369
WHERE `guid` = 216158;

-- fix broken quest Queldanil Lodge
UPDATE `quest_template`
SET `flags` = 0
WHERE `ID` = 27725;

-- fix tracker yoro
UPDATE `creature_template_addon`
SET `bytes2` = 257,
`auras` = ''
WHERE `entry` = 46476;
