extends Node


func get_next_color() -> Color:
	var hue: float = randf()
	var current_color: Color = Color.from_hsv(hue, 1.0, 1.0)
	return current_color
