extends Node


class Flags:
	signal changed
	
	var _flags := []
	
	func has(flag:String) -> bool:
		return flag in _flags

	func add(flag:String):
		if flag in _flags:
			return
		_flags.append(flag)
		emit_signal("changed")

	func get_all():
		return _flags


class Inventory:
	signal changed
	
	var _items := []
	
	func add_item(item:String):
		if item in _items:
			return
		_items.append(item)
		emit_signal("changed")
	
	
	func remove_item(item:String):
		var index := _items.find(item)
		if index == -1:
			return
		_items.remove_at(index)
		emit_signal("changed")
	
	
	func has_item(item:String) -> bool:
		return item in _items
		
		
	func get_all_item():
		return _items


var flags := Flags.new()
var inventory := Inventory.new()


var item_enum := {
	"dustbin":"垃圾桶",
	"bookshelf":"书架",
	"poster":"海报",
	"clock":"时钟",
	"youxiwang":"游戏王卡牌",
	"gameboy":"GameBoy",
	"slippers":"拖鞋",
	"photo_album":"相册",
	"scallion":"盆栽",
	"recorder":"录音机",
	"umbrella":"雨伞",
	"carpet":"地毯",
	"sofa":"沙发",
	"tissue":"纸巾盒",
}


func to_title_scene():
	SceneChanger.change_scene("res://scenes/gui/TitleMenu.tscn")
	
	
