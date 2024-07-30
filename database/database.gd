class_name Database extends Node

@export var player_queries: PlayerQueries = null

var _db_client: SQLite = null


func _init() -> void:
    if _is_database_connected():
        print("Database connection already exists.")
        return
    _db_client = SQLite.new()
    _db_client.path = "res://_db_client/_db_client.db"
    _db_client.open_db()
    _create_tables()

func _is_database_connected() -> bool:
    return _db_client != null

func _create_tables() -> void:
    if not _is_database_connected():
        print("Database connection does not exist.")
        return
    _db_client.create_table("hero", HeroEntity.new().table())
    _db_client.create_table("trait", TraitEntity.new().table())
    _db_client.create_table("hero_traits", HeroTraitsEntity.new().table())
    _db_client.create_table("player", PlayerEntity.new().table())

func _init_queries() -> void:
    player_queries = PlayerQueries.new(_db_client)