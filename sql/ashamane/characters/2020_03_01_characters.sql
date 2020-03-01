DELETE FROM `updates_include` WHERE `path` = '$/sql/ashamane/old/characters';
INSERT INTO `updates_include` VALUES
('$/sql/ashamane/old/characters', 'ARCHIVED');

UPDATE `updates` SET `state`='ARCHIVED';