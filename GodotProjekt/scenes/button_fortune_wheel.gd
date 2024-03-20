extends Button

#var scene_fortune_wheel: PackedScene;
var scene_fortune_wheel: PackedScene = preload("res://scenes/fortune_wheel.tscn")
# Called when the node enters the scene tree for the first time.

func _on_button_down():
	Global.main_node_scene.load_scene('fortune_wheel');
	#var fortune_wheel = scene_fortune_wheel.instantiate()
	#fortune_wheel.set_name("scene_fortune_wheel")
	#get_parent().add_child(fortune_wheel)
	#get_tree().change_scene("res://scenes/fortune_wheel.tscn")
