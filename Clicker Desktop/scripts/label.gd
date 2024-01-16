extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Score.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Score: " + str(floor(Score.score))
