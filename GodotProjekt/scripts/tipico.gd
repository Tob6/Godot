extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	$"../Clicker".visible = false;
	#pass # Replace with function body.

func _on_continue_button_pressed():
	$"../Clicker".visible = true;
	get_parent().remove_child(self);
