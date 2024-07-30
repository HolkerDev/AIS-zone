extends Node

class_name TraitEntity

func table() -> Dictionary:
    return {
        "id": {"data_type": "int", "primary_key": true, "not_null": true, "auto_increment": true},
        "name": {"data_type": "text", "not_null": true},
        "cost": {"data_type": "int", "not_null": true},
        "description": {"data_type": "text", "not_null": true},
    }