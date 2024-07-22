extends Button  # If attached to a Control node

func _on_pressed():
	
	get_tree().change_scene_to_file("res://lobby.tscn")
