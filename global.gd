extends Node

@onready var Trait = preload("res://trait.gd")
@onready var Stage = preload("res://stage.gd")

const SERVER_PORT = 8082
var ROLE = ''
var PLAYERS_COUNT = 0

var STAGES = [{"is_active": true,
		"action": "",
		"result": ""},]

func get_heroes():
	const heroes_raw = [
		{
		  "hero_name": "Good James",
		  "traits": [
			"Charismatic", "Clumsy"
			]
		},
		{
		  "hero_name": "Bad John",
		  "traits": [
			"Paranoid", "Greedy", "Lucky"
			]
		}
	]
	var heroes = []
	for i in heroes_raw.size():
		var hero_item = Hero.new(heroes_raw[i]['hero_name'],
					   heroes_raw[i]['traits'])
		heroes.append(hero_item)
	return heroes

func get_traits():
	const traits_raw = [
		{
		  "trait_name": "Night Vision",
		  "cost": 8,
		  "description": "Your character can see clearly in complete darkness, allowing for effective nighttime operations and exploration."
		},
		{
		  "trait_name": "Clumsy",
		  "cost": - 6,
		  "description": "Your character frequently stumbles and drops items, causing problems in stealth and delicate situations."
		},
		{
		  "trait_name": "Charismatic",
		  "cost": 6,
		  "description": "Your character has a natural charm, making interactions with NPCs more favorable and increasing persuasion success."
		},
		{
		  "trait_name": "Weak Constitution",
		  "cost": - 8,
		  "description": "Your character has lower health and stamina, making them more susceptible to injuries and fatigue."
		},
		{
		  "trait_name": "Agile",
		  "cost": 7,
		  "description": "Your character has exceptional dexterity, enhancing their ability to dodge attacks and move silently."
		},
		{
		  "trait_name": "Greedy",
		  "cost": - 5,
		  "description": "Your character is obsessed with wealth, often taking unnecessary risks to obtain more gold and treasures."
		},
		{
		  "trait_name": "Resourceful",
		  "cost": 5,
		  "description": "Your character can make the most of available resources, crafting useful items from minimal materials."
		},
		{
		  "trait_name": "Fear of Darkness",
		  "cost": - 7,
		  "description": "Your character is terrified of the dark, causing panic and decreased effectiveness in low-light environments."
		},
		{
		  "trait_name": "Strong",
		  "cost": 6,
		  "description": "Your character has great physical strength, allowing them to deal more damage and carry heavy loads."
		},
		{
		  "trait_name": "Short-Sighted",
		  "cost": - 6,
		  "description": "Your character has poor long-distance vision, making ranged combat and spotting distant enemies difficult."
		},
		{
		  "trait_name": "Quick Learner",
		  "cost": 7,
		  "description": "Your character gains skills and abilities faster than others, allowing for rapid development and adaptation."
		},
		{
		  "trait_name": "Paranoid",
		  "cost": - 4,
		  "description": "Your character is constantly on edge, reducing trust in allies and causing stress in social situations."
		},
		{
		  "trait_name": "Lucky",
		  "cost": 9,
		  "description": "Your character experiences favorable outcomes more often, from finding rare items to avoiding deadly traps."
		},
		{
		  "trait_name": "Slow",
		  "cost": - 5,
		  "description": "Your character moves at a slower pace, making them less effective in fast-paced combat and escapes."
		},
		{
		  "trait_name": "Stealthy",
		  "cost": 8,
		  "description": "Your character excels at avoiding detection, making them highly effective in stealth missions and evasion."
		},
		{
		  "trait_name": "Pessimistic",
		  "cost": - 3,
		  "description": "Your character often expects the worst, leading to lower morale and reduced effectiveness in prolonged battles."
		},
		{
		  "trait_name": "Eagle-Eyed",
		  "cost": 7,
		  "description": "Your character has excellent vision, allowing them to spot hidden traps and distant enemies with ease."
		},
		{
		  "trait_name": "Cowardly",
		  "cost": - 8,
		  "description": "Your character is prone to fleeing from danger, making them unreliable in critical combat situations."
		},
		{
		  "trait_name": "Tough",
		  "cost": 6,
		  "description": "Your character can withstand more damage than usual, reducing the impact of attacks and environmental hazards."
		},
		{
		  "trait_name": "Forgetful",
		  "cost": - 5,
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

func report_error(text: String):
	print(text)

func get_stages(adventure: int):
	return STAGES

func save_stage(adventure: int, action: String, result: String) -> int:
	STAGES.insert(STAGES.size()-1, {"is_active": false,
		"action": action,
		"result": result})
	return STAGES.size()-2
