extends Sprite2D

func _ready():
	var conx = get_parent().get_size().x
	var cony = get_parent().get_size().y
	
	scale.x = conx/texture.get_width()
	scale.y = cony/texture.get_height()
	
	position.x = (texture.get_width()*scale.x)/2
	position.y = (texture.get_height()*scale.y)/2
