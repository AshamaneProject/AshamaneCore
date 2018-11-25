DELETE FROM spell_script_names WHERE scriptname IN ("spell_pal_art_of_war",
                                                    "spell_pal_divine_hammer",
                                                    "spell_pal_divine_intervention",
                                                    "spell_pal_execute_sentence",
                                                    "spell_pal_holy_wrath",
                                                    "spell_pal_judgment_of_light",
                                                    "spell_pal_judgment_of_light_proc",
                                                    "spell_pal_zeal",
                                                    "spell_pal_divine_judgement",
                                                    "spell_pal_inquisition",
                                                    "spell_pal_righteous_verdict"
                                                    );
INSERT INTO spell_script_names VALUES
(267344, "spell_pal_art_of_war"),
(271580, "spell_pal_divine_judgement"),
(84963, "spell_pal_inquisition"),
(267610, "spell_pal_righteous_verdict");

DELETE FROM `spell_proc` WHERE `SpellId` IN (267610, 267611);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask2`, `SpellPhaseMask`) VALUES ('267610', '10', '8192', '2'); 
