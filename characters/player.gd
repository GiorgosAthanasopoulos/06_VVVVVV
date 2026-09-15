extends CharacterBody2D

@export var ground_speed := 300.0
@export var air_speed := 200.0
@export var gravity_force := 400.0
@export var jump_input_action := "jump"
@export var move_left_input_action := "move_left"
@export var move_right_input_action := "move_right"

var _gravity := Vector2(0, 2000)

func _physics_process(delta: float) -> void:
	if is_queued_for_deletion():
		get_tree().reload_current_scene()

	velocity += _gravity * delta

	if Input.is_action_just_pressed(jump_input_action) and is_on_floor():
		_gravity = -_gravity
		up_direction = -_gravity.normalized()

	var speed := ground_speed if is_on_floor() else air_speed
	var direction := Input.get_axis(move_left_input_action, move_right_input_action)
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
