extends VideoStreamPlayer

var played = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	stream = load("res://assets/videos/vid1.ogv")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (is_playing() == false) && (not played):
		play()
		played = true
