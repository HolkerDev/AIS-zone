extends Node

func _on_join_pressed():
	var peer = ENetMultiplayerPeer.new()
	var ip = $EditTextIP.text
	peer.create_client(ip, Global.SERVER_PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.connected_to_server.connect(_on_connected_to_server)
	multiplayer.connection_failed.connect(_on_connection_failed)

func _on_connected_to_server():
	send_credentials()

func _on_connection_failed():
		$TextStatus.text = "Cannot connect to the server"

func send_credentials():
	var login = $EditTextLogin.text
	var password = '1'
	get_node("../").rpc_id(get_multiplayer_authority(),
									"authenticate_player",
									login,
									password)

@rpc
func authentication_failed(error_message):
	$TextStatus.text = "Cannot auth to the server"
