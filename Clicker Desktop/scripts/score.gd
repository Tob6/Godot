extends Node

var score = 1000
var flat_increase = 1
var passive_counter_absolute = 0
var multiplier = 0

func score_increase():
	score += flat_increase

func score_decrease_flat(amount): 
	score -= amount

func increase_multiplier(amount):
	multiplier += amount

func _process(delta):
	score += multiplier * (delta) #per second
	
