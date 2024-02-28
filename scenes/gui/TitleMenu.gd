extends TextureRect

@onready var back = $Back
@onready var start = $Start
@onready var quit = $Quit


func _ready():
	SoundManager.bind_btn_sfx([back, start, quit])
	

func _on_start_pressed():
	SceneChanger.change_scene("res://scenes/gui/StartMenu.tscn")


func _on_back_pressed():
	var backScene := "res://scenes/gui/StartMenu.tscn"
	if SceneChanger.prve_scene:
		backScene = "res://scenes/game/%s.tscn" % SceneChanger.prve_scene
	SceneChanger.change_scene(backScene)


func _on_quit_pressed():
	get_tree().quit()
