DELETE FROM `trinity_string` WHERE `entry` BETWEEN 2000 AND 2002;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000','|cff00ff00New ticket from|r|cffff00ff %s.|r |cff00ff00Ticket entry:|r|cffff00ff %d.|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('2001','|cff00ff00Character|r|cffff00ff %s |r|cff00ff00edited his/her ticket:|r|cffff00ff %d.|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('2002','|cff00ff00Character|r|cffff00ff %s |r|cff00ff00abandoned ticket entry:|r|cffff00ff %d.|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
