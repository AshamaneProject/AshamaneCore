-- The motherlode dungeon mapid 1594
-- access_requeriment
delete from `access_requirement` where `mapid`=1594;
insert into `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) values
('1594','1','120','0','0','0','0','0','0',0,'The MOTHERLODE!! (Entrance) - Normal');
insert into `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) values
('1594','2','120','0','0','0','0','0','0',0,'The MOTHERLODE!! (Entrance) - Heroic');
insert into `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) values
('1594','8','120','0','0','0','0','0','0',0,'The MOTHERLODE!! (Entrance) - Mythic Keystone');
insert into `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) values
('1594','23','120','0','0','0','0','0','0',0,'The MOTHERLODE!! (Entrance) - Mythic');

-- Areatrigger Portal
delete from `areatrigger_teleport` where `id` in (-65,-66);
insert into `areatrigger_teleport` (`Id`,`PortLocID`,`Name`) values
(-66,6580,'The MotherLode Entrance Target'),
(-65,6583,'The MotherLode Exit Target');

delete from `areatrigger` where `guid` in (65,66);
insert into `areatrigger` values
(66,100007,1642,1,-2647.25,2388.37,10.0474,''),
(65,100007,1594,8388870,624.86,-3617.66,-1.472,'');


-- instance template
delete from `instance_template` where `map`=1594;
insert into `instance_template` (`map`, `parent`, `script`, `allowMount`, `insideResurrection`) values
('1594','0','instance_the_motherlode','0','1');
