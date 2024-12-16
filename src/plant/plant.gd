class_name Plant extends Node2D

const PEA_BULLET = preload("res://src/pea_bullet/pea_bullet.tscn")
const SUN = preload("res://src/sun/sun.tscn")

@onready var plants_anim: AnimatedSprite2D = $plants_anim
@onready var attack_timer: Timer = $attack_timer
@onready var product_timer: Timer = $product_timer
@onready var attack_mark: Marker2D = $attack_mark

var plant_type: PlantType

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func set_plant_type(plant_type: PlantType):
	self.plant_type = plant_type
	plants_anim.animation = plant_type.code
	if plant_type.attack_cd != 0:
		attack_timer.wait_time = plant_type.attack_cd
		attack_timer.start()
	if plant_type.product_cd != 0:
		product_timer.wait_time = plant_type.product_cd
		product_timer.start()


func _on_product_timer_timeout() -> void:
	print("生产阳光")
	var sun : Sun = SUN.instantiate()
	get_tree().root.add_child(sun)
	sun.global_position = global_position
	sun.product = plant_type.product


func _on_attack_timer_timeout() -> void:
	var pea_bullet : PeaBullet = PEA_BULLET.instantiate()
	get_tree().root.add_child(pea_bullet)
	pea_bullet.global_position = attack_mark.global_position
