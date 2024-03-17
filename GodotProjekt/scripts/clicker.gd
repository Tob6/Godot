extends TextureButton


func _pressed():
	$"../AnimationPlayer".play_click_animation()
	ScoreNode.score_increase_active();
	$"../AchievementMenu".increase_total_clicks()
