class_name SunFlower extends Plant

const SUN = preload("res://src/sun/sun.tscn")

@onready var product_timer: Timer = $product_timer

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func set_plant_type(plant_type: PlantType):
	self.plant_type = plant_type
	plants_anim.animation = plant_type.code
	if plant_type.product_cd != 0:
		product_timer.wait_time = plant_type.product_cd
		product_timer.start()


func _on_product_timer_timeout() -> void:
	print("生产阳光")
	var sun : Sun = SUN.instantiate()
	get_tree().root.add_child(sun)
	sun.global_position = global_position
	sun.product = plant_type.product
