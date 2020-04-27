extends Node2D


onready var level_path : String

func _ready() -> void:
	var scene = preload("res://levels/Level01.tscn").instance()
	add_child(scene)
	add_to_group("trigger_listeners")
	
	
#func on_trigger_entered(item) -> void:
#	get_tree().call_group("actors", "on_actor_entered", item)


func on_trigger_activated(group_number) -> void:
	var number = String(group_number)
	get_tree().call_group(number, "on_activated")


func load_next_level(next_level_path: String) -> void:
	level_path = next_level_path
	var next_level = load(level_path).instance()
	$Level.queue_free()
	add_child(next_level)
