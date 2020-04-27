extends Area2D

signal level_completed

export (String, FILE, "*.tscn") var next_level_path

onready var game := get_parent().get_parent()

func _ready() -> void:
	connect("body_entered", self, "_on_actor_entered")
	connect("level_completed", game, "load_next_level")
	

func _on_actor_entered(body: Node) -> void:
	emit_signal("level_completed", next_level_path)
#	var next_level: = get_parent()
#	if next_level.has_method("load_next_level"):
#		next_level.load_next_level()
