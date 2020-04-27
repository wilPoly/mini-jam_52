extends Node2D

#export (String, FILE, "*.tscn") var next_level_path

#func _ready() -> void:
#	var next_level = preload(next_level_path)

#func load_next_level() -> void:
#	var game = get_parent()
#	if game.has_method("change_level"):
#		game.change_level(next_level)
