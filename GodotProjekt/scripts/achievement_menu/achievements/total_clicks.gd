extends MarginContainer

var total_clicks = 0
func increase_total_clicks():
	total_clicks+=1
# Called when the node enters the scene tree for the first time.
func _ready():
	var progress_bar: ProgressBar = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar
	progress_bar.max_value = 1000
	progress_bar.min_value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progress_bar: ProgressBar = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar
	progress_bar.value = total_clicks

