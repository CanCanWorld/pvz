class_name SelectPlant extends Node2D

@onready var plants_anim: AnimatedSprite2D = $plants_anim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_code(code: String):
	plants_anim.animation = code
