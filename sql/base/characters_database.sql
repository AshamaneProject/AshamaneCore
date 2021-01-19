/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE TABLE IF NOT EXISTS `account_data` (
  `accountId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`accountId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `account_data`;
/*!40000 ALTER TABLE `account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_data` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `account_instance_times` (
  `accountId` int unsigned NOT NULL,
  `instanceId` int unsigned NOT NULL DEFAULT '0',
  `releaseTime` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `account_instance_times`;
/*!40000 ALTER TABLE `account_instance_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_instance_times` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `account_tutorial` (
  `accountId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `tut0` int unsigned NOT NULL DEFAULT '0',
  `tut1` int unsigned NOT NULL DEFAULT '0',
  `tut2` int unsigned NOT NULL DEFAULT '0',
  `tut3` int unsigned NOT NULL DEFAULT '0',
  `tut4` int unsigned NOT NULL DEFAULT '0',
  `tut5` int unsigned NOT NULL DEFAULT '0',
  `tut6` int unsigned NOT NULL DEFAULT '0',
  `tut7` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `account_tutorial`;
/*!40000 ALTER TABLE `account_tutorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_tutorial` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `arena_team` (
  `arenaTeamId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL,
  `captainGuid` bigint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` smallint unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint unsigned NOT NULL DEFAULT '0',
  `rank` int unsigned NOT NULL DEFAULT '0',
  `backgroundColor` int unsigned NOT NULL DEFAULT '0',
  `emblemStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `emblemColor` int unsigned NOT NULL DEFAULT '0',
  `borderStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `borderColor` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `arena_team`;
/*!40000 ALTER TABLE `arena_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `arena_team_member` (
  `arenaTeamId` int unsigned NOT NULL DEFAULT '0',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint unsigned NOT NULL DEFAULT '0',
  `personalRating` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `arena_team_member`;
/*!40000 ALTER TABLE `arena_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team_member` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `auctionhouse` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `auctionHouseId` int unsigned NOT NULL DEFAULT '0',
  `owner` bigint unsigned NOT NULL DEFAULT '0',
  `bidder` bigint unsigned NOT NULL DEFAULT '0',
  `minBid` bigint unsigned NOT NULL DEFAULT '0',
  `buyoutOrUnitPrice` bigint unsigned NOT NULL DEFAULT '0',
  `deposit` bigint unsigned NOT NULL DEFAULT '0',
  `bidAmount` bigint unsigned NOT NULL DEFAULT '0',
  `startTime` int unsigned NOT NULL DEFAULT '0',
  `endTime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `auctionhouse`;
/*!40000 ALTER TABLE `auctionhouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctionhouse` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `auction_bidders` (
  `auctionId` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  PRIMARY KEY (`auctionId`,`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `auction_bidders`;
/*!40000 ALTER TABLE `auction_bidders` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_bidders` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `auction_items` (
  `auctionId` int unsigned NOT NULL,
  `itemGuid` bigint unsigned NOT NULL,
  PRIMARY KEY (`auctionId`,`itemGuid`),
  UNIQUE KEY `idx_itemGuid` (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `auction_items`;
/*!40000 ALTER TABLE `auction_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_items` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `blackmarket_auctions` (
  `marketId` int NOT NULL DEFAULT '0',
  `currentBid` bigint unsigned NOT NULL DEFAULT '0',
  `time` int NOT NULL DEFAULT '0',
  `numBids` int NOT NULL DEFAULT '0',
  `bidder` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`marketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `blackmarket_auctions`;
/*!40000 ALTER TABLE `blackmarket_auctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackmarket_auctions` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `bugreport` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Debug System';

DELETE FROM `bugreport`;
/*!40000 ALTER TABLE `bugreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugreport` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `calendar_events` (
  `EventID` bigint unsigned NOT NULL DEFAULT '0',
  `Owner` bigint unsigned NOT NULL DEFAULT '0',
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `EventType` tinyint unsigned NOT NULL DEFAULT '4',
  `TextureID` int NOT NULL DEFAULT '-1',
  `Date` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `LockDate` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `calendar_events`;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `calendar_invites` (
  `InviteID` bigint unsigned NOT NULL DEFAULT '0',
  `EventID` bigint unsigned NOT NULL DEFAULT '0',
  `Invitee` bigint unsigned NOT NULL DEFAULT '0',
  `Sender` bigint unsigned NOT NULL DEFAULT '0',
  `Status` tinyint unsigned NOT NULL DEFAULT '0',
  `ResponseTime` int unsigned NOT NULL DEFAULT '0',
  `ModerationRank` tinyint unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`InviteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `calendar_invites`;
/*!40000 ALTER TABLE `calendar_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_invites` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `channels` (
  `name` varchar(128) NOT NULL,
  `team` int unsigned NOT NULL,
  `announce` tinyint unsigned NOT NULL DEFAULT '1',
  `ownership` tinyint unsigned NOT NULL DEFAULT '1',
  `password` varchar(32) DEFAULT NULL,
  `bannedList` text,
  `lastUsed` int unsigned NOT NULL,
  PRIMARY KEY (`name`,`team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Channel System';

DELETE FROM `channels`;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `characters` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `xp` int unsigned NOT NULL DEFAULT '0',
  `money` bigint unsigned NOT NULL DEFAULT '0',
  `inventorySlots` tinyint unsigned NOT NULL DEFAULT '16',
  `bankSlots` tinyint unsigned NOT NULL DEFAULT '0',
  `restState` tinyint unsigned NOT NULL DEFAULT '0',
  `playerFlags` int unsigned NOT NULL DEFAULT '0',
  `playerFlagsEx` int unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `instance_id` int unsigned NOT NULL DEFAULT '0',
  `dungeonDifficulty` tinyint unsigned NOT NULL DEFAULT '1',
  `raidDifficulty` tinyint unsigned NOT NULL DEFAULT '14',
  `legacyRaidDifficulty` tinyint unsigned NOT NULL DEFAULT '3',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` text NOT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint unsigned NOT NULL DEFAULT '0',
  `totaltime` int unsigned NOT NULL DEFAULT '0',
  `leveltime` int unsigned NOT NULL DEFAULT '0',
  `logout_time` int unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int unsigned NOT NULL DEFAULT '0',
  `resettalents_time` int unsigned NOT NULL DEFAULT '0',
  `numRespecs` tinyint unsigned NOT NULL DEFAULT '0',
  `primarySpecialization` int unsigned NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` bigint unsigned NOT NULL DEFAULT '0',
  `extra_flags` smallint unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint unsigned NOT NULL DEFAULT '0',
  `at_login` smallint unsigned NOT NULL DEFAULT '0',
  `zone` smallint unsigned NOT NULL DEFAULT '0',
  `death_expire_time` int unsigned NOT NULL DEFAULT '0',
  `taxi_path` text,
  `totalKills` int unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int unsigned NOT NULL DEFAULT '0',
  `drunk` tinyint unsigned NOT NULL DEFAULT '0',
  `health` int unsigned NOT NULL DEFAULT '0',
  `power1` int unsigned NOT NULL DEFAULT '0',
  `power2` int unsigned NOT NULL DEFAULT '0',
  `power3` int unsigned NOT NULL DEFAULT '0',
  `power4` int unsigned NOT NULL DEFAULT '0',
  `power5` int unsigned NOT NULL DEFAULT '0',
  `power6` int unsigned NOT NULL DEFAULT '0',
  `latency` mediumint unsigned NOT NULL DEFAULT '0',
  `activeTalentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `lootSpecId` int unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext,
  `equipmentCache` longtext,
  `knownTitles` longtext,
  `actionBars` tinyint unsigned NOT NULL DEFAULT '0',
  `deleteInfos_Account` int unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` int unsigned DEFAULT NULL,
  `honor` int unsigned NOT NULL DEFAULT '0',
  `honorLevel` int unsigned NOT NULL DEFAULT '1',
  `prestigeLevel` int unsigned NOT NULL DEFAULT '0',
  `honorRestState` tinyint unsigned NOT NULL DEFAULT '2',
  `honorRestBonus` float NOT NULL DEFAULT '0',
  `lastLoginBuild` int unsigned NOT NULL DEFAULT '0',
  `xpRate` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `characters`;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_account_data` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`guid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_account_data`;
/*!40000 ALTER TABLE `character_account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_account_data` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_achievement` (
  `guid` bigint unsigned NOT NULL,
  `achievement` int unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_achievement`;
/*!40000 ALTER TABLE `character_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_achievement` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_achievement_progress` (
  `guid` bigint unsigned NOT NULL,
  `criteria` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_achievement_progress`;
/*!40000 ALTER TABLE `character_achievement_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_achievement_progress` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_action` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `spec` tinyint unsigned NOT NULL DEFAULT '0',
  `button` tinyint unsigned NOT NULL DEFAULT '0',
  `action` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_action`;
/*!40000 ALTER TABLE `character_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_action` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_archaeology_branchs` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `projectId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_archaeology_branchs`;
/*!40000 ALTER TABLE `character_archaeology_branchs` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_archaeology_branchs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_archaeology_digsites` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `digsiteId` smallint unsigned NOT NULL DEFAULT '0',
  `point_x` float DEFAULT '0',
  `point_y` float DEFAULT '0',
  `count` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`digsiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_archaeology_digsites`;
/*!40000 ALTER TABLE `character_archaeology_digsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_archaeology_digsites` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_archaeology_history` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `projectId` int unsigned NOT NULL DEFAULT '0',
  `count` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_archaeology_history`;
/*!40000 ALTER TABLE `character_archaeology_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_archaeology_history` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_arena_data` (
  `guid` bigint unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `rating` int unsigned NOT NULL DEFAULT '0',
  `bestRatingOfWeek` int unsigned NOT NULL DEFAULT '0',
  `bestRatingOfSeason` int unsigned NOT NULL DEFAULT '0',
  `matchMakerRating` int unsigned NOT NULL DEFAULT '0',
  `weekGames` int unsigned NOT NULL DEFAULT '0',
  `weekWins` int unsigned NOT NULL DEFAULT '0',
  `prevWeekGames` int unsigned NOT NULL DEFAULT '0',
  `prevWeekWins` int unsigned NOT NULL DEFAULT '0',
  `seasonGames` int unsigned NOT NULL DEFAULT '0',
  `seasonWins` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_arena_data`;
/*!40000 ALTER TABLE `character_arena_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_arena_data` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_aura` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `casterGuid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `itemGuid` binary(16) NOT NULL,
  `spell` int unsigned NOT NULL,
  `effectMask` int unsigned NOT NULL,
  `recalculateMask` int unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `stackCount` tinyint unsigned NOT NULL DEFAULT '1',
  `maxDuration` int NOT NULL DEFAULT '0',
  `remainTime` int NOT NULL DEFAULT '0',
  `remainCharges` tinyint unsigned NOT NULL DEFAULT '0',
  `castItemId` int unsigned NOT NULL DEFAULT '0',
  `castItemLevel` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`guid`,`casterGuid`,`itemGuid`,`spell`,`effectMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_aura`;
/*!40000 ALTER TABLE `character_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_aura` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_aura_effect` (
  `guid` bigint unsigned NOT NULL,
  `casterGuid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `itemGuid` binary(16) NOT NULL,
  `spell` int unsigned NOT NULL,
  `effectMask` int unsigned NOT NULL,
  `effectIndex` tinyint unsigned NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `baseAmount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`casterGuid`,`itemGuid`,`spell`,`effectMask`,`effectIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_aura_effect`;
/*!40000 ALTER TABLE `character_aura_effect` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_aura_effect` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_banned` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

DELETE FROM `character_banned`;
/*!40000 ALTER TABLE `character_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_banned` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_battleground_data` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instanceId` int unsigned NOT NULL COMMENT 'Instance Identifier',
  `team` smallint unsigned NOT NULL,
  `joinX` float NOT NULL DEFAULT '0',
  `joinY` float NOT NULL DEFAULT '0',
  `joinZ` float NOT NULL DEFAULT '0',
  `joinO` float NOT NULL DEFAULT '0',
  `joinMapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `taxiStart` int unsigned NOT NULL DEFAULT '0',
  `taxiEnd` int unsigned NOT NULL DEFAULT '0',
  `mountSpell` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_battleground_data`;
/*!40000 ALTER TABLE `character_battleground_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_battleground_data` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_battleground_random` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_battleground_random`;
/*!40000 ALTER TABLE `character_battleground_random` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_battleground_random` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_cuf_profiles` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Guid',
  `id` tinyint unsigned NOT NULL COMMENT 'Profile Id (0-4)',
  `name` varchar(12) NOT NULL COMMENT 'Profile Name',
  `frameHeight` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Frame Height',
  `frameWidth` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Frame Width',
  `sortBy` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame Sort By',
  `healthText` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame Health Text',
  `boolOptions` int unsigned NOT NULL DEFAULT '0' COMMENT 'Many Configurable Bool Options',
  `topPoint` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame top alignment',
  `bottomPoint` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame bottom alignment',
  `leftPoint` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame left alignment',
  `topOffset` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame position offset from top',
  `bottomOffset` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame position offset from bottom',
  `leftOffset` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame position offset from left',
  PRIMARY KEY (`guid`,`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_cuf_profiles`;
/*!40000 ALTER TABLE `character_cuf_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_cuf_profiles` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_currency` (
  `CharacterGuid` bigint unsigned NOT NULL DEFAULT '0',
  `Currency` smallint unsigned NOT NULL,
  `Quantity` int unsigned NOT NULL,
  `WeeklyQuantity` int unsigned NOT NULL,
  `TrackedQuantity` int unsigned NOT NULL,
  `Flags` tinyint unsigned NOT NULL,
  `WeekCap` int unsigned NOT NULL,
  PRIMARY KEY (`CharacterGuid`,`Currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_currency`;
/*!40000 ALTER TABLE `character_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_currency` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_customizations` (
  `guid` bigint unsigned NOT NULL,
  `chrCustomizationOptionID` int unsigned NOT NULL,
  `chrCustomizationChoiceID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`chrCustomizationOptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_customizations`;
/*!40000 ALTER TABLE `character_customizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_customizations` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_declinedname` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_declinedname`;
/*!40000 ALTER TABLE `character_declinedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_declinedname` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_equipmentsets` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `setguid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setindex` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(31) NOT NULL,
  `iconname` varchar(100) NOT NULL,
  `ignore_mask` int unsigned NOT NULL DEFAULT '0',
  `AssignedSpecIndex` int NOT NULL DEFAULT '-1',
  `item0` bigint unsigned NOT NULL DEFAULT '0',
  `item1` bigint unsigned NOT NULL DEFAULT '0',
  `item2` bigint unsigned NOT NULL DEFAULT '0',
  `item3` bigint unsigned NOT NULL DEFAULT '0',
  `item4` bigint unsigned NOT NULL DEFAULT '0',
  `item5` bigint unsigned NOT NULL DEFAULT '0',
  `item6` bigint unsigned NOT NULL DEFAULT '0',
  `item7` bigint unsigned NOT NULL DEFAULT '0',
  `item8` bigint unsigned NOT NULL DEFAULT '0',
  `item9` bigint unsigned NOT NULL DEFAULT '0',
  `item10` bigint unsigned NOT NULL DEFAULT '0',
  `item11` bigint unsigned NOT NULL DEFAULT '0',
  `item12` bigint unsigned NOT NULL DEFAULT '0',
  `item13` bigint unsigned NOT NULL DEFAULT '0',
  `item14` bigint unsigned NOT NULL DEFAULT '0',
  `item15` bigint unsigned NOT NULL DEFAULT '0',
  `item16` bigint unsigned NOT NULL DEFAULT '0',
  `item17` bigint unsigned NOT NULL DEFAULT '0',
  `item18` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_equipmentsets`;
/*!40000 ALTER TABLE `character_equipmentsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_equipmentsets` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_favorite_auctions` (
  `guid` bigint unsigned NOT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `itemId` int unsigned NOT NULL DEFAULT '0',
  `itemLevel` int unsigned NOT NULL DEFAULT '0',
  `battlePetSpeciesId` int unsigned NOT NULL DEFAULT '0',
  `suffixItemNameDescriptionId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_favorite_auctions`;
/*!40000 ALTER TABLE `character_favorite_auctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_favorite_auctions` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_fishingsteps` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `fishingSteps` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_fishingsteps`;
/*!40000 ALTER TABLE `character_fishingsteps` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_fishingsteps` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_garrison` (
  `guid` bigint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `siteLevelId` int unsigned NOT NULL DEFAULT '0',
  `followerActivationsRemainingToday` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_garrison`;
/*!40000 ALTER TABLE `character_garrison` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_garrison` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_garrison_blueprints` (
  `guid` bigint unsigned NOT NULL,
  `garrison_type` tinyint unsigned NOT NULL,
  `buildingId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`garrison_type`,`buildingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_garrison_blueprints`;
/*!40000 ALTER TABLE `character_garrison_blueprints` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_garrison_blueprints` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_garrison_buildings` (
  `guid` bigint unsigned NOT NULL,
  `garrison_type` tinyint unsigned NOT NULL,
  `plotInstanceId` int unsigned NOT NULL DEFAULT '0',
  `buildingId` int unsigned NOT NULL DEFAULT '0',
  `timeBuilt` bigint unsigned NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`garrison_type`,`plotInstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_garrison_buildings`;
/*!40000 ALTER TABLE `character_garrison_buildings` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_garrison_buildings` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_garrison_followers` (
  `dbId` bigint unsigned NOT NULL,
  `guid` bigint unsigned NOT NULL,
  `garrison_type` tinyint unsigned NOT NULL,
  `followerId` int unsigned NOT NULL,
  `quality` int unsigned NOT NULL DEFAULT '2',
  `level` int unsigned NOT NULL DEFAULT '90',
  `itemLevelWeapon` int unsigned NOT NULL DEFAULT '600',
  `itemLevelArmor` int unsigned NOT NULL DEFAULT '600',
  `xp` int unsigned NOT NULL DEFAULT '0',
  `currentBuilding` int unsigned NOT NULL DEFAULT '0',
  `currentMission` int unsigned NOT NULL DEFAULT '0',
  `status` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbId`),
  UNIQUE KEY `idx_guid_id` (`guid`,`followerId`),
  CONSTRAINT `fk_foll_owner` FOREIGN KEY (`guid`) REFERENCES `characters` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_garrison_followers`;
/*!40000 ALTER TABLE `character_garrison_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_garrison_followers` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_garrison_follower_abilities` (
  `dbId` bigint unsigned NOT NULL,
  `abilityId` int unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbId`,`abilityId`,`slot`),
  CONSTRAINT `fk_foll_dbid` FOREIGN KEY (`dbId`) REFERENCES `character_garrison_followers` (`dbId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_garrison_follower_abilities`;
/*!40000 ALTER TABLE `character_garrison_follower_abilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_garrison_follower_abilities` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_garrison_missions` (
  `dbId` bigint unsigned NOT NULL,
  `guid` bigint unsigned NOT NULL,
  `garrison_type` tinyint unsigned NOT NULL,
  `missionId` int unsigned NOT NULL,
  `offerTime` int NOT NULL,
  `startTime` int NOT NULL,
  `status` tinyint unsigned NOT NULL,
  PRIMARY KEY (`dbId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_garrison_missions`;
/*!40000 ALTER TABLE `character_garrison_missions` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_garrison_missions` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_garrison_mission_rewards` (
  `dbId` int unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `itemId` int NOT NULL DEFAULT '0',
  `itemQuantity` int unsigned NOT NULL DEFAULT '0',
  `currencyId` int NOT NULL DEFAULT '0',
  `currencyQuantity` int unsigned NOT NULL DEFAULT '0',
  `FollowerXP` int unsigned NOT NULL DEFAULT '0',
  `BonusAbilityId` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_garrison_mission_rewards`;
/*!40000 ALTER TABLE `character_garrison_mission_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_garrison_mission_rewards` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_gifts` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `item_guid` bigint unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_gifts`;
/*!40000 ALTER TABLE `character_gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_gifts` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_glyphs` (
  `guid` bigint unsigned NOT NULL,
  `talentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `glyphId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`talentGroup`,`glyphId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_glyphs`;
/*!40000 ALTER TABLE `character_glyphs` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_glyphs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_homebind` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_homebind`;
/*!40000 ALTER TABLE `character_homebind` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_homebind` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_instance` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  `extendState` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_instance`;
/*!40000 ALTER TABLE `character_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_instance` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_inventory` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` bigint unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `item` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  PRIMARY KEY (`item`),
  UNIQUE KEY `guid` (`guid`,`bag`,`slot`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_inventory`;
/*!40000 ALTER TABLE `character_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_inventory` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_pet` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `owner` bigint unsigned NOT NULL DEFAULT '0',
  `modelid` int unsigned DEFAULT '0',
  `CreatedBySpell` mediumint unsigned NOT NULL DEFAULT '0',
  `PetType` tinyint unsigned NOT NULL DEFAULT '0',
  `level` smallint unsigned NOT NULL DEFAULT '1',
  `exp` int unsigned NOT NULL DEFAULT '0',
  `Reactstate` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(21) NOT NULL DEFAULT 'Pet',
  `renamed` tinyint unsigned NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `curhealth` int unsigned NOT NULL DEFAULT '1',
  `curmana` int unsigned NOT NULL DEFAULT '0',
  `savetime` int unsigned NOT NULL DEFAULT '0',
  `abdata` text,
  `specialization` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `idx_slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

DELETE FROM `character_pet`;
/*!40000 ALTER TABLE `character_pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pet` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_pet_declinedname` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `owner` int unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_pet_declinedname`;
/*!40000 ALTER TABLE `character_pet_declinedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pet_declinedname` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_pvp_talent` (
  `guid` bigint unsigned NOT NULL,
  `talentId0` int unsigned NOT NULL,
  `talentId1` int unsigned NOT NULL,
  `talentId2` int unsigned NOT NULL,
  `talentId3` int unsigned NOT NULL,
  `talentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`talentGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_pvp_talent`;
/*!40000 ALTER TABLE `character_pvp_talent` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pvp_talent` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `timer` int unsigned NOT NULL DEFAULT '0',
  `explored` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus`;
/*!40000 ALTER TABLE `character_queststatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus_daily` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus_daily`;
/*!40000 ALTER TABLE `character_queststatus_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_daily` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus_monthly` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus_monthly`;
/*!40000 ALTER TABLE `character_queststatus_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_monthly` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus_objectives` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  `objective` tinyint unsigned NOT NULL DEFAULT '0',
  `data` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`,`objective`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus_objectives`;
/*!40000 ALTER TABLE `character_queststatus_objectives` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_objectives` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus_objectives_criteria` (
  `guid` bigint unsigned NOT NULL,
  `questObjectiveId` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`questObjectiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus_objectives_criteria`;
/*!40000 ALTER TABLE `character_queststatus_objectives_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_objectives_criteria` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus_objectives_criteria_progress` (
  `guid` bigint unsigned NOT NULL,
  `criteriaId` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteriaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus_objectives_criteria_progress`;
/*!40000 ALTER TABLE `character_queststatus_objectives_criteria_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_objectives_criteria_progress` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus_rewarded` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus_rewarded`;
/*!40000 ALTER TABLE `character_queststatus_rewarded` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_rewarded` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus_seasonal` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `event` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus_seasonal`;
/*!40000 ALTER TABLE `character_queststatus_seasonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_seasonal` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_queststatus_weekly` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_queststatus_weekly`;
/*!40000 ALTER TABLE `character_queststatus_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_weekly` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_recovery` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `delivered` tinyint(1) DEFAULT '0',
  `account` int unsigned NOT NULL,
  `race` int unsigned NOT NULL,
  `class` int unsigned NOT NULL,
  `level` int unsigned NOT NULL,
  `skill1` int NOT NULL DEFAULT '0',
  `skill1_value` int NOT NULL DEFAULT '0',
  `skill2` int NOT NULL DEFAULT '0',
  `skill2_value` int NOT NULL DEFAULT '0',
  `items` text NOT NULL,
  `spells` text NOT NULL,
  `at_login` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DELETE FROM `character_recovery`;
/*!40000 ALTER TABLE `character_recovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_recovery` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_reputation` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `standing` int NOT NULL DEFAULT '0',
  `flags` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_reputation`;
/*!40000 ALTER TABLE `character_reputation` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_reputation` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_shop` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` bigint NOT NULL,
  `type` tinyint NOT NULL,
  `itemId` int NOT NULL DEFAULT '0',
  `itemCount` int NOT NULL DEFAULT '0',
  `delivered` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_shop`;
/*!40000 ALTER TABLE `character_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_shop` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_skills` (
  `guid` bigint unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` smallint unsigned NOT NULL,
  `value` smallint unsigned NOT NULL,
  `max` smallint unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_skills`;
/*!40000 ALTER TABLE `character_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_skills` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_social` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `friend` (`friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_social`;
/*!40000 ALTER TABLE `character_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_social` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_spell` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

DELETE FROM `character_spell`;
/*!40000 ALTER TABLE `character_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_spell` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_spell_charges` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `categoryId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellCategory.dbc Identifier',
  `rechargeStart` int unsigned NOT NULL DEFAULT '0',
  `rechargeEnd` int unsigned NOT NULL DEFAULT '0',
  KEY `idx_guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_spell_charges`;
/*!40000 ALTER TABLE `character_spell_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_spell_charges` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_spell_cooldown` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `item` int unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` int unsigned NOT NULL DEFAULT '0',
  `categoryId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category Id',
  `categoryEnd` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_spell_cooldown`;
/*!40000 ALTER TABLE `character_spell_cooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_spell_cooldown` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_stats` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int unsigned NOT NULL DEFAULT '0',
  `maxpower1` int unsigned NOT NULL DEFAULT '0',
  `maxpower2` int unsigned NOT NULL DEFAULT '0',
  `maxpower3` int unsigned NOT NULL DEFAULT '0',
  `maxpower4` int unsigned NOT NULL DEFAULT '0',
  `maxpower5` int unsigned NOT NULL DEFAULT '0',
  `maxpower6` int unsigned NOT NULL DEFAULT '0',
  `strength` int unsigned NOT NULL DEFAULT '0',
  `agility` int unsigned NOT NULL DEFAULT '0',
  `stamina` int unsigned NOT NULL DEFAULT '0',
  `intellect` int unsigned NOT NULL DEFAULT '0',
  `armor` int unsigned NOT NULL DEFAULT '0',
  `resHoly` int unsigned NOT NULL DEFAULT '0',
  `resFire` int unsigned NOT NULL DEFAULT '0',
  `resNature` int unsigned NOT NULL DEFAULT '0',
  `resFrost` int unsigned NOT NULL DEFAULT '0',
  `resShadow` int unsigned NOT NULL DEFAULT '0',
  `resArcane` int unsigned NOT NULL DEFAULT '0',
  `blockPct` float unsigned NOT NULL DEFAULT '0',
  `dodgePct` float unsigned NOT NULL DEFAULT '0',
  `parryPct` float unsigned NOT NULL DEFAULT '0',
  `critPct` float unsigned NOT NULL DEFAULT '0',
  `rangedCritPct` float unsigned NOT NULL DEFAULT '0',
  `spellCritPct` float unsigned NOT NULL DEFAULT '0',
  `attackPower` int unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int unsigned NOT NULL DEFAULT '0',
  `spellPower` int unsigned NOT NULL DEFAULT '0',
  `resilience` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_stats`;
/*!40000 ALTER TABLE `character_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_stats` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_talent` (
  `guid` bigint unsigned NOT NULL,
  `talentId` mediumint unsigned NOT NULL,
  `talentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`talentId`,`talentGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_talent`;
/*!40000 ALTER TABLE `character_talent` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_talent` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_transmog_outfits` (
  `guid` bigint NOT NULL DEFAULT '0',
  `setguid` bigint NOT NULL AUTO_INCREMENT,
  `setindex` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `iconname` varchar(256) NOT NULL,
  `ignore_mask` int NOT NULL DEFAULT '0',
  `appearance0` int NOT NULL DEFAULT '0',
  `appearance1` int NOT NULL DEFAULT '0',
  `appearance2` int NOT NULL DEFAULT '0',
  `appearance3` int NOT NULL DEFAULT '0',
  `appearance4` int NOT NULL DEFAULT '0',
  `appearance5` int NOT NULL DEFAULT '0',
  `appearance6` int NOT NULL DEFAULT '0',
  `appearance7` int NOT NULL DEFAULT '0',
  `appearance8` int NOT NULL DEFAULT '0',
  `appearance9` int NOT NULL DEFAULT '0',
  `appearance10` int NOT NULL DEFAULT '0',
  `appearance11` int NOT NULL DEFAULT '0',
  `appearance12` int NOT NULL DEFAULT '0',
  `appearance13` int NOT NULL DEFAULT '0',
  `appearance14` int NOT NULL DEFAULT '0',
  `appearance15` int NOT NULL DEFAULT '0',
  `appearance16` int NOT NULL DEFAULT '0',
  `appearance17` int NOT NULL DEFAULT '0',
  `appearance18` int NOT NULL DEFAULT '0',
  `mainHandEnchant` int NOT NULL DEFAULT '0',
  `offHandEnchant` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_transmog_outfits`;
/*!40000 ALTER TABLE `character_transmog_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_transmog_outfits` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_void_storage` (
  `itemId` bigint unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  `itemEntry` mediumint unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `creatorGuid` bigint unsigned NOT NULL DEFAULT '0',
  `randomBonusListId` int unsigned NOT NULL DEFAULT '0',
  `fixedScalingLevel` int unsigned DEFAULT '0',
  `artifactKnowledgeLevel` int unsigned DEFAULT '0',
  `challengeId` int unsigned NOT NULL DEFAULT '0',
  `challengeLevel` int unsigned NOT NULL DEFAULT '0',
  `challengeAffix1` int unsigned NOT NULL DEFAULT '0',
  `challengeAffix2` int unsigned NOT NULL DEFAULT '0',
  `challengeAffix3` int unsigned NOT NULL DEFAULT '0',
  `challengeIsCharged` int unsigned NOT NULL DEFAULT '0',
  `context` tinyint unsigned NOT NULL DEFAULT '0',
  `bonusListIDs` text,
  PRIMARY KEY (`itemId`),
  UNIQUE KEY `idx_player_slot` (`playerGuid`,`slot`),
  KEY `idx_player` (`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_void_storage`;
/*!40000 ALTER TABLE `character_void_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_void_storage` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `character_world_quest` (
  `guid` bigint unsigned NOT NULL,
  `questId` int unsigned NOT NULL,
  `lastupdate` int unsigned NOT NULL,
  `timer` int unsigned NOT NULL,
  `variableID` int unsigned NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`guid`,`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_world_quest`;
/*!40000 ALTER TABLE `character_world_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_world_quest` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `corpse` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `itemCache` text NOT NULL,
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '0',
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  `dynFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `corpseType` tinyint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpseType`),
  KEY `idx_instance` (`instanceId`),
  KEY `idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Death System';

DELETE FROM `corpse`;
/*!40000 ALTER TABLE `corpse` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpse` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `corpse_customizations` (
  `ownerGuid` bigint unsigned NOT NULL,
  `chrCustomizationOptionID` int unsigned NOT NULL,
  `chrCustomizationChoiceID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerGuid`,`chrCustomizationOptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `corpse_customizations`;
/*!40000 ALTER TABLE `corpse_customizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpse_customizations` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `corpse_phases` (
  `OwnerGuid` bigint unsigned NOT NULL DEFAULT '0',
  `PhaseId` int unsigned NOT NULL,
  PRIMARY KEY (`OwnerGuid`,`PhaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `corpse_phases`;
/*!40000 ALTER TABLE `corpse_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpse_phases` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `creature_respawn` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` bigint unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';

DELETE FROM `creature_respawn`;
/*!40000 ALTER TABLE `creature_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_respawn` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `gameobject_respawn` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` bigint unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';

DELETE FROM `gameobject_respawn`;
/*!40000 ALTER TABLE `gameobject_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_respawn` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `game_event_condition_save` (
  `eventEntry` tinyint unsigned NOT NULL,
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  `done` float DEFAULT '0',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `game_event_condition_save`;
/*!40000 ALTER TABLE `game_event_condition_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_condition_save` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `game_event_save` (
  `eventEntry` tinyint unsigned NOT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `next_start` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `game_event_save`;
/*!40000 ALTER TABLE `game_event_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_save` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `gm_bug` (
  `id` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  `note` text NOT NULL,
  `createTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `facing` float NOT NULL DEFAULT '0',
  `closedBy` bigint NOT NULL DEFAULT '0',
  `assignedTo` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `gm_bug`;
/*!40000 ALTER TABLE `gm_bug` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_bug` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `gm_complaint` (
  `id` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  `note` text NOT NULL,
  `createTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `facing` float NOT NULL DEFAULT '0',
  `targetCharacterGuid` bigint unsigned NOT NULL,
  `complaintType` smallint unsigned NOT NULL,
  `reportLineIndex` int NOT NULL,
  `closedBy` bigint NOT NULL DEFAULT '0',
  `assignedTo` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `gm_complaint`;
/*!40000 ALTER TABLE `gm_complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_complaint` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `gm_complaint_chatlog` (
  `complaintId` int unsigned NOT NULL,
  `lineId` int unsigned NOT NULL,
  `timestamp` int unsigned NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`complaintId`,`lineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `gm_complaint_chatlog`;
/*!40000 ALTER TABLE `gm_complaint_chatlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_complaint_chatlog` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `gm_suggestion` (
  `id` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  `note` text NOT NULL,
  `createTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `facing` float NOT NULL DEFAULT '0',
  `closedBy` bigint NOT NULL DEFAULT '0',
  `assignedTo` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `gm_suggestion`;
/*!40000 ALTER TABLE `gm_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_suggestion` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `groups` (
  `guid` int unsigned NOT NULL,
  `leaderGuid` bigint unsigned NOT NULL,
  `lootMethod` tinyint unsigned NOT NULL,
  `looterGuid` bigint unsigned NOT NULL,
  `lootThreshold` tinyint unsigned NOT NULL,
  `icon1` binary(16) NOT NULL,
  `icon2` binary(16) NOT NULL,
  `icon3` binary(16) NOT NULL,
  `icon4` binary(16) NOT NULL,
  `icon5` binary(16) NOT NULL,
  `icon6` binary(16) NOT NULL,
  `icon7` binary(16) NOT NULL,
  `icon8` binary(16) NOT NULL,
  `groupType` tinyint unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL DEFAULT '1',
  `raidDifficulty` tinyint unsigned NOT NULL DEFAULT '14',
  `legacyRaidDifficulty` tinyint unsigned NOT NULL DEFAULT '3',
  `masterLooterGuid` bigint unsigned NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Groups';

DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `group_instance` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `group_instance`;
/*!40000 ALTER TABLE `group_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_instance` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `group_member` (
  `guid` int unsigned NOT NULL,
  `memberGuid` bigint unsigned NOT NULL,
  `memberFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `subgroup` tinyint unsigned NOT NULL DEFAULT '0',
  `roles` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Groups';

DELETE FROM `group_member`;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `leaderguid` bigint unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `EmblemColor` tinyint unsigned NOT NULL DEFAULT '0',
  `BorderStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `BorderColor` tinyint unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` tinyint unsigned NOT NULL DEFAULT '0',
  `info` varchar(500) NOT NULL DEFAULT '',
  `motd` varchar(256) NOT NULL DEFAULT '',
  `createdate` int unsigned NOT NULL DEFAULT '0',
  `BankMoney` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

DELETE FROM `guild`;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_achievement` (
  `guildId` bigint unsigned NOT NULL,
  `achievement` int unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  `guids` text NOT NULL,
  PRIMARY KEY (`guildId`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_achievement`;
/*!40000 ALTER TABLE `guild_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_achievement` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_achievement_progress` (
  `guildId` bigint unsigned NOT NULL,
  `criteria` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  `completedGuid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_achievement_progress`;
/*!40000 ALTER TABLE `guild_achievement_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_achievement_progress` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_bank_eventlog` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` bigint unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` bigint unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` smallint unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_bank_eventlog`;
/*!40000 ALTER TABLE `guild_bank_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_eventlog` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_bank_item` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint unsigned NOT NULL DEFAULT '0',
  `item_guid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_bank_item`;
/*!40000 ALTER TABLE `guild_bank_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_item` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_bank_right` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `rid` tinyint unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint NOT NULL DEFAULT '0',
  `SlotPerDay` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_bank_right`;
/*!40000 ALTER TABLE `guild_bank_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_right` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_bank_tab` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(16) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_bank_tab`;
/*!40000 ALTER TABLE `guild_bank_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_tab` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_eventlog` (
  `guildid` bigint unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` bigint unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` bigint unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` int unsigned NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Eventlog';

DELETE FROM `guild_eventlog`;
/*!40000 ALTER TABLE `guild_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_eventlog` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_finder_applicant` (
  `guildId` bigint unsigned NOT NULL DEFAULT '0',
  `playerGuid` bigint unsigned NOT NULL DEFAULT '0',
  `availability` tinyint unsigned DEFAULT '0',
  `classRole` tinyint unsigned DEFAULT '0',
  `interests` tinyint unsigned DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `submitTime` int unsigned DEFAULT NULL,
  PRIMARY KEY (`guildId`,`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_finder_applicant`;
/*!40000 ALTER TABLE `guild_finder_applicant` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_finder_applicant` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_finder_guild_settings` (
  `guildId` bigint unsigned NOT NULL,
  `availability` tinyint unsigned NOT NULL DEFAULT '0',
  `classRoles` tinyint unsigned NOT NULL DEFAULT '0',
  `interests` tinyint unsigned NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '1',
  `listed` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guildId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_finder_guild_settings`;
/*!40000 ALTER TABLE `guild_finder_guild_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_finder_guild_settings` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_member` (
  `guildid` bigint unsigned NOT NULL COMMENT 'Guild Identificator',
  `guid` bigint unsigned NOT NULL,
  `rank` tinyint unsigned NOT NULL,
  `pnote` varchar(31) NOT NULL DEFAULT '',
  `offnote` varchar(31) NOT NULL DEFAULT '',
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_key` (`guildid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

DELETE FROM `guild_member`;
/*!40000 ALTER TABLE `guild_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_member` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_member_withdraw` (
  `guid` bigint unsigned NOT NULL,
  `tab0` int unsigned NOT NULL DEFAULT '0',
  `tab1` int unsigned NOT NULL DEFAULT '0',
  `tab2` int unsigned NOT NULL DEFAULT '0',
  `tab3` int unsigned NOT NULL DEFAULT '0',
  `tab4` int unsigned NOT NULL DEFAULT '0',
  `tab5` int unsigned NOT NULL DEFAULT '0',
  `tab6` int unsigned NOT NULL DEFAULT '0',
  `tab7` int unsigned NOT NULL DEFAULT '0',
  `money` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Member Daily Withdraws';

DELETE FROM `guild_member_withdraw`;
/*!40000 ALTER TABLE `guild_member_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_member_withdraw` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_newslog` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` bigint unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Value` int unsigned NOT NULL DEFAULT '0',
  `TimeStamp` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `guild_newslog`;
/*!40000 ALTER TABLE `guild_newslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_newslog` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `guild_rank` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `rid` tinyint unsigned NOT NULL,
  `rname` varchar(20) NOT NULL DEFAULT '',
  `rights` mediumint unsigned NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

DELETE FROM `guild_rank`;
/*!40000 ALTER TABLE `guild_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_rank` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `instance` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `resettime` bigint unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `completedEncounters` int unsigned NOT NULL DEFAULT '0',
  `data` tinytext NOT NULL,
  `entranceId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `instance`;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `instance_reset` (
  `mapid` smallint unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `resettime` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`difficulty`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `instance_reset`;
/*!40000 ALTER TABLE `instance_reset` DISABLE KEYS */;
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(33, 2, 1426996800),
	(36, 2, 1426996800),
	(249, 3, 1427515200),
	(249, 4, 1427515200),
	(269, 2, 1426996800),
	(409, 9, 1427515200),
	(469, 9, 1427515200),
	(509, 3, 1427169600),
	(531, 9, 1427515200),
	(532, 3, 1427515200),
	(533, 3, 1427515200),
	(533, 4, 1427515200),
	(534, 4, 1427515200),
	(540, 2, 1426996800),
	(542, 2, 1426996800),
	(543, 2, 1426996800),
	(544, 4, 1427515200),
	(545, 2, 1426996800),
	(546, 2, 1426996800),
	(547, 2, 1426996800),
	(548, 4, 1427515200),
	(550, 4, 1427515200),
	(552, 2, 1426996800),
	(553, 2, 1426996800),
	(554, 2, 1426996800),
	(555, 2, 1426996800),
	(556, 2, 1426996800),
	(557, 2, 1426996800),
	(558, 2, 1426996800),
	(560, 2, 1426996800),
	(564, 4, 1427515200),
	(565, 4, 1427515200),
	(568, 2, 1426996800),
	(574, 2, 1426996800),
	(575, 2, 1426996800),
	(576, 2, 1426996800),
	(578, 2, 1426996800),
	(580, 4, 1427515200),
	(585, 2, 1426996800),
	(595, 2, 1426996800),
	(598, 2, 1426996800),
	(599, 2, 1426996800),
	(600, 2, 1426996800),
	(601, 2, 1426996800),
	(602, 2, 1426996800),
	(603, 3, 1427515200),
	(603, 4, 1427515200),
	(604, 2, 1426996800),
	(608, 2, 1426996800),
	(615, 3, 1427515200),
	(615, 4, 1427515200),
	(616, 3, 1427515200),
	(616, 4, 1427515200),
	(619, 2, 1426996800),
	(624, 3, 1427515200),
	(624, 4, 1427515200),
	(631, 3, 1427515200),
	(631, 4, 1427515200),
	(631, 5, 1427515200),
	(631, 6, 1427515200),
	(632, 2, 1426996800),
	(643, 2, 1426996800),
	(644, 2, 1426996800),
	(645, 2, 1426996800),
	(649, 3, 1427515200),
	(649, 4, 1427515200),
	(649, 5, 1427515200),
	(649, 6, 1427515200),
	(650, 2, 1426996800),
	(657, 2, 1426996800),
	(658, 2, 1426996800),
	(668, 2, 1426996800),
	(669, 3, 1427515200),
	(669, 4, 1427515200),
	(669, 5, 1427515200),
	(669, 6, 1427515200),
	(670, 2, 1426996800),
	(671, 3, 1427515200),
	(671, 4, 1427515200),
	(671, 5, 1427515200),
	(671, 6, 1427515200),
	(720, 3, 1427515200),
	(720, 4, 1427515200),
	(720, 5, 1427515200),
	(720, 6, 1427515200),
	(724, 3, 1427515200),
	(724, 4, 1427515200),
	(724, 5, 1427515200),
	(724, 6, 1427515200),
	(725, 2, 1426996800),
	(754, 3, 1427515200),
	(754, 4, 1427515200),
	(754, 5, 1427515200),
	(754, 6, 1427515200),
	(755, 2, 1426996800),
	(757, 3, 1427515200),
	(757, 4, 1427515200),
	(757, 5, 1427515200),
	(757, 6, 1427515200),
	(859, 2, 1426996800),
	(938, 2, 1426996800),
	(939, 2, 1426996800),
	(940, 2, 1426996800),
	(959, 2, 1426996800),
	(960, 2, 1426996800),
	(961, 2, 1426996800),
	(962, 2, 1426996800),
	(967, 3, 1427515200),
	(967, 4, 1427515200),
	(967, 5, 1427515200),
	(967, 6, 1427515200),
	(994, 2, 1426996800),
	(996, 3, 1427515200),
	(996, 4, 1427515200),
	(996, 5, 1427515200),
	(996, 6, 1427515200),
	(1001, 2, 1426996800),
	(1004, 2, 1426996800),
	(1007, 2, 1426996800),
	(1008, 3, 1427515200),
	(1008, 4, 1427515200),
	(1008, 5, 1427515200),
	(1008, 6, 1427515200),
	(1009, 3, 1427515200),
	(1009, 4, 1427515200),
	(1009, 5, 1427515200),
	(1009, 6, 1427515200),
	(1011, 2, 1426996800),
	(1098, 3, 1427515200),
	(1098, 4, 1427515200),
	(1098, 5, 1427515200),
	(1098, 6, 1427515200),
	(1136, 14, 1427515200),
	(1136, 15, 1427515200),
	(1136, 16, 1427515200),
	(1175, 2, 1426996800),
	(1176, 2, 1426996800),
	(1182, 2, 1426996800),
	(1195, 2, 1426996800),
	(1205, 14, 1427515200),
	(1205, 15, 1427515200),
	(1205, 16, 1427515200),
	(1208, 2, 1426996800),
	(1209, 2, 1426996800),
	(1228, 14, 1427515200),
	(1228, 15, 1427515200),
	(1228, 16, 1427515200),
	(1279, 2, 1426996800),
	(1358, 2, 1426996800);
/*!40000 ALTER TABLE `instance_reset` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `instance_scenario_progress` (
  `id` int unsigned NOT NULL,
  `criteria` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `instance_scenario_progress`;
/*!40000 ALTER TABLE `instance_scenario_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_scenario_progress` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_azerite` (
  `CharacterGuid` bigint unsigned NOT NULL,
  `ItemGuid` bigint unsigned NOT NULL,
  `Level` int unsigned NOT NULL DEFAULT '0',
  `Xp` bigint unsigned NOT NULL,
  PRIMARY KEY (`CharacterGuid`,`ItemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_azerite`;
/*!40000 ALTER TABLE `item_azerite` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_azerite` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_azerite_empowered` (
  `CharacterGuid` bigint unsigned NOT NULL,
  `ItemGuid` bigint unsigned NOT NULL,
  `PowereId1` int unsigned NOT NULL DEFAULT '0',
  `PowereId2` int unsigned NOT NULL DEFAULT '0',
  `PowereId3` int unsigned NOT NULL DEFAULT '0',
  `PowereId4` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CharacterGuid`,`ItemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_azerite_empowered`;
/*!40000 ALTER TABLE `item_azerite_empowered` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_azerite_empowered` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `itemEntry` mediumint unsigned NOT NULL DEFAULT '0',
  `owner_guid` bigint unsigned NOT NULL DEFAULT '0',
  `creatorGuid` bigint unsigned NOT NULL DEFAULT '0',
  `giftCreatorGuid` bigint unsigned NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '1',
  `duration` int NOT NULL DEFAULT '0',
  `charges` tinytext,
  `flags` mediumint unsigned NOT NULL DEFAULT '0',
  `enchantments` text NOT NULL,
  `randomBonusListId` int unsigned NOT NULL DEFAULT '0',
  `durability` smallint unsigned NOT NULL DEFAULT '0',
  `playedTime` int unsigned NOT NULL DEFAULT '0',
  `text` text,
  `transmogrification` int unsigned NOT NULL DEFAULT '0',
  `enchantIllusion` int unsigned NOT NULL DEFAULT '0',
  `battlePetSpeciesId` int unsigned NOT NULL DEFAULT '0',
  `battlePetBreedData` int unsigned NOT NULL DEFAULT '0',
  `battlePetLevel` smallint unsigned NOT NULL DEFAULT '0',
  `battlePetDisplayId` int unsigned NOT NULL DEFAULT '0',
  `context` tinyint unsigned NOT NULL DEFAULT '0',
  `bonusListIDs` text,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item System';

DELETE FROM `item_instance`;
/*!40000 ALTER TABLE `item_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_artifact` (
  `itemGuid` bigint unsigned NOT NULL,
  `xp` bigint unsigned NOT NULL DEFAULT '0',
  `artifactAppearanceId` int unsigned NOT NULL DEFAULT '0',
  `artifactTierId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_artifact`;
/*!40000 ALTER TABLE `item_instance_artifact` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_artifact` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_artifact_powers` (
  `itemGuid` bigint unsigned NOT NULL,
  `artifactPowerId` int unsigned NOT NULL,
  `purchasedRank` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`itemGuid`,`artifactPowerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_artifact_powers`;
/*!40000 ALTER TABLE `item_instance_artifact_powers` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_artifact_powers` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_azerite` (
  `itemGuid` bigint unsigned NOT NULL,
  `xp` bigint unsigned NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '1',
  `knowledgeLevel` int unsigned NOT NULL DEFAULT '0',
  `selectedAzeriteEssences1specId` int unsigned DEFAULT '0',
  `selectedAzeriteEssences1azeriteEssenceId1` int unsigned DEFAULT '0',
  `selectedAzeriteEssences1azeriteEssenceId2` int unsigned DEFAULT '0',
  `selectedAzeriteEssences1azeriteEssenceId3` int unsigned DEFAULT '0',
  `selectedAzeriteEssences1azeriteEssenceId4` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2specId` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2azeriteEssenceId1` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2azeriteEssenceId2` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2azeriteEssenceId3` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2azeriteEssenceId4` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3specId` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3azeriteEssenceId1` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3azeriteEssenceId2` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3azeriteEssenceId3` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3azeriteEssenceId4` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4specId` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4azeriteEssenceId1` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4azeriteEssenceId2` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4azeriteEssenceId3` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4azeriteEssenceId4` int unsigned DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_azerite`;
/*!40000 ALTER TABLE `item_instance_azerite` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_azerite` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_azerite_empowered` (
  `itemGuid` bigint unsigned NOT NULL,
  `azeritePowerId1` int NOT NULL,
  `azeritePowerId2` int NOT NULL,
  `azeritePowerId3` int NOT NULL,
  `azeritePowerId4` int NOT NULL,
  `azeritePowerId5` int NOT NULL,
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_azerite_empowered`;
/*!40000 ALTER TABLE `item_instance_azerite_empowered` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_azerite_empowered` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_azerite_milestone_power` (
  `itemGuid` bigint unsigned NOT NULL,
  `azeriteItemMilestonePowerId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`,`azeriteItemMilestonePowerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_azerite_milestone_power`;
/*!40000 ALTER TABLE `item_instance_azerite_milestone_power` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_azerite_milestone_power` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_azerite_unlocked_essence` (
  `itemGuid` bigint unsigned NOT NULL,
  `azeriteEssenceId` int unsigned NOT NULL DEFAULT '0',
  `rank` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`,`azeriteEssenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_azerite_unlocked_essence`;
/*!40000 ALTER TABLE `item_instance_azerite_unlocked_essence` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_azerite_unlocked_essence` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_gems` (
  `itemGuid` bigint unsigned NOT NULL,
  `gemItemId1` int unsigned NOT NULL DEFAULT '0',
  `gemBonuses1` text,
  `gemContext1` tinyint unsigned NOT NULL DEFAULT '0',
  `gemScalingLevel1` int unsigned NOT NULL DEFAULT '0',
  `gemItemId2` int unsigned NOT NULL DEFAULT '0',
  `gemBonuses2` text,
  `gemContext2` tinyint unsigned NOT NULL DEFAULT '0',
  `gemScalingLevel2` int unsigned NOT NULL DEFAULT '0',
  `gemItemId3` int unsigned NOT NULL DEFAULT '0',
  `gemBonuses3` text,
  `gemContext3` tinyint unsigned NOT NULL DEFAULT '0',
  `gemScalingLevel3` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_gems`;
/*!40000 ALTER TABLE `item_instance_gems` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_gems` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_modifiers` (
  `itemGuid` bigint unsigned NOT NULL,
  `fixedScalingLevel` int unsigned DEFAULT '0',
  `artifactKnowledgeLevel` int unsigned DEFAULT '0',
  `challengeId` int unsigned NOT NULL DEFAULT '0',
  `challengeLevel` int unsigned NOT NULL DEFAULT '0',
  `challengeAffix1` int unsigned NOT NULL DEFAULT '0',
  `challengeAffix2` int unsigned NOT NULL DEFAULT '0',
  `challengeAffix3` int unsigned NOT NULL DEFAULT '0',
  `challengeIsCharged` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_modifiers`;
/*!40000 ALTER TABLE `item_instance_modifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_modifiers` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_instance_transmog` (
  `itemGuid` bigint unsigned NOT NULL,
  `itemModifiedAppearanceAllSpecs` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec1` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec2` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec3` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec4` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentAllSpecs` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec1` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec2` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec3` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec4` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_instance_transmog`;
/*!40000 ALTER TABLE `item_instance_transmog` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance_transmog` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_loot_items` (
  `container_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'loot item entry (item_instance.itemEntry)',
  `item_count` int NOT NULL DEFAULT '0' COMMENT 'stack size',
  `follow_rules` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'follow loot rules',
  `ffa` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'free-for-all',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `counted` tinyint(1) NOT NULL DEFAULT '0',
  `under_threshold` tinyint(1) NOT NULL DEFAULT '0',
  `needs_quest` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'quest drop',
  `rnd_bonus` int unsigned NOT NULL DEFAULT '0' COMMENT 'random bonus list added when originally rolled',
  `context` tinyint unsigned NOT NULL DEFAULT '0',
  `bonus_list_ids` text COMMENT 'Space separated list of bonus list ids',
  PRIMARY KEY (`container_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_loot_items`;
/*!40000 ALTER TABLE `item_loot_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_loot_items` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_loot_money` (
  `container_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `money` int unsigned NOT NULL DEFAULT '0' COMMENT 'money loot (in copper)',
  PRIMARY KEY (`container_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `item_loot_money`;
/*!40000 ALTER TABLE `item_loot_money` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_loot_money` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_refund_instance` (
  `item_guid` bigint unsigned NOT NULL COMMENT 'Item GUID',
  `player_guid` bigint unsigned NOT NULL COMMENT 'Player GUID',
  `paidMoney` bigint unsigned NOT NULL DEFAULT '0',
  `paidExtendedCost` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`,`player_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item Refund System';

DELETE FROM `item_refund_instance`;
/*!40000 ALTER TABLE `item_refund_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_refund_instance` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_soulbound_trade_data` (
  `itemGuid` bigint unsigned NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item Refund System';

DELETE FROM `item_soulbound_trade_data`;
/*!40000 ALTER TABLE `item_soulbound_trade_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_soulbound_trade_data` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `lfg_data` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `dungeon` int unsigned NOT NULL DEFAULT '0',
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LFG Data';

DELETE FROM `lfg_data`;
/*!40000 ALTER TABLE `lfg_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfg_data` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `log_gm` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `gm_account_id` bigint DEFAULT NULL,
  `gm_account_name` blob,
  `gm_character_id` bigint DEFAULT NULL,
  `gm_character_name` blob,
  `gm_ip` text,
  `target_account_id` bigint DEFAULT NULL,
  `target_account_name` blob,
  `target_character_id` bigint DEFAULT NULL,
  `target_character_name` blob,
  `target_ip` text,
  `command` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `log_gm`;
/*!40000 ALTER TABLE `log_gm` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_gm` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `mail` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint NOT NULL DEFAULT '41',
  `mailTemplateId` smallint unsigned NOT NULL DEFAULT '0',
  `sender` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `body` longtext,
  `has_items` tinyint unsigned NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `deliver_time` int unsigned NOT NULL DEFAULT '0',
  `money` bigint unsigned NOT NULL DEFAULT '0',
  `cod` bigint unsigned NOT NULL DEFAULT '0',
  `checked` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mail System';

DELETE FROM `mail`;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `mail_items` (
  `mail_id` int unsigned NOT NULL DEFAULT '0',
  `item_guid` bigint unsigned NOT NULL DEFAULT '0',
  `receiver` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`item_guid`),
  KEY `idx_receiver` (`receiver`),
  KEY `idx_mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `mail_items`;
/*!40000 ALTER TABLE `mail_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_items` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `petition` (
  `ownerguid` bigint unsigned NOT NULL,
  `petitionguid` bigint unsigned DEFAULT '0',
  `name` varchar(24) NOT NULL,
  PRIMARY KEY (`ownerguid`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

DELETE FROM `petition`;
/*!40000 ALTER TABLE `petition` DISABLE KEYS */;
/*!40000 ALTER TABLE `petition` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `petition_sign` (
  `ownerguid` bigint unsigned NOT NULL,
  `petitionguid` bigint unsigned NOT NULL DEFAULT '0',
  `playerguid` bigint unsigned NOT NULL DEFAULT '0',
  `player_account` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petitionguid`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

DELETE FROM `petition_sign`;
/*!40000 ALTER TABLE `petition_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `petition_sign` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pet_aura` (
  `guid` int unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `casterGuid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `spell` int unsigned NOT NULL,
  `effectMask` int unsigned NOT NULL,
  `recalculateMask` int unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `stackCount` tinyint unsigned NOT NULL DEFAULT '1',
  `maxDuration` int NOT NULL DEFAULT '0',
  `remainTime` int NOT NULL DEFAULT '0',
  `remainCharges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`effectMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

DELETE FROM `pet_aura`;
/*!40000 ALTER TABLE `pet_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_aura` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pet_aura_effect` (
  `guid` int unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `casterGuid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `spell` int unsigned NOT NULL,
  `effectMask` int unsigned NOT NULL,
  `effectIndex` tinyint unsigned NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `baseAmount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`casterGuid`,`spell`,`effectMask`,`effectIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

DELETE FROM `pet_aura_effect`;
/*!40000 ALTER TABLE `pet_aura_effect` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_aura_effect` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pet_spell` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

DELETE FROM `pet_spell`;
/*!40000 ALTER TABLE `pet_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pet_spell_charges` (
  `guid` int unsigned NOT NULL,
  `categoryId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellCategory.dbc Identifier',
  `rechargeStart` int unsigned NOT NULL DEFAULT '0',
  `rechargeEnd` int unsigned NOT NULL DEFAULT '0',
  KEY `idx_guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `pet_spell_charges`;
/*!40000 ALTER TABLE `pet_spell_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell_charges` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pet_spell_cooldown` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` int unsigned NOT NULL DEFAULT '0',
  `categoryId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category Id',
  `categoryEnd` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `pet_spell_cooldown`;
/*!40000 ALTER TABLE `pet_spell_cooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell_cooldown` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pool_quest_save` (
  `pool_id` int unsigned NOT NULL DEFAULT '0',
  `quest_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pool_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `pool_quest_save`;
/*!40000 ALTER TABLE `pool_quest_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_quest_save` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pvpstats_battlegrounds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `winner_faction` tinyint NOT NULL,
  `bracket_id` tinyint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `pvpstats_battlegrounds`;
/*!40000 ALTER TABLE `pvpstats_battlegrounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvpstats_battlegrounds` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pvpstats_players` (
  `battleground_id` bigint unsigned NOT NULL,
  `character_guid` bigint unsigned NOT NULL,
  `winner` bit(1) NOT NULL,
  `score_killing_blows` int unsigned NOT NULL,
  `score_deaths` int unsigned NOT NULL,
  `score_honorable_kills` int unsigned NOT NULL,
  `score_bonus_honor` int unsigned NOT NULL,
  `score_damage_done` int unsigned NOT NULL,
  `score_healing_done` int unsigned NOT NULL,
  `attr_1` int unsigned NOT NULL,
  `attr_2` int unsigned NOT NULL,
  `attr_3` int unsigned NOT NULL,
  `attr_4` int unsigned NOT NULL,
  `attr_5` int unsigned NOT NULL,
  PRIMARY KEY (`battleground_id`,`character_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `pvpstats_players`;
/*!40000 ALTER TABLE `pvpstats_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvpstats_players` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `quest_tracker` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `character_guid` bigint unsigned NOT NULL DEFAULT '0',
  `quest_accept_time` datetime NOT NULL,
  `quest_complete_time` datetime DEFAULT NULL,
  `quest_abandon_time` datetime DEFAULT NULL,
  `completed_by_gm` tinyint(1) NOT NULL DEFAULT '0',
  `core_hash` varchar(120) NOT NULL DEFAULT '0',
  `core_revision` varchar(120) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`character_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `quest_tracker`;
/*!40000 ALTER TABLE `quest_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_tracker` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player Reserved Names';

DELETE FROM `reserved_name`;
/*!40000 ALTER TABLE `reserved_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserved_name` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all applied updates in this database.';

DELETE FROM `updates`;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of directories where we want to include sql updates.';

DELETE FROM `updates_include`;
/*!40000 ALTER TABLE `updates_include` DISABLE KEYS */;
INSERT INTO `updates_include` (`path`, `state`) VALUES
	('$/sql/zgn/characters', 'RELEASED');
/*!40000 ALTER TABLE `updates_include` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `warden_action` (
  `wardenId` smallint unsigned NOT NULL,
  `action` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`wardenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `warden_action`;
/*!40000 ALTER TABLE `warden_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `warden_action` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `worldstates` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `value` int unsigned NOT NULL DEFAULT '0',
  `comment` tinytext,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Saves';

DELETE FROM `worldstates`;
/*!40000 ALTER TABLE `worldstates` DISABLE KEYS */;
INSERT INTO `worldstates` (`entry`, `value`, `comment`) VALUES
	(20001, 0, 'NextArenaPointDistributionTime'),
	(20002, 0, 'NextWeeklyQuestResetTime'),
	(20003, 0, 'NextBGRandomDailyResetTime'),
	(20004, 0, 'cleaning_flags');
/*!40000 ALTER TABLE `worldstates` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `world_quest` (
  `id` int unsigned NOT NULL,
  `rewardid` int unsigned NOT NULL,
  `starttime` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `world_quest`;
/*!40000 ALTER TABLE `world_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `world_quest` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
