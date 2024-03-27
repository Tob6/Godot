extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var score = ScoreNode.score;
	#"NumSuffix" is autoload object; loads in "num_suffix_formatting.gd"
	set_text(NumSuffix.number_with_suffix(score, 0) + " 🍎");
