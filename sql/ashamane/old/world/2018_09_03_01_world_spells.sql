DELETE FROM spell_script_names WHERE scriptname IN (
    "spell_dk_outbreak",
    "spell_dk_epidemic",
    "spell_dk_epidemic_aoe",
    "aura_dk_outbreak_periodic",
    "aura_dk_virulent_plague",
    "aura_dk_defile",
    "spell_dk_festering_strike",
    "spell_dk_festering_wound",
    "spell_dk_scourge_strike",
    "spell_dk_blighted_rune_weapon"
);
INSERT INTO spell_script_names VALUES
(77575, "spell_dk_outbreak"),
(207317, "spell_dk_epidemic"),
(215969, "spell_dk_epidemic_aoe"),
(196782, "aura_dk_outbreak_periodic"),
(191587, "aura_dk_virulent_plague"),
(152280, "aura_dk_defile"),
(85948, "spell_dk_festering_strike"),
(55090, "spell_dk_scourge_strike"),
(195758, "spell_dk_blighted_rune_weapon");

UPDATE areatrigger_template SET scriptname = "at_dk_defile" WHERE Id = 6212;

DELETE FROM `spell_proc` WHERE `SpellId` IN (253324, 194310);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask1`, `SpellPhaseMask`, `ProcsPerMinute`) VALUES
(253324, 0, 0, 0, 1);
