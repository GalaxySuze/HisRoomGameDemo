extends Control


@onready var btn_box = %BtnBox
@onready var question = %Question
@onready var msg = %Msg


var _questions := [
	"[center]1. 能推测出他[color=#FF6616]职业[/color]的线索是哪个？",
	"[center]2. 通过哪个物品可以知道他的[color=#FF6616]家庭经历[/color]？",
	"[center]3. 他的[color=#FF6616]情感状况[/color]相关线索是什么？",
	"[center]4. 他的[color=#FF6616]年龄[/color]和哪个线索有关？",
]
var _answer := ["书架", "拖鞋", "垃圾桶", "相册",]
var _current_question_idx:int = 0
var _picked_items := []
var _items_count:int = 0


func _ready():
	question.text = _questions[_current_question_idx]
	
	# 通过点击过的道具,生成道具按钮
	_picked_items = Game.inventory.get_all_item()
	_items_count = _picked_items.size()
	if _items_count < 1:
		unpicked_tips()
	else :
		for picked in _picked_items:
			var btn = Button.new()
			btn.text = picked
			btn.name = picked
			#btn.add_theme_font_size_override("font_size", 38)
			btn.pressed.connect(_on_prop_btn_pressed.bind(picked))
			btn_box.add_child(btn)
			

func _on_prop_btn_pressed(prop_name:String):
	SoundManager.play_sfx(SoundManager.SFX_PRESSED)
	
	var prop_item = get_node("BottonMargin/BtnBox/%s"%prop_name)
	
	if prop_name == _answer[_current_question_idx]:
		_items_count -= 1
		prop_item.hide()
		
		# 判断是否最后一题
		if _current_question_idx >= _questions.size() - 1:
			# 问题回答结束
			end_answer()
			return
		
		# 进入一下题
		_current_question_idx += 1
		question.text = _questions[_current_question_idx]
		
		# 无道具选项了提示继续收集线索
		if _items_count < 1:
			unpicked_tips()
	else:
		msg_prompt("不对哦~")
		

func end_answer():
	question.text = "[center][color=#FF6616]第一幕: 弥留的灿星 待续...[/color][/center]"
	btn_box.hide()


func unpicked_tips():
	var tips_node = get_node_or_null("BottonMargin/BtnBox/UnpickedTips")
	if tips_node:
		tips_node.queue_free()
	
	var btn = Button.new()
	btn.name = "UnpickedTips"
	btn.text = "没有更多的线索了，请点击场景中的道具获取推测线索~"
	btn.disabled = true
	btn.add_theme_color_override("font_disabled_color", Color("#888888"))
	btn_box.add_child(btn)


func msg_prompt(text:String):
	msg.text = "[shake][center][color=#FF6616][font_size=42]%s[/font_size][/color][/center][/shake]"%text
	var tw = msg.create_tween()
	tw.tween_callback(msg.show)
	tw.tween_property(msg, "position", Vector2(0, 460), 0.9)
	tw.tween_callback(msg.hide)
	

func _on_back_pressed():
	SoundManager.play_sfx(SoundManager.SFX_PRESSED)
	SceneChanger.change_scene("res://scenes/game/SceneA1.tscn")
