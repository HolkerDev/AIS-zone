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
	print("user connected: ", user_id)

@rpc("any_peer")
func authenticate_player():
	print('authenticate called!')
	var peer_id = multiplayer.get_remote_sender_id()
	
	#if not login in ['1', '2']:
		#rpc_id(peer_id, "authentication_failed", "User doesn't exist")
		#print('here2')
	#elif password == '1':
		#var token = randi()
		#logged_users[login] = token
		#rpc_id(peer_id, "authentication_succeed", token)

