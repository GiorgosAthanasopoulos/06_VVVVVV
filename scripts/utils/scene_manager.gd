extends Node


const FAILED_CHANGE_SCENE_MSG: String = "Failed to change scene to file= `"
const SUCCESS_EXIT_CODE: int = 0
const ERROR_EXIT_CODE: int = 1


func goto_scene(scene: String) -> bool:
	# Returns whether or not we were able to change to desired scene

	var error: Error = get_tree().change_scene_to_file(scene)

	if error != OK:
		var msg: String = "".join([FAILED_CHANGE_SCENE_MSG, scene, "`: ", error_string(error)])
		push_error(msg)
		Dialogs.show_accept_dialog(msg)
		return false

	return true


func goto_scene_packed(scene: PackedScene) -> bool:
	var error: Error = get_tree().change_scene_to_packed(scene)

	if error != OK:
		var msg: String = "".join([FAILED_CHANGE_SCENE_MSG, scene, "`: ", error_string(error)])
		push_error(msg)
		Dialogs.show_accept_dialog(msg)
		return false

	return true


func quit(exit_code: int = SUCCESS_EXIT_CODE) -> void:
	# TODO: do we have to do anything before shutting down? (e.g. saving saves, etc.) -- careful if exit code is non zero smth went wrong
	if get_tree():
		get_tree().quit(exit_code)
