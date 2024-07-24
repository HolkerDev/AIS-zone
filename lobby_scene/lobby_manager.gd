extends Node2D

var logged_users = {}

func _ready():
	if Global.ROLE == 'client':
		set_node_state("LobbyForm/ControlsHost", false)
		set_node_state("LobbyForm", false)
	elif Global.ROLE == 'host':
		set_node_state("JoinForm", false)
		init_server()
	else:
		OS.alert("Unknown user role")
	
func set_node_state(node_string: String, state: bool):
	var node = get_node(node_string)
	node.visible = state
	node.set_process(state)
	node.set_physics_process(state)
	if node is CollisionShape2D:
		node.disabled = !state

func init_server():
	print("Starting host server...")
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(8082, 8)
	multiplayer.multiplayer_peer = server_peer
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	if multiplayer.is_server():
		print("Server started!")

@rpc("any_peer", "call_remote", "reliable")
func authenticate_player(login: String, password: String):
	print("Server: Authenticating player... login is: ", login)
	# Auth logic TODO
	var peer_id = multiplayer.get_remote_sender_id()
	var session_token = str(randi())  # Change TODO
	rpc_id(peer_id, "authentication_succeed", session_token)
	rpc("update_lobby", multiplayer.get_peers())
	# Failure TODO

@rpc("authority", "call_remote", "reliable")
func authentication_succeed(session_token):
	set_node_state("JoinForm", false)
	set_node_state("LobbyForm", true)

func _on_peer_disconnected(user_id: int):
	rpc("update_lobby", multiplayer.get_peers())

@rpc("authority", "call_local", "reliable")
func update_lobby(peers: PackedInt32Array):
	var peers_with_host = peers +  PackedInt32Array([1])
	Global.PLAYERS_COUNT = len(peers_with_host)
	var node = get_node("LobbyForm/CounterPlayers")
	node.text = str(Global.PLAYERS_COUNT)+"
	"+str(peers_with_host)

@rpc("authority", "call_local", "reliable")
func start_level():
	get_tree().change_scene_to_file("res://level_scene/level.tscn")
