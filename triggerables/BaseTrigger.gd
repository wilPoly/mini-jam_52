extends Area2D


func _ready() -> void:
	connect("body_entered", self, "_on_player_entered")
	
	
func _on_player_entered(body: Node) -> void:
	get_tree().call_group("trigger_listeners", "on_trigger_entered", self)
#
#
#func _on_body_exited(body: Node) -> void:
#	if body.has_method("on_triggerable_exited"):
#		body.on_triggerable_exited(global_position)
