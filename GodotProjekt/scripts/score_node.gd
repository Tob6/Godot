extends Node

var score = 0

var click_power = 1.0;
var passive_income = 0.0;

var player_gold = 0;
var player_diamonds = 0;


#func score_increase_arbitrary(amount):
#	score += amount;


func score_increase_active(amount = click_power):
	score += amount;
func score_decrease(amount):
	score -= amount

func increase_passive_income(amount):
	passive_income += amount
func increase_click_power(amount):
	click_power += amount;

func increase_player_gold(amount):
	player_gold += amount

func increase_player_diamonds(amount):
	player_diamonds += amount



func _process(delta):
	score += passive_income * delta;
	#SaveSystem.save_game()
