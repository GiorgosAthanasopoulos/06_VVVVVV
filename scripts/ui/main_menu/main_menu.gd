extends Control


# TODO: starting color blue after going into each submenu return with color of that submenu (or random?)


@onready var main_menu_ui: PanelContainer = $panel_container
@onready var pause_menu_ui: PanelContainer = $pause_menu_panel_container
@onready var levels_button: Button = $panel_container/margin_container/v_box_container/margin_container_2/v_box_container/margin_container/levels_button
@onready var yes_quit_button: Button = $pause_menu_panel_container/margin_container/v_box_container/margin_container/yes_quit_button


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		_on_quit_button_pressed()


func _on_quit_button_pressed() -> void:
	main_menu_ui.visible = false
	pause_menu_ui.visible = true
	yes_quit_button.grab_focus()


func _on_credits_button_pressed() -> void:
	# TODO: goto credits scene
	pass # Replace with function body.


func _on_options_button_pressed() -> void:
	# TODO: goto options scene
	pass # Replace with function body.


func _on_levels_button_pressed() -> void:
	# TODO: goto levels scene
	pass # Replace with function body.


func _on_yes_quit_button_pressed() -> void:
	SceneManager.quit()


func _on_no_return_button_pressed() -> void:
	pause_menu_ui.visible = false
	main_menu_ui.visible = true
	levels_button.grab_focus()
