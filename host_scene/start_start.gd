extends Node

var logged_users = {}

func _ready():
	print("Starting host server...")
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(8082, 8)
	multiplayer.multiplayer_peer = server_peer
	multiplayer.peer_connected.connect(_on_peer_connected)

	if multiplayer.is_server():
		print("Server started!")


func _on_peer_connected(user_id: int):
	if multiplayer.is_server():
		print("Server: user connected: ", user_id)

