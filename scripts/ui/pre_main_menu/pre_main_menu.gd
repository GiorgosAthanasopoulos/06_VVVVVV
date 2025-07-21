extends Control


@export var action_input_map: String = "ui_accept"
@export var main_menu_scene_res_path: String = "res://scenes/ui/main_menu/main_menu.tscn"


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(action_input_map):
		_on_action_pressed()


func _on_action_pressed() -> void:
	if !SceneManager.goto_scene(main_menu_scene_res_path):
		SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
