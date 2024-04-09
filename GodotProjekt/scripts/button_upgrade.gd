extends Button

func _process(_delta): # Updates Prices
	set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(get_meta("Type")), 1) + " 🍎" );
func _pressed():
	var type = get_meta("Type")
	if type == 0:
		if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(type))):
			ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(type))
			ScoreNode.double_click_power();
			ScoreNode.increase_upgrade_mult(type);
	else:
		if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(type))):
			ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(type))
			ScoreNode.increase_passive_income(get_meta("passive_increase"));
			ScoreNode.increase_upgrade_mult(type);
