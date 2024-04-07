extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	#pass # Replace with function body.

func _on_continue_button_pressed():
	get_parent().remove_child(self);
