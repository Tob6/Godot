extends Control


func _on_reward_countdown_timeout():
	$continue_button.visible = true;
	$continue_button.disabled = false;

func play_animation(price,price_node):
	#price ist ein element im prices string in fortune_wheel.gd
	#price noad ist so ein preload_scene gedöhns
	var price_instance = price_node.instantiate();
	price_instance.type = price.price;
	price_instance.set_tex(str(price.amount));
	$".".call_deferred("add_child",price_instance);	#kp was diese Zeile macht
