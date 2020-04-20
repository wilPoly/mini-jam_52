extends KinematicBody2D

enum { NORMAL, FALL, CLIMB }
const SPEED := 200
const GRAVITY := 800

signal pushed

var velocity := Vector2()
var state := NORMAL
var actionable := false


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	match state:
		NORMAL:
			horizontal()
			trigger()
		FALL:
			pass
		CLIMB:
			climb()
			if is_on_floor() and velocity.y > 0:
				state = NORMAL


func _physics_process(delta: float) -> void:
	if state != CLIMB:
		velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP, true)


func horizontal() -> void:
	if Input.is_action_pressed("arrow_right"):
		$Sprite.flip_h = false
		velocity.x = SPEED
	elif Input.is_action_pressed("arrow_left"):
		$Sprite.flip_h = true
		velocity.x = -SPEED
	else:
		velocity.x = 0
	if is_on_floor():
		if velocity.x == 0:
			$AnimationPlayer.play("idle")
		else:
			$AnimationPlayer.play("walk")
			
			
func vertical() -> void:
	if Input.is_action_pressed("arrow_up"):
		velocity.y = -SPEED / 2.0
		$AnimationPlayer.play("climb")
	elif Input.is_action_pressed("arrow_down"):
		velocity.y = SPEED * 0.75
		$AnimationPlayer.play_backwards("climb")
	else:
			velocity.y = 0
			$AnimationPlayer.stop()
			
			
func climb() -> void:
	velocity.x = 0
	vertical()
#	if Input.is_action_just_pressed("w"):
#		state = NORMAL


func trigger() -> void:
	if actionable and Input.is_action_just_pressed("a"):
		emit_signal("pushed")


func on_interactable_entered(obj_pos) -> void:
	print("Ladder!")
	state = CLIMB
	global_position.x = obj_pos.x
	$AnimationPlayer.play("climb_idle")


func on_interactable_exited(obj_pos) -> void:
	state = NORMAL
	print("Ladder no more!")
	
	
func on_triggerable_entered(obj_pos) -> void:
		actionable = true
		print("Actionable!")

func on_triggerable_exited(obj_pos) -> void:
	actionable = false
	print("not Actionable!")
