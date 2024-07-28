extends Control

class_name TraitUI
@onready var trait_name: String
@onready var cost: int
@onready var description: String
signal trait_toggled

func _make_custom_tooltip(for_text):
	var label = preload("res://tooltip.tscn").instantiate()
	label.text = for_text
	return label

func init(i: int, in_name: String, in_cost: int, in_description: String):
	
	self.trait_name = in_name
	self.cost = in_cost
	self.description = in_description
	
	self.position = Vector2(0, i*25)
	$TraitLabel.text = self.trait_name
	self.tooltip_text = self.description
	
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
