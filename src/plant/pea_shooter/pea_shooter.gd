class_name PeaShooter extends Plant

const PEA_BULLET = preload("res://src/pea_bullet/pea_bullet.tscn")

@onready var attack_timer: Timer = $attack_timer
@onready var attack_mark: Marker2D = $attack_mark

var zombies : Array[Zombie] = []

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func set_plant_type(plant_type: PlantType):
	print(plant_type.code)
	self.plant_type = plant_type
	plants_anim.animation = plant_type.code
	if plant_type.attack_cd != 0:
		attack_timer.wait_time = plant_type.attack_cd
		attack_timer.start()

func _on_attack_timer_timeout() -> void:
	if zombies.size() <= 0: return
	var pea_bullet : PeaBullet = PEA_BULLET.instantiate()
	get_tree().root.add_child(pea_bullet)
	pea_bullet.global_position = attack_mark.global_position


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Zombie:
		zombies.append(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Zombie:
		zombies.remove_at(zombies.find(body))
