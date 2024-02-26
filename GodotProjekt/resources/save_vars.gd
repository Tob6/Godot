extends Node
#Time Spent Achievement
var time_spent = 0 : set = set_time_spent, get = get_time_spent

func set_time_spent(value):
	time_spent = value
	
func get_time_spent():
	return time_spent

#Total Clicks Achievement
var total_clicks = 0 : set = set_total_clicks, get = get_total_clicks

func set_total_clicks(value):
	total_clicks = value
	
func get_total_clicks():
	return total_clicks
