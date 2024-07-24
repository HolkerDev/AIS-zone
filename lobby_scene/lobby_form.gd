extends Node

func _on_button_pressed():
	get_node("../").rpc("start_level")
