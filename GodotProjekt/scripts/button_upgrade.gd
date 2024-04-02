extends Button

func _process(delta): # Updates Prices
	match get_meta("Type"):
		0:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(0), 1) + " 🍎" );
		1:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(1)) +" 🍎");
		2:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(2)) +" 🍎");
		3:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(3)) +" 🍎");
		4:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(4)) +" 🍎");
		5:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(5)) +" 🍎");
		6:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(6)) +" 🍎");
		7:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(7)) +" 🍎");
		8:
			set_text(NumSuffix.number_with_suffix(get_meta("cost") * ScoreNode.get_upgrade_mult(8)) +" 🍎");
func _pressed():
	match get_meta("Type"):
		0:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(0))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(0))
				ScoreNode.double_click_power();
				ScoreNode.increase_upgrade_mult(0);
		1:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(1))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(1))
				ScoreNode.increase_passive_income(get_meta("passive_increase"));
				ScoreNode.increase_upgrade_mult(1);
		2:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(2))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(2))
				ScoreNode.increase_passive_income(get_meta("passive_increase"));
				ScoreNode.increase_upgrade_mult(2);
		3:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(3))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(3))
				ScoreNode.increase_passive_income(get_meta("passive_increase"));
				ScoreNode.increase_upgrade_mult(3);
		4:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(4))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(4))
				ScoreNode.increase_passive_income(get_meta("passive_increase"));
				ScoreNode.increase_upgrade_mult(4);
		5:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(5))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(5))
				ScoreNode.increase_passive_income(get_meta("passive_increase"));
				ScoreNode.increase_upgrade_mult(5);
		6:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(6))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(6))
				ScoreNode.increase_passive_income(get_meta("passive_increase"));
				ScoreNode.increase_upgrade_mult(6);
		7:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(7))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(7))
				ScoreNode.increase_passive_income(get_meta("passive_increase"));
				ScoreNode.increase_upgrade_mult(7);
		8:
			if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_upgrade_mult(8))):
				ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_upgrade_mult(8))
				ScoreNode.increase_passive_income(get_meta("passive_increase"));
				ScoreNode.increase_upgrade_mult(8);
