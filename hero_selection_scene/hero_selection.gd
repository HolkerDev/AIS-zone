extends Node2D

@onready var trait_edit_ui = preload("res://hero_selection_scene/trait_edit_ui.tscn")

func _ready():
	var traits = Global.get_traits()
	traits.sort_custom(func(a, b): return a.cost > b.cost)
	var trait_list_control = get_node("UI/TraitsUI/TraitList")
	for i in traits.size():
		var trait_control = trait_edit_ui.instantiate()
		trait_control.init(i, traits[i].name, traits[i].cost, traits[i].description)
		trait_control.trait_toggled.connect(on_toggle)
		trait_list_control.add_child(trait_control)

func on_toggle(new_state: bool, cost: int):
	$UI/TraitsUI/TotalUI/TotalCostLabel.change_cost(new_state, cost)


