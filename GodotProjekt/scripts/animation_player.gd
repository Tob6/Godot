extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	play("idle_apple")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_animation == "":
		play("idle_apple")

func play_click_animation():
	stop()
	play("click_apple")
	
