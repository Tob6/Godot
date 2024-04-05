extends Label

func _process(_delta):
	var timer = $"../close_countdown";
	text = str(floor(timer.time_left));

#func _on_countdown_timeout():
	#visible = false;


#func _on_close_countdown_timeout():
	#visible = false;
