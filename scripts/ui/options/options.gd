extends Control


@export var back_input_map: String = "ui_cancel"


func _ready() -> void:
	modulate = ColorController.get_next_color()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(back_input_map):
		if ! await SceneManager.goto_scene(SceneManager.main_menu_scene_res_path):
			pass
			#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
