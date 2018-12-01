
DROP TABLE IF EXISTS `azerite_empowered_item`;
CREATE TABLE `azerite_empowered_item` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID` int(11) NOT NULL DEFAULT '0',
  `AzeriteTierUnlockSetID` int(10) unsigned NOT NULL DEFAULT '0',
  `AzeritePowerSetID` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `azerite_item`;
CREATE TABLE `azerite_item` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID` int(11) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `azerite_item_milestone_power`;
CREATE TABLE `azerite_item_milestone_power` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AzeritePowerID` smallint(6) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `azerite_power`;
CREATE TABLE `azerite_power` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(11) NOT NULL DEFAULT '0',
  `ItemBonusListID` int(11) NOT NULL DEFAULT '0',
  `SpecSetMemberID` int(11) NOT NULL DEFAULT '0',
  `Flags` int(11) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `azerite_power_set_member`;
CREATE TABLE `azerite_power_set_member` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `AzeritePowerID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Tier` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AzeritePowerSetID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `azerite_tier_unlock`;
CREATE TABLE `azerite_tier_unlock` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemCreationContext` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Tier` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AzeriteLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AzeriteTierUnlockSetID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
