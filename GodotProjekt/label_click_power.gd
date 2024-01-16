extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text("Click Power\n"+str(ScoreNode.click_power));
