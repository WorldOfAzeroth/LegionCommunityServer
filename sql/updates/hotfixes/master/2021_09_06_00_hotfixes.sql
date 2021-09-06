--
-- Table structure for table `adventure_journal`
--
DROP TABLE IF EXISTS `adventure_journal`;
CREATE TABLE `adventure_journal` (
    ID                       INT              DEFAULT 0 NOT NULL
        primary key,
    Name_Lang                TEXT                       NULL,
    Description_Lang         TEXT                       NULL,
    ButtonText_Lang          TEXT                       NULL,
    RewardDescription_Lang   TEXT                       NULL,
    ContinueDescription_Lang TEXT                       NULL,
    TextureFileDataID        INT              DEFAULT 0 NOT NULL,
    ItemID                   INT              DEFAULT 0 NOT NULL,
    LfgDungeonID             SMALLINT         DEFAULT 0 NOT NULL,
    QuestID                  SMALLINT         DEFAULT 0 NOT NULL,
    BattleMasterListID       SMALLINT         DEFAULT 0 NOT NULL,
	BonusPlayerConditionID1  SMALLINT         DEFAULT 0 NOT NULL,
    BonusPlayerConditionID2  SMALLINT         DEFAULT 0 NOT NULL,
    CurrencyType             SMALLINT         DEFAULT 0 NOT NULL,
    WorldMapAreaID           SMALLINT         DEFAULT 0 NOT NULL,
    Type                     TINYINT UNSIGNED DEFAULT 0 NOT NULL,
    Flags                    TINYINT UNSIGNED DEFAULT 0 NOT NULL,
    ButtonActionType         TINYINT UNSIGNED DEFAULT 0 NOT NULL,
    PriorityMin              TINYINT UNSIGNED DEFAULT 0 NOT NULL,
    PriorityMax              TINYINT UNSIGNED DEFAULT 0 NOT NULL,
	BonusValue1              TINYINT UNSIGNED DEFAULT 0 NOT NULL,
    BonusValue2              TINYINT UNSIGNED DEFAULT 0 NOT NULL,
    CurrencyQuantity         TINYINT UNSIGNED DEFAULT 0 NOT NULL,
    PlayerConditionID        INT              DEFAULT 0 NOT NULL,
    ItemQuantity             INT              DEFAULT 0 NOT NULL	
) ENGINE = MyISAM collate = utf8_unicode_ci;

--
-- Table structure for table `adventure_journal_locale`
--
DROP TABLE IF EXISTS `adventure_journal_locale`;
CREATE TABLE `adventure_journal_locale`
(
    ID                       INT UNSIGNED DEFAULT 0 NOT NULL,
    locale                   VARCHAR(4)             NULL,
    Name_Lang                TEXT                   NULL,
    Description_Lang         TEXT                   NULL,
    ButtonText_Lang          TEXT                   NULL,
    RewardDescription_Lang   TEXT                   NULL,
    ContinueDescription_Lang TEXT                   NULL,
    VerifiedBuild            SMALLINT     DEFAULT 0 NULL
) ENGINE = MyISAM collate = utf8_unicode_ci;