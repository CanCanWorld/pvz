extends Node2D

const CARD = preload("res://src/card/card.tscn")
@onready var marker_2d: Marker2D = $Marker2D

func _ready() -> void:
	var index = 0
	for item in GameMain.plant_list:
		var card = CARD.instantiate()
		add_child(card)
		card.position = marker_2d.position + Vector2(50 * index, 0)
		card.reset(item)
		index += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
