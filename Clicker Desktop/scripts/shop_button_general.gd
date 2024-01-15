extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	print("metadata/amount")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_down():	
	if Score.score >= get_meta("cost"):
		Score.score_decrease_flat(get_meta("cost"))
		Score.flat_increase += get_meta("Click_increase")
		
		Score.increase_multiplier(get_meta("Passive_Increase"))
	else:
		print("Not enough Apples!")
