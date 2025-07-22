extends Control


@export var next_page_scene_res_path: String = "res://scenes/ui/credits/0-10/credits_10.tscn"
@export var previous_page_scene_res_path: String = "res://scenes/ui/credits/0-10/credits_8.tscn"


func _ready() -> void:
	modulate = ColorController.get_next_color()


func _on_next_page_button_pressed() -> void:
	if ! await SceneManager.goto_scene(next_page_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_previous_page_button_pressed() -> void:
	if ! await SceneManager.goto_scene(previous_page_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_return_button_pressed() -> void:
	if ! await SceneManager.goto_scene(SceneManager.main_menu_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
