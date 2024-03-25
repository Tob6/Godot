extends Node

var score = 0

var click_power = 1.0;
var click_upgrade_mult = 1;
var passive_upgrade_mult = 1;
var passive_income = 0.0;


#func score_increase_arbitrary(amount):
#	score += amount;


func score_increase_active():
	score += click_power;
func score_decrease(amount):
	score -= amount

func increase_passive_income(amount):
	passive_income += amount###!!
func increase_passive_upgrade_mult():
	passive_upgrade_mult += passive_upgrade_mult;
func get_passive_upgrades_mult():
	return passive_upgrade_mult;
func double_click_power():
	click_power += click_power;
func increase_click_upgrade_mult():
	click_upgrade_mult += 2*click_upgrade_mult;
func get_click_upgrades_mult():
	return click_upgrade_mult;




func _process(delta):
	score += passive_income * delta;
	#SaveSystem.save_game()
