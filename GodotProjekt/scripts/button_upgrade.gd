extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	print("metadata/amount")
	pass # Replace with function body.


func _pressed():	
	if ScoreNode.score >= get_meta("cost"):
		ScoreNode.score_decrease(get_meta("cost"))
		ScoreNode.increase_click_power(get_meta("click_increase"));
		ScoreNode.increase_passive_income(get_meta("passive_increase"))

	else:
		print("Not enough Apples!")
