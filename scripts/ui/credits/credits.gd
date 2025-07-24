extends Control


@export var next_page_scene_res_path: String
@export var previous_page_scene_res_path: String

@export var next_button: Button
@export var previous_button: Button
@export var return_button: Button

@export var back_input_map: String = "ui_cancel"


func _ready() -> void:
	modulate = ColorController.get_next_color()

	var __: Error = return_button.pressed.connect(_on_return_button_pressed) as Error
	__ = previous_button.pressed.connect(_on_last_page_button_pressed) as Error
	__ = next_button.pressed.connect(_on_next_page_button_pressed) as Error


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(back_input_map):
		goto_main_menu()


func _on_return_button_pressed() -> void:
	goto_main_menu()


func _on_next_page_button_pressed() -> void:
	if ! await SceneManager.goto_scene(next_page_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_last_page_button_pressed() -> void:
	if ! await SceneManager.goto_scene(previous_page_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func goto_main_menu() -> void:
	if ! await SceneManager.goto_scene(SceneManager.main_menu_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
