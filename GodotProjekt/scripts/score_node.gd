extends Node

var score = 0

var click_power = 1.0;
var click_upgrade_mult = 1.0;
var passive1_upgrade_mult = 1.0;
var passive2_upgrade_mult = 1.0;
var passive3_upgrade_mult = 1.0;
var passive4_upgrade_mult = 1.0;
var passive5_upgrade_mult = 1.0;
var passive6_upgrade_mult = 1.0;
var passive7_upgrade_mult = 1.0;
var passive8_upgrade_mult = 1.0;
var passive_income = 0.0;

var player_gold = 0;
var player_diamonds = 0;


func score_increase(amount = click_power):
	score += amount;
func score_decrease(amount):
	score -= amount

func increase_passive_income(amount):
	passive_income += amount
func increase_click_power(amount):
	click_power += amount;

func increase_player_arbitrary(stat,amount):
	match stat:
		"apple":
			score_increase(amount);
		"gold":
			increase_player_gold(amount);
		"diamond":
			increase_player_diamonds(amount);
		_:
			pass;

func increase_player_gold(amount):
	player_gold += amount

func increase_player_diamonds(amount):
	player_diamonds += amount

func increase_upgrade_mult(type):
	match type:
		0:
			click_upgrade_mult *= 2.5;
		1:
			passive1_upgrade_mult *= 1.1;
		2:
			passive2_upgrade_mult *= 1.1;
		3:
			passive3_upgrade_mult *= 1.1;
		4:
			passive4_upgrade_mult *= 1.1;
		5:
			passive5_upgrade_mult *= 1.1;
		6:
			passive6_upgrade_mult *= 1.1;
		7:
			passive7_upgrade_mult *= 1.1;
		8:
			passive8_upgrade_mult *= 1.1;
func get_upgrade_mult(type):
	match type:
		0:
			return click_upgrade_mult;
		1:
			return passive1_upgrade_mult;
		2:
			return passive2_upgrade_mult;
		3:
			return passive3_upgrade_mult;
		4:
			return passive4_upgrade_mult;
		5:
			return passive5_upgrade_mult;
		6:
			return passive6_upgrade_mult;
		7:
			return passive7_upgrade_mult;
		8:
			return passive8_upgrade_mult;
	return passive1_upgrade_mult;
func double_click_power():
	click_power += click_power;
func _process(delta):
	score += passive_income * delta;
	#SaveSystem.save_game()
