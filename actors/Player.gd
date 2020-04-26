extends KinematicBody2D

enum { NORMAL, FALL, CLIMB }
const SPEED := 200
const JUMP_SPEED := -200
const GRAVITY := 800

signal triggered

var velocity := Vector2()
var state := NORMAL
var triggerable : Node
var last_triggerable : Node
var is_triggerable := false

func _ready() -> void:
	add_to_group("actors")

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	match state:
		NORMAL:
			horizontal()
			trigger(triggerable)
			jump()
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


func jump() -> void:
	if Input.is_action_just_pressed("arrow_up") and is_on_floor():
		velocity.y = JUMP_SPEED

			
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


func trigger(item) -> void:
	if is_triggerable:
		if Input.is_action_just_pressed("a"):
			connect("triggered", item, "_on_triggered")
			emit_signal("triggered")
			print(self.name + " triggered " + item.name)


func on_interactable_entered(obj_pos) -> void:
	print("Ladder!")
	state = CLIMB
	global_position.x = obj_pos.x
	$AnimationPlayer.play("climb_idle")


func on_interactable_exited(obj_pos) -> void:
	state = NORMAL
	print("Ladder no more!")
	

func on_triggerable_entered(item) -> void:
	is_triggerable = true
	print("Player can trigger " + item.name)
	triggerable = item


func on_triggerable_exited(item) -> void:
	is_triggerable = false
	print("Player cannot trigger " + item.name)
	last_triggerable = triggerable
