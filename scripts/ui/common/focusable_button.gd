extends Button


@export var original_text: String = text
@export var WHITESPACE_BETWEEN_BRACKETS_TEXT: int = 1
@export var left_char: String = "["
@export var right_char: String = "]"


func _ready() -> void:
	original_text = text
	focus_mode = Control.FOCUS_ALL

	var __: Error = self.focus_entered.connect(_on_focus_entered) as Error
	__ = self.focus_exited.connect(_on_focus_exited) as Error


func _on_focus_entered() -> void:
	var whitespace: String = " ".repeat(WHITESPACE_BETWEEN_BRACKETS_TEXT)
	text = left_char + whitespace + original_text.to_upper() + whitespace + right_char


func _on_focus_exited() -> void:
	text = original_text
