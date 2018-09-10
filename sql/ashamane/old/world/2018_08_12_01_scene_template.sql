-- Intro Cinematic Scene Templates
-- changed official flag from 9 to 2 to stop crashes

-- Nightborne
DELETE FROM `scene_template` WHERE (`SceneId`=1900 AND `ScriptPackageID`=2007);
INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`) VALUES
(1900, 2, 2007);

-- Hightmountain Tauren
DELETE FROM `scene_template` WHERE (`SceneId`=1901 AND `ScriptPackageID`=1984);
INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`) VALUES
(1901, 2, 1984);

-- Lightforged Dranai
DELETE FROM `scene_template` WHERE (`SceneId`=1902 AND `ScriptPackageID`=2005);
INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`) VALUES
(1902, 2, 2005);

-- Void Elf
DELETE FROM `scene_template` WHERE (`SceneId`=1903 AND `ScriptPackageID`=2006);
INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`) VALUES
(1903, 2, 2006); 
