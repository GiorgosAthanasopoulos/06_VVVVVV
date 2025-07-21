extends Control


# Escape menu
@onready var main_menu_ui: PanelContainer = $panel_container
@onready var pause_menu_ui: PanelContainer = $pause_menu_panel_container
@onready var levels_button: Button = $panel_container/margin_container/v_box_container/margin_container_2/v_box_container/margin_container/levels_button
@onready var yes_quit_button: Button = $pause_menu_panel_container/margin_container/v_box_container/margin_container/yes_quit_button


@export var levels_scene_res_path: String = "res://scenes/ui/levels/levels.tscn"
@export var options_scene_res_path: String = "res://scenes/ui/options/options.tscn"
@export var credits_scene_res_path: String = "res://scenes/ui/credits/0-10/credits.tscn"


func _ready() -> void:
	modulate = ColorController.get_next_color()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if pause_menu_ui.visible:
			hide_pause_menu()
		else:
			show_pause_menu()


func _on_quit_button_pressed() -> void:
	show_pause_menu()


func _on_credits_button_pressed() -> void:
	if ! await SceneManager.goto_scene(credits_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_options_button_pressed() -> void:
	if ! await SceneManager.goto_scene(options_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_levels_button_pressed() -> void:
	if ! await SceneManager.goto_scene(levels_scene_res_path):
		pass
		#SceneManager.quit(SceneManager.ERROR_EXIT_CODE)


func _on_yes_quit_button_pressed() -> void:
	SceneManager.quit()


func _on_no_return_button_pressed() -> void:
	hide_pause_menu()


func show_pause_menu() -> void:
	modulate = ColorController.get_next_color()
	main_menu_ui.visible = false
	pause_menu_ui.visible = true
	yes_quit_button.grab_focus()


func hide_pause_menu() -> void:
	modulate = ColorController.get_next_color()
	pause_menu_ui.visible = false
	main_menu_ui.visible = true
	levels_button.grab_focus()
