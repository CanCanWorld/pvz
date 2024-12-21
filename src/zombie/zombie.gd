class_name Zombie extends CharacterBody2D

@onready var hp_bar: ProgressBar = $hp_bar

const MAX_HP = 100
var hp = 0
var attack = 10
var speed = 15

func _ready() -> void:
	init()
	pass

func init():
	hp = MAX_HP
	hp_bar.value = 100

func _process(delta: float) -> void:
	velocity.x = -speed
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bullet:
		hurt(body)

func hurt(bullet: Bullet):
	hp -= bullet.hurt
	hp = max(0, hp)
	hp_bar.value = 100 * hp / MAX_HP
	bullet.hit()
	if hp <= 0:
		queue_free()
