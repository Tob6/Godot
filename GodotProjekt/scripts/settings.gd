extends Control

@onready var bg_music = $"../BackgroundMusic"
var volume;
@onready var music_slider = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/MusicSlider;

func _on_quit_button_pressed():
	get_tree().quit()


func _on_save_button_pressed():
	$"..".save_game()


func _process(_delta):
	
	volume = music_slider.value;
	bg_music.volume_db = volume; # = int(volume);
