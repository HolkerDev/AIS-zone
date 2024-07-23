extends Node

const SERVER_PORT = 8082

func _ready():
	pass

@rpc("any_peer")
func authenticate_player(username: String):
	print("Server: Authenticating player... username is: ", username)
