extends KinematicBody2D

const SPEED := 200
const GRAVITY := 800

var velocity := Vector2()


func _process(delta: float) -> void:
	movement()

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP, true)

func movement() -> void:
	velocity.x = (Input.get_action_strength("arrow_right") - Input.get_action_strength("arrow_left")) * SPEED
	if Input.is_action_pressed("arrow_right"):
		$AnimatedSprite.flip_h = false
		velocity.x = SPEED
	
	elif Input.is_action_pressed("arrow_left"):
		$AnimatedSprite.flip_h = true
		velocity.x = -SPEED
	
	else:
		velocity.x = 0
		
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite.play("idle")
		else:
			$AnimatedSprite.play("walk")
