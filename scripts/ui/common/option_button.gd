extends "res://scripts/ui/common/focusable_button.gd"


@export var title_label: Label
@export var description_label: Label

@export_multiline var title_override: String = ""
@export_multiline var description_override: String = ""

@export var target_scene: String = ""


func _ready() -> void:
	super()

	var __: Error = self.focus_entered.connect(_on_focus_entered) as Error
	__ = self.pressed.connect(_on_button_pressed) as Error


func _on_focus_entered() -> void:
	title_label.text = title_override
	description_label.text = description_override


func _on_button_pressed() -> void:
	if ! await SceneManager.goto_scene(target_scene):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
