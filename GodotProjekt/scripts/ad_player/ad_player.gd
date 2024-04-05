extends Control

func _ready():
	var rng = RandomNumberGenerator.new()
	
	var viewport_size = get_viewport().get_visible_rect().size;
	var button_scale =$close.scale;
	var button_size = $close/close_button.size * button_scale;
	
	#random position of button
	var pos_left = Vector2(0,0);
	var pos_right = Vector2(viewport_size.x-button_size.x, 0);
	
	var ran_num = rng.randi_range(0,1);
	
	var pos_1;
	var pos_2;
	
	if(ran_num==0):
		pos_1 = pos_right;
		pos_2 = pos_left;
	
	if(ran_num==1):
		pos_1 = pos_left;
		pos_2 = pos_right;
	$close.set_position(pos_1);
	
	#only works when both "close" and "continue" buttons are identical in size (and scale)
	$continue.set_position(pos_2);

func _on_continue_button_pressed():
	#continue button was pressed -> continue on to "download this app image"
	$MarginContainer/VideoStreamPlayer.stop();
	$continue.visible = false;
	$continue/continue_button.disabled = true;
	
	$close.visible = true;
	$close/close_button.disabled = false;
	$close/close_countdown.start();	#start timer


func _on_close_button_pressed():
	#closing button was pressed
	get_parent().remove_child(self)



func _on_close_countdown_timeout():
	#$close.visible = true;
	$close/close_button.visible = true;
	$close/close_button.disabled = false;
	$close/countdown_label.visible = false;

func _on_continue_countdown_timeout():
	#countdown des continue buttons
	#enable pressing continue button
	$continue.visible = true;
	$continue/continue_button.disabled = false;
