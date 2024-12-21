class_name PeaBullet extends Bullet

@onready var anim: AnimatedSprite2D = $anim

func _ready() -> void:
	anim.play("default")
	pass


func _process(delta: float) -> void:
	var zombie : Zombie = get_tree().get_first_node_in_group("zombie")
	var dir = Vector2(1, 0)
	velocity = dir * speed
	move_and_slide()

func hit():
	speed = 0
	anim.play("hit")

func _on_anim_animation_finished() -> void:
	if anim.animation == "hit":
		queue_free()
