extends Button

func _on_host_pressed():
	Global.ROLE = 'host'
	get_tree().change_scene_to_file("res://lobby_scene/lobby.tscn")
