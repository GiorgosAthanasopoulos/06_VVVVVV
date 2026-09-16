extends CharacterBody2D

# TODO: implement ememy (patrol+maybe attack)
# TODO: dissolving platforms (disappear a second after being touched by the player)
# TODO: exit room in any direction (hole in the ground, portal, etc) -> goto odjacent room
# TODO: checkpoint to respawn in after dying in every room (light up when interacted)

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := 0.0
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
