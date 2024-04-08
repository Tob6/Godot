extends PanelContainer

var total_clicks: float = 0
var time_spent: float = 0
var ads_watched: float = 0;
var wheels_spun: float = 0;
var rewards_gotten: float = 0;
var money_spent: float = 0;		#€ runden auf 2 Nachkommas

func increase_total_clicks():
	total_clicks += 1
	$MarginContainer/achievement_menu/VBoxContainer/TotalClicksAchievement.total_clicks = total_clicks

func increase_ads_watched():
	ads_watched += 1;
	$MarginContainer/achievement_menu/VBoxContainer2/AdsWatchedAchievement.ads_watched = ads_watched;
func increase_wheels_spun():
	wheels_spun += 1;
	$MarginContainer/achievement_menu/VBoxContainer2/WheelsSpunAchievement.wheels_spun = wheels_spun;
func increase_money_spent(amount):
	amount = float(amount); #make sure we don't get a string handed over ;
	money_spent += amount;
	$MarginContainer/achievement_menu/VBoxContainer/MoneySpentAchievement.money_spent = money_spent;
func _process(delta):
	time_spent += delta
	$MarginContainer/achievement_menu/VBoxContainer/TimeSpentAchievement.time_spent = time_spent
