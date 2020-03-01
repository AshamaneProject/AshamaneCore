UPDATE `trainer` SET `VerifiedBuild`=27547 WHERE `Id`=386;


UPDATE `trainer_spell` SET `MoneyCost`=47500000, `ReqAbility1`=34091, `VerifiedBuild`=27547 WHERE (`TrainerId`=386 AND `SpellId`=90266);
UPDATE `trainer_spell` SET `MoneyCost`=47500000, `ReqAbility1`=34090, `VerifiedBuild`=27547 WHERE (`TrainerId`=386 AND `SpellId`=34093);
UPDATE `trainer_spell` SET `MoneyCost`=38000, `VerifiedBuild`=27547 WHERE (`TrainerId`=386 AND `SpellId`=33389);
UPDATE `trainer_spell` SET `MoneyCost`=475000, `ReqAbility1`=33388, `VerifiedBuild`=27547 WHERE (`TrainerId`=386 AND `SpellId`=33392);
UPDATE `trainer_spell` SET `MoneyCost`=2375000, `ReqAbility1`=33391, `VerifiedBuild`=27547 WHERE (`TrainerId`=386 AND `SpellId`=34092);

DELETE FROM `npc_trainer` WHERE ID=43769;
DELETE FROM `creature_default_trainer` WHERE `CreatureId`=43769;
INSERT INTO `creature_default_trainer` (`CreatureId`, `TrainerId`) VALUES
(43769, 386);
