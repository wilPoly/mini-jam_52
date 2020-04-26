extends Area2D

signal level_completed

onready var level := get_parent()

func _ready() -> void:
	connect("body_entered", self, "_on_actor_entered")
	connect("level_completed", level, "load_next_level")
	

func _on_actor_entered(body: Node) -> void:
	emit_signal("level_completed")
#	var next_level: = get_parent()
#	if next_level.has_method("load_next_level"):
#		next_level.load_next_level()
