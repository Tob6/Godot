extends Button

var scene: PackedScene = preload("res://scenes/ad_player.tscn")
# Called when the node enters the scene tree for the first time.

func _on_button_down():
	var scene_instance = scene.instantiate()
	scene_instance.set_name("scene")
	get_parent().add_child(scene_instance)
