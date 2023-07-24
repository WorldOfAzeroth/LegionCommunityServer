update gossip_menu_option set BoxText=null, BoxMoney=0
where BoxText like 'Are you sure you wish to purchase a Dual Talent Specialization?'
  and BoxMoney=100000
  and OptionText <> 'I wish to know about Dual Talent Specialization.';