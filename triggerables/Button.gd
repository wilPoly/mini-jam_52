extends Area2D

var pushed = false

#func trigger() -> void:
#	if Input.is_action_just_pressed("a"):
#		pushed = true
#		$AnimationPlayer.play("pushed")
#		print("pushed!")

func _on_body_entered(body: Node) -> void:
#	trigger()
	if body.has_method("on_triggerable_entered"):
		body.on_triggerable_entered(global_position)

func _on_body_exited(body: Node) -> void:
	if body.has_method("on_triggerable_exited"):
		body.on_triggerable_exited(global_position)


func _on_Player_pushed() -> void:
	if !pushed:
		pushed = true
		$AnimationPlayer.play("pushed")
	else:
		return
