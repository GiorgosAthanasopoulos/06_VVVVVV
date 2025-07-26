extends "res://scripts/ui/options/options.gd"


@onready var flip_mode_button: OptionButton_ = $panel_container/margin_container/v_box_container/margin_container_2/margin_container_3/flip_mode_button
@onready var toggle_fps_button: OptionButton_ = $panel_container/margin_container/v_box_container/margin_container_2/margin_container_2/toggle_fps_button


# TODO: move these to settings class
var flip: bool = false
var fps: bool = false


func _ready() -> void:
	super()

	# TODO: set base values depending on loaded settings (flip,toggle_fps)


func _on_flip_mode_button_pressed() -> void:
	# TODO: play splash effect when enabling
	flip = not flip
	flip_mode_button.hint_override = "Currently ENABLED!" if flip else "Current Disabled."
	flip_mode_button._on_focus_entered()
	# TODO: implement _on_flip_mode_button_pressed (change hint, apply settings, save)
	pass


func _on_toggle_fps_button_pressed() -> void:
	fps = not fps
	toggle_fps_button.hint_override = "Current mode: Over 30 FPS" if fps else "Current mode: 30 FPS"
	toggle_fps_button._on_focus_entered()
	# TODO: implement _on_toggle_fps_button_pressed (change hint, apply settings, save)
	pass


func _on_clear_main_game_data_button_pressed() -> void:
	# TODO: implement _on_clear_main_game_data_button_pressed (delete main game data -- if we will have any xD )
	pass


func _on_clear_custom_level_data_button_pressed() -> void:
	# TODO: implement _on_clear_custom_level_data_button_pressed (delete custom level data -- if we will have any xD )
	pass
