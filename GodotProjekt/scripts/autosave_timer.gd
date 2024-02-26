extends Timer

func _on_timeout():
	SaveSystem.save_game()
