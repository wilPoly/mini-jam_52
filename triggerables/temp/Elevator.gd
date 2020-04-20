extends Area2D


var pushed = false


func _ready() -> void:
	print(self.get_path())

func _on_body_entered(body: Node) -> void:
	if body.has_method("on_triggerable_entered"):
		body.on_triggerable_entered(global_position)


func _on_body_exited(body: Node) -> void:
	if body.has_method("on_triggerable_exited"):
		body.on_triggerable_exited(global_position)


func _on_activated() -> void:
	print($Elevator.get_name())
	pass

#func _on_Player_pushed() -> void:
#	if !pushed:
#		pushed = true
#		$AnimationPlayer.play("pushed")
#		print("pushed!")
#	else:
#		print("button already pushed!")
