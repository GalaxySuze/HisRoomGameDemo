extends CanvasLayer


func _ready():
	layer = 99

func _input(event):
	if !event.is_action_pressed("interact"):
		return
	
	var sprite := Sprite2D.new()
	add_child(sprite)
	sprite.texture = preload("res://resources/spirits/gui/click.svg")
	sprite.global_position = get_viewport().get_mouse_position()
	
	var tw := create_tween()
	tw.tween_property(sprite, "scale", Vector2.ONE, 0.3).from(Vector2.ONE * 0.9)
	tw.parallel().tween_property(sprite, "modulate:a", 1.0, 0.2).from(0.0)
	tw.tween_property(sprite, "modulate:a", 0.0, 0.3)
	tw.tween_callback(sprite.queue_free)
	
