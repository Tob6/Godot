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
		"player_gold" = ScoreNode.player_gold,
		"player_diamonds" = ScoreNode.player_diamonds,
		"click_upgrade_mult" = ScoreNode.click_upgrade_mult,
		"passive1_upgrade_mult" = ScoreNode.passive1_upgrade_mult,
		"passive2_upgrade_mult" = ScoreNode.passive2_upgrade_mult,
		"passive3_upgrade_mult" = ScoreNode.passive3_upgrade_mult,
		"passive4_upgrade_mult" = ScoreNode.passive4_upgrade_mult,
		"passive5_upgrade_mult" = ScoreNode.passive5_upgrade_mult,
		"passive6_upgrade_mult" = ScoreNode.passive6_upgrade_mult,
		"passive7_upgrade_mult" = ScoreNode.passive7_upgrade_mult,
		"passive8_upgrade_mult" = ScoreNode.passive8_upgrade_mult
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
		ScoreNode.player_diamonds = node_data["player_diamonds"]
		ScoreNode.player_gold = node_data["player_gold"]
		ScoreNode.click_upgrade_mult = node_data["click_upgrade_mult"]
		ScoreNode.passive1_upgrade_mult = node_data["passive1_upgrade_mult"]
		ScoreNode.passive2_upgrade_mult = node_data["passive2_upgrade_mult"]
		ScoreNode.passive3_upgrade_mult = node_data["passive3_upgrade_mult"]
		ScoreNode.passive4_upgrade_mult = node_data["passive4_upgrade_mult"]
		ScoreNode.passive5_upgrade_mult = node_data["passive5_upgrade_mult"]
		ScoreNode.passive6_upgrade_mult = node_data["passive6_upgrade_mult"]
		ScoreNode.passive7_upgrade_mult = node_data["passive7_upgrade_mult"]
		ScoreNode.passive8_upgrade_mult = node_data["passive8_upgrade_mult"]
	
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
