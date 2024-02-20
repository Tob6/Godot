extends Control

func _on_button_pressed():
	get_parent().remove_child(self)
