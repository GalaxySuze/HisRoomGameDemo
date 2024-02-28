extends Control

@onready var content = $Content
@onready var go = $BtnMargin/Go
@onready var enter = $BtnMargin/Enter

var _text_id:int = 0
var _text_arr := [
	"但人生中的苦难，总是绵绵不绝，由始至终，以一种渗入骨髓的方式与人的生命共生着。
在这样强大的苦难之下，本来一死了之是一个很自然的选择。
但人却生来，有一个名为希望的生存本能。
希望有很多副产品，比如他会让人相信苦难的价值。
因为如若苦难没有价值，那么为何我们要承受。
但真相是，我们不得不承受。",

"他的房间中承载着关于他的一切，在这里选择如飞而去的他。
在坠落的时隙，记忆似乎也与引力发生着缠斗，天空与大地的分界如划破的流星炫目
晴空之上似乎真的有一颗灿耀的星星响应了他的选择。
你从灿耀中来到他的房间，房间中与他相关的一切忽然都赋予了自己的生命。
快与它们交流吧，或许你要的答案也在其中......"
]


func _ready():
	var tw := content.create_tween()
	tw.tween_property(content, "visible_ratio", 1, 6.0)
	tw.set_trans(Tween.TRANS_CUBIC)
	tw.tween_callback(go.show)
	
	
	SoundManager.bind_btn_sfx([go, enter])


func _on_go_pressed():
	go.hide()
	if _text_id == _text_arr.size() - 1:
		_writer(_text_arr[_text_id], false, true)
		return
	
	_writer(_text_arr[_text_id], true, false)
	_text_id += 1


func _on_enter_pressed():
	SceneChanger.change_scene("res://scenes/game/SceneA1.tscn")


func _writer(val:String = "", is_go:bool = true, is_enter:bool = true):
	if val:
		content.text = val
	
	var tw := content.create_tween()
	tw.tween_property(content, "visible_ratio", 0, 0)
	tw.tween_property(content, "visible_ratio", 1, 6.0)
	tw.set_trans(Tween.TRANS_CUBIC)
	
	if is_go:
		tw.tween_callback(go.show)
	if is_enter:
		tw.tween_callback(enter.show)






