extends Node2D

const PEA_SHOOTER = preload("res://src/plant/pea_shooter/pea_shooter.tscn")
@onready var zimbie_marks: Node2D = $zimbie_marks
@onready var player: Node2D = $player

func _ready() -> void:
	for mark in zimbie_marks.get_children():
		if mark is Marker2D:
			GameMain.zombie_mark_list.append(mark.global_position)
	var pea_shooter = PEA_SHOOTER.instantiate()
	player.add_child(pea_shooter)
	player.global_position = Vector2(250, 368)
	pea_shooter.set_plant_type(GameMain.plant_list[1])


func _process(delta: float) -> void:
	move()

func move():
	const delta_y = 100
	const delta_x = 90
	if Input.is_action_just_pressed("上"):
		player.global_position.y -= delta_y
	if Input.is_action_just_pressed("下"):
		player.global_position.y += delta_y
	if Input.is_action_just_pressed("左"):
		player.global_position.x -= delta_x
	if Input.is_action_just_pressed("右"):
		player.global_position.x += delta_x
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bullet:
		body.queue_free()
