class_name Database extends Node

@export var player_queries: PlayerQueries = null

var _db_client: SQLite = null


func _init() -> void:
	if _is_database_connected():
		print("Database connection already exists.")
		return
	_db_client = SQLite.new()
	_db_client.path = "res://database/database.db"
	_db_client.open_db()
	_create_tables()
	print("Database connected.")
	_init_queries()

func _is_database_connected() -> bool:
	return _db_client != null

func _create_tables() -> void:
	if not _is_database_connected():
		print("Database connection does not exist.")
		return
	print("Creating tables...")
	_db_client.create_table("hero", HeroEntity.new().table())
	_db_client.create_table("trait", TraitEntity.new().table())
	_db_client.create_table("hero_traits", HeroTraitsEntity.new().table())
	_db_client.create_table("player", PlayerEntity.new().table())
	print("Tables created.")

func _init_queries() -> void:
	player_queries = PlayerQueries.new(_db_client)
