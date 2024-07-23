extends Node

# This will be used to identify the RPC calls
const SERVER_ID = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

@rpc("any_peer")
func authenticate_player(username: String):
	print("Server: Authenticating player... username is: ", username)
