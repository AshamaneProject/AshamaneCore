DELETE FROM `gameobject_template` WHERE `entry` = 1619; 
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `RequiredLevel`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES ('1619','3','414','Earthroot','','','','0.4','30','1416','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','20','1','0','0','0','0','0','0','0','0','0','0','0','0','0','','','26972'); 
UPDATE `gameobject_template` SET `Data0` = 221694 WHERE `entry` = 207691; 
DELETE FROM `gameobject_template_addon` WHERE `entry` = 300184; 
DELETE FROM `spell_proc` WHERE `spellid` = 253324; 
DELETE FROM `creature_model_info` WHERE `DisplayID` IN (84345, 87473, 87586, 87441, 87446, 87474, 87460, 87448, 87470, 87447, 87439, 87435, 87461, 87450, 87440, 25202); 
UPDATE `creature_template` SET `flags_extra` = 0, `unit_flags2` = 2048 WHERE `entry` = 38913; 
