extends Area2D


func _on_body_entered(body: Node) -> void:
	if body.has_method("on_interactable_entered"):
		body.on_interactable_entered(global_position)


func _on_body_exited(body: Node) -> void:
	if body.has_method("on_interactable_exited"):
		body.on_interactable_exited(global_position)
