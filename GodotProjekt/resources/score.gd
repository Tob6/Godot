extends Node

func _ready():
	save_game()
	print(load_game())

func create_save():
	var save = {
		"score" = 0
	}
	return save
	
func save_game():
	var save_score = FileAccess.open("user://save_score.save", FileAccess.WRITE)
	
	var json_string = JSON.stringify(create_save())
	
	save_score.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://save_score.save"):
		return
	
	var save_score = FileAccess.open("user://save_score.save", FileAccess.READ)
	
	var node_data
	while save_score.get_position() < save_score.get_length():
		var json_string = save_score.get_line()
		var json = JSON.new()
		#var parse_result = json.parse(json_string)
		node_data = json.get_data()
		
	return node_data
