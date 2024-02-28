extends CanvasLayer


func _ready():
	SceneChanger.game_entered.connect(show)
	SceneChanger.game_exited.connect(hide)
	visible = get_tree().current_scene is Scene


func _on_menu_pressed():
	Game.to_title_scene()


func _on_infer_pressed():
	SceneChanger.change_scene("res://scenes/game/InferScene.tscn")
