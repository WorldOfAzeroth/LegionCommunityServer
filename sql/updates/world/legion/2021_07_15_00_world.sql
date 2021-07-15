-- Innkeeper fixes
DELETE FROM `world`.`gossip_menu_option` WHERE MenuId in (7468, 1291, 1293);

INSERT INTO `world`.`gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
-- Caregiver Chellan, Azure Watch Gossip fix. ( Closes Issue #54 )
(7468, 0, 0, 'Trick or Treat!', 10693, 1, 1, 0),
(7468, 2, 0, 'What can I do at an inn?', 4308, 1, 1, 26124),
(7468, 3, 5, 'Make this inn your home.', 2822, 8, 65536, 26124),
(7468, 4, 1, 'Let me browse your goods', 2823, 3, 128, 0),
-- Innkeepr Farnley, Goldshire Gossip fix'. ( Closes issue #55 )
(1291, 2, 0, 'What can I do at an inn?', 4308, 1, 1, 25881),
(1291, 3, 5, 'Make this inn your home.', 2822, 8, 65536, 25881),
(1291, 4, 1, 'Let me browse your goods', 3370, 3, 128, 25881),
-- Innkeeper Keldamyr, Dolanaar Gossip fix'. ( Closes issue #5 )
(1293, 1, 5, 'Make this inn my home.', 2822, 8, 65536, 0), 
(1293, 2, 1, 'I want to browse your goods.', 2823, 3, 128, 0);