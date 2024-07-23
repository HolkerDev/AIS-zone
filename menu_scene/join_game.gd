extends Button

func _on_join_pressed():
    get_tree().change_scene_to_file("res://lobby_scene/lobby.tscn")
