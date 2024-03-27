extends Node2D



var prices = [
	{"price": "apple", "amount":500},
	{"price": "gold", "amount":500},
	{"price": "apple", "amount":500},
	{"price": "apple", "amount":500},
	{"price": "apple", "amount":500},
	{"price": "apple", "amount":500},
	{"price": "apple", "amount":500},
	{"price": "apple", "amount":500}
];


var rotation_direction = 0;
var rotation_speed = 0;

var is_spinning = false;		#true, when wheel is spinning definitively
var spinning_finished = false;

var mouse_drag = false;			#True, when wheel is following mouse direction
var reference_pos = Vector2(0,0);
var reference_pos_angle = 0.0;
var current_pos = Vector2(0,0);
var current_pos_angle = 0.0;

#func _process(_delta):
#	mouse_drag = false;


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	#The input variables aren't processed right here but are necessary for Godot built in Functionalities -> don't dlt them!
	if Input.is_action_just_pressed("Klick"):
		if(!is_spinning):
			mouse_drag = true;
			reference_pos = get_global_mouse_position();
			print("just pressed");
	if Input.is_action_pressed("Klick"):
		#this code will be executed whenever the mouse state is changed (i.e. mouse position changes) and has been already pressed
		if(!is_spinning):
			mouse_drag = true;
	if Input.is_action_just_released("Klick"):
		if(!is_spinning):
			rotation_speed = randf_range(15.0, 25.0);
			mouse_drag = false;				#Redundant
			is_spinning = true;
	
func _physics_process(delta):
	#drag wheel behind mouse
	if(mouse_drag):
		reference_pos_angle = reference_pos.angle_to_point(global_position);
		current_pos = get_global_mouse_position();
		current_pos_angle = current_pos.angle_to_point(global_position);
		
		rotation_direction = 1 if(angle_difference(reference_pos_angle,current_pos_angle) > 0) else -1;
		
		var amount_angle_difference = abs(angle_difference(current_pos_angle,reference_pos_angle));
		if(amount_angle_difference > 0.0625):
			rotation_speed = 5.0 * amount_angle_difference;
		else:
			rotation_speed = 0.0;
	
	#rotation in rad
	var rotation_delta = rotation_speed * rotation_direction * delta;
	rotation += rotation_delta;
	reference_pos = (reference_pos-global_position).rotated(rotation_delta)+global_position;#Rotate around point global_position by angle of rotation_delta rad
	
	if(is_spinning):
		reduce_rotation();

func reduce_rotation():
	if(rotation_speed < 0):
		rotation_speed = 0;
		spinning_finished = true;
	if(rotation_speed > 5):
		rotation_speed -= randf_range(0.05, 0.075)#0.075;
		return;
	if(rotation_speed > 1):
		rotation_speed -= randf_range(0.0125,0.025);#0.025;
		return;
	if(rotation_speed > 0):
		rotation_speed -= 0.005;
		return;
	

func _draw():
	for element in prices:
		prices
	
