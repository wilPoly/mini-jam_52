extends Node2D


#function to load maps

func _ready() -> void:
	var scene = preload("res://levels/Level01.tscn").instance()
	add_child(scene)
	add_to_group("trigger_listeners")
	
	
func on_trigger_entered(item) -> void:
	print(item.name)
	
