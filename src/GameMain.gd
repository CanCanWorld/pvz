extends Node2D

const SUN_FLOWER = preload("res://src/plant/sun_flower/sun_flower.tscn")
const PEA_SHOOTER = preload("res://src/plant/pea_shooter/pea_shooter.tscn")

var plant_list : Array[PlantType] = [
	# 			  代号				名称			花费		攻击力	血量		生产力	卡片冷却	生产冷却	攻击冷却  场景
	PlantType.new("sun_flower",		"向日葵",		50,		0,		100,	25,		2,		10,		0,		SUN_FLOWER),
	PlantType.new("peas_hooter",	"豌豆射手",	100,	25,		100,	0,		2,		0,		3,		PEA_SHOOTER),
	PlantType.new("wall_nut", 		"坚果墙",		50,		0,		3000,	0,		15,		0,		0,		PEA_SHOOTER),
]

var select_plant : SelectPlant
var enter_positon : Vector2 = Vector2.ZERO
var sun_count = 150
var on_sun_change_list : Array[Callable] = []
var zombie_mark_list : Array[Vector2] = []

func add_on_sun_change_listener(callback: Callable):
	on_sun_change_list.append(callback)

func remove_on_sun_change_listener(callback: Callable):
	on_sun_change_list.remove_at(on_sun_change_list.find(callback))

func _ready() -> void:
	Input.mouse_mode = Input.MouseMode.MOUSE_MODE_HIDDEN
	add_on_sun_change_listener(on_sun_change)

func _process(delta: float) -> void:
	select_plant = get_tree().get_first_node_in_group("select_plant")
	if select_plant:
		if enter_positon != Vector2.ZERO:
			if Input.is_action_just_pressed("选中"):
				var plant_type = select_plant.plant_type
				var plant: Plant = plant_type.resouce.instantiate()
				print("种植", enter_positon)
				for listener in on_sun_change_list:
					listener.call(-plant_type.cost)
				get_tree().root.add_child(plant)
				plant.global_position = enter_positon
				plant.set_plant_type(plant_type)
				select_plant.card.reset()
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


func on_sun_change(value):
	sun_count += value
