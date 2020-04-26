extends Node2D


#function to load maps

func _ready() -> void:
	var scene = preload("res://levels/Level01.tscn").instance()
	add_child(scene)
	add_to_group("trigger_listeners")
	
	
#func on_trigger_entered(item) -> void:
#	get_tree().call_group("actors", "on_actor_entered", item)


func on_trigger_activated(group_number) -> void:
	var number = String(group_number)
	get_tree().call_group(number, "on_activated")


func change_level(next_level) -> void:
	$Level.queue_free()
	add_child(next_level)
