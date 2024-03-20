extends Button

#var scene_fortune_wheel: PackedScene;
var scene_fortune_wheel: PackedScene = preload("res://scenes/fortune_wheel.tscn")
@onready var fortune_wheel_is_loaded = false;
# Called when the node enters the scene tree for the first time.

func _on_button_down():
	if fortune_wheel_is_loaded == true:
		fortune_wheel_is_loaded = false;
		Global.main_node_scene.unload_scene();
		return;
	if fortune_wheel_is_loaded == false:
		fortune_wheel_is_loaded = true;
		Global.main_node_scene.load_scene('fortune_wheel');
		return;
