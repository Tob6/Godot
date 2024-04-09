extends Control

func _on_quit_button_pressed():
	get_tree().quit()


func _on_save_button_pressed():
	$"..".save_game()
