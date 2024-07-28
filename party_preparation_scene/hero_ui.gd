extends Control
@onready var hero_name: String
@onready var traits: Array

var trait_ui = preload("res://party_preparation_scene/trait_ui.tscn")

func init(hero_i: int, in_name: String, in_traits: Array):
	self.hero_name = in_name
	self.traits = in_traits
	
	self.position = Vector2(hero_i*500, 0)
	$HeroMainUI/HeroNameLabel.text = self.hero_name
	
	var traits_global = Global.get_traits()
	for trait_i in self.traits.size():
		var cost = 0
		var description = "Unknown"
		for trait_ii in traits_global.size():
			if traits_global[trait_ii].name == self.traits[trait_i]:
				cost = traits_global[trait_ii].cost
				description = traits_global[trait_ii].description
		var trait_control = trait_ui.instantiate()
		trait_control.init(trait_i, self.traits[trait_i], cost, description)
		$TraitsUI.add_child(trait_control)
