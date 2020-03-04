DELETE FROM `smart_scripts` WHERE `entryorguid`='86563';
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_archmage_khadgar_86563' WHERE `entry`='86563';
UPDATE `gossip_menu_option` SET `OptionText`='I\'m ready. Let\'s get down to Azsuna, Khadgar.' WHERE `MenuId` = '86563';
DELETE FROM `creature_text` WHERE `CreatureID`=86563 AND `GroupID` IN (0, 1);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(86563, 0, 0, 'Here you are. $n, over here, Azsuna awaits.', 12, 0, 100, 3, 0, 57419, 0, 0, 'Archmage Khadgar to Player'),
(86563, 1, 0, 'Let me know when you are ready, champion.', 12, 0, 100, 1, 0, 58371, 0, 0, 'Archmage Khadgar to Player');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (86563);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 86563, 1, 0, 0, 9, 0, 41220, 0, 0, 0, 0, 0, '', 'Gossip Only Shows if Quest Taken');