extends Control


@onready var start = $Start
@onready var setting = $Setting
@onready var quit = $Quit


func _ready():
	SoundManager.play_music()
	SoundManager.bind_btn_sfx([start, setting, quit])


func _on_start_pressed():
	SceneChanger.change_scene("res://scenes/game/Typewriter.tscn")


func _on_load_pressed():
	pass


func _on_setting_pressed():
	SceneChanger.change_scene("res://scenes/gui/SettingMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
