extends Resource

class_name Trait
@export var name: String
@export var cost: int
@export var description: String

func _init(in_name: String, in_cost: int, in_description: String) -> void:
	self.name = in_name
	self.cost = in_cost
	self.description = in_description
