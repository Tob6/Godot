extends VideoStreamPlayer

var rng = RandomNumberGenerator.new()
var played = false
signal played_signal
# Called when the node enters the scene tree for the first time.
func _ready():
	var load_list = []
	load_list.append("res://assets/videos/WerbungTest1.ogv")
	load_list.append("res://assets/videos/WerbungTest2.ogv")
	load_list.append("res://assets/videos/WerbungTest3.ogv")
	load_list.append("res://assets/videos/WerbungTest4.ogv")
	stream = load(load_list[rng.randf_range(0,len(load_list))])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (is_playing() == false) && (not played):
		play()
		played = true
	
	if (is_playing() == false) && (played):
		$"../Button".visible = true
		played_signal.emit()
