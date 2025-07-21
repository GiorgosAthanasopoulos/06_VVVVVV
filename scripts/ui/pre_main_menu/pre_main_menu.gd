extends Control


@export var action_input_map: String = "ui_accept"


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(action_input_map):
		_on_action_pressed()


func _on_action_pressed() -> void:
	if ! await SceneManager.goto_scene(SceneManager.main_menu_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
