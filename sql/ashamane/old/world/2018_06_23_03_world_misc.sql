UPDATE `areatrigger_template` SET `VerifiedBuild`=26822 WHERE `Id`=12515;
UPDATE `areatrigger_template` SET `VerifiedBuild`=26822 WHERE `Id`=3020;

DELETE FROM `spell_areatrigger` WHERE (`AreaTriggerId`=3020) OR (`AreaTriggerId`=12515);
INSERT INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`, `MoveCurveId`, `ScaleCurveId`, `MorphCurveId`, `FacingCurveId`, `DecalPropertiesId`, `TimeToTarget`, `TimeToTargetScale`, `VerifiedBuild`) VALUES
(314, 3020, 0, 0, 0, 0, 0, 0, 10000, 26822), -- SpellId : 102793
(7363, 12515, 0, 0, 1908, 0, 43, 0, 600000, 26822); -- SpellId : 215312


DELETE FROM `gameobject_template_addon` WHERE `entry` IN (240388 /*Apexis Vault*/, 243577 /*Doodad_6HU_BLACKSMITH_FLOORPLATE002*/);
INSERT INTO `gameobject_template_addon` (`entry`, `faction`, `flags`) VALUES
(240388, 0, 32), -- Apexis Vault
(243577, 1375, 0); -- Doodad_6HU_BLACKSMITH_FLOORPLATE002

UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=244581; -- Decommissioned Calefactor
UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=244579; -- Spellbound Insulation
UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=244578; -- Alchemical Flame
UPDATE `gameobject_template_addon` SET `faction`=94 WHERE `entry`=244598; -- Underbelly Cache
UPDATE `gameobject_template_addon` SET `faction`=1732 WHERE `entry`=239438; -- Portal to Ironforge
UPDATE `gameobject_template_addon` SET `flags`=32 WHERE `entry`=236409; -- Prison Door
UPDATE `gameobject_template_addon` SET `flags`=32 WHERE `entry`=236408; -- Prison Door
UPDATE `gameobject_template_addon` SET `flags`=32 WHERE `entry`=237737; -- Prison Door
UPDATE `gameobject_template_addon` SET `flags`=32 WHERE `entry`=237736; -- Prison Door
UPDATE `gameobject_template_addon` SET `flags`=32 WHERE `entry`=237735; -- Prison Door
UPDATE `gameobject_template_addon` SET `flags`=32 WHERE `entry`=237734; -- Prison Door
UPDATE `gameobject_template_addon` SET `faction`=1733 WHERE `entry`=259114; -- [DNT] Command Table Collision Cylinder
UPDATE `gameobject_template_addon` SET `faction`=1732 WHERE `entry`=235883; -- Portal to Stormwind

DELETE FROM `creature_template_addon` WHERE `entry` IN (110661 /*110661 (Underbelly Banquet) - Underbelly Banquet*/, 116323 /*116323 (Underbelly Lowlife)*/, 104208 /*104208 (Nexus-Prince Haramad)*/, 40443 /*40443 (Earthen Ring Scout)*/, 114719 /*114719 (Trader Caelen)*/, 119541 /*119541 (Felwing Screecher)*/, 40436 /*40436 (Earthen Ring Pathfinder)*/, 97505 /*97505 (Drool)*/, 88189 /*88189 (Stormshield Sentinel)*/, 87692 /*87692 (Stormshield Courier)*/, 86389 /*86389 (Dawn-Seeker Verroak)*/, 87657 /*87657 (Stormshield Guard)*/, 86387 /*86387 (Dawn-Seeker Rilak)*/, 86391 /*86391 (Dawn-Seeker Krek)*/, 92501 /*92501 (Dawn-Seeker Kasrek)*/, 87391 /*87391 (Fate-Twister Seress)*/, 86388 /*86388 (Awakened Warder) - Dual Wield*/, 85919 /*85919 (Jonath Chainfist)*/, 86141 /*86141 (Dina Sprockettoss) - Use Wrench*/, 86418 /*86418 (Stormshield Guard) - Invisibility and Stealth Detection*/, 86424 /*86424 (Navic Greenbark) - Kneel and Heal*/, 85916 /*85916 (Artificer Nissea)*/, 87052 /*87052 (Artificer Harlaan)*/, 86129 /*86129 (Crystalsmith Naarkis) - Channel Into Crystal*/, 85930 /*85930 (Telys Vinemender)*/, 86084 /*86084 (Delvar Ironfist)*/, 88168 /*88168 (Stormshield Sentinel) - Invisibility and Stealth Detection*/, 87062 /*87062 (Royce Bigbeard)*/, 86142 /*86142 (Nichole Swann) - Carry Heated Sword*/, 87065 /*87065 (Sean Catchpole)*/, 85917 /*85917 (Aimee Goldforge)*/, 85918 /*85918 (Hilda Copperfuze)*/, 86436 /*86436 (Stormshield Officer) - Invisibility and Stealth Detection*/, 87320 /*87320 (Raider's Training Dummy) - Training Dummy Marker*/, 87329 /*87329 (Raider's Training Dummy) - Training Dummy Marker*/, 87365 /*87365 (Grakis)*/, 93915 /*93915 (Li "Crunchpaw" Tsang)*/, 93914 /*93914 (Holly McTilla)*/, 85951 /*85951 (Kenneth Knowles)*/, 87321 /*87321 (Training Dummy) - Training Dummy Marker, Passive Uber DoT*/, 87318 /*87318 (Dungeoneer's Training Dummy) - Training Dummy Marker*/, 87243 /*87243 (Zaalendor)*/, 88472 /*88472 (Brylla Highgrip)*/, 88469 /*88469 (Gemyl Moltensteel)*/, 86136 /*86136 (Leah Kranz) - Hold Bread Basket*/, 88468 /*88468 (Bartham Flintbrow)*/, 88501 /*88501 (Maldur Goldmantle)*/, 85927 /*85927 (Manda Darlowe) - Lean Against Shovel*/, 86176 /*86176 (Ingrid Blackingot)*/, 86175 /*86175 (Bregg Coppercast)*/, 91273 /*91273 (Helen Noel)*/, 85923 /*85923 (Rangari Laandon)*/, 87049 /*87049 (Steven Cochrane)*/, 86438 /*86438 (Stormshield Officer) - Invisibility and Stealth Detection*/, 88471 /*88471 (Dinfink Steamspan)*/, 85957 /*85957 (Nolan Burnbrick)*/, 85958 /*85958 (Bert Coinsplitter)*/, 88212 /*88212 (Machinist Clockspan)*/, 88214 /*88214 (Machinist Sparkswift)*/, 85910 /*85910 (Joshua Fuesting)*/, 88503 /*88503 (Briann Highfall)*/, 88502 /*88502 (Nissa Snowpick)*/, 87057 /*87057 (Leara Moonsilk)*/, 85920 /*85920 (Jistun Sharpfeather)*/, 87067 /*87067 (Miaasha)*/, 88211 /*88211 (Sprocket Shortgauge)*/, 86148 /*86148 (Knewbie McGreen)*/, 86087 /*86087 (Stormshield Peasant)*/, 86433 /*86433 (Stormshield Officer)*/, 85911 /*85911 (Scribe Chi-Yuan) - Channel Arcane*/, 85962 /*85962 (Vaultkeeper Nizsham)*/, 86432 /*86432 (Belosh) - Taking Notes*/, 86413 /*86413 (Stormshield Guard) - Invisibility and Stealth Detection*/, 86408 /*86408 (Stormshield Guard) - Invisibility and Stealth Detection*/, 88230 /*88230 (Forge-O-Matic 3000 XL)*/, 86093 /*86093 (Zappy Zooly) - Arcane Channeling*/, 87063 /*87063 (Joao Calhandro)*/, 85961 /*85961 (Warpweaver Shal)*/, 88254 /*88254 (Julia Watkins)*/, 88215 /*88215 (Machinist Wobblewrench) - Use Wrench*/, 101989 /*101989 (Voidbinder Tarazuuk)*/, 108925 /*108925 (Lord Adder) - Truthguard Area Trigger*/);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(110661, 0, 0, 0, 1, 0, 0, 0, 0, '220025'), -- 110661 (Underbelly Banquet) - Underbelly Banquet
(116323, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- 116323 (Underbelly Lowlife)
(104208, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 104208 (Nexus-Prince Haramad)
(40443, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 40443 (Earthen Ring Scout)
(114719, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 114719 (Trader Caelen)
(119541, 0, 0, 50331648, 1, 0, 0, 0, 0, ''), -- 119541 (Felwing Screecher)
(40436, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 40436 (Earthen Ring Pathfinder)
(97505, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 97505 (Drool)
(88189, 0, 14333, 0, 257, 0, 0, 0, 0, ''), -- 88189 (Stormshield Sentinel)
(87692, 0, 2404, 0, 257, 0, 0, 0, 0, ''), -- 87692 (Stormshield Courier)
(86389, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 86389 (Dawn-Seeker Verroak)
(87657, 0, 0, 0, 257, 0, 0, 0, 0, ''), -- 87657 (Stormshield Guard)
(86387, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 86387 (Dawn-Seeker Rilak)
(86391, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 86391 (Dawn-Seeker Krek)
(92501, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 92501 (Dawn-Seeker Kasrek)
(87391, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87391 (Fate-Twister Seress)
(86388, 0, 0, 0, 1, 0, 0, 0, 0, '42459'), -- 86388 (Awakened Warder) - Dual Wield
(85919, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85919 (Jonath Chainfist)
(86141, 0, 0, 0, 1, 0, 0, 0, 0, '171989'), -- 86141 (Dina Sprockettoss) - Use Wrench
(86418, 0, 0, 3, 1, 0, 0, 0, 0, '18950'), -- 86418 (Stormshield Guard) - Invisibility and Stealth Detection
(86424, 0, 0, 0, 1, 0, 0, 0, 0, '174609'), -- 86424 (Navic Greenbark) - Kneel and Heal
(85916, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85916 (Artificer Nissea)
(87052, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87052 (Artificer Harlaan)
(86129, 0, 0, 0, 1, 0, 0, 0, 0, '164381'), -- 86129 (Crystalsmith Naarkis) - Channel Into Crystal
(85930, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85930 (Telys Vinemender)
(86084, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 86084 (Delvar Ironfist)
(88168, 0, 0, 0, 257, 0, 0, 0, 0, '18950'), -- 88168 (Stormshield Sentinel) - Invisibility and Stealth Detection
(87062, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87062 (Royce Bigbeard)
(86142, 0, 0, 0, 1, 0, 0, 0, 0, '172067'), -- 86142 (Nichole Swann) - Carry Heated Sword
(87065, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87065 (Sean Catchpole)
(85917, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85917 (Aimee Goldforge)
(85918, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85918 (Hilda Copperfuze)
(86436, 0, 0, 0, 256, 0, 0, 0, 0, '18950'), -- 86436 (Stormshield Officer) - Invisibility and Stealth Detection
(87320, 0, 0, 0, 1, 0, 0, 0, 0, '98892'), -- 87320 (Raider's Training Dummy) - Training Dummy Marker
(87329, 0, 0, 0, 1, 0, 0, 0, 0, '98892'), -- 87329 (Raider's Training Dummy) - Training Dummy Marker
(87365, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87365 (Grakis)
(93915, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 93915 (Li "Crunchpaw" Tsang)
(93914, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 93914 (Holly McTilla)
(85951, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85951 (Kenneth Knowles)
(87321, 0, 0, 0, 1, 0, 0, 0, 0, '98892 167347'), -- 87321 (Training Dummy) - Training Dummy Marker, Passive Uber DoT
(87318, 0, 0, 0, 1, 0, 0, 0, 0, '98892'), -- 87318 (Dungeoneer's Training Dummy) - Training Dummy Marker
(87243, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87243 (Zaalendor)
(88472, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88472 (Brylla Highgrip)
(88469, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88469 (Gemyl Moltensteel)
(86136, 0, 0, 0, 1, 0, 0, 0, 0, '172032'), -- 86136 (Leah Kranz) - Hold Bread Basket
(88468, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88468 (Bartham Flintbrow)
(88501, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88501 (Maldur Goldmantle)
(85927, 0, 0, 0, 1, 0, 0, 0, 0, '172121'), -- 85927 (Manda Darlowe) - Lean Against Shovel
(86176, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 86176 (Ingrid Blackingot)
(86175, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 86175 (Bregg Coppercast)
(91273, 0, 0, 0, 257, 0, 0, 0, 0, ''), -- 91273 (Helen Noel)
(85923, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85923 (Rangari Laandon)
(87049, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87049 (Steven Cochrane)
(86438, 0, 0, 0, 256, 0, 0, 0, 0, '18950'), -- 86438 (Stormshield Officer) - Invisibility and Stealth Detection
(88471, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88471 (Dinfink Steamspan)
(85957, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85957 (Nolan Burnbrick)
(85958, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85958 (Bert Coinsplitter)
(88212, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88212 (Machinist Clockspan)
(88214, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88214 (Machinist Sparkswift)
(85910, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85910 (Joshua Fuesting)
(88503, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88503 (Briann Highfall)
(88502, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88502 (Nissa Snowpick)
(87057, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87057 (Leara Moonsilk)
(85920, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85920 (Jistun Sharpfeather)
(87067, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87067 (Miaasha)
(88211, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88211 (Sprocket Shortgauge)
(86148, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 86148 (Knewbie McGreen)
(86087, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 86087 (Stormshield Peasant)
(86433, 0, 28917, 0, 257, 0, 0, 0, 0, ''), -- 86433 (Stormshield Officer)
(85911, 0, 0, 0, 1, 0, 0, 0, 0, '171984'), -- 85911 (Scribe Chi-Yuan) - Channel Arcane
(85962, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85962 (Vaultkeeper Nizsham)
(86432, 0, 0, 0, 1, 0, 0, 0, 0, '163207'), -- 86432 (Belosh) - Taking Notes
(86413, 0, 0, 0, 256, 0, 0, 0, 0, '18950'), -- 86413 (Stormshield Guard) - Invisibility and Stealth Detection
(86408, 0, 0, 0, 256, 0, 0, 0, 0, '18950'), -- 86408 (Stormshield Guard) - Invisibility and Stealth Detection
(88230, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88230 (Forge-O-Matic 3000 XL)
(86093, 0, 0, 0, 1, 0, 0, 0, 0, '32783'), -- 86093 (Zappy Zooly) - Arcane Channeling
(87063, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 87063 (Joao Calhandro)
(85961, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 85961 (Warpweaver Shal)
(88254, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 88254 (Julia Watkins)
(88215, 0, 0, 0, 0, 0, 0, 0, 0, '171989'), -- 88215 (Machinist Wobblewrench) - Use Wrench
(101989, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 101989 (Voidbinder Tarazuuk)
(108925, 0, 0, 0, 1, 0, 0, 0, 0, '215919'); -- 108925 (Lord Adder) - Truthguard Area Trigger

UPDATE `creature_template_addon` SET `bytes2`=1 WHERE `entry`=23086; -- 23086 (Sewer Rat)
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=97623; -- 97623 (Jillums Shadowcoil)
UPDATE `creature_template_addon` SET `auras`='217075' WHERE `entry`=113188; -- 113188 (Bastard)
UPDATE `creature_template_addon` SET `emote`=0 WHERE `entry`=105333; -- 105333 (Val'zuun)
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=96954; -- 96954 (Nelur Lightsown)
UPDATE `creature_template_addon` SET `auras`='60913' WHERE `entry`=93521; -- 93521 (Ranid Glowergold)
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=93538; -- 93538 (Dariness the Learned)
UPDATE `creature_template_addon` SET `auras`='196324' WHERE `entry`=92183; -- 92183 (Alard Schmied)
UPDATE `creature_template_addon` SET `auras`='187063' WHERE `entry`=41200; -- 41200 (Generic Bunny - PRK)
UPDATE `creature_template_addon` SET `auras`='60913' WHERE `entry`=92457; -- 92457 (Patricia Egan)
UPDATE `creature_template_addon` SET `auras`='229939' WHERE `entry`=54638; -- 54638 (Generic Bunny)
UPDATE `creature_template_addon` SET `auras`='60913 61354' WHERE `entry`=93544; -- 93544 (Jang Quillpaw)
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=101924; -- 101924 (Black Harvest Acolyte)
UPDATE `creature_template_addon` SET `auras`='60913 61354' WHERE `entry`=97342; -- 97342 (Salan Sunthread)
UPDATE `creature_template_addon` SET `aiAnimKit`=10747 WHERE `entry`=112720; -- 112720 (Jemma Wilson)
UPDATE `creature_template_addon` SET `auras`='171980' WHERE `entry`=35845; -- 35845 (Dave's Industrial Light and Magic Bunny (Small)(Sessile))
UPDATE `creature_template_addon` SET `auras`='232270' WHERE `entry`=116420; -- 116420 (Glowing Blue Gem)
UPDATE `creature_template_addon` SET `auras`='232269' WHERE `entry`=116419; -- 116419 (Glowing Green Gem)
UPDATE `creature_template_addon` SET `auras`='226952' WHERE `entry`=113901; -- 113901 (Crixa)
UPDATE `creature_template_addon` SET `auras`='226952' WHERE `entry`=113900; -- 113900 (Liyana)
UPDATE `creature_template_addon` SET `auras`='61424' WHERE `entry`=32639; -- 32639 (Gnimo)
UPDATE `creature_template_addon` SET `auras`='61424' WHERE `entry`=32638; -- 32638 (Hakmud of Argus)
UPDATE `creature_template_addon` SET `bytes1`=3 WHERE `entry`=34330; -- 34330 (Jones)
UPDATE `creature_template_addon` SET `auras`='60913 61354' WHERE `entry`=96778; -- 96778 (Aemara)
UPDATE `creature_template_addon` SET `auras`='60913' WHERE `entry`=96479; -- 96479 (Breanni)
UPDATE `creature_template_addon` SET `auras`='122729 123236' WHERE `entry`=62821; -- 62821 (Mystic Birdhat)
UPDATE `creature_template_addon` SET `auras`='183111' WHERE `entry`=104091; -- 104091 (Kirin Tor Guardian)

DELETE FROM `creature_template_scaling` WHERE `Entry` IN (106856, 113157, 100671, 97756, 105333, 119541);
INSERT INTO `creature_template_scaling` (`Entry`, `LevelScalingMin`, `LevelScalingMax`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `VerifiedBuild`) VALUES
(106856, 98, 110, 0, 0, 26822),
(113157, 110, 110, 0, 0, 26822),
(100671, 98, 110, 0, 0, 26822),
(97756, 98, 110, 0, 0, 26822),
(105333, 98, 110, 0, 0, 26822),
(119541, 100, 110, 0, 0, 26822);

UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=112441;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=108710;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=108401;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=41200;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=105564;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=105723;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=119436;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=119438;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=119437;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=119396;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=119226;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=99349;
UPDATE `creature_template_scaling` SET `VerifiedBuild`=26822 WHERE `Entry`=108925;


UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=68666;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=47090;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=71830;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72076;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=79714;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=67403;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72894;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65298;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=40089;
UPDATE `creature_model_info` SET `BoundingRadius`=0.236, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=74161;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=341;
UPDATE `creature_model_info` SET `BoundingRadius`=0.3319826, `VerifiedBuild`=26822 WHERE `DisplayID`=15394;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65193;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=37121;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72681;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65188;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27799;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65288;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=57295;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=4960;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65192;
UPDATE `creature_model_info` SET `BoundingRadius`=0.383, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=74160;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65405;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=70270;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=22175;
UPDATE `creature_model_info` SET `BoundingRadius`=0.3263556, `VerifiedBuild`=26822 WHERE `DisplayID`=71611;
UPDATE `creature_model_info` SET `BoundingRadius`=1.458524, `VerifiedBuild`=26822 WHERE `DisplayID`=46515;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65191;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=70267;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=67528;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=67604;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65290;
UPDATE `creature_model_info` SET `BoundingRadius`=0.347, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=74159;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65190;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=70619;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65287;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65187;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=73363;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=73366;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=69095;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=75912;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65229;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=32991;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=35818;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=36904;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72956;
UPDATE `creature_model_info` SET `BoundingRadius`=0.208, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=69910;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=70903;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60926;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60927;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=31850;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60924;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65240;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=30098;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25644;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25613;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72948;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65228;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26335;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59303;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25616;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=18052;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=35704;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=35280;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=64586;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26339;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=69682;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28152;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28145;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=70532;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65198;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25611;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65257;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=73730;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=67195;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26378;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=38491;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25648;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25619;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=63776;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=67193;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65834;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=15505;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26376;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=63050;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=63051;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=69197;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25645;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=2428;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25650;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25620;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=71622;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72985;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72947;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26075;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27782;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28433;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=45425;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=66652;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=69575;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25622;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26390;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=67401;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=75276;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=68439;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=17200;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25618;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28146;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28163;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27999;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=24916;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25610;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=75277;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=75278;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=68547;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=75274;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25635;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26310;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=48000;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28149;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28153;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65163;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=36893;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=47056;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=46697;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=46696;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65174;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=70701;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65172;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25594;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=36894;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26300;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25604;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=23672;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=36883;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=69528;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=66838;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=29735;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25621;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=69780;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27449;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=30415;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=1595;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=30358;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=56737;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65239;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65451;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27216;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=2177;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=75115;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=31849;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27958;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25602;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=64782;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25880;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27962;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26321;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65164;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=29834;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65106;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72235;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=46694;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26442;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=48278;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27956;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72114;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=73438;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65345;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25609;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25878;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25608;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65256;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=29835;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=63488;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28150;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28154;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=3058;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25655;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=74532;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26311;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=19744;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65171;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65083;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72952;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65252;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65255;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65236;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65227;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65450;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65250;
UPDATE `creature_model_info` SET `BoundingRadius`=0.306, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=60781;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60451;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=57511;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=57116;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59533;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59452;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59454;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59466;
UPDATE `creature_model_info` SET `BoundingRadius`=1.096739, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=59531;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59211;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59388;
UPDATE `creature_model_info` SET `BoundingRadius`=0.208, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=59575;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59581;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59207;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60153;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59377;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59222;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59565;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59353;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59357;
UPDATE `creature_model_info` SET `BoundingRadius`=0.306, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=60783;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60157;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59389;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60160;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59208;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59209;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59567;
UPDATE `creature_model_info` SET `BoundingRadius`=0.6, `CombatReach`=2, `VerifiedBuild`=26822 WHERE `DisplayID`=60259;
UPDATE `creature_model_info` SET `BoundingRadius`=0.6, `CombatReach`=2, `VerifiedBuild`=26822 WHERE `DisplayID`=61120;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60291;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59359;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=63807;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=63809;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59235;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60853;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60258;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60211;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60920;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60918;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59383;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59555;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59568;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60917;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60936;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59219;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59553;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59407;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59406;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=62375;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59552;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59215;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60152;
UPDATE `creature_model_info` SET `BoundingRadius`=0.306, `CombatReach`=1.5, `VerifiedBuild`=26822 WHERE `DisplayID`=59588;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60919;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59238;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59239;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60808;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60810;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59196;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60938;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60937;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60154;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59212;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60162;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60807;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59356;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59393;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59358;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59589;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59198;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=19646;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59584;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59566;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=59554;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=19013;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=10215;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60159;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=20987;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60836;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=60811;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=70773;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26437;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26347;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=23337;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72465;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=63038;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26330;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28148;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=71596;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25882;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=71597;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72945;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28144;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=36906;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=34635;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=36907;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=74200;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=74199;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65477;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=74194;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=26396;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25955;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72078;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=71942;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=78398;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65173;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=68483;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=68484;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27954;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=72074;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=71943;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=25674;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=80;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65356;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=65370;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27952;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28282;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=28111;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=69153;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=58822;
UPDATE `creature_model_info` SET `BoundingRadius`=0.9288539, `VerifiedBuild`=26822 WHERE `DisplayID`=20833;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=24862;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=69152;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=3714;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=27881;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=5555;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=40674;
UPDATE `creature_model_info` SET `VerifiedBuild`=26822 WHERE `DisplayID`=1004;

DELETE FROM `npc_vendor` WHERE (`entry`=85961 AND `item`=151116 AND `ExtendedCost`=6211 AND `type`=1) OR (`entry`=85961 AND `item`=151120 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=85961 AND `item`=151119 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=85961 AND `item`=151118 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=85961 AND `item`=151117 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=85961 AND `item`=157577 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=85961 AND `item`=157576 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=85961 AND `item`=157574 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=85961 AND `item`=157573 AND `ExtendedCost`=6188 AND `type`=1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `ExtendedCost`, `type`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES
(85961, 9, 151116, 0, 6211, 1, 50225, 0, 26822), -- -0-
(85961, 8, 151120, 0, 6188, 1, 9206, 0, 26822), -- -0-
(85961, 7, 151119, 0, 6188, 1, 4617, 0, 26822), -- -0-
(85961, 6, 151118, 0, 6188, 1, 17097, 0, 26822), -- -0-
(85961, 5, 151117, 0, 6188, 1, 0, 0, 26822), -- -0-
(85961, 4, 157577, 0, 6188, 1, 9206, 0, 26822), -- -0-
(85961, 3, 157576, 0, 6188, 1, 4617, 0, 26822), -- -0-
(85961, 2, 157574, 0, 6188, 1, 17097, 0, 26822), -- -0-
(85961, 1, 157573, 0, 6188, 1, 0, 0, 26822); -- -0-

UPDATE `npc_vendor` SET `slot`=3, `VerifiedBuild`=26822 WHERE (`entry`=97011 AND `item`=40703 AND `ExtendedCost`=0 AND `type`=1); -- Grasscutter
UPDATE `npc_vendor` SET `slot`=2, `IgnoreFiltering`=1, `VerifiedBuild`=26822 WHERE (`entry`=97011 AND `item`=44639 AND `ExtendedCost`=0 AND `type`=1); -- Dalaran Greatsword
UPDATE `npc_vendor` SET `slot`=1, `IgnoreFiltering`=1, `VerifiedBuild`=26822 WHERE (`entry`=97011 AND `item`=44638 AND `ExtendedCost`=0 AND `type`=1); -- Dalaran Sword
UPDATE `npc_vendor` SET `slot`=6, `VerifiedBuild`=26822 WHERE (`entry`=96780 AND `item`=3424 AND `ExtendedCost`=0 AND `type`=1); -- Bouquet of Black Roses
UPDATE `npc_vendor` SET `slot`=5, `VerifiedBuild`=26822 WHERE (`entry`=96780 AND `item`=3423 AND `ExtendedCost`=0 AND `type`=1); -- Bouquet of White Roses
UPDATE `npc_vendor` SET `slot`=4, `VerifiedBuild`=26822 WHERE (`entry`=96780 AND `item`=3420 AND `ExtendedCost`=0 AND `type`=1); -- Black Rose
UPDATE `npc_vendor` SET `slot`=3, `VerifiedBuild`=26822 WHERE (`entry`=96780 AND `item`=3422 AND `ExtendedCost`=0 AND `type`=1); -- Beautiful Wildflowers
UPDATE `npc_vendor` SET `slot`=2, `VerifiedBuild`=26822 WHERE (`entry`=96780 AND `item`=3419 AND `ExtendedCost`=0 AND `type`=1); -- Red Rose
UPDATE `npc_vendor` SET `slot`=1, `VerifiedBuild`=26822 WHERE (`entry`=96780 AND `item`=3421 AND `ExtendedCost`=0 AND `type`=1); -- Simple Wildflowers
UPDATE `npc_vendor` SET `slot`=2, `IgnoreFiltering`=1, `VerifiedBuild`=26822 WHERE (`entry`=97007 AND `item`=44645 AND `ExtendedCost`=0 AND `type`=1); -- Dalaran Hammer
UPDATE `npc_vendor` SET `slot`=1, `IgnoreFiltering`=1, `VerifiedBuild`=26822 WHERE (`entry`=97007 AND `item`=44636 AND `ExtendedCost`=0 AND `type`=1); -- Dalaran Cudgel

DELETE FROM `creature_equip_template` WHERE (`CreatureID`=97586 AND `ID`=1) OR (`CreatureID`=97515 AND `ID`=1) OR (`CreatureID`=101989 AND `ID`=1);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`) VALUES
(97586, 1, 43618, 0, 0, 0, 0, 0, 0, 0, 0), -- Underbelly Guard
(97515, 1, 115309, 0, 0, 0, 0, 0, 0, 0, 0), -- Sorrow
(101989, 1, 29417, 0, 0, 71741, 0, 0, 0, 0, 0); -- Voidbinder Tarazuuk

UPDATE `creature_equip_template` SET `ItemID1`=116646 WHERE (`CreatureID`=106655 AND `ID`=1); -- Arcanomancer Vridiel


UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=112553; -- Wintron
UPDATE `creature_template` SET `minlevel`=98, `speed_run`=1.142857 WHERE `entry`=106856; -- Blightfire Imp
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97623; -- Jillums Shadowcoil
UPDATE `creature_template` SET `speed_run`=1.142857, `unit_flags`=33536 WHERE `entry`=113335; -- Trashy Jr.
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=113183; -- Skidmark
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=113157; -- Spider
UPDATE `creature_template` SET `minlevel`=98 WHERE `entry`=100671; -- Harold Winston
UPDATE `creature_template` SET `minlevel`=98 WHERE `entry`=97756; -- Inkrot
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `npcflag`=16777216, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=512, `unit_flags2`=559104, `unit_flags3`=1 WHERE `entry`=110661; -- Underbelly Banquet
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=110743; -- Crate of Ratstallion Harnesses
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=190, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=8, `unit_flags`=33024, `unit_flags2`=2048 WHERE `entry`=116323; -- Underbelly Lowlife
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=110708; -- Ratstallion
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110 WHERE `entry`=114662; -- Kayvon Quinnstar
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110 WHERE `entry`=114665; -- Sergeant Wilson
UPDATE `creature_template` SET `minlevel`=98 WHERE `entry`=105333; -- Val'zuun
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `faction`=35, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=33555200, `unit_flags2`=2048 WHERE `entry`=104208; -- Nexus-Prince Haramad
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=40443; -- Earthen Ring Scout
UPDATE `creature_template` SET `minlevel`=75, `maxlevel`=75, `faction`=2007, `unit_class`=8, `unit_flags`=32768 WHERE `entry`=32453; -- Dalaran Citizen
UPDATE `creature_template` SET `npcflag`=19 WHERE `entry`=93189; -- Mama Diggs
UPDATE `creature_template` SET `npcflag`=4243 WHERE `entry`=106655; -- Arcanomancer Vridiel
UPDATE `creature_template` SET `minlevel`=105, `maxlevel`=105, `npcflag`=3, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=768, `unit_flags2`=2048 WHERE `entry`=114719; -- Trader Caelen
UPDATE `creature_template` SET `npcflag`=19 WHERE `entry`=92183; -- Alard Schmied
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=92185; -- Braeg Stoutbeard
UPDATE `creature_template` SET `minlevel`=40 WHERE `entry`=41200; -- Generic Bunny - PRK
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=90417; -- Archmage Khadgar
UPDATE `creature_template` SET `npcflag`=19 WHERE `entry`=93542; -- Tanithria
UPDATE `creature_template` SET `npcflag`=18 WHERE `entry`=93525; -- Ainderu Summerleaf
UPDATE `creature_template` SET `maxlevel`=106 WHERE `entry`=110738; -- Kaela Grimlocket
UPDATE `creature_template` SET `npcflag`=19 WHERE `entry`=93527; -- Timothy Jones
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=35, `npcflag`=3, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=8, `unit_flags`=33536, `unit_flags2`=2048 WHERE `entry`=103976; -- Le maître de poste
UPDATE `creature_template` SET `npcflag`=19 WHERE `entry`=92195; -- Professor Pallin
UPDATE `creature_template` SET `npcflag`=19 WHERE `entry`=93531; -- Enchanter Nalthanis
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=99867; -- Warpweaver Tuviss
UPDATE `creature_template` SET `minlevel`=100, `maxlevel`=110, `faction`=954, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2099200 WHERE `entry`=119541; -- Felwing Screecher
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=40436; -- Earthen Ring Pathfinder
UPDATE `creature_template` SET `minlevel`=105, `maxlevel`=105, `faction`=1735, `npcflag`=17179869184, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=4, `unit_flags`=33536, `unit_flags2`=2048, `unit_flags3`=32 WHERE `entry`=97505; -- Drool
UPDATE `creature_template` SET `minlevel`=99, `maxlevel`=108 WHERE `entry`=112079; -- Crimson Pilgrim
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88189; -- Stormshield Sentinel
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87692; -- Stormshield Courier
UPDATE `creature_template` SET `speed_run`=1.142857, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86389; -- Dawn-Seeker Verroak
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87657; -- Stormshield Guard
UPDATE `creature_template` SET `speed_run`=1.142857, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86387; -- Dawn-Seeker Rilak
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86391; -- Dawn-Seeker Krek
UPDATE `creature_template` SET `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=92501; -- Dawn-Seeker Kasrek
UPDATE `creature_template` SET `faction`=1732, `npcflag`=131, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87391; -- Fate-Twister Seress
UPDATE `creature_template` SET `speed_run`=1.142857, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86388; -- Awakened Warder
UPDATE `creature_template` SET `npcflag`=16, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85919; -- Jonath Chainfist
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=34816 WHERE `entry`=86141; -- Dina Sprockettoss
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86418; -- Stormshield Guard
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86424; -- Navic Greenbark
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85916; -- Artificer Nissea
UPDATE `creature_template` SET `npcflag`=1, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87052; -- Artificer Harlaan
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86129; -- Crystalsmith Naarkis
UPDATE `creature_template` SET `npcflag`=80, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85930; -- Telys Vinemender
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86084; -- Delvar Ironfist
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88168; -- Stormshield Sentinel
UPDATE `creature_template` SET `npcflag`=1, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87062; -- Royce Bigbeard
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86142; -- Nichole Swann
UPDATE `creature_template` SET `npcflag`=1, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87065; -- Sean Catchpole
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85917; -- Aimee Goldforge
UPDATE `creature_template` SET `npcflag`=16, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85918; -- Hilda Copperfuze
UPDATE `creature_template` SET `faction`=2321, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86436; -- Stormshield Officer
UPDATE `creature_template` SET `minlevel`=103, `maxlevel`=103, `unit_flags`=131072, `unit_flags2`=2048, `unit_flags3`=1 WHERE `entry`=87320; -- Raider's Training Dummy
UPDATE `creature_template` SET `minlevel`=103, `maxlevel`=103, `unit_flags`=0, `unit_flags2`=2048 WHERE `entry`=87329; -- Raider's Training Dummy
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87365; -- Grakis
UPDATE `creature_template` SET `minlevel`=100, `maxlevel`=100, `faction`=1733, `npcflag`=4224, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=93915; -- Li "Crunchpaw" Tsang
UPDATE `creature_template` SET `minlevel`=100, `maxlevel`=100, `faction`=1733, `npcflag`=4224, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=93914; -- Holly McTilla
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85951; -- Kenneth Knowles
UPDATE `creature_template` SET `unit_flags`=131072, `unit_flags2`=2048, `unit_flags3`=1 WHERE `entry`=87321; -- Training Dummy
UPDATE `creature_template` SET `speed_run`=1, `unit_flags`=131072, `unit_flags2`=2048, `unit_flags3`=1 WHERE `entry`=87318; -- Dungeoneer's Training Dummy
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87243; -- Zaalendor
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88472; -- Brylla Highgrip
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88469; -- Gemyl Moltensteel
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86136; -- Leah Kranz
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88468; -- Bartham Flintbrow
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88501; -- Maldur Goldmantle
UPDATE `creature_template` SET `npcflag`=80, `unit_flags`=32768, `unit_flags2`=34816 WHERE `entry`=85927; -- Manda Darlowe
UPDATE `creature_template` SET `faction`=1733, `npcflag`=4225, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86176; -- Ingrid Blackingot
UPDATE `creature_template` SET `faction`=1733, `npcflag`=4225, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86175; -- Bregg Coppercast
UPDATE `creature_template` SET `faction`=1078, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=8, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=91273; -- Helen Noel
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85923; -- Rangari Laandon
UPDATE `creature_template` SET `npcflag`=1, `unit_flags`=32768, `unit_flags2`=34816 WHERE `entry`=87049; -- Steven Cochrane
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86438; -- Stormshield Officer
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88471; -- Dinfink Steamspan
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85957; -- Nolan Burnbrick
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85958; -- Bert Coinsplitter
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88212; -- Machinist Clockspan
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88214; -- Machinist Sparkswift
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85910; -- Joshua Fuesting
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88503; -- Briann Highfall
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88502; -- Nissa Snowpick
UPDATE `creature_template` SET `npcflag`=1, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87057; -- Leara Moonsilk
UPDATE `creature_template` SET `npcflag`=16, `unit_flags`=32768, `unit_flags2`=34816 WHERE `entry`=85920; -- Jistun Sharpfeather
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87067; -- Miaasha
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88211; -- Sprocket Shortgauge
UPDATE `creature_template` SET `unit_flags`=33280, `unit_flags2`=2048 WHERE `entry`=86148; -- Knewbie McGreen
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86087; -- Stormshield Peasant
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `speed_run`=1.142857, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86433; -- Stormshield Officer
UPDATE `creature_template` SET `npcflag`=16, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85911; -- Scribe Chi-Yuan
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85962; -- Vaultkeeper Nizsham
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=34816 WHERE `entry`=86432; -- Belosh
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=2321, `npcflag`=1, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86413; -- Stormshield Guard
UPDATE `creature_template` SET `gossip_menu_id`=17334, `minlevel`=110, `maxlevel`=110, `faction`=2321, `npcflag`=1, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=86408; -- Stormshield Guard
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88230; -- Forge-O-Matic 3000 XL
UPDATE `creature_template` SET `unit_flags`=33024, `unit_flags2`=2048 WHERE `entry`=86093; -- Zappy Zooly
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=87063; -- Joao Calhandro
UPDATE `creature_template` SET `gossip_menu_id`=21043, `npcflag`=268435585, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=85961; -- Warpweaver Shal
UPDATE `creature_template` SET `npcflag`=49, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88254; -- Julia Watkins
UPDATE `creature_template` SET `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=88215; -- Machinist Wobblewrench
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `npcflag`=4294967296, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=8, `unit_flags`=512, `unit_flags2`=2048 WHERE `entry`=101989; -- Voidbinder Tarazuuk
UPDATE `creature_template` SET `minlevel`=98, `maxlevel`=110, `npcflag`=1, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=2, `unit_flags`=32832, `unit_flags2`=2048, `VehicleId`=4840 WHERE `entry`=108925; -- Lord Adder
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=190, `speed_run`=1, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=8, `unit_flags`=768, `unit_flags2`=71337984 WHERE `entry`=118507; -- Nightborne Soulstone
UPDATE `creature_template` SET `faction`=190, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=768, `unit_flags2`=71337984 WHERE `entry`=119540; -- Kirin Tor Sky Ward
UPDATE `creature_template` SET `minlevel`=101 WHERE `entry`=105904; -- Raven
UPDATE `creature_template` SET `minlevel`=109, `maxlevel`=109 WHERE `entry`=96641; -- Stabled Hunter Pet
UPDATE `creature_template` SET `minlevel`=101, `maxlevel`=101 WHERE `entry`=96635; -- Stabled Hunter Pet
UPDATE `creature_template` SET `minlevel`=103, `maxlevel`=103 WHERE `entry`=96592; -- Stabled Hunter Pet
UPDATE `creature_template` SET `minlevel`=104, `maxlevel`=104 WHERE `entry`=96636; -- Stabled Hunter Pet
UPDATE `creature_template` SET `minlevel`=105, `maxlevel`=105 WHERE `entry`=96639; -- Stabled Hunter Pet
UPDATE `creature_template` SET `npcflag`=49 WHERE `entry`=96786; -- Archmage Celindra
UPDATE `creature_template` SET `minlevel`=106, `maxlevel`=106 WHERE `entry`=96643; -- Stabled Hunter Pet
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110 WHERE `entry`=104091; -- Kirin Tor Guardian

INSERT IGNORE INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(107772, 234590, 0, 0),
(113901, 234595, 0, 0),
(116408, 231849, 0, 0),
(116419, 231849, 0, 0),
(116420, 231849, 0, 0),
(92438, 103583, 0, 0),
(112947, 234593, 0, 0),
(68232, 75648, 0, 0),
(68238, 75648, 0, 0),
(68239, 75648, 0, 0),
(119396, 237066, 0, 0),
(119437, 237066, 0, 0),
(119438, 237066, 0, 0),
(119436, 237066, 0, 0),
(106359, 210857, 0, 0),
(116323, 231637, 0, 0),
(110743, 220218, 0, 0),
(110661, 201599, 0, 0);


UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113335; -- Trashy Jr.
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113157; -- Spider
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97756; -- Inkrot
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=99895; -- Dirty Rat
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97363; -- K'huta
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=114665; -- Sergeant Wilson
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=105333; -- Val'zuun
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97491; -- Moon Priestess Nici
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=108710; -- Guardian Orb
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97509; -- Great Hexer Ohodo
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=98931; -- Thanid Glowergold
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93189; -- Mama Diggs
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=108401; -- Blacksmith Kyriel
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=106655; -- Arcanomancer Vridiel
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=41200; -- Generic Bunny - PRK
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93524; -- Lalla Brightweave
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93525; -- Ainderu Summerleaf
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=105723; -- Vicktor Ebonfall
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92460; -- Edward Egan
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113873; -- Archivist Elysiana
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93529; -- Olisarra the Kind
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=106359; -- Runed Ladder
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93533; -- Theresa Wolf
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=103976; -- Le maître de poste
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96841; -- Emeline Fizzlefry
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93531; -- Enchanter Nalthanis
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=99867; -- Warpweaver Tuviss
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96987; -- Norvin Alderman
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96947; -- Matron Nessa
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=68239; -- Carousel Wyvern
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96948; -- Pathstalker Gilen
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96968; -- Aquanos
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97507; -- Disidra Stormglory
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=109751; -- Lightsworn Anchorite
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112554; -- Pesky Bug
UPDATE `creature_template` SET `HealthScalingExpansion`=0, `VerifiedBuild`=26822 WHERE `entry`=40436; -- Earthen Ring Pathfinder
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=119226; -- Danath Trollbane
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97331; -- Icks
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=68232; -- Carousel Gryphon
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96980; -- Matilda Brightlink
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96484; -- Clockwork Assistant
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=114730; -- Caeli
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97004; -- "Red" Jack Findle
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96833; -- Grezla the Hag
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=117448; -- Cinnamon
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113779; -- Sister Might
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97533; -- Felcaster Virim
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=33776; -- Gondria
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97489; -- Garl Grimgrizzle
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `VerifiedBuild`=26822 WHERE `entry`=88189; -- Stormshield Sentinel
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `HealthModifier`=25, `VerifiedBuild`=26822 WHERE `entry`=87657; -- Stormshield Guard
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=86387; -- Dawn-Seeker Rilak
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=87052; -- Artificer Harlaan
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86424; -- Navic Greenbark
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85919; -- Jonath Chainfist
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=87065; -- Sean Catchpole
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86142; -- Nichole Swann
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=93914; -- Holly McTilla
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4, `type_flags2`=8192, `VerifiedBuild`=26822 WHERE `entry`=87329; -- Raider's Training Dummy
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86136; -- Leah Kranz
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=87243; -- Zaalendor
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85958; -- Bert Coinsplitter
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=87067; -- Miaasha
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=87049; -- Steven Cochrane
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85910; -- Joshua Fuesting
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88211; -- Sprocket Shortgauge
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88230; -- Forge-O-Matic 3000 XL
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86148; -- Knewbie McGreen
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=35845; -- Dave's Industrial Light and Magic Bunny (Small)(Sessile)
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=108925; -- Lord Adder
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97002; -- Ninsianna
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92438; -- Glaciela Rimebang
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96834; -- Fabioso the Fabulous
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96809; -- Arille Azuregaze
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96952; -- Hahna Moonscrest
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=106843; -- Prince Farondis
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97863; -- Bonegrim
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97009; -- Jawknee
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112007; -- Mel Lynchen
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112012; -- Sir Jonathan Trueheart
UPDATE `creature_template` SET `type_flags`=2162761, `HealthModifier`=17.5, `VerifiedBuild`=26822 WHERE `entry`=11673; -- Ancient Core Hound
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=46910; -- Core Hound
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=124944; -- Ageless Bronze Drake
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=99394; -- Fetid Waveling
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97238; -- Nursery Spider
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=7561; -- Albino Snake
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=118506; -- Sunreaver Spellblade
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=23086; -- Sewer Rat
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=78217; -- Infernal
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=106856; -- Blightfire Imp
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97366; -- The Widow
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113187; -- Underbelly Bonnie
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97360; -- Matthew Rabis
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113116; -- Stanky
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97364; -- Laura Malley
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110666; -- Young Mutant Warturtle
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=102193; -- Filgo Scrapbottom
UPDATE `creature_template` SET `IconName`='questinteract', `HealthScalingExpansion`=6, `type`=7, `VerifiedBuild`=26822 WHERE `entry`=116323; -- Underbelly Lowlife
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110708; -- Ratstallion
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=109364; -- Val'sharah Druid
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97359; -- Raethan
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96959; -- Vinsun
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113781; -- Li-An Skymirror
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93523; -- Namha Moonwater
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93188; -- Mongar
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96845; -- Mona Everspring
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92183; -- Alard Schmied
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=90431; -- Archmage Ansirem Runeweaver
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=105081; -- Archmage Kalec
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93542; -- Tanithria
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=105564; -- Injured Kirin Tor Guardian
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110738; -- Kaela Grimlocket
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113784; -- Classic Larry
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93527; -- Timothy Jones
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93528; -- Angelique Butler
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96840; -- Sabriana Sorrowgaze
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97718; -- Vanessa Sellers
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=119438; -- ILLISIBLE
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=119437; -- AFFRANCHISSEMENT INSUFFISANT
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96839; -- The Magnificent Merleaux
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96483; -- Jepetto Joybuzz
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=68238; -- Carousel Rocket
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96976; -- Cloth Merchant
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=85290; -- Vaultkeeper Sarniv
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=106930; -- Lieutenant Surtees
UPDATE `creature_template` SET `HealthScalingExpansion`=6, `type`=3, `VerifiedBuild`=26822 WHERE `entry`=119541; -- Felwing Screecher
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96793; -- Stefen Cotter
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96977; -- Valerie Langrom
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97685; -- Gnolie
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97213; -- Windle Sparkshine
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113782; -- Hannis Shoalwalker
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=111243; -- Archmage Lan'dalock
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97339; -- Cho Ironpalm
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97515; -- Sorrow
UPDATE `creature_template` SET `HealthScalingExpansion`=4, `type_flags`=4096, `VerifiedBuild`=26822 WHERE `entry`=87692; -- Stormshield Courier
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86389; -- Dawn-Seeker Verroak
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type`=7, `VerifiedBuild`=26822 WHERE `entry`=92501; -- Dawn-Seeker Kasrek
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85916; -- Artificer Nissea
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85930; -- Telys Vinemender
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86141; -- Dina Sprockettoss
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=85917; -- Aimee Goldforge
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=93915; -- Li "Crunchpaw" Tsang
UPDATE `creature_template` SET `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=86175; -- Bregg Coppercast
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88501; -- Maldur Goldmantle
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `type_flags2`=8192, `VerifiedBuild`=26822 WHERE `entry`=87321; -- Training Dummy
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88469; -- Gemyl Moltensteel
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88214; -- Machinist Sparkswift
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88471; -- Dinfink Steamspan
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85920; -- Jistun Sharpfeather
UPDATE `creature_template` SET `type_flags`=4096, `HealthModifier`=25, `VerifiedBuild`=26822 WHERE `entry`=86433; -- Stormshield Officer
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88254; -- Julia Watkins
UPDATE `creature_template` SET `type_flags`=4096, `HealthModifier`=25, `VerifiedBuild`=26822 WHERE `entry`=86408; -- Stormshield Guard
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92936; -- Aimee
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96835; -- Grindle Firespark
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=116420; -- Glowing Blue Gem
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96781; -- Kizi Copperclip
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=125261; -- Bran Buckbeard
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112437; -- Roscoe
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=35189; -- Skoll
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=32335; -- Armored Snowy Gryphon
UPDATE `creature_template` SET `HealthScalingExpansion`=4, `type`=12, `movementId`=100, `VerifiedBuild`=26822 WHERE `entry`=69748; -- Living Sandling
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97205; -- Stormborne Whelpling
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=106152; -- Baby Elderhorn
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=71015; -- Menagerie Custodian
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113136; -- Benax
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=98116; -- Bleakwater Jelly
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=10598; -- Smolderweb Hatchling
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112441; -- Robert Newhearth
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=122926; -- Chromie
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113188; -- Bastard
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=100671; -- Harold Winston
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=107764; -- Thuni
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97362; -- Dazzik "Proudmoore"
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97586; -- Underbelly Guard
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=120687; -- Violet Shadowmend
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96953; -- Ranger Eoss
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113812; -- Randall Goldsprocket
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=107273; -- Eve Fredrickson
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110020; -- Bruiser Wrenchvolt
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110018; -- Gazrix Gearlock
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93521; -- Ranid Glowergold
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97490; -- Halga Steelbarrow
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93541; -- Kondal Huntsworn
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93522; -- Diane Cannings
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=32453; -- Dalaran Citizen
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=32451; -- Dalaran Citizen
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93538; -- Dariness the Learned
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=114719; -- Trader Caelen
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92185; -- Braeg Stoutbeard
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=106196; -- Generic Bunny - SCS
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=115264; -- Illnea Bloodthorn
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=90418; -- Archmage Modera
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=90417; -- Archmage Khadgar
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92464; -- Kuhuine Tenderstride
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92459; -- Dorothy Egan
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=101924; -- Black Harvest Acolyte
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93532; -- Jessica Sellers
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=119396; -- RETOUR A L'ENVOYEUR
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96944; -- Muran Fairden
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=108792; -- Jenny McCree
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97342; -- Salan Sunthread
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96950; -- Summoner Mazek
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96951; -- Naseev
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93534; -- Katherine Lee
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113785; -- Hugh Mann
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96967; -- Shandy Glossgleam
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96444; -- Violet Hold Guard
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97012; -- Abra Cadabra
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96979; -- Bragund Brightlink
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=99349; -- Robert "Chance" Llore
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96990; -- Applebough
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112720; -- Jemma Wilson
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96999; -- Susana Averoy
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96978; -- Rafael Langrom
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96832; -- Crafticus Mindbender
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=95844; -- Marcia Chase
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97011; -- Valaden Silverblade
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=54320; -- Ban'thalos
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97505; -- Drool
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=32752; -- Tabitha
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86391; -- Dawn-Seeker Krek
UPDATE `creature_template` SET `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=87391; -- Fate-Twister Seress
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `VerifiedBuild`=26822 WHERE `entry`=86418; -- Stormshield Guard
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `VerifiedBuild`=26822 WHERE `entry`=86084; -- Delvar Ironfist
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=87062; -- Royce Bigbeard
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `VerifiedBuild`=26822 WHERE `entry`=88168; -- Stormshield Sentinel
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `HealthModifier`=25, `VerifiedBuild`=26822 WHERE `entry`=86436; -- Stormshield Officer
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=87365; -- Grakis
UPDATE `creature_template` SET `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=86176; -- Ingrid Blackingot
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88468; -- Bartham Flintbrow
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88472; -- Brylla Highgrip
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `HealthModifier`=25, `VerifiedBuild`=26822 WHERE `entry`=86438; -- Stormshield Officer
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88212; -- Machinist Clockspan
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88502; -- Nissa Snowpick
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88503; -- Briann Highfall
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=88215; -- Machinist Wobblewrench
UPDATE `creature_template` SET `type_flags`=4096, `HealthModifier`=25, `VerifiedBuild`=26822 WHERE `entry`=86413; -- Stormshield Guard
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85911; -- Scribe Chi-Yuan
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86432; -- Belosh
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86093; -- Zappy Zooly
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85961; -- Warpweaver Shal
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97003; -- Sheddle Glossgleam
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112947; -- Emilia Baumoon
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113775; -- Punchy Lou
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110622; -- Trevor Page
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96956; -- Pathstalker Rislar
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112456; -- Rachele
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113901; -- Crixa
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96807; -- Afsaneh Asrar
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=417; -- Felhunter
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=32494; -- Dalaran Child
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96808; -- Sandra Bartan
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=32639; -- Gnimo
UPDATE `creature_template` SET `modelid2`=70439, `type`=12, `VerifiedBuild`=26822 WHERE `entry`=90206; -- Sister of Temptation
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112132; -- Firebat Pup
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=71033; -- Fiendish Imp
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=35399; -- Obsidian Hatchling
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=99403; -- Risen Saber Kitten
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=90205; -- Fragment of Desire
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=34364; -- Calico Cat
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=7382; -- Orange Tabby Cat
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112553; -- Wintron
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=107968; -- Archmage Lan'dalock
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97623; -- Jillums Shadowcoil
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113183; -- Skidmark
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113174; -- Jerkin Joe
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113155; -- Roaster Rat
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=111158; -- Blind Rat
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110661; -- Underbelly Banquet
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=111161; -- Blind Rat
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=107760; -- Strap Bucklebolt
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110743; -- Crate of Ratstallion Harnesses
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=114662; -- Kayvon Quinnstar
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96954; -- Nelur Lightsown
UPDATE `creature_template` SET `HealthScalingExpansion`=4, `type`=7, `type_flags`=1024, `VerifiedBuild`=26822 WHERE `entry`=104208; -- Nexus-Prince Haramad
UPDATE `creature_template` SET `HealthScalingExpansion`=0, `VerifiedBuild`=26822 WHERE `entry`=40443; -- Earthen Ring Scout
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110019; -- Bruiser Toppleblade
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93539; -- Hobart Grapplehammer
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92194; -- Timofey Oshenko
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92184; -- Imindril Spearsong
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96844; -- Whirt the All-Knowing
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=109985; -- "Deadlier Warglaives" Quest Obliterum Forge POI Marker
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92456; -- Linzy Blackbolt
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=90463; -- Archmage Karlain
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92457; -- Patricia Egan
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92458; -- Deucus Valdera
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93526; -- Tiffany Cartier
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=54638; -- Generic Bunny
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93543; -- Sminx Glasseye
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93544; -- Jang Quillpaw
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=79861; -- Generic Bunny
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=92195; -- Professor Pallin
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96772; -- Warmage Kath'leen
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=119436; -- INCONNU À CETTE ADRESSE
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=104230; -- Postier-lémentaire
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93530; -- Ildine Sorrowspear
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96838; -- Kitz Proudbreeze
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97332; -- Richard Hatstock
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96949; -- Farseer Lopaa
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96975; -- Paldesse
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96789; -- Caliel Brightwillow
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96945; -- Ranger Bodine
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96946; -- Varlean
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=93545; -- Bradford Duncan
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112716; -- Rasil Fireborne
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96792; -- Inzi Charmlight
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96791; -- Marcella Bloom
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112717; -- Ginger Blockgear
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96790; -- Isirami Fairwind
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=108323; -- Gilnean Guard
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97007; -- Kerta the Bold
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97520; -- Drog Skullbreaker
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=101527; -- Blingtron 6000
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=115786; -- Sharptalon Hatchling
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86388; -- Awakened Warder
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=86129; -- Crystalsmith Naarkis
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85918; -- Hilda Copperfuze
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4, `type_flags2`=8192, `VerifiedBuild`=26822 WHERE `entry`=87320; -- Raider's Training Dummy
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85927; -- Manda Darlowe
UPDATE `creature_template` SET `type_flags2`=8192, `VerifiedBuild`=26822 WHERE `entry`=87318; -- Dungeoneer's Training Dummy
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85951; -- Kenneth Knowles
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=85923; -- Rangari Laandon
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=87057; -- Leara Moonsilk
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type`=7, `VerifiedBuild`=26822 WHERE `entry`=91273; -- Helen Noel
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85957; -- Nolan Burnbrick
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=134217728, `VerifiedBuild`=26822 WHERE `entry`=87063; -- Joao Calhandro
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `type_flags`=4096, `VerifiedBuild`=26822 WHERE `entry`=86087; -- Stormshield Peasant
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=101989; -- Voidbinder Tarazuuk
UPDATE `creature_template` SET `HealthScalingExpansion`=5, `VerifiedBuild`=26822 WHERE `entry`=85962; -- Vaultkeeper Nizsham
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=32725; -- Warmage Silva
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=110621; -- Erika Page
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96957; -- Murgha the Tempered
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=116419; -- Glowing Green Gem
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=116408; -- Glowing Red Gem
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97005; -- Debbi Moore
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=113900; -- Liyana
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=96812; -- Elizabeth Ross
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=32638; -- Hakmud of Argus
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=14505; -- Dreadsteed
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=106551; -- Hati
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=112144; -- Corgnelius
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=111423; -- Untethered Wyrmling
UPDATE `creature_template` SET `VerifiedBuild`=26822 WHERE `entry`=97207; -- Emmigosa

DELETE FROM `creature_questitem` WHERE (`CreatureEntry`=116323 AND `Idx`=0);
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(116323, 0, 143496, 26822); -- Underbelly Lowlife

UPDATE `creature_questitem` SET `VerifiedBuild`=26822 WHERE (`CreatureEntry`=97756 AND `Idx`=0); -- Inkrot
UPDATE `creature_questitem` SET `VerifiedBuild`=26822 WHERE (`CreatureEntry`=99895 AND `Idx`=0); -- Dirty Rat
UPDATE `creature_questitem` SET `VerifiedBuild`=26822 WHERE (`CreatureEntry`=11673 AND `Idx`=0); -- Ancient Core Hound
UPDATE `creature_questitem` SET `VerifiedBuild`=26822 WHERE (`CreatureEntry`=46910 AND `Idx`=0); -- Core Hound
UPDATE `creature_questitem` SET `VerifiedBuild`=26822 WHERE (`CreatureEntry`=100671 AND `Idx`=0); -- Harold Winston

DELETE FROM `gameobject_template` WHERE `entry` IN (246943 /*Obliterum Hammer*/, 246941 /*Illidari Banner*/, 246942 /*Anvil*/, 243577 /*Doodad_6HU_BLACKSMITH_FLOORPLATE002*/, 236995 /*Woodbench*/, 240388 /*Apexis Vault*/);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `RequiredLevel`, `VerifiedBuild`) VALUES
(246943, 5, 27365, 'Obliterum Hammer', '', '', '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26822), -- Obliterum Hammer
(246941, 5, 26916, 'Illidari Banner', '', '', '', 0.76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26822), -- Illidari Banner
(246942, 8, 26248, 'Anvil', '', '', '', 1, 1, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26822), -- Anvil
(243577, 5, 27911, 'Doodad_6HU_BLACKSMITH_FLOORPLATE002', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26822), -- Doodad_6HU_BLACKSMITH_FLOORPLATE002
(236995, 7, 15419, 'Woodbench', '', '', '', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26822), -- Woodbench
(240388, 0, 25496, 'Apexis Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 33880, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26822); -- Apexis Vault

UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250395; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248523; -- Khadgar's Lockbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248933; -- Compendium of Ancient Weapons Volume I
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248822; -- Khadgar's Lockbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250389; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250388; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=244581; -- Decommissioned Calefactor
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248863; -- Candle
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248864; -- Skull
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259415; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250318; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242123; -- Lamp
UPDATE `gameobject_template` SET `type`=9, `size`=4.5, `Data0`=3542, `Data2`=1, `Data3`=1, `VerifiedBuild`=26822 WHERE `entry`=267068; -- Archimage Antonidas
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242201; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245691; -- Gem Chips
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245368; -- Namha's Tanning Mixture
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245662; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=247849; -- Tube pneumatique
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=244824; -- Leather Shipment
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=188215; -- Collision PC Size
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259345; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245663; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242640; -- Tanithria's Finishing Table
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242044; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268066; -- L’Alliance de Lordaeron
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250393; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259262; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250217; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250216; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242039; -- The Scribe's Sacellum
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259306; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242042; -- Shard up for some enchanting materials? Come inside!
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259305; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242216; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241972; -- The Wonderworks
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250435; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250260; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242029; -- Guild Vault
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246003; -- Portal to Exodar
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241951; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242030; -- Guild Vault
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250259; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250310; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259288; -- Couch
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=200296; -- Washing Tub
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259317; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242127; -- Dalaran Merchant's Bank
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250512; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250521; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250510; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250511; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250524; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242126; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250506; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268052; -- L’exil des Haut-Elfes
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246008; -- Portal to Dalaran Crater
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268078; -- Le triomphe du roi-liche
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246262; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241952; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241965; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=247337; -- Collision Wall
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268046; -- Arathor et les Guerres trolles
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=247013; -- Stairs
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246010; -- Portal to Shattrath
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241960; -- Curiosities & Moore
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237258; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=236979; -- Weapons
UPDATE `gameobject_template` SET `Data5`=924, `VerifiedBuild`=26822 WHERE `entry`=239438; -- Portal to Ironforge
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=228651; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237734; -- Prison Door
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237620; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237619; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237622; -- Anvil
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=238668; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=236993; -- Chair
UPDATE `gameobject_template` SET `Data5`=924, `VerifiedBuild`=26822 WHERE `entry`=237623; -- Portal to Stormshield
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259303; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268074; -- Les Gardiens de Tirisfal
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250464; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250299; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241963; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259339; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250477; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=266619; -- Une note mystérieuse
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=235100; -- Bones
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259295; -- Beanbag
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259294; -- Beanbag
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259335; -- Coffee Press
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250492; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241966; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250458; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250495; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250490; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250491; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250484; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250483; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=190942; -- Death Gate
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250400; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=266129; -- Portail vers la citadelle Pourpre
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250391; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=252663; -- Rest in peace, Lil' Brudder. Heart of a champion.
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250390; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=254800; -- Dalaran Sewer Roast
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=244579; -- Spellbound Insulation
UPDATE `gameobject_template` SET `Data1`=0, `VerifiedBuild`=26822 WHERE `entry`=246519; -- Fel Reaver Husk
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=244599; -- Underbelly Spoils
UPDATE `gameobject_template` SET `type`=3, `displayId`=25466, `Data0`=2591, `Data1`=62091, `Data3`=1, `Data13`=1, `Data18`=110, `Data19`=3, `RequiredLevel`=98, `VerifiedBuild`=26822 WHERE `entry`=244598; -- Underbelly Cache
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248865; -- Skull
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248862; -- Candle
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250317; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=251105; -- Portal out of the Vault
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250313; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246007; -- Portal to Vale of Eternal Blossoms
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242199; -- The Bank of Dalaran
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=258330; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242118; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245661; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248841; -- Namha's Workbench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=247848; -- Tube pneumatique
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259350; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242051; -- Things of the Past
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241513; -- Alard's Workbench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241511; -- Alard's Anvil
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242049; -- Talismanic Textiles
UPDATE `gameobject_template` SET `Data1`=0, `VerifiedBuild`=26822 WHERE `entry`=242638; -- Tanithria's Red Dye
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=249919; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250394; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246154; -- Broken Toy Box
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250218; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242366; -- Hay Bale
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259341; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268081; -- Le Fléau de Lordaeron
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=247858; -- Tube pneumatique
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259378; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242041; -- Simply Enchanting
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259366; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259285; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259387; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242220; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250311; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259309; -- Beanbag
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250306; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259382; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259383; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250301; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=200297; -- Shandy's Clothesline
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241943; -- Wall Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259287; -- Couch
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242128; -- Dalaran Merchant's Bank
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250527; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250515; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250507; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250503; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250454; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250438; -- Photonic Playground
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=278574; -- Tableau de l’appel des héros
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250520; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250476; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241961; -- A Hero's Welcome
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=247019; -- Sack
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241953; -- The Arsenal Absolute
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=225789; -- Easter Egg
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=228644; -- Cookbot
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=236184; -- Broken Sword
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=228646; -- Machine
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237736; -- Prison Door
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=236409; -- Prison Door
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=238944; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237618; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=236994; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242218; -- Well
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250298; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241944; -- Wall Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=267991; -- La Naissance du roi-liche
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241950; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=266618; -- Pile de courrier
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=235098; -- Skull Candle
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259337; -- Coffee Grinder
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=244562; -- Teleport Pad
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259268; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250487; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=266851; -- Wand of Simulated Life
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=266761; -- Research Notes
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250459; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259336; -- Coffee Grinder
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250471; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250473; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250481; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=269037; -- Caillou déchaussé
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250399; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248522; -- Khadgar's Lockbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250387; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=251302; -- Portal to Dreadscar Rift
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250642; -- Shimmering Whorl
UPDATE `gameobject_template` SET `type`=3, `displayId`=8128, `size`=0.75, `Data3`=1, `Data30`=71624, `VerifiedBuild`=26822 WHERE `entry`=268058; -- Anciennes haines - La colonisation de Kalimdor
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=252122; -- Ratstallion Cage
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248889; -- Seat
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245999; -- Portal to Thunder Bluff
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250300; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245832; -- Guild Vault
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250319; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250314; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242202; -- Lamp
UPDATE `gameobject_template` SET `type`=3, `displayId`=447, `size`=1.1, `Data3`=1, `Data30`=71629, `VerifiedBuild`=26822 WHERE `entry`=268067; -- La bataille de Grim Batol
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=258329; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248842; -- Skinning Knife
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259348; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259346; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268053; -- Forgefer - l’Eveil des Nains
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242054; -- Like Clockwork
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246945; -- Obliterum Forge
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242052; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241419; -- Alard's Whetstone
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241512; -- Alard's Quenching Trough
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242043; -- Lamp
UPDATE `gameobject_template` SET `type`=3, `displayId`=105, `size`=0.75, `Data3`=1, `Data30`=71632, `VerifiedBuild`=26822 WHERE `entry`=268072; -- La Porte des ténèbres et la chute de Hurlevent
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242641; -- Tanithria's Dyeing Tub
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268087; -- L’Arbre-Monde et le Rêve d’émeraude
UPDATE `gameobject_template` SET `Data1`=0, `VerifiedBuild`=26822 WHERE `entry`=242637; -- Tanithria's Blue Dye
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242047; -- Lamp
UPDATE `gameobject_template` SET `Data0`=200499, `VerifiedBuild`=26822 WHERE `entry`=245623; -- Tiffany's Carving Machine
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268057; -- Le mont Hyjal et le cadeau d’Illidan
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259343; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259342; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=249730; -- Runes of the Aqir
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250219; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=244651; -- Steamy Romance Novel
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=280797; -- Tube pneumatique
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242040; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246006; -- Portal to Vale of Eternal Blossoms
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259390; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268045; -- Au lendemain de la Deuxième guerre
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259284; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259310; -- Beanbag
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250258; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245997; -- Portal to Darnassus
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250307; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245998; -- Portal to Ironforge
UPDATE `gameobject_template` SET `Data1`=0 WHERE `entry`=246710; -- Nomi's Silver Mackerel
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259834; -- Fireplace
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246002; -- Portal to Stormwind
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259351; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250523; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250509; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250525; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250517; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250501; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242125; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250505; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242129; -- The Militant Mystic
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246708; -- WARNING: Drop
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250504; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246258; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=258327; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246257; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250519; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242131; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=249362; -- Lever
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=247015; -- Luggage
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259296; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=236219; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237291; -- Anvil
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=228649; -- Mail-o-Tron 9001
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237735; -- Prison Door
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=236408; -- Prison Door
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237621; -- Anvil
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242200; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=254236; -- Harp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250479; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250485; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250478; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=235099; -- Crystal Dust
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259293; -- Beanbag
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246463; -- Hammer of Khaz'goroth
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268044; -- Aegwynn et la chasse au dragon
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250493; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242237; -- Barbershop
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250497; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268049; -- Le fardeau des Vols draconiques
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=269989; -- Journal de Mel
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259292; -- Beanbag
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241964; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259338; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268059; -- La montée des Elfes de sang
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250215; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268368; -- Matrice arcanique du Kirin Tor
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250397; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268060; -- La montée de la Horde
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268079; -- La nouvelle Horde
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250392; -- Bench
UPDATE `gameobject_template` SET `type`=3, `displayId`=8133, `size`=0.7, `Data3`=1, `Data30`=71640, `VerifiedBuild`=26822 WHERE `entry`=268080; -- Les Dieux très anciens et l’ordonnancement d’Azeroth
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=244578; -- Alchemical Flame
UPDATE `gameobject_template` SET `type`=3, `displayId`=6908, `size`=0.6, `Data3`=1, `Data30`=71644, `VerifiedBuild`=26822 WHERE `entry`=268084; -- Les empires jumeaux
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248861; -- Tome
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=245833; -- Guild Vault
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259416; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246000; -- Portal to Undercity
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250322; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246001; -- Portal to Orgrimmar
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242198; -- The Bank of Dalaran
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259349; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=258328; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248843; -- Skinning Knife
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248844; -- Namha's Tanning Rack
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242050; -- Legendary Leathers
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248516; -- Anvil
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241453; -- Alard's Forge
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242038; -- Wall Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242046; -- The Agronomical Apothecary
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259347; -- Chair
UPDATE `gameobject_template` SET `Data1`=0, `VerifiedBuild`=26822 WHERE `entry`=248093; -- Box of Bear Fur
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248966; -- Broken High-Capacity Decoction Conduit
UPDATE `gameobject_template` SET `Data1`=0, `VerifiedBuild`=26822 WHERE `entry`=242639; -- Tanithria's Green Dye
UPDATE `gameobject_template` SET `Data1`=0, `VerifiedBuild`=26822 WHERE `entry`=242636; -- Tanithria's Purple Dye
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242045; -- Cartier & Co. Fine Jewelry
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242048; -- First to Your Aid
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259344; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268061; -- Sargeras et la trahison
UPDATE `gameobject_template` SET `Data1`=0, `VerifiedBuild`=26822 WHERE `entry`=249729; -- The Masterful Miller's Manual
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=249732; -- Verdigris or Malachite? Selecting the Proper Green Ink
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242037; -- Wall Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=249731; -- Scrolls, Scrolls, Scrolls
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259334; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248856; -- Caution!
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259304; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242215; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=248079; -- Wall Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259380; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268065; -- Puits de soleil - La chute de Quel’Thalas
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259363; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241959; -- The Threads of Fate
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259311; -- Beanbag
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259312; -- Beanbag
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250261; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250305; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259381; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259384; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=259286; -- Couch
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250302; -- Bench
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250514; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250513; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250522; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250528; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250526; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250516; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250502; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250455; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250508; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250456; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246013; -- Portal to Wyrmrest Temple
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246009; -- Portal to Karazhan
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250453; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242130; -- Langrom's Leather & Links
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250518; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241968; -- Lamp
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=242132; -- Glorious Goods
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=247018; -- Tip Bucket
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246005; -- Portal to Caverns of Time
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=251286; -- Illidari Gateway
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237289; -- Anvil
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237290; -- Forge
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=228653; -- Vice
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=228642; -- Engine
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=237737; -- Prison Door
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=238667; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=238945; -- Stool
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=235883; -- Portal to Stormwind
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=194115; -- Shoeshine Seat
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246260; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246261; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250457; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241958; -- The Legerdemain Lounge
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=266736; -- Journal de recherche de Levia
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241922; -- Barbershop Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241921; -- Barbershop Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250480; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241920; -- Barbershop Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250494; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=246465; -- Tidestone of Golganneth
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250436; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=268051; -- La chute de l’empire
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=266705; -- Willem West's Table
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250214; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250496; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=250472; -- Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=252331; -- Traveller Pepe
UPDATE `gameobject_template` SET `VerifiedBuild`=26822 WHERE `entry`=241945; -- Wall Lamp


UPDATE `gameobject_questitem` SET `VerifiedBuild`=26822 WHERE (`GameObjectEntry`=244581 AND `Idx`=0); -- Decommissioned Calefactor
UPDATE `gameobject_questitem` SET `VerifiedBuild`=26822 WHERE (`GameObjectEntry`=245368 AND `Idx`=0); -- Namha's Tanning Mixture
UPDATE `gameobject_questitem` SET `VerifiedBuild`=26822 WHERE (`GameObjectEntry`=244824 AND `Idx`=0); -- Leather Shipment
UPDATE `gameobject_questitem` SET `VerifiedBuild`=26822 WHERE (`GameObjectEntry`=266619 AND `Idx`=0); -- Une note mystérieuse
UPDATE `gameobject_questitem` SET `VerifiedBuild`=26822 WHERE (`GameObjectEntry`=244578 AND `Idx`=0); -- Alchemical Flame
UPDATE `gameobject_questitem` SET `VerifiedBuild`=26822 WHERE (`GameObjectEntry`=249729 AND `Idx`=0); -- The Masterful Miller's Manual
UPDATE `gameobject_questitem` SET `VerifiedBuild`=26822 WHERE (`GameObjectEntry`=244579 AND `Idx`=0); -- Spellbound Insulation
UPDATE `gameobject_questitem` SET `VerifiedBuild`=26822 WHERE (`GameObjectEntry`=246519 AND `Idx`=0); -- Fel Reaver Husk


UPDATE `npc_text` SET `VerifiedBuild`=26822 WHERE `ID`=31799; -- 31799
UPDATE `npc_text` SET `VerifiedBuild`=26822 WHERE `ID`=28753; -- 28753
UPDATE `npc_text` SET `VerifiedBuild`=26822 WHERE `ID`=28102; -- 28102
UPDATE `npc_text` SET `VerifiedBuild`=26822 WHERE `ID`=25786; -- 25786
UPDATE `npc_text` SET `VerifiedBuild`=26822 WHERE `ID`=28754; -- 28754

