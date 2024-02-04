extends Node

var apples = 100000.0;
var click_power = 1.0;
var passive_income = 0.0;


func _process(delta):
	apples+=passive_income*delta;
