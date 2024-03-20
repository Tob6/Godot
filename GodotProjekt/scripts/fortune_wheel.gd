extends Node2D

var selected = false;

var rotation_direction = 0;
var rotation_speed = 0;

var reference_position = Vector2(0,0);

func _process(delta):
	selected = false;

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Klick"):
		reference_position = get_global_mouse_position();
	if Input.is_action_pressed("Klick"):
		var current_pos = get_global_mouse_position();
		var x_comp_curr = (current_pos.x-global_position.x);
		var y_comp_curr = (current_pos.y-global_position.y);
		
		var x_comp_ref = (reference_position.x-global_position.x);
		var y_comp_ref = (reference_position.y-global_position.y);
		
		rotation_direction = (y_comp_curr/x_comp_curr - y_comp_ref/x_comp_ref);
		
	if Input.is_action_just_released("Klick"):
		rotation_speed = 100;
	
func _physics_process(delta):
	
	rotation += rotation_speed * rotation_direction * delta
	
	reduce_rotation();

func reduce_rotation():
	if(rotation_speed > 10):
		rotation_speed -= 0.125;
		return;
	if(rotation_speed > 0):
		rotation_speed -= 0.025;
		return;
	
func rotate_around_point(vec: Vector2, center: Vector2, angle:float) -> Vector2:
	var diff:Vector2 = vec - center
	diff = diff.rotated(angle)
	diff += center
	return diff






