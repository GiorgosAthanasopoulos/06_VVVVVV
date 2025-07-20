extends Control


@export var action_input_map: String = "action"
@export var main_menu_scene_res_path: PackedScene


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(action_input_map):
		_on_action_pressed()


func _on_action_pressed() -> void:
	if !SceneManager.goto_scene_packed(main_menu_scene_res_path):
		SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
