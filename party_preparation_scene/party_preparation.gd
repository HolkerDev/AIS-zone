extends Node2D

@onready var hero_ui = preload("res://party_preparation_scene/hero.tscn")
@onready var add_hero_button_ui = preload("res://party_preparation_scene/add_hero_button.tscn")

func _ready():
	var heroes = Global.get_heroes()
	var heroes_list_control = get_node("UI/HeroesUI")
	for i in heroes.size():
		var hero_control = hero_ui.instantiate()
		hero_control.init(i, heroes[i].name, heroes[i].traits)
		#hero_control.trait_toggled.connect(on_toggle)
		heroes_list_control.add_child(hero_control)
	var add_hero_button_control = add_hero_button_ui.instantiate()
	add_hero_button_control.init(heroes.size())
	heroes_list_control.add_child(add_hero_button_control)


