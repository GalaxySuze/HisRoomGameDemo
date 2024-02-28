extends Interactable
class_name StageProp


@export var prop_name:String
@export var click_count:int = 1
@export var dialogue_res:DialogueResource
@export var dialogue_start:String


# 点击次数
var _click_num:int = 0


func _interact():
	super._interact()
	
	if Game.flags.has(_get_flag()):
		# 非运行多次交互才触发任务的道具只标记一次
		if click_count < 2:
			return
		# 交互次数大于允许交互次数后,停止标记
		if _click_num > click_count:
			return
	
	# 已交互过的道具,标记状态
	_click_num += 1
	Game.flags.add(_get_flag())
	
	var item_name:String = _get_item_name(prop_name)
	if !Game.inventory.has_item(item_name):
		Game.inventory.add_item(item_name)


func _get_flag() -> String:
	return "picked:" + prop_name + ":" + str(_click_num)
	

func _get_item_name(item:String) -> String:
	return Game.item_enum.get(item, "unknown")
