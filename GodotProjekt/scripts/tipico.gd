extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	$"../Clicker".visible = false;
	#pass # Replace with function body.

func shut_fortune_wheel():
	$"../Clicker".visible = true;
	get_parent().remove_child(self);

func _on_continue_button_pressed():
	shut_fortune_wheel();


func _on_forced_continue_countdown_timeout():
	shut_fortune_wheel();
