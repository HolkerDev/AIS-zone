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
	peer.create_client(ip, port)
	multiplayer.multiplayer_peer = peer
	send_credentials()


func send_credentials():
	print('send_credentials', get_multiplayer_authority())
	var login = login_line_edit.text
	var password = '1'
	rpc_id(get_multiplayer_authority(), "authenticate_player", login, password)


@rpc
func authentication_failed(error_message):
	print("Connection failed! ", error_message)


@rpc
func authentication_succeed(session_token):
	var peers = multiplayer.get_peers()
	print("Connection stablished! ", peers)
	get_tree().change_scene_to_file('res://level.tscn')

