class_name SelectPlant extends Node2D

@onready var plants_anim: AnimatedSprite2D = $plants_anim

var plant_type: PlantType

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

func set_plant_type(plant_type: PlantType):
	self.plant_type = plant_type
	plants_anim.animation = plant_type.code
