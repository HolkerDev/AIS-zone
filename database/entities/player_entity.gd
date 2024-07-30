extends Node

class_name PlayerEntity

func table() -> Dictionary:
    return {
        "id": {"data_type": "int", "primary_key": true, "not_null": true, "auto_increment": true},
        "login": {"data_type": "text", "not_null": true},
        "password": {"data_type": "text", "not_null": true},
        "hero_id": {"data_type": "int", "not_null": false},
    }
