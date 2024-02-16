extends Button

var scene: PackedScene = preload("res://scenes/ad_player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	var scene_instance = scene.instantiate()
	scene_instance.set_name("scene")
	$"..".add_child(scene_instance)
