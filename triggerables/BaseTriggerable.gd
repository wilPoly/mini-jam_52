extends KinematicBody2D


export (int) var trigger_group_number


func _ready() -> void:
	var group_number = String(trigger_group_number)
	print(group_number)
	add_to_group(group_number)

func on_activated() -> void:
	print(self.name + " activated")
	$AnimationPlayer.play("active")
