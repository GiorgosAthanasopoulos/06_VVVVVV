extends AnimatableBody2D

enum Type {
	VERTICAL,
	HORIZONTAL
}

enum Direction {
	LEFT,
	RIGHT,
	UP,
	DOWN,
}

@export var movement_speed := 300.0

@export var move_type := Type.HORIZONTAL
@export var default_dir := Direction.RIGHT

@export var left_boundary: Area2D
@export var right_boundary: Area2D
@export var top_boundary: Area2D
@export var bottom_boundary: Area2D

var _dir := Direction.RIGHT

var left_boundary_pos: Vector2
var right_boundary_pos: Vector2
var top_boundary_pos: Vector2
var bottom_boundary_pos: Vector2

func _ready() -> void:
	if move_type == Type.HORIZONTAL:
		assert(default_dir == Direction.RIGHT || default_dir == Direction.LEFT)

		left_boundary.body_entered.connect(_on_left_entered)
		right_boundary.body_entered.connect(_on_right_entered)

	elif move_type == Type.VERTICAL:
		assert(default_dir == Direction.UP || default_dir == Direction.DOWN)

		top_boundary.body_entered.connect(_on_top_entered)
		bottom_boundary.body_entered.connect(_on_bottom_entered)

	_dir = default_dir

	left_boundary_pos = left_boundary.global_position
	right_boundary_pos = right_boundary.global_position
	top_boundary_pos = top_boundary.global_position
	bottom_boundary_pos = bottom_boundary.global_position

func _physics_process(delta: float) -> void:
	var velocity := Vector2()

	if _dir == Direction.LEFT:
		velocity.x -= movement_speed
	elif _dir == Direction.RIGHT:
		velocity.x += movement_speed
	elif _dir == Direction.UP:
		velocity.y += movement_speed
	elif _dir == Direction.DOWN:
		velocity.y -= movement_speed

	velocity *= delta
	# move_and_collide(velocity)
	global_position += velocity

	left_boundary.global_position = left_boundary_pos
	right_boundary.global_position = right_boundary_pos
	top_boundary.global_position = top_boundary_pos
	bottom_boundary.global_position = bottom_boundary_pos

func _on_left_entered(_body: Node2D) -> void:
	_dir = Direction.RIGHT

func _on_right_entered(_body: Node2D) -> void:
	_dir = Direction.LEFT

func _on_top_entered(_body: Node2D) -> void:
	_dir = Direction.DOWN

func _on_bottom_entered(_body: Node2D) -> void:
	_dir = Direction.UP
