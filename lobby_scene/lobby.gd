# lobby.gd
extends Node

@onready var ip_line_edit = $EditTextIP
@onready var login_line_edit = $EditTextLogin
const port = 8082

var peer = ENetMultiplayerPeer.new()
var is_peer_connected = false


func _ready():
	pass

func _on_join_pressed():
	var ip = ip_line_edit.text
	peer.create_client("127.0.0.1", port)
	multiplayer.multiplayer_peer = peer
	multiplayer.connected_to_server.connect(_on_connected_to_server)

func _on_connected_to_server():
	print("callback on connection")
	send_credentials()


func send_credentials():
	print('send_credentials', get_multiplayer_authority())
	var login = login_line_edit.text
	var password = '1'
	var result = rpc_id(get_multiplayer_authority(), "authenticate_player", "1", "2")
	if result != OK:
		print("error sending the rpc: ", result)


@rpc
func authentication_failed(error_message):
	print("Connection failed! ", error_message)


@rpc
func authentication_succeed(session_token):
	var peers = multiplayer.get_peers()
	print("Connection stablished! ", peers)
	get_tree().change_scene_to_file('res://level.tscn')

