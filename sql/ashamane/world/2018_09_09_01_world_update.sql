DELETE FROM pool_template WHERE entry=350;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(350, 1, "Fishing daily quest pool Stormwind");

DELETE FROM pool_quest WHERE pool_entry = 350 OR entry IN (26414, 26420, 26442, 26488, 26536);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(26414, 350, "Hitting a Walleye"),
(26420, 350, "Diggin' For Worms"),
(26442, 350, "Rock Lobster"),
(26488, 350, "Big Gulp"),
(26536, 350, "Thunder Falls");

UPDATE pool_template SET description="Fishing daily quest pool Orgrimmar" WHERE entry=347;
UPDATE pool_template SET description="Fishing daily quest pool Thunderbluff" WHERE entry=346;

DELETE FROM pool_template WHERE entry=351;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(351, 1, "Cooking daily quest pool Stormwind");

DELETE FROM pool_quest WHERE pool_entry = 351 OR entry IN (26153, 26177, 26183, 26190, 26192);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(26153, 351, "Penny's Pumpkin Pancakes"),
(26177, 351, "Feeling Crabby?"),
(26183, 351, "Rock Lobster"),
(26190, 351, "A Fisherman's Feast"),
(26192, 351, "Orphans Like Cookies Too!");

DELETE FROM pool_template WHERE entry=352;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(352, 1, "Cooking daily quest pool Ironforge");

DELETE FROM pool_quest WHERE pool_entry = 352 OR entry IN (29351, 29352, 29353, 29355, 29356);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(29351, 352, "A Round for the Guards"),
(29352, 352, "A Fowl Shortage"),
(29353, 352, "Keepin' the Haggis Flowin'"),
(29355, 352, "Can't Get Enough Spice Bread"),
(29356, 352, "I Need to Cask a Favor");

DELETE FROM pool_template WHERE entry=353;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(353, 1, "Fishing daily quest pool Ironforge");

DELETE FROM pool_quest WHERE pool_entry = 353 OR entry IN (29342, 29343, 29344, 29347, 29350);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(29342, 353, "Cold Water Fishing"),
(29343, 353, "One fer the Ages"),
(29344, 353, "Fish fer Squrky"),
(29347, 353, "Live Bait"),
(29350, 353, "The Gnomish Bait-o-Matic");

DELETE FROM pool_template WHERE entry=354;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(354, 1, "Cooking daily quest pool Thunderbluff");

DELETE FROM pool_quest WHERE pool_entry = 354 OR entry IN (29358, 29362, 29363, 29364, 29365);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(29358, 354, "Pining for Nuts"),
(29362, 354, "'Magic' Mushrooms"),
(29363, 354, "Mulgore Spice Bread"),
(29364, 354, "Corn Mash"),
(29365, 354, "Perfectly Picked Portions");

DELETE FROM pool_template WHERE entry=355;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(355, 1, "Cooking daily quest pool Undercity");

DELETE FROM pool_quest WHERE pool_entry = 355 OR entry IN (29315, 29332, 29333, 29334, 29360);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(29315, 355, "Fungus Among Us"),
(29332, 355, "Lily, Oh Lily"),
(29333, 355, "Escargot A Go-Go"),
(29334, 355, "Roach Coach"),
(29360, 355, "Would You Like Some Flies With That?");

DELETE FROM pool_template WHERE entry=356;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(356, 1, "Fishing daily quest pool Undercity");

DELETE FROM pool_quest WHERE pool_entry = 356 OR entry IN (29317, 29319, 29320, 29322, 29361);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(29317, 356, "Fish Head"),
(29319, 356, "Tadpole Terror"),
(29320, 356, "Like Pike?"),
(29322, 356, "Time for Slime"),
(29361, 356, "Moat Monster!");

DELETE FROM pool_template WHERE entry=357;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(357, 1, "Cooking daily quest pool Darnassus");

DELETE FROM pool_quest WHERE pool_entry = 357 OR entry IN (29313, 29314, 29316, 29318, 29357);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(29313, 357, "The Secret to Perfect Kimchi"),
(29314, 357, "Remembering the Ancestors"),
(29316, 357, "Back to Basics"),
(29318, 357, "Ribs for the Sentinels"),
(29357, 357, "Spice Bread Aplenty");

DELETE FROM pool_template WHERE entry=358;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(358, 1, "Fishing daily quest pool Darnassus");

DELETE FROM pool_quest WHERE pool_entry = 358 OR entry IN (29321, 29323, 29324, 29325, 29359);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(29321, 358, "Happy as a Clam Digger"),
(29323, 358, "Stocking Up"),
(29324, 358, "The Sister's Pendant"),
(29325, 358, "A Slippery Snack"),
(29359, 358, "An Old Favorite");

DELETE FROM pool_template WHERE entry=359;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(359, 1, "Cooking daily quest pool Shattrath");

DELETE FROM pool_quest WHERE pool_entry = 359 OR entry IN (11377, 11379, 11380, 11381);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(11377, 359, "Revenge is Tasty"),
(11379, 359, "Super Hot Stew"),
(11380, 359, "Manalicious"),
(11381, 359, "Soup for the Soul");

DELETE FROM pool_template WHERE entry=360;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(360, 1, "Fishing daily quest pool Shattrath");

DELETE FROM pool_quest WHERE pool_entry = 360 OR entry IN (11665, 11666, 11667, 11668, 11669);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(11665, 360, "Crocolisks in the City"),
(11666, 360, "Bait Bandits"),
(11667, 360, "The One That Got Away"),
(11668, 360, "Shrimpin' Ain't Easy"),
(11669, 360, "Felblood Fillet");

DELETE FROM pool_template WHERE entry=361;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(361, 1, "Fishing daily quest pool Dalaran");

DELETE FROM pool_quest WHERE pool_entry = 361 OR entry IN (13830, 13832, 13833, 13834, 13836);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(13830, 361, "The Ghostfish"),
(13832, 361, "Jewel Of The Sewers"),
(13833, 361, "Blood Is Thicker"),
(13834, 361, "Dangerously Delicious"),
(13836, 361, "Disarmed!");

DELETE FROM pool_template WHERE entry=362;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(362, 1, "Cooking daily quest pool Dalaran");

DELETE FROM pool_quest WHERE pool_entry = 362 OR entry IN (13100, 13101, 13102, 13103, 13107);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(13100, 362, "Infused Mushroom Meatloaf"),
(13101, 362, "Convention at the Legerdemain"),
(13102, 362, "Sewer Stew"),
(13103, 362, "Cheese for Glowergold"),
(13107, 362, "Mustard Dogs!");

DELETE FROM pool_template WHERE entry=363;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(363, 1, "Jewelry daily quest pool Dalaran");

DELETE FROM pool_quest WHERE pool_entry = 363 OR entry IN (12958, 12959, 12960, 12961, 12962, 12963);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(12958, 363, "Shipment: Blood Jade Amulet"),
(12959, 363, "Shipment: Glowing Ivory Figurine"),
(12960, 363, "Shipment: Wicked Sun Brooch"),
(12961, 363, "Shipment: Intricate Bone Figurine"),
(12962, 363, "Shipment: Bright Armor Relic"),
(12963, 363, "Shipment: Shifting Sun Curio");

DELETE FROM pool_template WHERE entry=364;
INSERT INTO pool_template (entry, max_limit,description) VALUES
(364, 1, "Cooking daily quest pool Pandaria");

DELETE FROM pool_quest WHERE pool_entry = 364 OR entry IN (31332, 31333, 31334, 31335, 31336, 31337);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(31332, 364, "Lesson 1: Sliced Peaches"),
(31333, 364, "Lesson 2: Instant Noodles"),
(31334, 364, "Lesson 3: Toasted Fish Jerky"),
(31335, 364, "Lesson 4: Dried Needle Mushrooms"),
(31336, 364, "Lesson 5: Pounded Rice Cake"),
(31337, 364, "A Token of Appreciation");

DELETE FROM creature WHERE guid=98952;