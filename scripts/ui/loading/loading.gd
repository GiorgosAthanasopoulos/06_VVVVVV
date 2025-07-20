extends Control


@onready var loading_label: Label = $panel_container/v_box_container/margin_container/margin_container/loading_label


@export var loading_text: String = "LOADING... "
@export var loading_duration_seconds: int = 3
@export var pre_main_menu_scene_res_path: PackedScene


var _loading_percentage: float = 0


func _process(delta: float) -> void:
	update_loading_percentage(delta)


func update_loading_percentage(delta: float) -> void:
	var increment: float = 100 * delta / loading_duration_seconds
	_loading_percentage = min(_loading_percentage + increment, 100.0)
	loading_label.text = loading_text + str(_loading_percentage as int) + "%"

	if _loading_percentage == 100:
		if !SceneManager.goto_scene_packed(pre_main_menu_scene_res_path):
			SceneManager.quit(SceneManager.ERROR_EXIT_CODE)
