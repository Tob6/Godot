extends TextureButton

func _pressed():
	ScoreNode.score_increase_active();
