extends Node2D
@onready var marker_2d: Marker2D = $Marker2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Mouse:
		if GameMain.select_plant != null:
			GameMain.enter_positon = marker_2d.global_position
			GameMain.select_plant.global_position = marker_2d.global_position

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Mouse:
		if GameMain.select_plant != null:
			GameMain.enter_positon = Vector2.ZERO
