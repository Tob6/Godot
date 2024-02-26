extends TextureButton


func _pressed():
	ScoreNode.score_increase_active();
	$"../AchievementMenu".increase_total_clicks()
