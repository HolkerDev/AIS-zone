class_name PlayerQueries extends Node
var _db_client: SQLite = null

func _init(db_client: SQLite) -> void:
    _db_client = db_client

func create_player(login, password: String) -> void:
    var query = "INSERT INTO player (login, password) VALUES ('?', '?')"
    var is_succ = _db_client.query_with_bindings(query, [login, password])
    if not is_succ:
        print("Failed to create player.")
