extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	if(get_meta("click_increase") > 0):
		set_text("%.0f 🍎" % (get_meta("cost") * ScoreNode.get_click_upgrades_mult()));
	else:
		if(get_meta("passive_increase") > 0):
			set_text("%.0f 🍎" % (get_meta("cost") * ScoreNode.get_passive_upgrades_mult()));
		else:
			set_text("Error: ScoreNode Script not loaded yet");
	# pass # Replace with function body.


func _pressed():	
	if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_click_upgrades_mult()) and (get_meta("click_increase") > 0)):
		ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_click_upgrades_mult())
		ScoreNode.double_click_power();
		ScoreNode.increase_click_upgrade_mult();
		set_text("%.0f 🍎" % (get_meta("cost") * ScoreNode.get_click_upgrades_mult()));
	if (ScoreNode.score >= (get_meta("cost") * ScoreNode.get_passive_upgrades_mult()) and (get_meta("passive_increase") > 0)):
		ScoreNode.score_decrease(get_meta("cost") * ScoreNode.get_passive_upgrades_mult())
		ScoreNode.increase_passive_income(get_meta("passive_increase"));
		ScoreNode.increase_passive_upgrade_mult();
		set_text("%.0f 🍎" % (get_meta("cost") * ScoreNode.get_passive_upgrades_mult()));

	else:
		print("Not enough Apples!")
