extends Sprite2D

var label = preload("res://scenes/fortune_wheel/text_label.tscn");

var type;

func _ready():
	
	
	var sprite = load("res://assets/textures/" + str(type) + ".png");
	texture = sprite;

func set_tex(text):
	var price_label = label.instantiate();
	price_label.text = text;
	$".".call_deferred("add_child",price_label);
