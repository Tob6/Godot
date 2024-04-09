extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var click_power = ScoreNode.click_power;
	set_text("Click Power "+NumSuffix.number_with_suffix(click_power));
