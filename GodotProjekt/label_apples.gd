extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text("🍎\n"+str(floor($"..".apples))+"\n"+str(floor($"..".passive_income))+"🍎 per sec");
