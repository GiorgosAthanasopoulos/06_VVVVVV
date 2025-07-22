extends Control


@export var next_page_scene_res_path: String = "res://scenes/ui/credits/0-10/credits_2.tscn"
@export var previous_page_scene_res_path: String = "res://scenes/ui/credits/21-30/credits_22.tscn"

@export var next_button: Button
@export var previous_button: Button
@export var return_button: Button


func _ready() -> void:
	modulate = ColorController.get_next_color()

	var __: Error = return_button.pressed.connect(_on_return_button_pressed) as Error
	__ = previous_button.pressed.connect(_on_last_page_button_pressed) as Error
	__ = next_button.pressed.connect(_on_next_page_button_pressed) as Error


func _on_return_button_pressed() -> void:
	if ! await SceneManager.goto_scene(SceneManager.main_menu_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_next_page_button_pressed() -> void:
	if ! await SceneManager.goto_scene(next_page_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_last_page_button_pressed() -> void:
	if ! await SceneManager.goto_scene(previous_page_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
