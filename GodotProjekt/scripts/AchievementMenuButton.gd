extends TextureButton

func _on_pressed():
	var menu: Control = $"../AchievementMenu"
	menu.visible = !menu.visible
