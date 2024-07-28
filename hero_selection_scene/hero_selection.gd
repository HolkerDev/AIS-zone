extends Node2D

@onready var trait_ui = preload("res://hero_selection_scene/trait_ui.tscn")

func _ready():
	var traits = get_traits()
	traits.sort_custom(func(a, b): return a.cost > b.cost)
	var trait_list_control = get_node("UI/TraitsUI/TraitList")
	for i in traits.size():
		var trait_control = trait_ui.instantiate()
		trait_control.init(i, traits[i].name, traits[i].cost, traits[i].description)
		trait_control.trait_toggled.connect(on_toggle)
		trait_list_control.add_child(trait_control)

func on_toggle(new_state: bool, cost: int):
	$UI/TraitsUI/TotalUI/TotalCostLabel.change_cost(new_state, cost)

func get_traits():
	const Trait = preload("res://Trait.gd")
	const traits_raw = [
		{
		  "trait_name": "Night Vision",
		  "cost": 8,
		  "description": "Your character can see clearly in complete darkness, allowing for effective nighttime operations and exploration."
		},
		{
		  "trait_name": "Clumsy",
		  "cost": -6,
		  "description": "Your character frequently stumbles and drops items, causing problems in stealth and delicate situations."
		},
		{
		  "trait_name": "Charismatic",
		  "cost": 6,
		  "description": "Your character has a natural charm, making interactions with NPCs more favorable and increasing persuasion success."
		},
		{
		  "trait_name": "Weak Constitution",
		  "cost": -8,
		  "description": "Your character has lower health and stamina, making them more susceptible to injuries and fatigue."
		},
		{
		  "trait_name": "Agile",
		  "cost": 7,
		  "description": "Your character has exceptional dexterity, enhancing their ability to dodge attacks and move silently."
		},
		{
		  "trait_name": "Greedy",
		  "cost": -5,
		  "description": "Your character is obsessed with wealth, often taking unnecessary risks to obtain more gold and treasures."
		},
		{
		  "trait_name": "Resourceful",
		  "cost": 5,
		  "description": "Your character can make the most of available resources, crafting useful items from minimal materials."
		},
		{
		  "trait_name": "Fear of Darkness",
		  "cost": -7,
		  "description": "Your character is terrified of the dark, causing panic and decreased effectiveness in low-light environments."
		},
		{
		  "trait_name": "Strong",
		  "cost": 6,
		  "description": "Your character has great physical strength, allowing them to deal more damage and carry heavy loads."
		},
		{
		  "trait_name": "Short-Sighted",
		  "cost": -6,
		  "description": "Your character has poor long-distance vision, making ranged combat and spotting distant enemies difficult."
		},
		{
		  "trait_name": "Quick Learner",
		  "cost": 7,
		  "description": "Your character gains skills and abilities faster than others, allowing for rapid development and adaptation."
		},
		{
		  "trait_name": "Paranoid",
		  "cost": -4,
		  "description": "Your character is constantly on edge, reducing trust in allies and causing stress in social situations."
		},
		{
		  "trait_name": "Lucky",
		  "cost": 9,
		  "description": "Your character experiences favorable outcomes more often, from finding rare items to avoiding deadly traps."
		},
		{
		  "trait_name": "Slow",
		  "cost": -5,
		  "description": "Your character moves at a slower pace, making them less effective in fast-paced combat and escapes."
		},
		{
		  "trait_name": "Stealthy",
		  "cost": 8,
		  "description": "Your character excels at avoiding detection, making them highly effective in stealth missions and evasion."
		},
		{
		  "trait_name": "Pessimistic",
		  "cost": -3,
		  "description": "Your character often expects the worst, leading to lower morale and reduced effectiveness in prolonged battles."
		},
		{
		  "trait_name": "Eagle-Eyed",
		  "cost": 7,
		  "description": "Your character has excellent vision, allowing them to spot hidden traps and distant enemies with ease."
		},
		{
		  "trait_name": "Cowardly",
		  "cost": -8,
		  "description": "Your character is prone to fleeing from danger, making them unreliable in critical combat situations."
		},
		{
		  "trait_name": "Tough",
		  "cost": 6,
		  "description": "Your character can withstand more damage than usual, reducing the impact of attacks and environmental hazards."
		},
		{
		  "trait_name": "Forgetful",
		  "cost": -5,
		  "description": "Your character often forgets important details, leading to mistakes and missed opportunities."
		}
	]
	var traits = []
	for trait_raw in traits_raw:
		var trait_item = Trait.new(trait_raw['trait_name'],
								   trait_raw['cost'],
								   trait_raw['description'])
		traits.append(trait_item)
	return traits
