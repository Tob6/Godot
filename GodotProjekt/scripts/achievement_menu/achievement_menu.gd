extends PanelContainer

var total_clicks: float = 0
var time_spent: float = 0

func increase_total_clicks():
	total_clicks += 1
	$MarginContainer/achievement_menu/VBoxContainer/TotalClicksAchievement.total_clicks = total_clicks
	
func _process(delta):
	time_spent += delta
	$MarginContainer/achievement_menu/VBoxContainer/TimeSpentAchievement.time_spent = time_spent
