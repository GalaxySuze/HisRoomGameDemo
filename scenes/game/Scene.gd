extends Sprite2D
class_name Scene


const Balloon = preload("res://scenes/dialogue/balloon.tscn")


func _ready():
	var tween := get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2.ONE, 0.3).from(Vector2.ONE * 1.05)
