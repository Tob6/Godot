extends Control

signal purchase(type, amount, price)

func _ready():
	$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/AmountLabel.text = str(get_meta("amount")) + "x "
	$PanelContainer/MarginContainer/VBoxContainer/Button.text = get_meta("price") + "€"
	
	if get_meta("type") == "gold":
		$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/TypeSprite.texture = ResourceLoader.load("res://assets/textures/gold.png")
	elif get_meta("type") == "diamond":
		$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/TypeSprite.texture = ResourceLoader.load("res://assets/textures/diamond.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	purchase.emit(get_meta("type"), get_meta("amount"), get_meta("price"))
	
