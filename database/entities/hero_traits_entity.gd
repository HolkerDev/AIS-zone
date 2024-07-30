extends Node

class_name HeroTraitsEntity

func table() -> Dictionary:
    return {
        "id": {"data_type": "int", "primary_key": true, "not_null": true, "auto_increment": true},
        "hero_id": {"data_type": "int", "not_null": true},
        "trait_id": {"data_type": "int", "not_null": true},
    }