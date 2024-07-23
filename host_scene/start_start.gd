extends Node

func _ready():
	print("Starting host server...")
	var server_peep = ENetMultiplayerPeer.new()
	server_peep.create_server(8082, 8)
	multiplayer.multiplayer_peer = server_peep

	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_player_disconnected)

	if multiplayer.is_server():
		print("Server started!")

func _add_player_to_game(user_id: int):
	print("Player [%s] connected!", user_id)
	
func _player_disconnected(user_id: int):
	print("Player [%s] disconnected!", user_id)
