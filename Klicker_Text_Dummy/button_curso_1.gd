extends Button

var cost = 50.0;
@onready
var main_node = get_node("../../..");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _pressed():
	if(floor(main_node.apples)>=cost):
		main_node.apples-=cost;
		main_node.click_power+=1.0;
