extends Button

func _on_join_pressed():
	Global.ROLE = 'client'
	get_tree().change_scene_to_file("res://lobby_scene/lobby.tscn")
