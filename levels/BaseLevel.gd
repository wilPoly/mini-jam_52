extends Node2D

export (PackedScene) var next_level

func _ready() -> void:
	next_level.instance()

func load_next_level() -> void:
	var game = get_parent()
	if game.has_method("change_level"):
		game.change_level(next_level)
