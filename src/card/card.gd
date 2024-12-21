class_name Card extends Node2D

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var timer: Timer = $Timer
@onready var plants_anim: AnimatedSprite2D = $plants_anim
@onready var label: Label = $Label
@onready var button: Button = $Button

const SELECT_PLANT = preload("res://src/select_plant/select_plant.tscn")

var isCd = false
var isEnable = false
var plant_type: PlantType = GameMain.plant_list[0]

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	progress_bar.value = timer.time_left / plant_type.cd * 100
	if GameMain.sun_count < plant_type.cost:
		isEnable = false
		button.modulate = "ff0000"
	else :
		button.modulate = "ff000000"
		isEnable = true


func _on_timer_timeout() -> void:
	isCd = true


func reset():
	isCd = false
	isEnable = false
	timer.wait_time = plant_type.cd
	timer.start()
	plants_anim.animation = plant_type.code
	label.text = str(plant_type.cost)

func _on_button_pressed() -> void:
	if !isCd: return
	if !isEnable: return
	if GameMain.select_plant != null: return
	var select_plant : SelectPlant = SELECT_PLANT.instantiate()
	get_tree().root.add_child(select_plant)
	select_plant.set_plant_type(plant_type)
	select_plant.card = self
