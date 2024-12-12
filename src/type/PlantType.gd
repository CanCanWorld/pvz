class_name PlantType extends Object

var code : String = ""
var name : String = ""
var cost : int = 0
var attack : int = 0
var hp : int = 0
var product : int = 0
var cd : int = 10
var product_cd : int = 10
var attack_cd : int = 10

func _init(
	code: String, 
	name: String, 
	cost: int, 
	attack: int, 
	hp: int, 
	product: int, 
	cd: int,
	product_cd: int,
	attack_cd: int,
) -> void:
	self.code = code
	self.name = name
	self.cost = cost
	self.attack = attack
	self.hp = hp
	self.product = product
	self.cd = cd
	self.product_cd = product_cd
	self.attack_cd = attack_cd
