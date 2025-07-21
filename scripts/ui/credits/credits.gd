extends Control


@export var next_page_scene_res_path: String = "res://scenes/ui/credits/0-10/credits_2.tscn"
@export var last_page_scene_res_path: String = "res://scenes/ui/credits/21-30/credits_22.tscn"


func _ready() -> void:
	modulate = ColorController.get_next_color()


func _on_return_button_pressed() -> void:
	if ! await SceneManager.goto_scene(SceneManager.main_menu_scene_res_path):
		SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_next_page_button_pressed() -> void:
	if ! await SceneManager.goto_scene(next_page_scene_res_path):
		SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_last_page_button_pressed() -> void:
	if ! await SceneManager.goto_scene(last_page_scene_res_path):
		SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
