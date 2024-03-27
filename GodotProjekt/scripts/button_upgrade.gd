extends Button

func _process(delta): # Updates Prices
	if(get_meta("click_increase") > 0):
		set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_click_upgrades_mult(), 1) + " 🍎" );
	else:
		if(get_meta("passive_increase") > 0):
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_passive_upgrades_mult()) +" 🍎");
		else:
			set_text("Error: Cannot calculate price");


func _pressed():	
	if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_click_upgrades_mult()) and (get_meta("click_increase") > 0)):
		ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_click_upgrades_mult())
		ScoreNode.double_click_power();
		ScoreNode.increase_click_upgrade_mult();
	if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_passive_upgrades_mult()) and (get_meta("passive_increase") > 0)):
		ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_passive_upgrades_mult())
		ScoreNode.increase_passive_income(get_meta("passive_increase"));
		ScoreNode.increase_passive_upgrade_mult();

	else:
		print("Not enough Apples!")
