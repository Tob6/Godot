extends Node2D

var main_scene = self;
var scene_instance;


func _ready():
	Global.main_node_scene = self;
	load_game()

func create_save():
	#var total_clicks = 
	var save = {
		"score" = ScoreNode.score,
		"click_power" = ScoreNode.click_power,
		"passive_income" = ScoreNode.passive_income,
		"total_clicks" = $AchievementMenu.total_clicks,
		"time_spent" = $AchievementMenu.time_spent,
		"click_upgrade_mult" = ScoreNode.click_upgrade_mult,
		"passive_upgrade_mult" = ScoreNode.passive_upgrade_mult
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
		$AchievementMenu.total_clicks = node_data["total_clicks"]
		$AchievementMenu.time_spent = node_data["time_spent"]
		ScoreNode.click_upgrade_mult = node_data["click_upgrade_mult"]
		ScoreNode.passive_upgrade_mult = node_data["passive_upgrade_mult"]
	
	savegame.close()


func unload_scene():
	if (is_instance_valid(scene_instance)):
		scene_instance.queue_free();
	scene_instance = null;

func load_scene(scene_name : String):
	unload_scene()
	var scene_path := "res://scenes/%s.tscn" % scene_name
	var scene_resource := load(scene_path)
	if(scene_resource):
		scene_instance = scene_resource.instantiate()
		main_scene.add_child(scene_instance)
