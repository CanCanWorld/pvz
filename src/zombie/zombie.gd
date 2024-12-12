class_name Zombie extends CharacterBody2D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	velocity.x = -30
	move_and_slide()
