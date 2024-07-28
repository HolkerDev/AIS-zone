extends Resource

class_name Trait
@export var name: String
@export var cost: int
@export var description: String

func _init(name: String, cost: int, description: String) -> void:
	self.name = name
	self.cost = cost
	self.description = description
