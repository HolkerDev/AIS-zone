extends Node

var logged_users = {}

func _ready():
	print("Starting host server...")
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(8082, 8)
	multiplayer.multiplayer_peer = server_peer

	if multiplayer.is_server():
		print("Server started!")

@rpc("any_peer", "call_remote")
func authenticate_player(login, password):
	print('here1')
	var peer_id = multiplayer.get_remote_sender_id()
	
	if not login in ['1', '2']:
		rpc_id(peer_id, "authentication_failed", "User doesn't exist")
		print('here2')
	elif password == '1':
		var token = randi()
		logged_users[login] = token
		rpc_id(peer_id, "authentication_succeed", token)

