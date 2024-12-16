class_name Sun extends CharacterBody2D

var speed = 300
const TARGET_POS = Vector2(70, 38)
var product = 0

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if TARGET_POS.distance_to(global_position) <= 5:
		for listener in GameMain.on_sun_change_list:
			listener.call(product)
		queue_free()
	var dir = (TARGET_POS - global_position).normalized()
	velocity = dir * speed
	move_and_slide()
