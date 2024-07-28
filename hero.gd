extends Resource


class_name Hero
const Trait = preload("res://trait.gd")
@export var name: String
@export var traits: Array

func _init(in_name: String, in_traits: Array):
	self.name = in_name
	self.traits = in_traits

