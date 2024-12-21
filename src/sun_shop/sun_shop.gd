extends Node2D

const CARD = preload("res://src/card/card.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var sun_count: Label = $sun_count

func _ready() -> void:
	sun_count.text = str(GameMain.sun_count)
	GameMain.add_on_sun_change_listener(on_sun_change)
	var index = 0
	for item in GameMain.plant_list:
		var card = CARD.instantiate()
		add_child(card)
		card.position = marker_2d.position + Vector2(52 * index, 0)
		card.plant_type = item
		card.reset()
		index += 1


func _process(delta: float) -> void:
	pass

func on_sun_change(value):
	sun_count.text = str(int(sun_count.text) + value)
