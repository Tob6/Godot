extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var passive_income = ScoreNode.passive_income;
	set_text(NumSuffix.number_with_suffix(passive_income) + "🍎 per second");
