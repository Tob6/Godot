extends TextureButton


func _on_pressed():
	$"../Settings".visible = !$"../Settings".visible
