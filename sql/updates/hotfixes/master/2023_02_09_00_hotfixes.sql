--
-- Table structure for table `spell_keybound_override`
--
DROP TABLE IF EXISTS `spell_keybound_override`;
CREATE TABLE `spell_keybound_override` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Function` text,
  `Data` int(11) NOT NULL DEFAULT '0',
  `Type` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
