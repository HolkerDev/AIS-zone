extends Resource

class_name Stage
@export var name: String
@export var action: String
@export var result: String

func _init(in_name: String, in_action: String, in_result: String) -> void:
	self.name = in_name
	self.action = in_action
	self.result = in_result
