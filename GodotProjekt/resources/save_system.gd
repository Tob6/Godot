extends Node

func create_save():
	#var total_clicks = 
	var save = {
		"score" = ScoreNode.score,
		"click_power" = ScoreNode.click_power,
		"passive_income" = ScoreNode.passive_income,
		"total_clicks" = SaveVars.get_total_clicks(),
		"time_spent" = SaveVars.get_time_spent()
	}
	return save
	
func delete_save():
	DirAccess.remove_absolute("user://savegame.save")

func save_game():
	var savegame = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(create_save())
	savegame.store_line(json_string)
	savegame.close()

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var savegame = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while savegame.get_position() < savegame.get_length():
		var json_string = savegame.get_line()
		var json = JSON.new()
		json.parse(json_string)
		var node_data = json.get_data()
		
		ScoreNode.score = node_data["score"]
		ScoreNode.passive_income = node_data["passive_income"]
		ScoreNode.click_power = node_data["click_power"]
		SaveVars.set_total_clicks(node_data["total_clicks"])
		SaveVars.set_time_spent(node_data["time_spent"])
	
	savegame.close()
