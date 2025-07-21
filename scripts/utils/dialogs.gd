extends Node

var accept_dialog: AcceptDialog = AcceptDialog.new()


func _ready() -> void:
	add_child(accept_dialog)


func show_accept_dialog(msg: String) -> void:
	accept_dialog.dialog_text = msg
	accept_dialog.popup_centered()
	await accept_dialog.confirmed
