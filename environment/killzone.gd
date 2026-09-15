extends Area2D

@export var kill_groups: Array[String] = ["player"]

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	for group: String in kill_groups:
		if body.is_in_group(group):
			body.queue_free()
