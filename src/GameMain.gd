extends Node2D

var plant_list : Array[PlantType] = [
	# 			  代号				名称			花费		攻击力	血量		生产力	冷却时间
	PlantType.new("sun_flower",		"向日葵",		50,		0,		100,	25,		1),
	PlantType.new("peas_hooter",	"豌豆射手",	100,	25,		100,	0,		1),
	PlantType.new("wall_nut", 		"坚果墙",		50,		0,		100,	0,		3),
]
var select_plant : SelectPlant
var isEnter = false
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	select_plant = get_tree().get_first_node_in_group("select_plant")
	if select_plant:
		if not isEnter:
			select_plant.global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("取消"):
		if select_plant:
			get_tree().root.remove_child(select_plant)
			select_plant = null
