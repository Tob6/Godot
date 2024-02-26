extends PanelContainer

signal total_clicks_sig_a(value)

var total_clicks: float = 0

func _ready():
	SaveSystem.total_clicks_sig.connect(_update_click)

func _update_click(value):
	total_clicks = value
	total_clicks_sig_a.emit(total_clicks)

func increase_total_clicks():
	total_clicks += 1
	$MarginContainer/achievement_menu/VBoxContainer/TimeSpentAchievement.total_clicks = total_clicks
