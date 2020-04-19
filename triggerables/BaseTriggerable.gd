extends Area2D


func _on_body_entered(body: Node) -> void:
	if body.has_method("on_triggerable_entered"):
		body.on_triggerable_entered(global_position)


func _on_body_exited(body: Node) -> void:
	if body.has_method("on_triggerable_exited"):
		body.on_triggerable_exited(global_position)
