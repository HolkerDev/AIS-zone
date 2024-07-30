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
