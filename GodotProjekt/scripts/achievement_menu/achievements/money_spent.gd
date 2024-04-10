extends MarginContainer

var money_spent: float = 0
@onready var progress_bar: ProgressBar = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar;
@onready var bar_text : RichTextLabel = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar/BarText;
# Called when the node enters the scene tree for the first time.
func _ready():
	#var progress_bar: ProgressBar = $MarginContainer/VBoxContainer/MarginContainer/ProgressBar
	progress_bar.max_value = 50.0
	progress_bar.min_value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	progress_bar.value = money_spent
	
	#mit .set_text funktioniert es nicht
	#dieses "[center]" ist ein bbcode, der muss in der RichTextLabel node enabled sein
	bar_text.clear();
	bar_text.append_text("[center]"+str(progress_bar.value) + " € / " + str(progress_bar.max_value) + " €");
