extends Node2D

#@onready var spr_apple = get_node("apple");
#@onready var spr_gold = get_node("gold");
#@onready var spr_diamond = get_node("diamond");

#var apple = preload("res://scenes/fortune_wheel/apple.tscn");
#var gold = preload("res://scenes/fortune_wheel/gold.tscn");
#var diamond = preload("res://scenes/fortune_wheel/diamond.tscn");

var price_node = preload("res://scenes/fortune_wheel/wheel_price.tscn");

var prices = [
	{"price": "apple", "amount":10000,  "instance": null },
	{"price": "gold", "amount":10, "instance": null},
	{"price": "gold", "amount":15, "instance": null},
	{"price": "apple", "amount":50, "instance": null},
	{"price": "apple", "amount":1000, "instance": null},
	{"price": "apple", "amount":5000, "instance": null},
	{"price": "apple", "amount":2000, "instance": null},
	{"price": "diamond", "amount":1, "instance": null}
];

var rotation_direction = 0;
var rotation_speed = 0;

var is_spinning = false;		#true, when wheel is spinning definitively
var spinning_finished = false;
var rewarded = false;

var mouse_drag = false;			#True, when wheel is following mouse direction
var reference_pos = Vector2(0,0);
var reference_pos_angle = 0.0;
var current_pos = Vector2(0,0);
var current_pos_angle = 0.0;

func _ready():
	instantiate_prices();
	
func _process(_delta):
	if(spinning_finished && !rewarded):
		reward();
		rewarded = true;
		print("rewarded");



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
		#is_spinning = false;
		spinning_finished = true;
		print("spinning finished");
		return;
	if(rotation_speed > 5):
		rotation_speed -= randf_range(0.05, 0.075)#0.075;
		return;
	if(rotation_speed > 1):
		rotation_speed -= randf_range(0.0125,0.025);#0.025;
		return;
	if(rotation_speed > 0):
		rotation_speed -= 0.005;
		return;
	

func instantiate_prices():
	#for price in prices:
	for i in range(prices.size()):
		var angle_grad = 360.0/prices.size() * i;
		var angle_rad = angle_grad * PI / 180;
		
		var price = prices[i];				#returns element in prices array
		#var price_node = price.node;		#returns apple.tscn; gold.tscn etc.
		var price_instance = price_node.instantiate();
		price.instance = price_instance;
		price_instance.position = Vector2(cos(angle_rad)*150,sin(angle_rad)*150);
		price_instance.rotation = angle_rad; #+ 90.0;
		price_instance.type = price.price;
		$".".call_deferred("add_child",price_instance);	#kp was diese Zeile macht
		price_instance.set_tex(str(price.amount));


func reward():
	print("rotation:" + str(rotation_degrees));
	
	rotation_degrees = fmod(rotation_degrees,360.0);
	print("rotation aus degrees:" + str(rotation_degrees));
	print("actual rotation" + str(rotation));
	var tmp_rotation = 360.0 - rotation_degrees;
	print("tmprotation:" + str(tmp_rotation));

	var price_index = floor(tmp_rotation/(360.0/prices.size()))
	print("index: " + str(price_index));
	
	var price = prices[price_index];
	
	ScoreNode.score_increase_active(price.amount);
	print("given reward");

func is_inside(angle,sector):
	#is schon drienn?
	#secotr must be array of 2 elements
	# all values is angle in rad
	if(angle >= sector[0] && angle < sector[1]):
		return true;
	return false;
