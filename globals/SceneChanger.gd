extends CanvasLayer

@onready var color_rect = $ColorRect


signal game_entered
signal game_exited

var prve_scene:String


func change_scene(path:String):
	var tw = get_tree().create_tween()
	tw.tween_callback(color_rect.show)
	tw.tween_property(color_rect, "color:a", 1.0, 0.2)
	tw.tween_callback(_change_scene.bind(path))
	tw.tween_property(color_rect, "color:a", 0.0, 0.3)
	tw.tween_callback(color_rect.hide)


func _change_scene(path:String):
	# 如果转入的是设置菜单场景,记录进来的场景是哪个,好进行返回
	var current_scene = get_tree().current_scene
	if path == "res://scenes/gui/TitleMenu.tscn":
		prve_scene = current_scene.name
	
	
	var old_scene := get_tree().current_scene
	var new_scene := load(path).instantiate() as Node
	
	var root := get_tree().root
	root.remove_child(old_scene)
	root.add_child(new_scene)
	get_tree().current_scene = new_scene
	
	# 上个场景是否在游戏场景中
	var was_in_game := old_scene is Scene
	# 新场景是否在游戏场景中
	var is_in_game := new_scene is Scene
	
	if was_in_game != is_in_game:
		if is_in_game:
			emit_signal("game_entered")
		else:
			emit_signal("game_exited")
	
	old_scene.queue_free()
