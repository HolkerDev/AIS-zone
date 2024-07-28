extends Control

class_name TraitUI
@onready var trait_name: String
@onready var cost: int
@onready var description: String

func init(i: int, in_name: String, in_cost: int, in_description: String):
	self.trait_name = in_name
	self.cost = in_cost
	self.description = in_description
	
	self.position = Vector2(0, i*25)
	$TraitLabel.text = "[hint="+self.description+"]"+self.trait_name+"[/hint]"

