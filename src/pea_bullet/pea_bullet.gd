class_name PeaBullet extends CharacterBody2D

var speed = 100

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	var zombie : Zombie = get_tree().get_first_node_in_group("zombie")
	var dir = (zombie.global_position - global_position).normalized()
	velocity = dir * speed
	move_and_slide()
