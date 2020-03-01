DELETE FROM `conversation_actors` WHERE (`ConversationId`=2257 AND `ConversationActorId`=53867 AND `Idx`=0) OR (`ConversationId`=2586 AND `ConversationActorId`=53727 AND `Idx`=0) OR (`ConversationId`=2844 AND `ConversationActorId`=49656 AND `Idx`=0) OR (`ConversationId`=2256 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=3623 AND `Idx`=0) OR (`ConversationId`=2849 AND `Idx`=1) OR (`ConversationId`=2849 AND `Idx`=0) OR (`ConversationId`=2253 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=2336 AND `Idx`=0) OR (`ConversationId`=2336 AND `Idx`=1) OR (`ConversationId`=2529 AND `ConversationActorId`=53622 AND `Idx`=0) OR (`ConversationId`=2671 AND `ConversationActorId`=53867 AND `Idx`=0) OR (`ConversationId`=2251 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=1867 AND `Idx`=1) OR (`ConversationId`=1867 AND `Idx`=0) OR (`ConversationId`=775 AND `ConversationActorId`=50369 AND `Idx`=0) OR (`ConversationId`=2258 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=778 AND `ConversationActorId`=50369 AND `Idx`=0) OR (`ConversationId`=2237 AND `ConversationActorId`=53077 AND `Idx`=0) OR (`ConversationId`=2259 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=777 AND `ConversationActorId`=50369 AND `Idx`=0) OR (`ConversationId`=2550 AND `Idx`=0) OR (`ConversationId`=773 AND `ConversationActorId`=50369 AND `Idx`=0) OR (`ConversationId`=3593 AND `Idx`=1) OR (`ConversationId`=3593 AND `Idx`=0) OR (`ConversationId`=776 AND `ConversationActorId`=50369 AND `Idx`=0) OR (`ConversationId`=2260 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=2255 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=2650 AND `Idx`=0) OR (`ConversationId`=2845 AND `ConversationActorId`=49656 AND `Idx`=0) OR (`ConversationId`=2252 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=2338 AND `Idx`=1) OR (`ConversationId`=2338 AND `Idx`=0) OR (`ConversationId`=2339 AND `Idx`=1) OR (`ConversationId`=2339 AND `Idx`=0) OR (`ConversationId`=2542 AND `Idx`=1) OR (`ConversationId`=2542 AND `Idx`=0) OR (`ConversationId`=2439 AND `ConversationActorId`=49664 AND `Idx`=0) OR (`ConversationId`=2846 AND `Idx`=0) OR (`ConversationId`=1875 AND `Idx`=0) OR (`ConversationId`=1875 AND `Idx`=1) OR (`ConversationId`=774 AND `ConversationActorId`=50369 AND `Idx`=0) OR (`ConversationId`=3624 AND `Idx`=0) OR (`ConversationId`=2254 AND `ConversationActorId`=50552 AND `Idx`=0) OR (`ConversationId`=2247 AND `ConversationActorId`=53077 AND `Idx`=0);
INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorId`, `Idx`, `VerifiedBuild`) VALUES
(2257, 53867, 0, 23420),
(2586, 53727, 0, 23420),
(2844, 49656, 0, 23420),
(2256, 50552, 0, 23420),
(2253, 50552, 0, 23420),
(2529, 53622, 0, 23420),
(2671, 53867, 0, 23420),
(2251, 50552, 0, 23420),
(775, 50369, 0, 23420),
(2258, 50552, 0, 23420),
(778, 50369, 0, 23420),
(2237, 53077, 0, 23420),
(2259, 50552, 0, 23420),
(777, 50369, 0, 23420),
(773, 50369, 0, 23420),
(776, 50369, 0, 23420),
(2260, 50552, 0, 23420),
(2255, 50552, 0, 23420),
(2845, 49656, 0, 23420),
(2252, 50552, 0, 23420),
(2439, 49664, 0, 23420),
(774, 50369, 0, 23420),
(2254, 50552, 0, 23420),
(2247, 53077, 0, 23420);


DELETE FROM `conversation_actor_template` WHERE `Id` IN (53867, 53727, 49656, 50552, 53622, 50369, 53077, 49664);
INSERT INTO `conversation_actor_template` (`Id`, `CreatureId`, `CreatureModelId`, `VerifiedBuild`) VALUES
(53867, 91387, 65043, 23420),
(53727, 93231, 65138, 23420),
(49656, 98174, 68213, 23420),
(50552, 91387, 65043, 23420),
(53622, 91556, 62280, 23420),
(50369, 96257, 25217, 23420),
(53077, 96254, 64208, 23420),
(49664, 96254, 64208, 23420);


DELETE FROM `conversation_line_template` WHERE `Id` IN (4753, 5427, 5924, 4752, 8118, 5931, 5932, 4749, 4939, 4938, 4937, 5345, 5344, 5343, 5614, 5426, 4747, 3960, 3959, 3958, 3957, 3955, 1839, 4754, 1842, 4711, 4710, 4755, 1841, 5379, 1837, 8041, 8040, 8039, 8038, 1840, 4756, 4751, 5565, 5564, 5926, 4748, 4944, 4943, 4947, 4946, 5365, 5364, 5366, 5162, 5928, 5927, 5428, 3973, 3972, 3970, 1838, 8119, 4750, 4743, 4742, 4741, 4740, 5925);
INSERT INTO `conversation_line_template` (`Id`, `StartTime`, `UiCameraID`, `ActorIdx`, `Flags`, `VerifiedBuild`) VALUES
(4753, 0, 620, 0, 1, 23420),
(5427, 0, 601, 0, 0, 23420),
(5924, 0, 149, 0, 0, 23420),
(4752, 0, 620, 0, 0, 23420),
(8118, 0, 690911645, 0, 0, 23420),
(5931, 2000, 0, 1, 0, 23420),
(5932, 0, 0, 0, 0, 23420),
(4749, 0, 620, 0, 0, 23420),
(4939, 2693, 0, 0, 1, 23420),
(4938, 0, 0, 1, 1, 23420),
(4937, 0, 0, 0, 1, 23420),
(5345, 14905, 134, 0, 0, 23420),
(5344, 7253, 134, 0, 0, 23420),
(5343, 0, 134, 0, 0, 23420),
(5614, 0, 620, 0, 0, 23420),
(5426, 0, 601, 0, 0, 23420),
(4747, 0, 620, 0, 0, 23420),
(3960, 24434, 833283456, 1, 0, 23420),
(3959, 13558, 833283456, 1, 0, 23420),
(3958, 10498, 833283456, 0, 0, 23420),
(3957, 4337, 833283456, 1, 0, 23420),
(3955, 0, 833283456, 0, 0, 23420),
(1839, 0, 598, 0, 0, 23420),
(4754, 0, 620, 0, 0, 23420),
(1842, 0, 598, 0, 0, 23420),
(4711, 4511, 134, 0, 0, 23420),
(4710, 0, 134, 0, 0, 23420),
(4755, 0, 620, 0, 0, 23420),
(1841, 0, 598, 0, 0, 23420),
(5379, 0, 1465, 0, 0, 23420),
(1837, 0, 598, 0, 0, 23420),
(8041, 14300, 833290952, 1, 0, 23420),
(8040, 9800, 833290952, 0, 0, 23420),
(8039, 6050, 833290952, 1, 0, 23420),
(8038, 0, 833290952, 0, 0, 23420),
(1840, 0, 598, 0, 0, 23420),
(4756, 0, 620, 0, 0, 23420),
(4751, 0, 620, 0, 0, 23420),
(5565, 7082, 4290027536, 0, 0, 23420),
(5564, 0, 4290027536, 0, 0, 23420),
(5926, 0, 149, 0, 0, 23420),
(4748, 0, 620, 0, 0, 23420),
(4944, 3064, 0, 1, 0, 23420),
(4943, 0, 0, 0, 0, 23420),
(4947, 3537, 0, 1, 0, 23420),
(4946, 0, 0, 0, 0, 23420),
(5365, 7091, 4290027536, 1, 0, 23420),
(5364, 2000, 4290027536, 1, 0, 23420),
(5366, 0, 4290027536, 0, 0, 23420),
(5162, 0, 134, 0, 0, 23420),
(5928, 5844, 0, 0, 0, 23420),
(5927, 0, 0, 0, 0, 23420),
(5428, 0, 601, 0, 0, 23420),
(3973, 14674, 833286496, 0, 0, 23420),
(3972, 9090, 833286496, 1, 0, 23420),
(3970, 0, 833286496, 0, 0, 23420),
(1838, 0, 598, 0, 0, 23420),
(8119, 0, 0, 0, 0, 23420),
(4750, 0, 620, 0, 0, 23420),
(4743, 22355, 134, 0, 0, 23420),
(4742, 15243, 134, 0, 0, 23420),
(4741, 5034, 134, 0, 0, 23420),
(4740, 0, 134, 0, 0, 23420),
(5925, 0, 149, 0, 0, 23420);


DELETE FROM `conversation_template` WHERE `Id` IN (2339, 2338, 3593, 2849, 2846, 2845, 2260, 2259, 2258, 2257, 2256, 2255, 2254, 2253, 2252, 2251, 2671, 1867, 1875, 2650, 2586, 2336, 2247, 3623, 3624, 2542, 2550, 2529, 775, 774, 773, 778, 777, 776, 2439, 2237);
INSERT INTO `conversation_template` (`Id`, `FirstLineID`, `LastLineEndTime`, `VerifiedBuild`) VALUES
(2339, 4946, 0, 23420),
(2338, 4943, 0, 23420),
(3593, 8038, 0, 23420),
(2849, 5932, 0, 23420),
(2846, 5927, 0, 23420),
(2845, 5926, 0, 23420),
(2260, 4756, 0, 23420),
(2259, 4755, 0, 23420),
(2258, 4754, 0, 23420),
(2257, 4753, 0, 23420),
(2256, 4752, 0, 23420),
(2255, 4751, 0, 23420),
(2254, 4750, 0, 23420),
(2253, 4749, 0, 23420),
(2252, 4748, 0, 23420),
(2251, 4747, 0, 23420),
(2671, 5614, 0, 23420),
(1867, 3955, 0, 23420),
(1875, 3970, 0, 23420),
(2650, 5564, 0, 23420),
(2586, 5428, 0, 23420),
(2336, 4937, 0, 23420),
(2247, 4740, 0, 23420),
(3623, 8118, 0, 23420),
(3624, 8119, 0, 23420),
(2542, 5366, 0, 23420),
(2550, 5379, 0, 23420),
(2529, 5343, 0, 23420),
(775, 1839, 0, 23420),
(774, 1838, 0, 23420),
(773, 1837, 0, 23420),
(778, 1842, 0, 23420),
(777, 1841, 0, 23420),
(776, 1840, 0, 23420),
(2439, 5162, 0, 23420),
(2237, 4710, 0, 23420);


DELETE FROM `gameobject_template_addon` WHERE `entry` IN (243455 /*Plant Explosives*/, 266054 /*Keg of Grog*/, 245668 /*Whelp Cage*/, 245672 /*Whelp Cage*/);
INSERT INTO `gameobject_template_addon` (`entry`, `faction`, `flags`) VALUES
(243455, 0, 262144), -- Plant Explosives
(266054, 0, 262144), -- Keg of Grog
(245668, 0, 4), -- Whelp Cage
(245672, 0, 5); -- Whelp Cage

UPDATE `gameobject_template_addon` SET `flags`=17 WHERE `entry`=247421; -- Powder Keg
UPDATE `gameobject_template_addon` SET `flags`=1 WHERE `entry`=243570; -- Shieldmaiden Idol
UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=243454; -- Gilnean Heavy Explosive
UPDATE `gameobject_template_addon` SET `flags`=1 WHERE `entry`=244703; -- Nether Circle
UPDATE `gameobject_template_addon` SET `flags`=1 WHERE `entry`=244730; -- Nether Circle
UPDATE `gameobject_template_addon` SET `flags`=1 WHERE `entry`=244731; -- Nether Circle
UPDATE `gameobject_template_addon` SET `flags`=1 WHERE `entry`=244733; -- Nether Circle
UPDATE `gameobject_template_addon` SET `flags`=1 WHERE `entry`=244704; -- Tideskorn Banner
UPDATE `gameobject_template_addon` SET `flags`=5 WHERE `entry`=244565; -- Kvaldir Spoils
UPDATE `gameobject_template_addon` SET `flags`=1 WHERE `entry`=251189; -- Plate of Leftovers
UPDATE `gameobject_template_addon` SET `flags`=262145 WHERE `entry`=240650; -- Ritual Circle
UPDATE `gameobject_template_addon` SET `flags`=262145 WHERE `entry`=244337; -- Ritual Circle
UPDATE `gameobject_template_addon` SET `flags`=262145 WHERE `entry`=244336; -- Ritual Circle
UPDATE `gameobject_template_addon` SET `flags`=262145 WHERE `entry`=244335; -- Ritual Circle
UPDATE `gameobject_template_addon` SET `flags`=2113540 WHERE `entry`=241460; -- Climbing Treads
UPDATE `gameobject_template_addon` SET `flags`=5 WHERE `entry`=245670; -- Whelp Cage
UPDATE `gameobject_template_addon` SET `flags`=2113540 WHERE `entry`=241462; -- Oiled Cloak
UPDATE `gameobject_template_addon` SET `flags`=262149 WHERE `entry`=243817; -- Powered Console
UPDATE `gameobject_template_addon` SET `flags`=1 WHERE `entry`=243808; -- Unpowered Console
UPDATE `gameobject_template_addon` SET `flags`=5 WHERE `entry`=243841; -- Bloodtotem Standard
UPDATE `gameobject_template_addon` SET `flags`=2113540 WHERE `entry`=249890; -- Tigrid's Arkhana
UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=244453; -- Cullen's Scouting Report

DELETE FROM `quest_offer_reward` WHERE `ID` IN (42483 /*Put It All on Red*/, 39786 /*A Stone Cold Gamble*/, 39792 /*A Stack of Racks*/, 39793 /*Only the Finest*/, 39787 /*Rigging the Wager*/, 42447 /*Dances With Ravenbears*/, 42446 /*Singed Feathers*/, 42445 /*Nithogg's Tribute*/, 42444 /*Plight of the Blackfeather*/, 38882 /*A New Life for Undeath*/, 39155 /*Becoming the Ascendant*/, 38878 /*Shielded Secrets*/, 39154 /*To Skold-Ashil*/, 38873 /*Clear the Deck!*/, 39153 /*Dreadwake's Dilemma*/, 39385 /*A Gift for Greymane*/, 38872 /*The Dark Lady's Bidding*/, 39789 /*Eating Into Our Business*/, 38618 /*Above the Winter Moonlight*/, 38617 /*Another Way*/, 38615 /*Impalement Insurance*/, 38614 /*To Weather the Storm*/, 38616 /*Built to Scale*/, 38613 /*No Wings Required*/, 38612 /*A Grapple a Day*/, 38611 /*Will of the Thorignir*/, 38459 /*The Ancient Trials*/, 38317 /*Masters of Disguise*/, 38308 /*Eyes in the Overlook*/, 38362 /*A Grim Trophy*/, 38360 /*The Windrunner's Fate*/, 38361 /*Wrath of the Blightcaller*/, 38332 /*The Ranger Lord*/, 38358 /*Pump it Up*/, 38357 /*Side Effects May Include Mild Undeath*/);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(42483, 0, 0, 0, 0, 0, 0, 0, 0, '<A note from the goblins is left behind, along with an old magnifying glass>$B$BI wish I coulda been there to see the look on your face, but Raz and I got bigger fish to fry!$B$BThanks for the trophies and meat. I\'m sure they\'ll fetch a nice sum on the black market, along with all the goodies we got from those stupid tauren! I\'m sure they won\'t be needing them any more!$B$BSo long sucker!', 23420), -- Put It All on Red
(39786, 0, 0, 0, 0, 0, 0, 0, 0, 'Well, well. I half expected to find your statue on the riverbank. You\'re gonna get a nice payout once those tauren get back...$B$BYou haven\'t seen them around, have you?', 23420), -- A Stone Cold Gamble
(39792, 0, 0, 0, 0, 0, 0, 0, 0, 'Oh hey, it\'s... you again! Of course you didn\'t have any trouble with those musken. You\'re a big, tough hero after all!$B$BThe tauren still aren\'t back, though. I\'m a bit worried that they may have gone off and hunted a bit more that they can chew.$B$BOh, I\'ll take those ribs, though. What do you want for em?', 23420), -- A Stack of Racks
(39793, 0, 0, 0, 0, 0, 0, 0, 0, 'You\'re back? $B$BI mean... hey, you\'re back!$B$BWell, the tauren haven\'t come back yet, but no worries, I\'ll take that stuff off your hands! Let me show you some of my prime trade goods.', 23420), -- Only the Finest
(39787, 0, 0, 0, 0, 0, 0, 0, 0, 'So you took him out, eh? Those tauren are gonna be so jealous when they get back!  \n\nNaturally, you\'ll have to wait till the tauren get back and pay their wager before I can give you your cut. But in the meantime, I\'ve got another target for you.', 23420), -- Rigging the Wager
(42447, 0, 0, 0, 0, 0, 0, 0, 0, 'It seems that Nithogg wasn\'t interested in the ravenbears\' tribute.$B$BIt\'s probably a good idea to get out of here before he comes back...', 23420), -- Dances With Ravenbears
(42446, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackfeather chieftain bows respectfully to you. $B$BYou have helped ensure the survival of his tribe.', 23420), -- Singed Feathers
(42445, 0, 0, 0, 0, 0, 0, 0, 0, 'Caw! Caw! $B$B<The ravenbear chieftain flaps his wings excitedly when he sees the reagents you\'ve brought.>', 23420), -- Nithogg's Tribute
(42444, 0, 0, 0, 0, 0, 0, 0, 0, 'Caw?$B$B<The ravenbear chieftain seems preoccupied with the gathering of reagents for some sort of ritual. Perhaps you could help him?>', 23420), -- Plight of the Blackfeather
(38882, 0, 0, 0, 0, 0, 0, 0, 0, 'It looks like we underestimated Greymane\'s tenacity - a mistake that cost the Forsaken dearly. $B$BThis Eyir cannot hide for long, however. If I must I will hunt her through the Halls of Valor! $B$BGo now, $c. I will call upon you when you are needed.', 23420), -- A New Life for Undeath
(39155, 0, 0, 0, 0, 0, 0, 0, 0, 'The hero returns, and with the barrier disabled. I will see that you are commended for this. $B$BBut first, we must claim this vault!', 23420), -- Becoming the Ascendant
(38878, 0, 0, 0, 0, 0, 0, 0, 0, 'I would hope that you bring me some good news, $c. $B$BFor both of our sake.', 23420), -- Shielded Secrets
(39154, 0, 0, 0, 0, 0, 0, 0, 0, 'You seem surprised to find me here? I was surprised as well, to find that my forces were unable to even breach the city of these cursed vrykul! $B$BThe time has come to employ some different tactics, and your arrival couldn\'t have been more fortuitous.', 23420), -- To Skold-Ashil
(38873, 0, 0, 0, 0, 0, 0, 0, 0, 'Hah! Greymane will find his cannons aren\'t so useful when the blight takes his crew!', 23420), -- Clear the Deck!
(39153, 0, 0, 0, 0, 0, 0, 0, 0, 'It looks like the ravens will feast on worgen flesh today, $c.$B$BWell done.', 23420), -- Dreadwake's Dilemma
(39385, 0, 0, 0, 0, 0, 0, 0, 0, 'By the Dark Lady\'s favor, you did it! I witnessed the explosion from here - there\'s no way that Greymane could have survived such destruction! $B$BYou have done a great deed today for the Forsaken. Rest assured, it will be remembered.', 23420), -- A Gift for Greymane
(38872, 0, 0, 0, 0, 0, 0, 0, 0, 'Finally someone competent arrives at this sorry excuse for an outpost. $B$BOur efforts to complete Sylvanas\'s mission are at a standstill, but now we have even more pressing matters on our hands.', 23420), -- The Dark Lady's Bidding
(39789, 0, 0, 0, 0, 0, 0, 0, 0, 'Oh, hey! You must be lookin for them tauren was camped here. They just stepped out for a bit, but Snaggle here and I - we can take care of ya!$B$BYou say they were gonna pay you for killin\' some worgs, huh? No prob, bub!$B$BI ain\'t got a lot of gold, but these goods are pretty valuable. Take your pick!', 23420), -- Eating Into Our Business
(38618, 1, 0, 0, 0, 0, 0, 0, 0, 'You are here for the trial? I\'m afraid you might be too late.$B$BThis battle with these Felskorn has taken its toll. I am too weak to grant you the power you seek...$B$BBut perhaps you may be able to help...', 23420), -- Above the Winter Moonlight
(38617, 4, 0, 0, 0, 0, 0, 0, 0, 'What a fight! $B$BAnd here I thought this place would be boring.', 23420), -- Another Way
(38615, 5, 0, 0, 0, 0, 0, 0, 0, 'We won\'t have to worry about those scrap heaps anymore! $B$BIt looks like we\'ve got a hitch in our plan though. That bridge was the only way up.', 23420), -- Impalement Insurance
(38614, 1, 0, 0, 0, 0, 0, 0, 0, 'Well, the sizing might be a bit big, but I think you can make them work. $B$BThat path doesn\'t look pleasant, so it\'ll help to be prepared.', 23420), -- To Weather the Storm
(38616, 1, 0, 0, 0, 0, 0, 0, 0, 'Good thinking. If the vrykul can use the drake scales for their armor, why not us? $B$BIt shouldn\'t be too tough to work this into something serviceable.', 23420), -- Built to Scale
(38613, 1, 0, 0, 0, 0, 0, 0, 0, 'Those vrykul were so distracted seeing someone flying through their village, they never noticed me slip by. $B$BI hope that didn\'t get you too much unwanted attention.', 23420), -- No Wings Required
(38612, 1, 0, 0, 0, 0, 0, 0, 0, 'Yes, that should do quite nicely.', 23420), -- A Grapple a Day
(38611, 5, 0, 0, 0, 0, 0, 0, 0, 'These vrykul are so boring! Why does Nathanos send me on missions like this? Does he really think the Aegis is here?$B$BI hope you\'ve come to stir up some trouble.', 23420), -- Will of the Thorignir
(38459, 0, 0, 0, 0, 0, 0, 0, 0, 'I\'m sure your head is filled with questions. Answers will come, in time.$B$BI am Havi, and my words are those of the Valarjar - the glorious keepers of the Halls of Valor. $B$BYou will need my help if it is the Aegis you seek. Oh yes, I know your goals outsider. As I know many things...', 23420), -- The Ancient Trials
(38317, 0, 0, 0, 0, 0, 0, 0, 0, 'Finally, I can get back to the action!', 23420), -- Masters of Disguise
(38308, 0, 0, 0, 0, 0, 0, 0, 0, '<Thumbing through the intel, you discover that Knockwhistle wasn\'t the only SI:7 spy in the area.>', 23420), -- Eyes in the Overlook
(38362, 0, 0, 0, 0, 0, 0, 0, 0, 'Look carefully at this head, $p. This is what comes to those who stand against the Forsaken.$B$BFor now, we should begin our search for the Aegis of Agrammar. I will send some scouts out to discern its location. You should start your search as well. $B$BWhat are you waiting for?', 23420), -- A Grim Trophy
(38360, 0, 0, 0, 0, 0, 0, 0, 0, 'So, she escaped after all...', 23420), -- The Windrunner's Fate
(38361, 0, 0, 0, 0, 0, 0, 0, 0, 'They have only begun to pay for their insolence.', 23420), -- Wrath of the Blightcaller
(38332, 0, 0, 0, 0, 0, 0, 0, 0, '<Nathanos narrows his eyes at the wreckage of Sylvanas\' ship.>$B$BShe\'s out there... she has to be.', 23420), -- The Ranger Lord
(38358, 11, 0, 0, 0, 100, 0, 0, 0, 'Wonderful, just put that down anywhere. Careful not to spill it!$B$B<The apothecary snickers.>', 23420), -- Pump it Up
(38357, 0, 0, 0, 0, 0, 0, 0, 0, 'The R.A.S. is nothing if not humane.', 23420); -- Side Effects May Include Mild Undeath

DELETE FROM `quest_greeting` WHERE (`ID`=108072 AND `Type`=0) OR (`ID`=107498 AND `Type`=0) OR (`ID`=97480 AND `Type`=0) OR (`ID`=91531 AND `Type`=0) OR (`ID`=97270 AND `Type`=0) OR (`ID`=93446 AND `Type`=0) OR (`ID`=91249 AND `Type`=0) OR (`ID`=92567 AND `Type`=0) OR (`ID`=243836 AND `Type`=1) OR (`ID`=91158 AND `Type`=0) OR (`ID`=91590 AND `Type`=0);
INSERT INTO `quest_greeting` (`ID`, `Type`, `GreetEmoteType`, `GreetEmoteDelay`, `Greeting`, `VerifiedBuild`) VALUES
(108072, 0, 0, 0, 'What-ho traveller! What brings you to these dusty ruins?', 23420), -- 108072
(107498, 0, 0, 0, 'Caw?', 23420), -- 107498
(97480, 0, 0, 0, 'We face a formidable foe, but we must not let Helya win.', 23420), -- 97480
(91531, 0, 0, 0, 'I\'m sure ye don\'t belong here in Helheim, just like me.  $B$BI just hope Helya agrees with us.', 23420), -- 91531
(97270, 0, 0, 0, 'What have you uncovered in Haustvald, outsider?', 23420), -- 97270
(93446, 0, 0, 0, 'The Mystics have committed an unforgivable heresy here. The Valkyra will not forget this trespass.', 23420), -- 93446
(91249, 0, 0, 0, 'You... $B$BYou are not like the others.', 23420), -- 91249
(92567, 0, 0, 0, 'Good work with the distractions, boss. $B$BThose guards never knew what hit em.', 23420), -- 92567
(243836, 1, 0, 0, 'This cannot be! What kind of gall does this Skovald have to disregard these ancient rites! $B$BThis must not stand!', 23420), -- 243836
(91158, 0, 0, 0, 'The Alliance are still scouring the wreckage. They haven\'t found their quarry yet...', 23420), -- 91158
(91590, 0, 0, 0, 'No use crying over spilled toxic waste.$B$BSeriously, don\'t cry - the fumes can enter your tear ducts and melt your eyes from the inside.$B$BIsn\'t science fun?!', 23420); -- 91590


DELETE FROM `quest_details` WHERE `ID` IN (42483 /*Put It All on Red*/, 39792 /*A Stack of Racks*/, 39786 /*A Stone Cold Gamble*/, 42447 /*Dances With Ravenbears*/, 43341 /*Uniting the Isles*/, 42445 /*Nithogg's Tribute*/, 42446 /*Singed Feathers*/, 42444 /*Plight of the Blackfeather*/, 38882 /*A New Life for Undeath*/, 39155 /*Becoming the Ascendant*/, 38878 /*Shielded Secrets*/, 39154 /*To Skold-Ashil*/, 39385 /*A Gift for Greymane*/, 39153 /*Dreadwake's Dilemma*/, 38873 /*Clear the Deck!*/, 38872 /*The Dark Lady's Bidding*/, 39787 /*Rigging the Wager*/, 39793 /*Only the Finest*/, 39789 /*Eating Into Our Business*/, 38618 /*Above the Winter Moonlight*/, 38617 /*Another Way*/, 38615 /*Impalement Insurance*/, 38616 /*Built to Scale*/, 38614 /*To Weather the Storm*/, 38613 /*No Wings Required*/, 38612 /*A Grapple a Day*/, 38611 /*Will of the Thorignir*/, 38317 /*Masters of Disguise*/, 38308 /*Eyes in the Overlook*/, 38459 /*The Ancient Trials*/, 38362 /*A Grim Trophy*/, 38361 /*Wrath of the Blightcaller*/, 38360 /*The Windrunner's Fate*/, 38357 /*Side Effects May Include Mild Undeath*/, 38358 /*Pump it Up*/, 38332 /*The Ranger Lord*/);
INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`) VALUES
(42483, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Put It All on Red
(39792, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- A Stack of Racks
(39786, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- A Stone Cold Gamble
(42447, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Dances With Ravenbears
(43341, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Uniting the Isles
(42445, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Nithogg's Tribute
(42446, 403, 0, 0, 0, 0, 0, 0, 0, 23420), -- Singed Feathers
(42444, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Plight of the Blackfeather
(38882, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- A New Life for Undeath
(39155, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Becoming the Ascendant
(38878, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Shielded Secrets
(39154, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- To Skold-Ashil
(39385, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- A Gift for Greymane
(39153, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Dreadwake's Dilemma
(38873, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Clear the Deck!
(38872, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- The Dark Lady's Bidding
(39787, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Rigging the Wager
(39793, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Only the Finest
(39789, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Eating Into Our Business
(38618, 1, 0, 0, 0, 0, 0, 0, 0, 23420), -- Above the Winter Moonlight
(38617, 6, 0, 0, 0, 0, 0, 0, 0, 23420), -- Another Way
(38615, 1, 0, 0, 0, 0, 0, 0, 0, 23420), -- Impalement Insurance
(38616, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Built to Scale
(38614, 1, 0, 0, 0, 0, 0, 0, 0, 23420), -- To Weather the Storm
(38613, 1, 0, 0, 0, 0, 0, 0, 0, 23420), -- No Wings Required
(38612, 6, 0, 0, 0, 0, 0, 0, 0, 23420), -- A Grapple a Day
(38611, 1, 0, 0, 0, 0, 0, 0, 0, 23420), -- Will of the Thorignir
(38317, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Masters of Disguise
(38308, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Eyes in the Overlook
(38459, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- The Ancient Trials
(38362, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- A Grim Trophy
(38361, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Wrath of the Blightcaller
(38360, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- The Windrunner's Fate
(38357, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Side Effects May Include Mild Undeath
(38358, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Pump it Up
(38332, 0, 0, 0, 0, 0, 0, 0, 0, 23420); -- The Ranger Lord

DELETE FROM `quest_request_items` WHERE `ID` IN (42483 /*Put It All on Red*/, 42639 /*A Stone of Blood*/, 42635 /*The Mystery of Dreyrgrot*/, 42640 /*The Value of Knowledge*/, 39786 /*A Stone Cold Gamble*/, 39792 /*A Stack of Racks*/, 39793 /*Only the Finest*/, 39787 /*Rigging the Wager*/, 42445 /*Nithogg's Tribute*/, 42446 /*Singed Feathers*/, 39405 /*Stories of Battle*/, 40002 /*A Familiar Fate*/, 39849 /*To Light the Way*/, 39848 /*A Desperate Bargain*/, 38347 /*Stealth by Seaweed*/, 38339 /*A Little Kelp From My Foes*/, 38324 /*Accessories of the Cursed*/, 38817 /*Regal Remains*/, 38808 /*Bjornharta*/, 38810 /*The Dreaming Fungus*/, 38413 /*Wings of Liberty*/, 38614 /*To Weather the Storm*/, 38616 /*Built to Scale*/, 39593 /*The Shattered Watcher*/, 39590 /*Ahead of the Game*/, 39595 /*Blood and Gold*/, 38308 /*Eyes in the Overlook*/, 38362 /*A Grim Trophy*/);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES
(42483, 0, 0, 0, 0, 'Hmm...', 23420), -- Put It All on Red
(42639, 0, 0, 0, 0, 'We will need the amulet\'s protection to proceed.', 23420), -- A Stone of Blood
(42635, 0, 0, 0, 0, 'How goes the hunt for knowledge?', 23420), -- The Mystery of Dreyrgrot
(42640, 0, 0, 0, 0, 'What\'s this?', 23420), -- The Value of Knowledge
(39786, 0, 0, 0, 0, 'Did you take him out?', 23420), -- A Stone Cold Gamble
(39792, 0, 0, 0, 0, 'Aint nothin like some good old meaty musken ribs, eh pal?', 23420), -- A Stack of Racks
(39793, 0, 0, 0, 0, 'Make sure to get the good stuff!', 23420), -- Only the Finest
(39787, 0, 0, 0, 0, 'You got my trophy yet?', 23420), -- Rigging the Wager
(42445, 0, 0, 0, 0, 'Ca-caw?', 23420), -- Nithogg's Tribute
(42446, 0, 0, 0, 0, '', 23420), -- Singed Feathers
(39405, 0, 0, 0, 0, 'This appears to be the last verse.', 23420), -- Stories of Battle
(40002, 0, 0, 0, 0, 'The jailer has... the key...', 23420), -- A Familiar Fate
(39849, 0, 0, 0, 0, 'Were you able to secure the lantern?', 23420), -- To Light the Way
(39848, 0, 0, 0, 0, '<The air hangs silent as you approach.>', 23420), -- A Desperate Bargain
(38347, 0, 0, 0, 0, 'Gods, what is that stench?! $B$BThis disguise had better work!', 23420), -- Stealth by Seaweed
(38339, 0, 0, 0, 0, 'Do ye have enough for a proper disguise?', 23420), -- A Little Kelp From My Foes
(38324, 0, 0, 0, 0, 'Make sure ye\'ve got enough bones before we move on.', 23420), -- Accessories of the Cursed
(38817, 0, 0, 0, 0, 'Were you able to recover her remains?', 23420), -- Regal Remains
(38808, 0, 0, 0, 0, 'How went the hunt, outsider?', 23420), -- Bjornharta
(38810, 0, 0, 0, 0, 'What do you bring?', 23420), -- The Dreaming Fungus
(38413, 0, 0, 0, 0, 'What news do you bring of my brothers and sisters?', 23420), -- Wings of Liberty
(38614, 0, 0, 0, 0, 'Were you able to get all the gear you needed?', 23420), -- To Weather the Storm
(38616, 0, 0, 0, 0, 'What have we here?', 23420), -- Built to Scale
(39593, 0, 0, 0, 0, 'Have you managed to find them all?', 23420), -- The Shattered Watcher
(39590, 0, 0, 0, 0, 'An ironic gift you bring me, challenger.', 23420), -- Ahead of the Game
(39595, 0, 0, 0, 0, 'What is this you bring?$B$BYou honor me, outsider.', 23420), -- Blood and Gold
(38308, 0, 0, 0, 0, '<The gnome spy was guarding a detailed report of the Forsaken forces.>', 23420), -- Eyes in the Overlook
(38362, 0, 0, 0, 0, 'Do you have his head?', 23420); -- A Grim Trophy

DELETE FROM `creature_template_scaling` WHERE `Entry` IN (105387, 105386, 103222, 95755, 94228, 95611, 94227, 107441, 103786, 97250, 91904, 91536, 91158);
INSERT INTO `creature_template_scaling` (`Entry`, `LevelScalingMin`, `LevelScalingMax`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `VerifiedBuild`) VALUES
(105387, 98, 110, 0, 0, 23420),
(105386, 98, 110, 0, 0, 23420),
(103222, 98, 110, 0, 0, 23420),
(95755, 98, 110, 0, 0, 23420),
(94228, 98, 110, 0, 0, 23420),
(95611, 98, 110, 0, 0, 23420),
(94227, 98, 110, 0, 0, 23420),
(107441, 98, 110, 0, 0, 23420),
(103786, 98, 110, 0, 0, 23420),
(97250, 98, 110, 0, 0, 23420),
(91904, 98, 110, 0, 0, 23420),
(91536, 98, 110, 0, 0, 23420),
(91158, 98, 110, 0, 0, 23420);

DELETE FROM `creature_model_info` WHERE `DisplayID`=25202;
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`, `VerifiedBuild`) VALUES
(25202, 0.575, 2.53, 0, 23420);

DELETE FROM `creature_equip_template` WHERE (`CreatureID`=94337 AND `ID`=1) OR (`CreatureID`=109640 AND `ID`=1) OR (`CreatureID`=107926 AND `ID`=2) OR (`CreatureID`=107926 AND `ID`=1) OR (`CreatureID`=92609 AND `ID`=1) OR (`CreatureID`=104290 AND `ID`=1) OR (`CreatureID`=103307 AND `ID`=1) OR (`CreatureID`=103745 AND `ID`=1) OR (`CreatureID`=103729 AND `ID`=1) OR (`CreatureID`=103245 AND `ID`=1) OR (`CreatureID`=95755 AND `ID`=1) OR (`CreatureID`=94228 AND `ID`=1) OR (`CreatureID`=95611 AND `ID`=1) OR (`CreatureID`=94227 AND `ID`=1) OR (`CreatureID`=92803 AND `ID`=1) OR (`CreatureID`=94313 AND `ID`=1) OR (`CreatureID`=95444 AND `ID`=1) OR (`CreatureID`=109635 AND `ID`=1) OR (`CreatureID`=94614 AND `ID`=1) OR (`CreatureID`=93611 AND `ID`=1) OR (`CreatureID`=95052 AND `ID`=1) OR (`CreatureID`=97695 AND `ID`=1) OR (`CreatureID`=93624 AND `ID`=1) OR (`CreatureID`=107675 AND `ID`=1) OR (`CreatureID`=97258 AND `ID`=1) OR (`CreatureID`=92951 AND `ID`=1) OR (`CreatureID`=92568 AND `ID`=1) OR (`CreatureID`=92573 AND `ID`=1) OR (`CreatureID`=92567 AND `ID`=1) OR (`CreatureID`=92566 AND `ID`=2) OR (`CreatureID`=92566 AND `ID`=1) OR (`CreatureID`=92561 AND `ID`=1) OR (`CreatureID`=97250 AND `ID`=1) OR (`CreatureID`=91158 AND `ID`=1) OR (`CreatureID`=91473 AND `ID`=1);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`) VALUES
(94337, 1, 0, 0, 0, 0, 0, 0, 80271, 0, 0), -- Dread-Rider Plaguebringer
(109640, 1, 0, 0, 0, 0, 0, 0, 80271, 0, 0), -- Dread-Rider Plaguebringer
(107926, 2, 0, 0, 0, 120406, 0, 0, 0, 0, 0), -- Hannval the Butcher
(107926, 1, 120406, 0, 0, 120406, 0, 0, 0, 0, 0), -- Hannval the Butcher
(92609, 1, 0, 0, 0, 0, 0, 0, 52052, 0, 0), -- Tracker Jack
(104290, 1, 134848, 0, 0, 134848, 0, 0, 0, 0, 0), -- Captain Grimshanks
(103307, 1, 0, 0, 0, 0, 0, 0, 80271, 0, 0), -- Forsaken Plaguebringer
(103745, 1, 0, 0, 0, 0, 0, 0, 18680, 0, 0), -- Forsaken Dark Ranger
(103729, 1, 0, 0, 0, 0, 0, 0, 25243, 0, 0), -- Forsaken Archer
(103245, 1, 0, 0, 0, 0, 0, 0, 80271, 0, 0), -- Forsaken Befouler
(95755, 1, 0, 0, 0, 0, 0, 0, 42775, 0, 0), -- Lady Sylvanas Windrunner
(94228, 1, 0, 0, 0, 0, 0, 0, 42775, 0, 0), -- Lady Sylvanas Windrunner
(95611, 1, 0, 0, 0, 0, 0, 0, 42775, 0, 0), -- Lady Sylvanas Windrunner
(94227, 1, 0, 0, 0, 0, 0, 0, 42775, 0, 0), -- Lady Sylvanas Windrunner
(92803, 1, 0, 0, 0, 0, 0, 0, 97227, 0, 0), -- Ranger Captain Areiel
(94313, 1, 0, 0, 0, 0, 0, 0, 110599, 0, 0), -- Daniel "Boomer" Vorick
(95444, 1, 46737, 0, 0, 0, 0, 0, 0, 0, 0), -- Genn Greymane
(109635, 1, 0, 0, 0, 0, 0, 0, 110178, 0, 0), -- Greywatch Saboteur
(94614, 1, 0, 0, 0, 0, 0, 0, 110178, 0, 0), -- Greywatch Saboteur
(93611, 1, 0, 0, 0, 0, 0, 0, 97227, 0, 0), -- Dark Ranger
(95052, 1, 0, 0, 0, 0, 0, 0, 80271, 0, 0), -- Dread-Rider Plaguebringer
(97695, 1, 0, 0, 0, 0, 0, 0, 42775, 0, 0), -- Lady Sylvanas Windrunner
(93624, 1, 113362, 0, 0, 0, 0, 0, 0, 0, 0), -- Dread-Rider Cullen
(107675, 1, 0, 0, 0, 0, 0, 0, 110600, 0, 0), -- Rax Sixtrigger
(97258, 1, 0, 0, 0, 0, 0, 0, 108715, 0, 0), -- Ootasa Galehoof
(92951, 1, 0, 0, 0, 0, 0, 0, 56170, 0, 0), -- Houndmaster Ely
(92568, 1, 113362, 0, 0, 0, 0, 0, 0, 0, 0), -- Dread-Rider Cullen
(92573, 1, 113362, 0, 0, 0, 0, 0, 0, 0, 0), -- Dread-Rider Cullen
(92567, 1, 113362, 0, 0, 0, 0, 0, 0, 0, 0), -- Dread-Rider Cullen
(92566, 2, 113362, 0, 0, 0, 0, 0, 112340, 0, 0), -- Dread-Rider Cullen
(92566, 1, 113362, 0, 0, 0, 0, 0, 0, 0, 0), -- Dread-Rider Cullen
(92561, 1, 113362, 0, 0, 0, 0, 0, 0, 0, 0), -- Dread-Rider Cullen
(97250, 1, 52521, 0, 0, 34717, 0, 0, 0, 0, 0), -- Forsaken Bat-Rider
(91158, 1, 65795, 0, 0, 65795, 0, 0, 5258, 0, 0), -- Nathanos Blightcaller
(91473, 1, 113362, 0, 0, 0, 0, 0, 0, 0, 0); -- Dread-Rider Cullen

UPDATE `creature_equip_template` SET `ItemID2`=109042, `ItemID3`=0 WHERE (`CreatureID`=109639 AND `ID`=1); -- Dread-Rider Stalker
UPDATE `creature_equip_template` SET `ItemID2`=52528, `ItemID3`=0 WHERE (`CreatureID`=92611 AND `ID`=1); -- Ambusher Daggerfang
UPDATE `creature_equip_template` SET `ItemID2`=119202, `ItemID3`=0 WHERE (`CreatureID`=92604 AND `ID`=1); -- Champion Elodie
UPDATE `creature_equip_template` SET `ItemID2`=5285, `ItemID3`=0 WHERE (`CreatureID`=92633 AND `ID`=1); -- Assassin Huwe
UPDATE `creature_equip_template` SET `ItemID2`=134848, `ItemID3`=0 WHERE (`CreatureID`=103222 AND `ID`=1); -- Forsaken Shadowblade
UPDATE `creature_equip_template` SET `ItemID2`=109042, `ItemID3`=0 WHERE (`CreatureID`=103218 AND `ID`=1); -- Forsaken Deceiver
UPDATE `creature_equip_template` SET `ItemID2`=52524, `ItemID3`=0 WHERE (`CreatureID`=103210 AND `ID`=1); -- Forsaken Defender
UPDATE `creature_equip_template` SET `ItemID2`=52524, `ItemID3`=0 WHERE (`CreatureID`=103215 AND `ID`=1); -- Forsaken Deathwarder
UPDATE `creature_equip_template` SET `ItemID2`=55170, `ItemID3`=0 WHERE (`CreatureID`=98188 AND `ID`=1); -- Egyl the Enduring
UPDATE `creature_equip_template` SET `ItemID2`=89116, `ItemID3`=0 WHERE (`CreatureID`=92764 AND `ID`=2); -- Valkyra Aspirant
UPDATE `creature_equip_template` SET `ItemID2`=89116, `ItemID3`=0 WHERE (`CreatureID`=94393 AND `ID`=1); -- Statue
UPDATE `creature_equip_template` SET `ItemID2`=61512, `ItemID3`=110180 WHERE (`CreatureID`=93779 AND `ID`=1); -- Commander Lorna Crowley
UPDATE `creature_equip_template` SET `ItemID3`=107953 WHERE (`CreatureID`=109589 AND `ID`=1); -- Royal Dreadguard
UPDATE `creature_equip_template` SET `ItemID2`=89116, `ItemID3`=0 WHERE (`CreatureID`=92764 AND `ID`=1); -- Valkyra Aspirant
UPDATE `creature_equip_template` SET `ItemID2`=109040, `ItemID3`=0 WHERE (`CreatureID`=109633 AND `ID`=1); -- Greywatch Infiltrator
UPDATE `creature_equip_template` SET `ItemID2`=109040, `ItemID3`=0 WHERE (`CreatureID`=93860 AND `ID`=1); -- Greywatch Infiltrator
UPDATE `creature_equip_template` SET `ItemID2`=52524, `ItemID3`=107953 WHERE (`CreatureID`=95787 AND `ID`=1); -- Dreadwake Deathguard
UPDATE `creature_equip_template` SET `ItemID2`=109040, `ItemID3`=0 WHERE (`CreatureID`=94825 AND `ID`=1); -- Greywatch Infiltrator
UPDATE `creature_equip_template` SET `ItemID2`=65795, `ItemID3`=5258 WHERE (`CreatureID`=93603 AND `ID`=1); -- Nathanos Blightcaller
UPDATE `creature_equip_template` SET `ItemID2`=52524, `ItemID3`=107953 WHERE (`CreatureID`=109452 AND `ID`=1); -- Dreadwake Deathguard
UPDATE `creature_equip_template` SET `ItemID3`=107953 WHERE (`CreatureID`=93592 AND `ID`=1); -- Royal Dreadguard
UPDATE `creature_equip_template` SET `ItemID2`=52524, `ItemID3`=107953 WHERE (`CreatureID`=93612 AND `ID`=1); -- Dreadwake Deathguard
UPDATE `creature_equip_template` SET `ItemID2`=109042, `ItemID3`=0 WHERE (`CreatureID`=94338 AND `ID`=1); -- Dread-Rider Stalker
UPDATE `creature_equip_template` SET `ItemID2`=108594, `ItemID3`=0 WHERE (`CreatureID`=97851 AND `ID`=1); -- Felskorn Chosen
UPDATE `creature_equip_template` SET `ItemID2`=77408, `ItemID3`=0 WHERE (`CreatureID`=98953 AND `ID`=1); -- Tideskorn Shieldmaiden
UPDATE `creature_equip_template` SET `ItemID2`=111717, `ItemID3`=110314 WHERE (`CreatureID`=93870 AND `ID`=1); -- Greywatch Guard
UPDATE `creature_equip_template` SET `ItemID2`=52524, `ItemID3`=0 WHERE (`CreatureID`=94413 AND `ID`=1); -- Isel the Hammer
UPDATE `creature_equip_template` SET `ItemID2`=77408, `ItemID3`=0 WHERE (`CreatureID`=97664 AND `ID`=1); -- Ashildir
UPDATE `creature_equip_template` SET `ItemID2`=89116, `ItemID3`=0 WHERE (`CreatureID`=97665 AND `ID`=1); -- Valkyra Guardian
UPDATE `creature_equip_template` SET `ItemID2`=56913, `ItemID3`=0 WHERE (`CreatureID`=97443 AND `ID`=1); -- Unworthy Combatant
UPDATE `creature_equip_template` SET `ItemID1`=128097 WHERE (`CreatureID`=89759 AND `ID`=1); -- Kvaldir Cursewalker
UPDATE `creature_equip_template` SET `ItemID2`=56913, `ItemID3`=0 WHERE (`CreatureID`=97433 AND `ID`=1); -- Unworthy Combatant
UPDATE `creature_equip_template` SET `ItemID2`=34590, `ItemID3`=0 WHERE (`CreatureID`=105687 AND `ID`=1); -- Valkyra Shieldmaiden
UPDATE `creature_equip_template` SET `ItemID2`=34217, `ItemID3`=0 WHERE (`CreatureID`=105680 AND `ID`=1); -- Bonespeaker Drudge
UPDATE `creature_equip_template` SET `ItemID2`=89116, `ItemID3`=0 WHERE (`CreatureID`=97270 AND `ID`=1); -- Shieldmaiden Iounn
UPDATE `creature_equip_template` SET `ItemID2`=89116, `ItemID3`=0 WHERE (`CreatureID`=93446 AND `ID`=1); -- Shieldmaiden Iounn
UPDATE `creature_equip_template` SET `ItemID2`=107703, `ItemID3`=0 WHERE (`CreatureID`=92920 AND `ID`=1); -- Oktel Dragonblood
UPDATE `creature_equip_template` SET `ItemID2`=56174, `ItemID3`=0 WHERE (`CreatureID`=108940 AND `ID`=1); -- Ancient Boneservant
UPDATE `creature_equip_template` SET `ItemID2`=111426, `ItemID3`=0 WHERE (`CreatureID`=107588 AND `ID`=1); -- Blood-Thane Lucard
UPDATE `creature_equip_template` SET `ItemID3`=110315 WHERE (`CreatureID`=108029 AND `ID`=1); -- Plundering Corsair
UPDATE `creature_equip_template` SET `ItemID2`=111586, `ItemID3`=0 WHERE (`CreatureID`=108030 AND `ID`=1); -- Blood-Crazed Swashbuckler
UPDATE `creature_equip_template` SET `ItemID2`=89116, `ItemID3`=0 WHERE (`CreatureID`=93445 AND `ID`=1); -- Valkyra Guardian
UPDATE `creature_equip_template` SET `ItemID2`=124531, `ItemID3`=0 WHERE (`CreatureID`=93401 AND `ID`=1); -- Urgev the Flayer
UPDATE `creature_equip_template` SET `ItemID2`=107112, `ItemID3`=0 WHERE (`CreatureID`=93066 AND `ID`=1); -- Bonespeaker Runeaxe
UPDATE `creature_equip_template` SET `ItemID3`=42484 WHERE (`CreatureID`=107674 AND `ID`=1); -- Snaggle Sixtrigger
UPDATE `creature_equip_template` SET `ItemID2`=49638, `ItemID3`=0 WHERE (`CreatureID`=92381 AND `ID`=1); -- Drekirjar Shieldbearer
UPDATE `creature_equip_template` SET `ItemID3`=112340 WHERE (`CreatureID`=92312 AND `ID`=1); -- Drekirjar Galeborn
UPDATE `creature_equip_template` SET `ItemID3`=40759 WHERE (`CreatureID`=91244 AND `ID`=1); -- Felskorn Trapper
UPDATE `creature_equip_template` SET `ItemID2`=40534, `ItemID3`=112340 WHERE (`CreatureID`=91429 AND `ID`=1); -- Tideskorn Pathfinder
UPDATE `creature_equip_template` SET `ItemID2`=108591, `ItemID3`=0 WHERE (`CreatureID`=91240 AND `ID`=1); -- Gunnlaug Scaleheart
UPDATE `creature_equip_template` SET `ItemID2`=36452, `ItemID3`=0 WHERE (`CreatureID`=108579 AND `ID`=1); -- Runelord Ragnar
UPDATE `creature_equip_template` SET `ItemID3`=108479 WHERE (`CreatureID`=100446 AND `ID`=1); -- Tideskorn Huntress
UPDATE `creature_equip_template` SET `ItemID2`=56913, `ItemID3`=0 WHERE (`CreatureID`=96129 AND `ID`=1); -- Felskorn Raider
UPDATE `creature_equip_template` SET `ItemID2`=56913, `ItemID3`=0 WHERE (`CreatureID`=108306 AND `ID`=1); -- Felskorn Raider
UPDATE `creature_equip_template` SET `ItemID2`=119204, `ItemID3`=0 WHERE (`CreatureID`=91460 AND `ID`=1); -- Spymaster Shwayder
UPDATE `creature_equip_template` SET `ItemID2`=18166, `ItemID3`=15460 WHERE (`CreatureID`=91880 AND `ID`=1); -- Royal Dreadguard
UPDATE `creature_equip_template` SET `ItemID3`=62400 WHERE (`CreatureID`=91414 AND `ID`=1); -- Skyfire Gryphon Rider
UPDATE `creature_equip_template` SET `ItemID3`=62285 WHERE (`CreatureID`=91950 AND `ID`=1); -- Forsaken Ranger
UPDATE `creature_equip_template` SET `ItemID2`=3757, `ItemID3`=0 WHERE (`CreatureID`=91590 AND `ID`=1); -- Apothecary Withers
UPDATE `creature_equip_template` SET `ItemID2`=3276, `ItemID3`=0 WHERE (`CreatureID`=91532 AND `ID`=1); -- Forsaken Deathguard

DELETE FROM `gossip_menu` WHERE (`MenuId`=18657 AND `TextId`=27093);
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES
(18657, 27093, 23420); -- 93624 (Dread-Rider Cullen)

DELETE FROM `gossip_menu_option` WHERE (`MenuId`=18657 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `VerifiedBuild`) VALUES
(18657, 0, 0, 'Take me to Dreadwake\'s Landing.', 97471, 23420);

UPDATE `creature_template` SET `unit_flags`=33536, `unit_flags2`=71305216 WHERE `entry`=107709; -- Goblin Zeppelin
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93371; -- Mordvigbjorn
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=94342; -- Credit  Bunny
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=111682; -- Savage Great White
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=111496; -- Isle Remora Shark
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768 WHERE `entry`=108032; -- Captain Broketooth
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=91984; -- Grapple Point
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108062; -- Citrine Thresher
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=67141632 WHERE `entry`=107917; -- Steelscale
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97809; -- Coastal Seagull
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109639; -- Dread-Rider Stalker
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=94337; -- Dread-Rider Plaguebringer
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=94340; -- Credit  Bunny
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109640; -- Dread-Rider Plaguebringer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109110; -- Tracking Hound
UPDATE `creature_template` SET `minlevel`=108 WHERE `entry`=109559; -- Gilnean Mastiff
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109083; -- Houndmaster Payne
UPDATE `creature_template` SET `faction`=188, `speed_run`=0.8571429, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=768, `unit_flags2`=2048 WHERE `entry`=105391; -- Mini Musken
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `npcflag`=1, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=768, `unit_flags2`=2048 WHERE `entry`=105387; -- Andurs
UPDATE `creature_template` SET `faction`=188, `speed_run`=0.8571429, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=768, `unit_flags2`=2048 WHERE `entry`=105389; -- Baby Bjorn
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `npcflag`=1, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=768, `unit_flags2`=2048 WHERE `entry`=105386; -- Rydyr
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91800; -- Stormwing Whelp
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=16, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32832, `unit_flags2`=2048 WHERE `entry`=107926; -- Hannval the Butcher
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107883; -- Tideskorn Beastbreaker
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32784 WHERE `entry`=107850; -- Highlands Ettin
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=536904448, `unit_flags2`=2049, `dynamicflags`=32 WHERE `entry`=107881; -- Tideskorn Beastbreaker
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=107544; -- Nithogg
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=536904448, `unit_flags2`=2049, `dynamicflags`=32 WHERE `entry`=107519; -- Cukkaw
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107487; -- Starbuck
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97124; -- Spitefeather
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=99224; -- Drakol'nir
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32784 WHERE `entry`=91956; -- Guthrie
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32784 WHERE `entry`=91954; -- Beagan
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92626; -- Deathguard Adams
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92613; -- Priestess Liza
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92609; -- Tracker Jack
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92611; -- Ambusher Daggerfang
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92604; -- Champion Elodie
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92633; -- Assassin Huwe
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=71, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=104290; -- Captain Grimshanks
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103307; -- Forsaken Plaguebringer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103430; -- Festering Abomination
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103222; -- Forsaken Shadowblade
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103431; -- Sninkwind Hulk
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=71, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=8, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=103745; -- Forsaken Dark Ranger
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103729; -- Forsaken Archer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103218; -- Forsaken Deceiver
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103446; -- Forsaken Frostflinger
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103210; -- Forsaken Defender
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103215; -- Forsaken Deathwarder
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103245; -- Forsaken Befouler
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=103453; -- Forsaken Rector
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=111327; -- Hillevi the Scalekeeper
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107499; -- Frightened Ravenbear
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107498; -- Cukkaw
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=106565; -- Blackfeather Gatherer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107469; -- Rampaging Squallhunter
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97516; -- Foothills Greatstag
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=109451; -- Great Eagle
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98188; -- Egyl the Enduring
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98189; -- Unseeing Watcher
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=68, `speed_run`=1, `BaseAttackTime`=1500, `RangeAttackTime`=2000, `unit_class`=2, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=95755; -- Lady Sylvanas Windrunner
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=68, `speed_run`=1, `BaseAttackTime`=1500, `RangeAttackTime`=2000, `unit_class`=2, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=94228; -- Lady Sylvanas Windrunner
UPDATE `creature_template` SET `gossip_menu_id`=18543 WHERE `entry`=94393; -- Statue
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=94477; -- Credit  Bunny
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92751; -- Ivory Sentinel
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=68, `npcflag`=2, `speed_run`=1, `BaseAttackTime`=1500, `RangeAttackTime`=2000, `unit_class`=2, `unit_flags`=32768, `unit_flags2`=34816 WHERE `entry`=95611; -- Lady Sylvanas Windrunner
UPDATE `creature_template` SET `npcflag`=0, `speed_run`=1 WHERE `entry`=93628; -- Eyir
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=94856; -- Priestess of Eyir
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=68, `speed_run`=1, `BaseAttackTime`=1500, `RangeAttackTime`=2000, `unit_class`=2, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=94227; -- Lady Sylvanas Windrunner
UPDATE `creature_template` SET `minlevel`=107, `maxlevel`=107, `faction`=68, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=92803; -- Ranger Captain Areiel
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109458; -- Rowboat to Dreadwake's Landing
UPDATE `creature_template` SET `unit_flags`=32784 WHERE `entry`=109589; -- Royal Dreadguard
UPDATE `creature_template` SET `faction`=190, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=33555200, `unit_flags2`=2099200, `unit_flags3`=1 WHERE `entry`=94593; -- Fire Effect Bunny
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92764; -- Valkyra Aspirant
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=94313; -- Daniel "Boomer" Vorick
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=536904448, `unit_flags2`=2049, `dynamicflags`=32 WHERE `entry`=95073; -- Forsaken Dreadwing
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=92022; -- Grapple Point
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=94006; -- Nashal Bonepicker
UPDATE `creature_template` SET `minlevel`=108, `maxlevel`=108, `faction`=2166, `speed_run`=1, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=33536, `unit_flags2`=2099200 WHERE `entry`=95444; -- Genn Greymane
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107852; -- Stout Highlands Runehorn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=95436; -- Greywatch Cannoneer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109633; -- Greywatch Infiltrator
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109635; -- Greywatch Saboteur
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=94614; -- Greywatch Saboteur
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=128 WHERE `entry`=95212; -- Forsaken Catapult
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93860; -- Greywatch Infiltrator
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109454; -- Rowboat to Skold Ashil
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=95787; -- Dreadwake Deathguard
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=94825; -- Greywatch Infiltrator
UPDATE `creature_template` SET `gossip_menu_id`=18625, `minlevel`=110 WHERE `entry`=93603; -- Nathanos Blightcaller
UPDATE `creature_template` SET `gossip_menu_id`=20270 WHERE `entry`=98106; -- Elliot Theodric
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93608; -- Benjamin Parrish
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93611; -- Dark Ranger
UPDATE `creature_template` SET `gossip_menu_id`=19884, `minlevel`=110 WHERE `entry`=109133; -- Batmaster Claud
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109138; -- Warbat
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109452; -- Dreadwake Deathguard
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109482; -- Captain Dreadwake
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109468; -- Oblivion Crewman
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93612; -- Dreadwake Deathguard
UPDATE `creature_template` SET `minlevel`=110, `speed_run`=1 WHERE `entry`=93584; -- Tideskorn Shieldmaiden
UPDATE `creature_template` SET `minlevel`=112, `maxlevel`=112, `speed_walk`=1.6, `speed_run`=0.7142857, `BaseAttackTime`=1500, `RangeAttackTime`=2000, `unit_flags`=64, `unit_flags2`=67127296, `unit_flags3`=1 WHERE `entry`=116459; -- Barrels o' Fun
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `speed_run`=1, `BaseAttackTime`=1500, `RangeAttackTime`=2000, `unit_flags`=33600, `unit_flags2`=2048 WHERE `entry`=98196; -- Odyn
UPDATE `creature_template` SET `gossip_menu_id`=18852 WHERE `entry`=98190; -- Vethir
UPDATE `creature_template` SET `gossip_menu_id`=18843 WHERE `entry`=97986; -- Vethir
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=94338; -- Dread-Rider Stalker
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=95052; -- Dread-Rider Plaguebringer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=95030; -- Forsaken Dreadwing
UPDATE `creature_template` SET `minlevel`=110, `speed_walk`=0.5, `speed_run`=0.5714286 WHERE `entry`=97944; -- Muorg
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97985; -- Credit - South Portal Destroyed
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98175; -- Hrafsir
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98176; -- Erilar
UPDATE `creature_template` SET `minlevel`=110, `speed_run`=1.285714 WHERE `entry`=110973; -- Worthy Vrykul
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97942; -- Ravathes
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97983; -- Credit - North Portal Destroyed
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107983; -- Stonewrought Guardian
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=113171; -- Felskorn Cleaver
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97859; -- Karuas
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=96080; -- Demonic Gateway
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97984; -- Credit - East Portal Destroyed
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97821; -- Felskorn Oathbinder
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97906; -- Runebound Wretch
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97851; -- Felskorn Chosen
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97822; -- Garzareth
UPDATE `creature_template` SET `minlevel`=110, `HoverHeight`=20 WHERE `entry`=92307; -- God-King Skovald
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97816; -- Felskorn Zealot
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97963; -- Felblood Cup
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=33587456 WHERE `entry`=96284; -- Helheim Champion
UPDATE `creature_template` SET `dynamicflags`=128 WHERE `entry`=105105; -- Storm Brew
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=95620; -- Servant of Skovald
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97825; -- Felskorn Cleaver
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98955; -- Tideskorn Warbear
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98953; -- Tideskorn Shieldmaiden
UPDATE `creature_template` SET `gossip_menu_id`=18828 WHERE `entry`=91743; -- Circle of Binding
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=94413; -- Isel the Hammer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107928; -- Cliffdiver Eagle
UPDATE `creature_template` SET `gossip_menu_id`=0, `npcflag`=0 WHERE `entry`=97664; -- Ashildir
UPDATE `creature_template` SET `unit_flags`=33024 WHERE `entry`=97665; -- Valkyra Guardian
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97484; -- Credit - Fragment of Valor
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97483; -- Credit - Fragment of Might
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97575; -- Chain Effect Bunny
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97357; -- Chain Effect Bunny
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97482; -- Credit - Fragment of Will
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97578; -- Chain Effect Bunny
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97577; -- Chain Effect Bunny
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93005; -- Rotting Jailer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91657; -- Bloodbeard
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97630; -- Soulthirster
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=97480; -- Ashildir
UPDATE `creature_template` SET `minlevel`=110, `faction`=14 WHERE `entry`=97443; -- Unworthy Combatant
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=91424; -- Unworthy Warrior
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=89759; -- Kvaldir Cursewalker
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97487; -- Credit - Helheim Escaped
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97499; -- Helya
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97479; -- Credit - Helya Confronted
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97696; -- Credit - Helya Approached
UPDATE `creature_template` SET `minlevel`=110, `speed_run`=1.142857, `BaseAttackTime`=1333 WHERE `entry`=97433; -- Unworthy Combatant
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93377; -- Kvaldir Mistcaller
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91537; -- Bleakwater Helsquid
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91384; -- Helhound
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=91974; -- Bones of the Defeated
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=160 WHERE `entry`=89819; -- Ashildir's Guard
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97445; -- Deepbrine Horror
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91575; -- Kvaldir Soulflayer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91948; -- Geir
UPDATE `creature_template` SET `dynamicflags`=128 WHERE `entry`=91387; -- Helya
UPDATE `creature_template` SET `npcflag`=16777216 WHERE `entry`=97469; -- Drowning Valkyra
UPDATE `creature_template` SET `unit_flags3`=1, `dynamicflags`=128 WHERE `entry`=91454; -- Helya's Tentacle
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=97408; -- Credit - Colborn Found
UPDATE `creature_template` SET `faction`=2633, `unit_flags`=33024 WHERE `entry`=91818; -- Unworthy Soul
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=97319; -- Ashildir
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91527; -- Dread Falke
UPDATE `creature_template` SET `npcflag`=2, `unit_flags`=33587200 WHERE `entry`=91531; -- Colborn the Unworthy
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=2129936, `unit_flags2`=33556608, `HoverHeight`=1 WHERE `entry`=105687; -- Valkyra Shieldmaiden
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=105680; -- Bonespeaker Drudge
UPDATE `creature_template` SET `gossip_menu_id`=0, `npcflag`=0, `HoverHeight`=1 WHERE `entry`=93428; -- Ashildir
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=33040 WHERE `entry`=93093; -- Runeseer Faljar
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=33587472 WHERE `entry`=97221; -- Empowered Runestone
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97223; -- Empowered Runestone
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=98439; -- Bonespeaker's Ink
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91556; -- God-King Skovald
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98411; -- Bonespeaker Inkbinder
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98412; -- Runeaxe Initiate
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32832 WHERE `entry`=92889; -- Heimir of the Black Fist
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93071; -- Bonespeaker Mystic
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32832 WHERE `entry`=92920; -- Oktel Dragonblood
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32848 WHERE `entry`=108939; -- Bonespeaker Cleaver
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=112257; -- Haustvald Bunny
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32832 WHERE `entry`=92918; -- Rythas the Oracle
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108940; -- Ancient Boneservant
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768, `unit_flags3`=0 WHERE `entry`=93094; -- Restless Ancestor
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768, `unit_flags3`=0 WHERE `entry`=109795; -- Neglected Bones
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107588; -- Blood-Thane Lucard
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=108029; -- Plundering Corsair
UPDATE `creature_template` SET `minlevel`=110, `unit_flags3`=1 WHERE `entry`=108150; -- Drained Corsair
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32784 WHERE `entry`=108030; -- Blood-Crazed Swashbuckler
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107403; -- Nelvek the Ashen
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=93341; -- Credit  Bunny
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=112479; -- Felskorn Oathbinder
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=112481; -- Felskorn Zealot
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=112480; -- Servant of Skovald
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97890; -- Dravax
UPDATE `creature_template` SET `gossip_menu_id`=18531 WHERE `entry`=93977; -- Leyweaver Tellumi
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=108922; -- Target - Runecarver Channel
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108892; -- Runewood Fawn
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=93340; -- Credit  Bunny
UPDATE `creature_template` SET `dynamicflags`=128 WHERE `entry`=93342; -- Runestone
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=93095; -- Voracious Bear
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108856; -- Agitated Stonewarden
UPDATE `creature_template` SET `gossip_menu_id`=18772 WHERE `entry`=93231; -- Vydhar
UPDATE `creature_template` SET `dynamicflags`=128 WHERE `entry`=93182; -- Runestone
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=108890; -- Runewood Greatstag
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=67141632 WHERE `entry`=93344; -- Runebound Stonewarden
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=93185; -- Credit  Bunny
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93070; -- Bonespeaker Carver
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93401; -- Urgev the Flayer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93066; -- Bonespeaker Runeaxe
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108891; -- Runewood Doe
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107401; -- Areg Bloodrune
UPDATE `creature_template` SET `speed_run`=0.9920629 WHERE `entry`=48706; -- Highlands Turkey
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=0.9920629 WHERE `entry`=62821; -- Mystic Birdhat
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=0.9920629 WHERE `entry`=62822; -- Cousin Slowhands
UPDATE `creature_template` SET `npcflag`=16777216 WHERE `entry`=98230; -- Ironhorn Buck
UPDATE `creature_template` SET `gossip_menu_id`=18657 WHERE `entry`=93624; -- Dread-Rider Cullen
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=98161; -- Garhal the Scalekeeper
UPDATE `creature_template` SET `gossip_menu_id`=19781, `minlevel`=110 WHERE `entry`=103797; -- Brulf the Heavy
UPDATE `creature_template` SET `gossip_menu_id`=10181 WHERE `entry`=106904; -- Valdemar Stormseeker
UPDATE `creature_template` SET `gossip_menu_id`=20232, `minlevel`=110 WHERE `entry`=103796; -- Riala the Hearthwatcher
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=110981; -- Fleshripper Helsquid
UPDATE `creature_template` SET `gossip_menu_id`=19809, `unit_flags`=33536 WHERE `entry`=107675; -- Rax Sixtrigger
UPDATE `creature_template` SET `minlevel`=110, `unit_flags3`=1 WHERE `entry`=92962; -- Saboteur Aronson
UPDATE `creature_template` SET `minlevel`=110, `unit_flags3`=1 WHERE `entry`=92967; -- Flavor Stalker
UPDATE `creature_template` SET `speed_run`=0.9920629 WHERE `entry`=97730; -- Black-Footed Fox Kit
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107808; -- Plains Runehorn Calf
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107805; -- Plains Runehorn Bull
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107753; -- Duskpelt Alpha
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92951; -- Houndmaster Ely
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92956; -- Attack Mastiff
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92591; -- Sinker
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92590; -- Hook
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91893; -- Erling the Lightningborn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91895; -- Asger Jarlborn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92392; -- Stormwing Drake
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92381; -- Drekirjar Shieldbearer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92384; -- Tideskorn Worker
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32784 WHERE `entry`=92374; -- Drekirjar Galeborn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92375; -- Stormwing Drake
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92367; -- Tideskorn Longaxe
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92361; -- Felscale Dominator
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92312; -- Drekirjar Galeborn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92362; -- Felscale Subduer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92359; -- Drekirjar Felblade
UPDATE `creature_template` SET `gossip_menu_id`=20106 WHERE `entry`=92218; -- Thrymjaris
UPDATE `creature_template` SET `minlevel`=110, `npcflag`=16777216 WHERE `entry`=91767; -- Vethir
UPDATE `creature_template` SET `gossip_menu_id`=18741 WHERE `entry`=97061; -- Thrymjaris
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97028; -- Aleifir
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=67141696 WHERE `entry`=91803; -- Fathnyr
UPDATE `creature_template` SET `gossip_menu_id`=18693 WHERE `entry`=96465; -- Vethir
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768 WHERE `entry`=91737; -- Azariah
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97143; -- Juvenile Thorignir
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97033; -- Hridmogir
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97032; -- Erilar
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97031; -- Hrafsir
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91759; -- Felskorn Subduer
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=93280; -- Caged Soul
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92128; -- Felskorn Pilferer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=92206; -- Felscale Pilferer
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=91979; -- Grapple Point
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91244; -- Felskorn Trapper
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=91566; -- Felskorn Executioner
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91874; -- Bladesquall
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=91429; -- Tideskorn Pathfinder
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91565; -- Raging Tempest
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=91561; -- Squall Bunny
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=91508; -- Fire Bunny
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91240; -- Gunnlaug Scaleheart
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=98255; -- Credit - Tower Climbed
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=102852; -- Morjirn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=99379; -- Stormcaster Throm
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=110372; -- Stormwing Drake
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91529; -- Glimar Ironfist
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91205; -- Drekirjar Galeborn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91517; -- Stormbreaker Reykir
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=67141632 WHERE `entry`=91486; -- Stormwing Drake
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768 WHERE `entry`=94624; -- Drekirjar Galeborn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108530; -- Drekirjar Galeborn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108579; -- Runelord Ragnar
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=67141632 WHERE `entry`=107965; -- Canyon Rockeater
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=91812; -- POI Target  Bunny
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=108403; -- Scout Grapple Point
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=105216; -- Jann Harnelor
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=100524; -- Untamed Whelp
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91204; -- Tideskorn Longaxe
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91229; -- Bluffwalker Goat
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91423; -- Hillstalker Worg
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108526; -- Tideskorn Worker
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91417; -- Tideskorn Worker
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91202; -- Stormwing Drake
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=100446; -- Tideskorn Huntress
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32784 WHERE `entry`=111291; -- Stonescar River-Thresher
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107914; -- Stonefang
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107954; -- Stoned Vrykul
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107957; -- Stoned Bird
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91920; -- Stormwing Drake
UPDATE `creature_template` SET `minlevel`=110, `speed_run`=1, `unit_flags`=536904448, `unit_flags2`=2049, `dynamicflags`=32 WHERE `entry`=107803; -- Wild Plains Runehorn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97091; -- Duskpelt Snarler
UPDATE `creature_template` SET `gossip_menu_id`=18672 WHERE `entry`=96258; -- Yotnar
UPDATE `creature_template` SET `minlevel`=110, `unit_flags3`=1 WHERE `entry`=96174; -- Lightforged Sentinel
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=272, `unit_flags3`=1 WHERE `entry`=96175; -- Yotnar
UPDATE `creature_template` SET `minlevel`=113, `maxlevel`=113 WHERE `entry`=96282; -- Vault Guardian
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108263; -- Felskorn Warmonger
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=96290; -- Credit - Trial of Might Started
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=96176; -- Titan Console
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768, `unit_flags3`=1 WHERE `entry`=99450; -- Blazesight Oculus
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768 WHERE `entry`=96121; -- Felskorn Torturer
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=96122; -- Titan Console
UPDATE `creature_template` SET `minlevel`=110, `unit_flags3`=1 WHERE `entry`=93151; -- Titan Beam
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=93110; -- Vault Keeper
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=96139; -- Titan Console
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=6491; -- Spirit Healer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=96215; -- Felskorn Runetwister
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107258; -- Juvenile Squallhunter
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=90747; -- Slash Gutspill
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=96283; -- Yotnar
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32848 WHERE `entry`=93166; -- Tiptog the Lost
UPDATE `creature_template` SET `minlevel`=113, `maxlevel`=113 WHERE `entry`=89817; -- Vault Guardian
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107755; -- Amberfall Doe
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107758; -- Amberfall Greatstag
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=96255; -- Credit - Vrykul Champion Missing
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=32768 WHERE `entry`=96135; -- Felskorn Warmonger
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=96129; -- Felskorn Raider
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=90734; -- Gro Rumblehoof
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108306; -- Felskorn Raider
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108309; -- Bloodtotem Flameheart
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=96229; -- Bloodtotem Skirmisher
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=100435; -- Bloodtotem Flameheart
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=110604; -- Credit - Ingredients Added
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97306; -- Muninn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108289; -- Bloodtotem Skirmisher
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108283; -- Mightstone Savage
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=96236; -- Mightstone Savage
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=100433; -- Mightstone Rockcaller
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97755; -- Galecrested Eagle
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108322; -- Ferngrazer Stag
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108313; -- Ferngrazer Doe
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=99223; -- Adult Squallhunter
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107455; -- Squallhunter Whelpling
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108935; -- Highlands Runehorn Calf
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `faction`=7, `speed_run`=1, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=103786; -- Well-Fed Musken
UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=98367; -- Tigrid the Charmer
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=90748; -- Whitewater Tempest
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=107445; -- Apprentice Conjuror
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=106150; -- Felsoul Magus
UPDATE `creature_template` SET `minlevel`=110, `speed_run`=1 WHERE `entry`=108927; -- Gluttonous Raven
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=104865; -- Galius Miremoore
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91460; -- Spymaster Shwayder
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107254; -- Felscale Imp
UPDATE `creature_template` SET `dynamicflags`=32 WHERE `entry`=113911; -- Spymaster Knockwhistle
UPDATE `creature_template` SET `dynamicflags`=32 WHERE `entry`=91470; -- Spymaster Knockwhistle
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91458; -- Vicious Ravenbear
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=108538; -- Highlands Runehorn
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=97305; -- Huginn
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=107840; -- Stormforged Grapple Launcher
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=97828; -- Silvertail Mountain Goat
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=109867; -- Fjara Rockjaw
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=107667; -- Crimson Rockshell
UPDATE `creature_template` SET `minlevel`=110, `faction`=84, `unit_flags`=32768 WHERE `entry`=91571; -- Thane Wildsky
UPDATE `creature_template` SET `npcflag`=16777216 WHERE `entry`=91904; -- Dread-Captain Tattersail
UPDATE `creature_template` SET `unit_flags`=16 WHERE `entry`=88981; -- Ironclaw Scuttler
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=91880; -- Royal Dreadguard
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91581; -- 7th Legion Paratrooper
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91693; -- Black Rose Apothecary
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=91881; -- Skyfire Gryphon
UPDATE `creature_template` SET `minlevel`=110, `dynamicflags`=32 WHERE `entry`=91414; -- Skyfire Gryphon Rider
UPDATE `creature_template` SET `minlevel`=110, `unit_flags3`=1 WHERE `entry`=91950; -- Forsaken Ranger
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=83642; -- Mud Jumper
UPDATE `creature_template` SET `minlevel`=110, `speed_run`=1.385714, `unit_flags`=536904448, `unit_flags2`=2049, `dynamicflags`=32 WHERE `entry`=91824; -- Bluffwalker Goat
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=111206; -- Saberfang Worg
UPDATE `creature_template` SET `gossip_menu_id`=20708, `minlevel`=110 WHERE `entry`=91535; -- Quartermaster Ricard
UPDATE `creature_template` SET `minlevel`=110, `unit_flags3`=1 WHERE `entry`=98143; -- Forsaken Dreadwing
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=110534; -- Provisioner Sheldon
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91590; -- Apothecary Withers
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=96928; -- Black Rose Apothecary
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91825; -- Bay Hunter
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91563; -- Volatile Sailor
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91532; -- Forsaken Deathguard
UPDATE `creature_template` SET `minlevel`=110, `unit_flags`=67141632 WHERE `entry`=91569; -- Volatile Bear
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=110846; -- Cove Raven
UPDATE `creature_template` SET `speed_run`=1.385714 WHERE `entry`=91473; -- Dread-Rider Cullen
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=91885; -- Forsaken Crewman
UPDATE `creature_template` SET `minlevel`=110 WHERE `entry`=89829; -- Highcrag Eagle

DELETE FROM `gameobject_template` WHERE `entry` IN (250852 /*Animal Bones*/, 246665 /*Barricade*/, 253247 /*Bonfire*/);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `RequiredLevel`, `VerifiedBuild`) VALUES
(250852, 5, 16147, 'Animal Bones', '', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Animal Bones
(246665, 5, 19432, 'Barricade', '', '', '', 2.56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- Barricade
(253247, 8, 23396, 'Bonfire', '', '', '', 2.789998, 4, 10, 2066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23420); -- Bonfire

UPDATE `gameobject_template` SET `name`='Baskets', `VerifiedBuild`=23420 WHERE `entry`=250596; -- Baskets
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=250612; -- Snaggle's Note
UPDATE `gameobject_template` SET `name`='Corn', `VerifiedBuild`=23420 WHERE `entry`=250595; -- Corn
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=259756; -- Campfire
UPDATE `gameobject_template` SET `name`='Forsaken Blight Cache', `VerifiedBuild`=23420 WHERE `entry`=243343; -- Forsaken Blight Cache
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253270; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253269; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253264; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253263; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253262; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253261; -- Stool
UPDATE `gameobject_template` SET `name`='Mailbox', `VerifiedBuild`=23420 WHERE `entry`=266464; -- Mailbox
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=259757; -- Campfire
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253268; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253267; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253266; -- Stool
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=258850; -- Ancient Dreyrgrot Tablet
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=250985; -- Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251008; -- Ancient Dreyrgrot Tablet
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=250990; -- Crate of Ancient Relics
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=250987; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=258851; -- Ancient Dreyrgrot Tablet
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=258849; -- Ancient Dreyrgrot Tablet
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251007; -- Crate of Ancient Relics
UPDATE `gameobject_template` SET `name`='Forsaken Blight Cache', `VerifiedBuild`=23420 WHERE `entry`=243339; -- Forsaken Blight Cache
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251772; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=259758; -- Campfire
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253276; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253275; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253274; -- Stool
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251762; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Target', `VerifiedBuild`=23420 WHERE `entry`=250610; -- Target
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251792; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Intact Greatstag Antler', `VerifiedBuild`=23420 WHERE `entry`=250537; -- Intact Greatstag Antler
UPDATE `gameobject_template` SET `name`='Supplies', `VerifiedBuild`=23420 WHERE `entry`=246675; -- Supplies
UPDATE `gameobject_template` SET `name`='Supplies', `VerifiedBuild`=23420 WHERE `entry`=246668; -- Supplies
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=247421; -- Powder Keg
UPDATE `gameobject_template` SET `name`='Supplies', `VerifiedBuild`=23420 WHERE `entry`=246672; -- Supplies
UPDATE `gameobject_template` SET `name`='Banner', `VerifiedBuild`=23420 WHERE `entry`=246667; -- Banner
UPDATE `gameobject_template` SET `name`='Torch', `VerifiedBuild`=23420 WHERE `entry`=246666; -- Torch
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=250536; -- Intact Greatstag Antler
UPDATE `gameobject_template` SET `name`='Feather', `VerifiedBuild`=23420 WHERE `entry`=250538; -- Feather
UPDATE `gameobject_template` SET `castBarCaption`='Placing', `VerifiedBuild`=23420 WHERE `entry`=244457; -- Spitefeather's Rock
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251820; -- Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Retrieving', `Data1`=0, `Data14`=23645, `Data30`=62721, `Data31`=1, `VerifiedBuild`=23420 WHERE `entry`=245171; -- Agnes' Skinning Knife
UPDATE `gameobject_template` SET `name`='Torch', `VerifiedBuild`=23420 WHERE `entry`=243239; -- Torch
UPDATE `gameobject_template` SET `name`='Sylvanas Arrow', `VerifiedBuild`=23420 WHERE `entry`=243035; -- Sylvanas Arrow
UPDATE `gameobject_template` SET `name`='Barrier', `VerifiedBuild`=23420 WHERE `entry`=242572; -- Barrier
UPDATE `gameobject_template` SET `castBarCaption`='Receiving Blessing', `VerifiedBuild`=23420 WHERE `entry`=242995; -- Eyir's Pauldron
UPDATE `gameobject_template` SET `castBarCaption`='Receiving Blessing', `VerifiedBuild`=23420 WHERE `entry`=242994; -- Eyir's Helm
UPDATE `gameobject_template` SET `castBarCaption`='Receiving Blessing', `VerifiedBuild`=23420 WHERE `entry`=242996; -- Eyir's Shield
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251558; -- Engraved Shield
UPDATE `gameobject_template` SET `castBarCaption`='Receiving Blessing', `VerifiedBuild`=23420 WHERE `entry`=242998; -- Eyir's Spear
UPDATE `gameobject_template` SET `castBarCaption`='Activating', `VerifiedBuild`=23420 WHERE `entry`=243574; -- Shieldmaiden Idol
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251560; -- Engraved Shield
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251559; -- Engraved Shield
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=253255; -- Bonfire
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251557; -- Engraved Shield
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=244903; -- Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Gathering', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=244828; -- The Fjarnskaggl Fjormula
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251561; -- Engraved Shield
UPDATE `gameobject_template` SET `castBarCaption`='Activating', `VerifiedBuild`=23420 WHERE `entry`=243571; -- Shieldmaiden Idol
UPDATE `gameobject_template` SET `castBarCaption`='Activating', `VerifiedBuild`=23420 WHERE `entry`=243573; -- Shieldmaiden Idol
UPDATE `gameobject_template` SET `name`='Titan Table', `VerifiedBuild`=23420 WHERE `entry`=243062; -- Titan Table
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=253246; -- Bonfire
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=242673; -- Engraved Shield
UPDATE `gameobject_template` SET `castBarCaption`='Activating', `VerifiedBuild`=23420 WHERE `entry`=243570; -- Shieldmaiden Idol
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251571; -- Ashilvara, Verse 1
UPDATE `gameobject_template` SET `type`=10, `displayId`=8586, `IconName`='questinteract', `castBarCaption`='Planting', `size`=1.5, `Data0`=1691, `Data3`=3000, `Data14`=51667, `Data20`=1, `VerifiedBuild`=23420 WHERE `entry`=243455; -- Plant Explosives
UPDATE `gameobject_template` SET `name`='Gilnean Heavy Explosive', `VerifiedBuild`=23420 WHERE `entry`=243456; -- Gilnean Heavy Explosive
UPDATE `gameobject_template` SET `Data1`=19413, `VerifiedBuild`=23420 WHERE `entry`=243454; -- Gilnean Heavy Explosive
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253582; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253581; -- Stool
UPDATE `gameobject_template` SET `name`='Anvil', `VerifiedBuild`=23420 WHERE `entry`=253574; -- Anvil
UPDATE `gameobject_template` SET `name`='Forge', `VerifiedBuild`=23420 WHERE `entry`=253573; -- Forge
UPDATE `gameobject_template` SET `name`='Mailbox', `VerifiedBuild`=23420 WHERE `entry`=266465; -- Mailbox
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=259759; -- Campfire
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253580; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253579; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253575; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253578; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253576; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253577; -- Stool
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=244904; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=244902; -- Treasure Chest
UPDATE `gameobject_template` SET `name`='Tideskorn Cage', `VerifiedBuild`=23420 WHERE `entry`=248775; -- Tideskorn Cage
UPDATE `gameobject_template` SET `name`='Fel Portal', `VerifiedBuild`=23420 WHERE `entry`=244768; -- Fel Portal
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=244703; -- Nether Circle
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=244729; -- Nether Circle
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=244730; -- Nether Circle
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251714; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Felbound Portal', `VerifiedBuild`=23420 WHERE `entry`=244681; -- Felbound Portal
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=244731; -- Nether Circle
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=244733; -- Nether Circle
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=248601; -- Tideskorn Cage
UPDATE `gameobject_template` SET `name`='Fel Blood Cauldron', `VerifiedBuild`=23420 WHERE `entry`=244696; -- Fel Blood Cauldron
UPDATE `gameobject_template` SET `castBarCaption`='Burning', `VerifiedBuild`=23420 WHERE `entry`=244704; -- Tideskorn Banner
UPDATE `gameobject_template` SET `name`='FelMag_Empowered_AuraFel', `VerifiedBuild`=23420 WHERE `entry`=251285; -- FelMag_Empowered_AuraFel
UPDATE `gameobject_template` SET `name`='FelMag_Empowered_AuraFel', `VerifiedBuild`=23420 WHERE `entry`=251277; -- FelMag_Empowered_AuraFel
UPDATE `gameobject_template` SET `name`='FelMag_Empowered_AuraFel', `VerifiedBuild`=23420 WHERE `entry`=251276; -- FelMag_Empowered_AuraFel
UPDATE `gameobject_template` SET `name`='FelMag_Empowered_AuraFel', `VerifiedBuild`=23420 WHERE `entry`=251275; -- FelMag_Empowered_AuraFel
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251221; -- Floki's Runestone
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251220; -- Ragnar's Runestone
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251219; -- Cage
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251218; -- Rollo's Runestone
UPDATE `gameobject_template` SET `name`='Fish', `VerifiedBuild`=23420 WHERE `entry`=244870; -- Fish
UPDATE `gameobject_template` SET `name`='Fish', `VerifiedBuild`=23420 WHERE `entry`=244869; -- Fish
UPDATE `gameobject_template` SET `name`='Fish', `VerifiedBuild`=23420 WHERE `entry`=244871; -- Fish
UPDATE `gameobject_template` SET `name`='Fishing Rod', `VerifiedBuild`=23420 WHERE `entry`=244868; -- Fishing Rod
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `VerifiedBuild`=23420 WHERE `entry`=244867; -- Fish Barrel
UPDATE `gameobject_template` SET `name`='Nail', `VerifiedBuild`=23420 WHERE `entry`=244483; -- Nail
UPDATE `gameobject_template` SET `castBarCaption`='Burning', `VerifiedBuild`=23420 WHERE `entry`=244565; -- Kvaldir Spoils
UPDATE `gameobject_template` SET `Data3`=18790, `VerifiedBuild`=23420 WHERE `entry`=244559; -- Helya's Altar
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241272; -- Treasure Chest
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=240603; -- Cursed Seaweed
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241267; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241686; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241833; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241832; -- Kvaldir Cage
UPDATE `gameobject_template` SET `castBarCaption`='Gathering', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=240586; -- Cursed Bones
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241783; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241774; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241771; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241688; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=259816; -- Bonfire
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241216; -- Treasure Chest
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=240649; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=259815; -- Bonfire
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241683; -- Kvaldir Cage
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241778; -- Colborn's Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241729; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `VerifiedBuild`=23420 WHERE `entry`=244587; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Bone Pile', `VerifiedBuild`=23420 WHERE `entry`=240604; -- Bone Pile
UPDATE `gameobject_template` SET `name`='Portal to Stormheim', `VerifiedBuild`=23420 WHERE `entry`=241755; -- Portal to Stormheim
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241782; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241779; -- Kvaldir Cage
UPDATE `gameobject_template` SET `name`='Kvaldir Cage', `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241693; -- Kvaldir Cage
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251856; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Portal to Helheim', `VerifiedBuild`=23420 WHERE `entry`=241758; -- Portal to Helheim
UPDATE `gameobject_template` SET `name`='Altar', `VerifiedBuild`=23420 WHERE `entry`=244452; -- Altar
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251723; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=244899; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=251412; -- Ritual Stone
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241872; -- Ashildir's Bones
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=244907; -- Campfire
UPDATE `gameobject_template` SET `castBarCaption`='Activating', `VerifiedBuild`=23420 WHERE `entry`=244450; -- Rune of Reformation
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251854; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=251413; -- Ritual Stone
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241870; -- Ashildir's Bones
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=241840; -- Rune-Carved Tablet
UPDATE `gameobject_template` SET `name`='Altar', `VerifiedBuild`=23420 WHERE `entry`=241839; -- Altar
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=241849; -- Ritual Stone
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241874; -- Ashildir's Bones
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=244901; -- Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241873; -- Ashildir's Bones
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=244779; -- Ancient Vrykul Rune Tablet
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241871; -- Ashildir's Bones
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241518; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Placing', `VerifiedBuild`=23420 WHERE `entry`=241869; -- Offering Bowl
UPDATE `gameobject_template` SET `name`='Tomb Door', `VerifiedBuild`=23420 WHERE `entry`=251522; -- Tomb Door
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251761; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Placing', `VerifiedBuild`=23420 WHERE `entry`=241868; -- Offering Bowl
UPDATE `gameobject_template` SET `castBarCaption`='Placing', `VerifiedBuild`=23420 WHERE `entry`=241864; -- Offering Bowl
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=250984; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Map', `VerifiedBuild`=23420 WHERE `entry`=254021; -- Map
UPDATE `gameobject_template` SET `castBarCaption`='Placing', `VerifiedBuild`=23420 WHERE `entry`=241877; -- Offering Bowl
UPDATE `gameobject_template` SET `name`='Slab', `VerifiedBuild`=23420 WHERE `entry`=241863; -- Slab
UPDATE `gameobject_template` SET `name`='Torch', `VerifiedBuild`=23420 WHERE `entry`=241862; -- Torch
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=241838; -- Disturbed Earth
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=253244; -- Bonfire
UPDATE `gameobject_template` SET `name`='Runestone', `VerifiedBuild`=23420 WHERE `entry`=241765; -- Runestone
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251713; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=233107; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=253252; -- Bonfire
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241866; -- Soulthorn
UPDATE `gameobject_template` SET `name`='Runestone Base', `VerifiedBuild`=23420 WHERE `entry`=241763; -- Runestone Base
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=244708; -- Watcher's Journal
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251431; -- Empowered Runestones
UPDATE `gameobject_template` SET `name`='Cleaver', `VerifiedBuild`=23420 WHERE `entry`=244866; -- Cleaver
UPDATE `gameobject_template` SET `name`='Bones', `VerifiedBuild`=23420 WHERE `entry`=244865; -- Bones
UPDATE `gameobject_template` SET `name`='Meat Chunk', `VerifiedBuild`=23420 WHERE `entry`=244864; -- Meat Chunk
UPDATE `gameobject_template` SET `name`='Meat Chunk', `VerifiedBuild`=23420 WHERE `entry`=244863; -- Meat Chunk
UPDATE `gameobject_template` SET `name`='Meat Chunk', `VerifiedBuild`=23420 WHERE `entry`=244862; -- Meat Chunk
UPDATE `gameobject_template` SET `name`='Meat Chunk', `VerifiedBuild`=23420 WHERE `entry`=244861; -- Meat Chunk
UPDATE `gameobject_template` SET `name`='Spear', `VerifiedBuild`=23420 WHERE `entry`=244860; -- Spear
UPDATE `gameobject_template` SET `name`='Mailbox', `VerifiedBuild`=23420 WHERE `entry`=266466; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=266054; -- Keg of Grog
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=244872; -- Spear
UPDATE `gameobject_template` SET `name`='Spit Post', `VerifiedBuild`=23420 WHERE `entry`=244859; -- Spit Post
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=253250; -- Campfire
UPDATE `gameobject_template` SET `name`='Zeppelin', `VerifiedBuild`=23420 WHERE `entry`=250554; -- Zeppelin
UPDATE `gameobject_template` SET `name`='Baskets', `VerifiedBuild`=23420 WHERE `entry`=250564; -- Baskets
UPDATE `gameobject_template` SET `name`='Bedroll', `VerifiedBuild`=23420 WHERE `entry`=250574; -- Bedroll
UPDATE `gameobject_template` SET `name`='Corn', `VerifiedBuild`=23420 WHERE `entry`=250565; -- Corn
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=257312; -- Campfire
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=257311; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=257310; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=248571; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=248570; -- Stool
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=248569; -- Campfire
UPDATE `gameobject_template` SET `name`='Baskets', `VerifiedBuild`=23420 WHERE `entry`=250573; -- Baskets
UPDATE `gameobject_template` SET `name`='Spear', `VerifiedBuild`=23420 WHERE `entry`=250570; -- Spear
UPDATE `gameobject_template` SET `name`='Weapon Rack', `VerifiedBuild`=23420 WHERE `entry`=250569; -- Weapon Rack
UPDATE `gameobject_template` SET `name`='Bow', `VerifiedBuild`=23420 WHERE `entry`=250567; -- Bow
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=259753; -- Campfire
UPDATE `gameobject_template` SET `name`='Sled', `VerifiedBuild`=23420 WHERE `entry`=250571; -- Sled
UPDATE `gameobject_template` SET `name`='Hides', `VerifiedBuild`=23420 WHERE `entry`=250566; -- Hides
UPDATE `gameobject_template` SET `name`='Baskets', `VerifiedBuild`=23420 WHERE `entry`=250563; -- Baskets
UPDATE `gameobject_template` SET `name`='Baskets', `VerifiedBuild`=23420 WHERE `entry`=250561; -- Baskets
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241154; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=240650; -- Ritual Circle
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251173; -- Forbidden Tome
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=244337; -- Ritual Circle
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241152; -- Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251780; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=244336; -- Ritual Circle
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `VerifiedBuild`=23420 WHERE `entry`=241279; -- Intact Thorignir Egg
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=244335; -- Ritual Circle
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241148; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Cauldron', `VerifiedBuild`=23420 WHERE `entry`=246870; -- Cauldron
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=245671; -- Whelp Cage
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=245669; -- Whelp Cage
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241207; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=253253; -- Bonfire
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241147; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Wood Pile', `VerifiedBuild`=23420 WHERE `entry`=245622; -- Wood Pile
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241460; -- Climbing Treads
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=245668; -- Whelp Cage
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=245667; -- Whelp Cage
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=241429; -- Dragon-Blood Brew
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241146; -- Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Gathering', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=244829; -- The Tangled Beard
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=253257; -- Bonfire
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=245670; -- Whelp Cage
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=245672; -- Whelp Cage
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241462; -- Oiled Cloak
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=240365; -- Tethering Post
UPDATE `gameobject_template` SET `castBarCaption`='Dismantling', `VerifiedBuild`=23420 WHERE `entry`=251257; -- Tideskorn Harpoon Launcher
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=246924; -- Blazing Storm Mead
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=246922; -- Weak Storm Mead
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241149; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=259754; -- Campfire
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=246925; -- Sour Storm Mead
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241564; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241665; -- Treasure Chest
UPDATE `gameobject_template` SET `Data1`=64266, `VerifiedBuild`=23420 WHERE `entry`=246491; -- Fever of Stormrays
UPDATE `gameobject_template` SET `castBarCaption`='Accessing Record', `VerifiedBuild`=23420 WHERE `entry`=243802; -- Powered Console
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241153; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=243822; -- Yotnar's Right Foot
UPDATE `gameobject_template` SET `castBarCaption`='Accessing Record', `VerifiedBuild`=23420 WHERE `entry`=243817; -- Powered Console
UPDATE `gameobject_template` SET `castBarCaption`='Accessing Record', `VerifiedBuild`=23420 WHERE `entry`=243801; -- Powered Console
UPDATE `gameobject_template` SET `castBarCaption`='Activating', `VerifiedBuild`=23420 WHERE `entry`=243808; -- Unpowered Console
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251189; -- Plate of Leftovers
UPDATE `gameobject_template` SET `name`='Defender Statue', `VerifiedBuild`=23420 WHERE `entry`=241702; -- Defender Statue
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `VerifiedBuild`=23420 WHERE `entry`=241721; -- Glimmering Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Activating', `VerifiedBuild`=23420 WHERE `entry`=243814; -- Unpowered Console
UPDATE `gameobject_template` SET `name`='Titan Defense Device', `VerifiedBuild`=23420 WHERE `entry`=242444; -- Titan Defense Device
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=243820; -- Yotnar's Right Arm
UPDATE `gameobject_template` SET `name`='Yotnar\'s  Left Foot', `castBarCaption`='Collecting', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=243823; -- Yotnar's  Left Foot
UPDATE `gameobject_template` SET `name`='Hologram Projector', `VerifiedBuild`=23420 WHERE `entry`=243818; -- Hologram Projector
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `Data1`=0, `Data14`=19676, `Data30`=61884, `VerifiedBuild`=23420 WHERE `entry`=243819; -- Yotnar's Left Arm
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=243836; -- Yotnar's Head
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=243845; -- Demonic Runestone
UPDATE `gameobject_template` SET `name`='Waygate', `VerifiedBuild`=23420 WHERE `entry`=241705; -- Waygate
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251782; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Yotnar\'s Body', `VerifiedBuild`=23420 WHERE `entry`=243835; -- Yotnar's Body
UPDATE `gameobject_template` SET `name`='Bonfire', `VerifiedBuild`=23420 WHERE `entry`=253242; -- Bonfire
UPDATE `gameobject_template` SET `castBarCaption`='Burning', `VerifiedBuild`=23420 WHERE `entry`=243842; -- Tideskorn Banner
UPDATE `gameobject_template` SET `name`='Vrykul Crate', `VerifiedBuild`=23420 WHERE `entry`=243830; -- Vrykul Crate
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=253237; -- Campfire
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241206; -- Small Treasure Chest
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=253238; -- Campfire
UPDATE `gameobject_template` SET `castBarCaption`='Burning', `VerifiedBuild`=23420 WHERE `entry`=243841; -- Bloodtotem Standard
UPDATE `gameobject_template` SET `name`='Vrykul Crate', `VerifiedBuild`=23420 WHERE `entry`=251876; -- Vrykul Crate
UPDATE `gameobject_template` SET `name`='Rock', `VerifiedBuild`=23420 WHERE `entry`=251101; -- Rock
UPDATE `gameobject_template` SET `name`='Veggie', `VerifiedBuild`=23420 WHERE `entry`=252075; -- Veggie
UPDATE `gameobject_template` SET `castBarCaption`='Grabbing', `VerifiedBuild`=23420 WHERE `entry`=252074; -- Basket of Root Vegetables
UPDATE `gameobject_template` SET `name`='Pot of Stew', `VerifiedBuild`=23420 WHERE `entry`=244480; -- Pot of Stew
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=253235; -- Campfire
UPDATE `gameobject_template` SET `castBarCaption`='Grabbing', `VerifiedBuild`=23420 WHERE `entry`=252080; -- Hearty Vrykul Grains
UPDATE `gameobject_template` SET `name`='Bowl', `VerifiedBuild`=23420 WHERE `entry`=252079; -- Bowl
UPDATE `gameobject_template` SET `name`='Crab', `VerifiedBuild`=23420 WHERE `entry`=252078; -- Crab
UPDATE `gameobject_template` SET `name`='Barrel', `VerifiedBuild`=23420 WHERE `entry`=252077; -- Barrel
UPDATE `gameobject_template` SET `castBarCaption`='Grabbing', `VerifiedBuild`=23420 WHERE `entry`=252076; -- Barrel of Crabs
UPDATE `gameobject_template` SET `name`='Sack', `VerifiedBuild`=23420 WHERE `entry`=250572; -- Sack
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=251188; -- Wicked-Looking Spear
UPDATE `gameobject_template` SET `castBarCaption`='Burning', `VerifiedBuild`=23420 WHERE `entry`=243840; -- Mightstone Banner
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251776; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Collecting', `VerifiedBuild`=23420 WHERE `entry`=250424; -- Loose Rock
UPDATE `gameobject_template` SET `castBarCaption`='Breaking', `VerifiedBuild`=23420 WHERE `entry`=250427; -- Squallhunter Egg
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251716; -- Glimmering Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Taking', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=249890; -- Tigrid's Arkhana
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241558; -- Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Broadcasting Signal', `VerifiedBuild`=23420 WHERE `entry`=240235; -- Skyfire Propeller
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241562; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=251764; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241212; -- Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241180; -- Treasure Chest
UPDATE `gameobject_template` SET `name`='Broken Cloaking Device', `VerifiedBuild`=23420 WHERE `entry`=241109; -- Broken Cloaking Device
UPDATE `gameobject_template` SET `name`='Skeleton', `VerifiedBuild`=23420 WHERE `entry`=241035; -- Skeleton
UPDATE `gameobject_template` SET `name`='Acid Burn', `VerifiedBuild`=23420 WHERE `entry`=241033; -- Acid Burn
UPDATE `gameobject_template` SET `castBarCaption`='Examining', `VerifiedBuild`=23420 WHERE `entry`=241032; -- Plague-Tipped Arrow
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=256928; -- Campfire
UPDATE `gameobject_template` SET `castBarCaption`='Opening', `Data1`=0, `VerifiedBuild`=23420 WHERE `entry`=241213; -- Small Treasure Chest
UPDATE `gameobject_template` SET `castBarCaption`='Examining', `VerifiedBuild`=23420 WHERE `entry`=241031; -- Dread-Captain's Saber
UPDATE `gameobject_template` SET `name`='Campfire', `VerifiedBuild`=23420 WHERE `entry`=256929; -- Campfire
UPDATE `gameobject_template` SET `VerifiedBuild`=23420 WHERE `entry`=244453; -- Cullen's Scouting Report
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253241; -- Stool
UPDATE `gameobject_template` SET `name`='Anvil', `VerifiedBuild`=23420 WHERE `entry`=253239; -- Anvil
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253236; -- Stool
UPDATE `gameobject_template` SET `name`='Stool', `VerifiedBuild`=23420 WHERE `entry`=253240; -- Stool
UPDATE `gameobject_template` SET `name`='Worgen Plank', `VerifiedBuild`=23420 WHERE `entry`=240981; -- Worgen Plank
UPDATE `gameobject_template` SET `name`='Worgen Plank', `VerifiedBuild`=23420 WHERE `entry`=240980; -- Worgen Plank
