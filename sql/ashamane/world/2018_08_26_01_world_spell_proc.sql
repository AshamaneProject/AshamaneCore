-- Light of the Titans should proc only from Light of the Protector and Hand of the Protector
DELETE FROM `spell_proc` WHERE `SpellId` = 209539;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `SpellFamilyMask3`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(209539, 0, 10, 0, 0, 0, 0x20000000, 16384, 4, 1, 0, 0, 0, 0, 0, 0);
