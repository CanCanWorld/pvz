extends Node2D

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var timer: Timer = $Timer
@onready var plants_anim: AnimatedSprite2D = $plants_anim
@onready var label: Label = $Label

const SELECT_PLANT = preload("res://src/select_plant/select_plant.tscn")

var isEnable = false
var plant: PlantType = GameMain.plant_list[0]

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	progress_bar.value = timer.time_left / plant.cd * 100


func _on_timer_timeout() -> void:
	isEnable = true

func reset(plant: PlantType):
	self.plant = plant
	isEnable = false
	timer.wait_time = plant.cd
	timer.start()
	plants_anim.animation = plant.code
	label.text = str(plant.cost)


func _on_button_pressed() -> void:
	if !isEnable: return
	if GameMain.select_plant != null: return
	var select_plant : SelectPlant = SELECT_PLANT.instantiate()
	get_tree().root.add_child(select_plant)
	select_plant.set_code(plant.code)
