extends Node2D

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var timer: Timer = $Timer
@onready var plants_anim: AnimatedSprite2D = $plants_anim
@onready var label: Label = $Label

const SELECT_PLANT = preload("res://src/select_plant/select_plant.tscn")

var isEnable = false
var plant_type: PlantType = GameMain.plant_list[0]

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	progress_bar.value = timer.time_left / plant_type.cd * 100


func _on_timer_timeout() -> void:
	isEnable = true

func reset(plant_type: PlantType):
	self.plant_type = plant_type
	isEnable = false
	timer.wait_time = plant_type.cd
	timer.start()
	plants_anim.animation = plant_type.code
	label.text = str(plant_type.cost)


func _on_button_pressed() -> void:
	if !isEnable: return
	if GameMain.select_plant != null: return
	var select_plant : SelectPlant = SELECT_PLANT.instantiate()
	get_tree().root.add_child(select_plant)
	select_plant.set_plant_type(plant_type)
