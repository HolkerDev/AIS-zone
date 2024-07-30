extends Node

class_name HeroEntity

func table() -> Dictionary:
    return {
        "id": {"data_type": "int", "primary_key": true, "not_null": true, "auto_increment": true},
        "name": {"data_type": "text", "not_null": true},
        "gold": {"data_type": "int", "not_null": true},
        "player_id": {"data_type": "int", "not_null": true},
    }