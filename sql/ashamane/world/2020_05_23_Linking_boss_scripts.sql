-- Azerokk
UPDATE `creature_template` SET `faction`=16,`maxlevel`=122,`minlevel`=116,`rank`=3,`mechanic_immune_mask`=2147467263 WHERE `entry`=129227;

UPDATE `creature_template` SET `ScriptName`='boss_azerokk' WHERE `entry`=129227;

-- instance_encounters
DELETE FROM `instance_encounters` WHERE `entry` IN (2105,2106,2107,2108);
INSERT INTO `instance_encounters` (`entry`, `creditType`, `creditEntry`, `lastEncounterDungeon`, `comment`) VALUES
('2105','0','139904','0','Coin-Operated Crowd Pummeler'),
('2106','0','129227','0','Azerokk'),
('2107','0','139273','0','Rixxa Fluxfume'),
('2108','0','131227','3000','Mogul Razdunk');

DELETE FROM `spell_script_names` WHERE `spell_id` IN
(257597,271698,257593,258622,275907);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
(257597,'spell_azerite_infusion1'),
(271698,'spell_azerite_infusion2'),
(257593,'spell_call_earthrager'),
(258622,'spell_resonant_pulse'),
(275907,'spell_tectonic_smash');


--  aura divine shield =40733

DELETE FROM `creature_text` WHERE (`CreatureID`=129227 AND `GroupID`='0' AND `ID`='0') OR (`CreatureID`=129227 AND `GroupID`='0' AND `ID`='1') OR(`CreatureID`=129227 AND `GroupID`='1' AND `ID`='0') OR (`CreatureID`=129227 AND `GroupID`='2' AND `ID`='0') OR (`CreatureID`=129227 AND `GroupID`='3' AND `ID`='0') OR (`CreatureID`=129227 AND `GroupID`='4' AND `ID`='0') OR (`CreatureID`=129227 AND `GroupID`='5' AND `ID`='0') OR (`CreatureID`=129227 AND `GroupID`='6' AND `ID`='0');
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(129227, 0, 0, '¡¡¡Te voy a partir la madre!!!!', 14, 0, 100, 0, 0, 97390, 0, 'Azerok - YELL_AZERITE_INFUSION'),
(129227, 0, 1, 'Ven con papi...', 14, 0, 100, 0, 0, 97384, 0, 'Azerok- YELL_CALL_EARTHRAGER'),
(129227, 1, 0, 'Hola mi amol', 14, 0, 100, 0, 0, 97381, 0, 'Azerok - YELL_RESONANT_PULSE'),
(129227, 2, 0, 'no se que mas poner', 41, 0, 100, 0, 0, 115344, 0, 'Azerok - YELL_TECTONIC_SMASH'),
(129227, 3, 0, 'La concha de tu madre', 14, 0, 100, 0, 0, 97380, 0, 'Azerok - YELL_KILLED'),
(129227, 4, 0, 'Te dije que funcionaria ^^', 14, 0, 100, 0, 0, 97379, 0, 'Azerok - YELL_KILL'),
(129227, 5, 0, 'Te reviento!!!', 14, 0, 100, 0, 0, 97385, 0, 'Azerok - YELL_ENTER_COMBAT');