extends Control


@onready var full_scene = %FullScene
@onready var window_scene = %WindowScene
@onready var back = %Back


func _ready():
	SoundManager.play_music()
	
	for btn in [full_scene, window_scene, back]:
		btn.pressed.connect(_on_btn_pressed)


func _on_btn_pressed():
	SoundManager.play_sfx(SoundManager.SFX_PRESSED)


func _on_full_scene_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	full_scene.hide()
	window_scene.show()


func _on_window_scene_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	full_scene.show()
	window_scene.hide()


func _on_back_pressed():
	SceneChanger.change_scene("res://scenes/gui/StartMenu.tscn")
