extends Node2D

const PLANT = preload("res://src/plant/plant.tscn")

var plant_list : Array[PlantType] = [
	# 			  代号				名称			花费		攻击力	血量		生产力	卡片冷却	生产冷却	攻击冷却
	PlantType.new("sun_flower",		"向日葵",		50,		0,		100,	25,		1,		1,		0),
	PlantType.new("peas_hooter",	"豌豆射手",	100,	25,		100,	0,		1,		0,		2),
	PlantType.new("wall_nut", 		"坚果墙",		50,		0,		100,	0,		15,		0,		0),
]

var select_plant : SelectPlant
var enter_positon : Vector2 = Vector2.ZERO
var sun_count = 150
var on_sun_change_list : Array[Callable] = []

func add_on_sun_change_listener(callback: Callable):
	on_sun_change_list.append(callback)

func remove_on_sun_change_listener(callback: Callable):
	on_sun_change_list.remove_at(on_sun_change_list.find(callback))

func _ready() -> void:
	Input.mouse_mode = Input.MouseMode.MOUSE_MODE_HIDDEN

func _process(delta: float) -> void:
	select_plant = get_tree().get_first_node_in_group("select_plant")
	if select_plant:
		if enter_positon != Vector2.ZERO:
			if Input.is_action_just_pressed("选中"):
				var plant: Plant = PLANT.instantiate()
				print("种植", enter_positon)
				get_tree().root.add_child(plant)
				plant.global_position = enter_positon
				plant.set_plant_type(select_plant.plant_type)
				reset_select_plant()
		else :
			select_plant.global_position = get_global_mouse_position()
				
	if Input.is_action_just_pressed("取消"):
		if select_plant:
			reset_select_plant()

func reset_select_plant():
	get_tree().root.remove_child(select_plant)
	select_plant = null
	enter_positon = Vector2.ZERO
	
