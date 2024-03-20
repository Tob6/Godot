extends MarginContainer

var time_spent: float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var progress_bar : ProgressBar = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar
	progress_bar.max_value = 1000
	progress_bar.min_value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var progress_bar : ProgressBar = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar
	progress_bar.value = time_spent
