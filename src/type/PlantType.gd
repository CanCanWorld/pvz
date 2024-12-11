class_name PlantType extends Object

var code : String = ""
var name : String = ""
var cost : int = 0
var attack : int = 0
var hp : int = 0
var product : int = 0
var cd : int = 10

func _init(
		code: String, 
		name: String, 
		cost: int, 
		attack: int, 
		hp: int, 
		product: int, 
		cd: int,
	) -> void:
	self.code = code
	self.name = name
	self.cost = cost
	self.attack = attack
	self.hp = hp
	self.product = product
	self.cd = cd
