extends Area2D

export (int) var trigger_tag_number

var active := false

func _ready() -> void:
	connect("body_entered", self, "_on_actor_entered")
	connect("body_exited", self, "_on_actor_exited")
	
func _on_actor_entered(body: Node) -> void:
	if body.has_method("on_triggerable_entered"):
		body.on_triggerable_entered(self)
		
		
func _on_actor_exited(body: Node) -> void:
	if body.has_method("on_triggerable_exited"):
		body.on_triggerable_exited(self)


func _on_triggered() -> void:
	$AnimationPlayer.play("active")
	active = true
	print(self.name + " active")
