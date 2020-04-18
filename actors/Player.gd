extends KinematicBody2D

export (int) var speed := 200
export (int) var gravity := 500

var direction := Vector2()


func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	direction.y = gravity
	get_input()
	animate_player(direction)
	move_and_slide(direction, Vector2(0, -1))

func get_input() -> void:
	direction.x = (Input.get_action_strength("arrow_right") - Input.get_action_strength("arrow_left")) * speed


func animate_player(direction: Vector2):
	var direction_norm = direction.normalized()
	if direction_norm.x > 0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
	elif direction_norm.x < 0:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")
