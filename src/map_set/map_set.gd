extends Node2D
@onready var marker_2d: Marker2D = $Marker2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("_on_area_2d_area_shape_entered")
	if GameMain.select_plant != null:
		GameMain.isEnter = true
		GameMain.select_plant.global_position = marker_2d.global_position


func _on_area_2d_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if GameMain.select_plant != null:
		GameMain.isEnter = true
