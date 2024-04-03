extends Control

signal ad_finished

func _on_button_pressed():
	get_parent().remove_child(self)
	ad_finished.emit()
