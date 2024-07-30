extends Node

var database: SQLite = null

func init_db_conn() -> void:
    if is_database_connected():
        print("Database connection already exists.")
        return
    database = SQLite.new()
    database.path = "res://database/database.db"
    database.open_db()

func is_database_connected() -> bool:
    return database != null

func create_tables() -> void:
    if not is_database_connected():
        print("Database connection does not exist.")
        return
    database.create_table("hero", HeroEntity.new().table())
    database.create_table("trait", TraitEntity.new().table())
    database.create_table("hero_traits", HeroTraitsEntity.new().table())
    database.create_table("player", PlayerEntity.new().table())