extends Node2D

@onready var zimbie_marks: Node2D = $zimbie_marks


func _ready() -> void:
	for mark in zimbie_marks.get_children():
		if mark is Marker2D:
			GameMain.zombie_mark_list.append(mark.global_position)
	pass


func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bullet:
		body.queue_free()
