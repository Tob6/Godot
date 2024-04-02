extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func purchase(type, amount, price):
	pass

func _on_offer_purchase(type, amount, price):
	purchase(type, amount, price)


func _on_gold_1_purchase(type, amount, price):
	purchase(type, amount, price)


func _on_gold_2_purchase(type, amount, price):
	purchase(type, amount, price)


func _on_gold_3_purchase(type, amount, price):
	purchase(type, amount, price)


func _on_diamond_1_purchase(type, amount, price):
	purchase(type, amount, price)


func _on_diamond_2_purchase(type, amount, price):
	purchase(type, amount, price)


func _on_diamond_3_purchase(type, amount, price):
	purchase(type, amount, price)
