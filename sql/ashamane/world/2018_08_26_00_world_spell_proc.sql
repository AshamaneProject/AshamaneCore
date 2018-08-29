DELETE FROM `spell_proc` WHERE `SpellId` = 209341;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `SpellFamilyMask3`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(209341, 1, 10, 0, 0, 0x00800000, 0, 16384, 4, 1, 0, 0, 0, 0, 0, 0);
