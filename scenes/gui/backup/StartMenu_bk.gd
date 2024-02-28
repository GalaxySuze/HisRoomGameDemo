extends Control


var center: Vector2
@onready var bg_dec_node = $BgDec # 存放背景装饰的节点

@onready var new = $BtnBar/New
@onready var load = $BtnBar/Load
@onready var setting = $BtnBar/Setting
@onready var quit = $BtnBar/Quit


func _ready():
	center = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2)
	
	SoundManager.play_music()
	SoundManager.bind_btn_sfx([new, load, setting, quit])
	

func _process(delta):
	var offset = center - get_global_mouse_position() * 0.1
	var tween = bg_dec_node.create_tween()
	tween.tween_property(bg_dec_node, "position", offset, 1.0)


func _on_item_rect_changed():
	# 窗口大小有发生变更的话,重新设置一下响应式效果的中心位置
	center = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2)
	if bg_dec_node != null:
		bg_dec_node.global_position = center


func _on_new_pressed():
	SceneChanger.change_scene("res://scenes/game/SceneA1.tscn")


func _on_load_pressed():
	pass


func _on_setting_pressed():
	SceneChanger.change_scene("res://scenes/gui/SettingMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
