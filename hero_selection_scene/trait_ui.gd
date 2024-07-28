extends Control

class_name TraitUI
@onready var trait_name: String
@onready var cost: int
@onready var description: String
signal trait_toggled

func init(i: int, name: String, cost: int, description: String):
	self.trait_name = name
	self.cost = cost
	self.description = description
	
	self.position = Vector2(0, i*25)
	$TraitLabel.text = name
	
	var cost_str = str(cost)
	var cost_color = 'black'
	if cost > 0:
		cost_str = "+"+cost_str
		cost_color = 'dark_green'
	elif cost < 0:
		cost_color = 'red'
	$TraitCostLabel.text = cost_str
	$TraitCostLabel.add_theme_color_override("font_color", Color(cost_color))

func on_trait_toggled(state: bool):
	trait_toggled.emit(state, self.cost)
