extends PanelContainer

var total_clicks: float = 0
var time_spent: float = 0

func _ready():
	total_clicks = SaveVars.get_total_clicks()
	time_spent = SaveVars.get_time_spent()
	$MarginContainer/achievement_menu/VBoxContainer/TotalClicksAchievement.total_clicks = total_clicks

func increase_total_clicks():
	total_clicks += 1
	$MarginContainer/achievement_menu/VBoxContainer/TotalClicksAchievement.total_clicks = total_clicks
	SaveVars.set_total_clicks(total_clicks)
	
func _process(delta):
	time_spent += delta
	SaveVars.set_time_spent(time_spent)
	$MarginContainer/achievement_menu/VBoxContainer/TimeSpentAchievement.time_spent = time_spent
