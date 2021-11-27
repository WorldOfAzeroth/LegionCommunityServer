-- Orgrimmar guards direction fix. ( Closes issue #56 )
UPDATE creature_template SET gossip_menu_id = 1951 WHERE creature_template.entry = 3296;