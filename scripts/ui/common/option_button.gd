extends "res://scripts/ui/common/focusable_button.gd"


@export var title_label: Label
@export var description_label: Label
@export var hint_label: Label

@export_multiline var title_override: String = ""
@export_multiline var description_override: String = ""
@export_multiline var hint_override: String = ""

@export var target_scene: String = ""


func _ready() -> void:
	super()

	var __: Error = self.focus_entered.connect(_on_focus_entered) as Error
	__ = self.pressed.connect(_on_button_pressed) as Error


func _on_focus_entered() -> void:
	super()

	title_label.text = title_override
	description_label.text = description_override
	if hint_label != null:
		hint_label.text = hint_override


func _on_button_pressed() -> void:
	if target_scene != null and not target_scene.is_empty() and not target_scene == " ":
		if ! await SceneManager.goto_scene(target_scene):
			pass
			#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
