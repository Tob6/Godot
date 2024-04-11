extends Control

@onready var ad_player_scene: PackedScene = preload("res://scenes/ad_player.tscn")
@onready var first_time_fortune_wheel = false

func _process(_delta):
	$PanelContainer/VBoxContainer/TopBar/PanelContainer/HBoxContainer/GoldLabel.text = str(ScoreNode.player_gold)
	$PanelContainer/VBoxContainer/TopBar/PanelContainer2/HBoxContainer2/DiamondLabel.text = str(ScoreNode.player_diamonds)

func purchase(type, amount, price):
	$"../AchievementMenu".increase_money_spent(price);
	if type == "diamond":
		ScoreNode.increase_player_diamonds(amount)
	elif type == "gold":
		ScoreNode.increase_player_gold(amount)
		

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

func _on_ad_finished():
	fortune_wheel()
	
func fortune_wheel():
	var scene_fortune_wheel: PackedScene = preload("res://scenes/fortune_wheel.tscn")
	var node_fortune_wheel = Global.main_node_scene.load_scene('fortune_wheel');
	if(node_fortune_wheel != null):	#falls unerwarteter Fehler
		node_fortune_wheel.set_position(Vector2(700,550));
		$".".visible = false;
		#$"../Clicker".visible = false;	#risky das bietet sich an anderer Stelle besser an
		


func _on_wheel_button_pressed():
	if first_time_fortune_wheel == false:
		$PanelContainer/VBoxContainer/MarginContainer/OfferAndWheel/SpinTheWheel/MarginContainer/VBoxContainer/WheelButton.text = "Watch Ad!"
		first_time_fortune_wheel = true
		fortune_wheel()
	else:
		var ad_player_scene_instance = ad_player_scene.instantiate()
		ad_player_scene_instance.set_name("ad_player_scene")
		add_child(ad_player_scene_instance)
		
		var ad_player = get_node("ad_player_scene")
		ad_player.ad_finished.connect(_on_ad_finished)
	


func _on_exit_button_pressed():
	$".".visible = false


func _on_click_power_button_pressed():
	if ScoreNode.player_gold >= 20:
		ScoreNode.increase_click_power(1)
		ScoreNode.player_gold -= 20


func _on_passive_income_button_pressed():
	if ScoreNode.player_diamonds >= 5:
		ScoreNode.increase_passive_income(1)
		ScoreNode.player_diamonds -= 5
