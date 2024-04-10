extends MarginContainer


var time_spent: float = 0
@onready var progress_bar : ProgressBar = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar
@onready var bar_text : RichTextLabel = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar/BarText;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass;
	# das hier lässt sich gleich in Node>Inspektor einstellen
	#var progress_bar : ProgressBar = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar
	#progress_bar.max_value = 1000
	#progress_bar.min_value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	progress_bar.value = time_spent
	
	#das ganze funktioniert mit .set_text nicht
	#dieses "[center]" ist ein bbcode, der muss in der RichTextLabel node enabled sein
	bar_text.clear();
	bar_text.append_text("[center]"+str(floor(time_spent)) + " s / " + str(progress_bar.max_value) + " s")
