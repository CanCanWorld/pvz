extends Node2D

const ZOMBIE = preload("res://src/zombie/zombie.tscn")

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_cd_timeout() -> void:
	var zombie : Zombie = ZOMBIE.instantiate()
	var rand_index = randi_range(0, GameMain.zombie_mark_list.size() - 1)
	var rondom_pos = GameMain.zombie_mark_list[rand_index]
	add_child(zombie)
	zombie.global_position = rondom_pos
	
