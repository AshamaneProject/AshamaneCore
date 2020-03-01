DELETE FROM `updates_include` WHERE `path` = '$/sql/ashamane/old/auth';
INSERT INTO `updates_include` VALUES
('$/sql/ashamane/old/auth', 'ARCHIVED');

UPDATE `updates` SET `state`='ARCHIVED';
