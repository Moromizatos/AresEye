extends ColorRect

onready var msg_label = $Panel/MarginContainer/VBoxContainer/CenterContainer/MSG
onready var aPlayer = $aPlayer

var _msg setget set_msg, get_msg
var _path setget set_path, get_path

func _init():
	set_msg()

func set_msg(value = "test"):
	_msg = value

func get_msg():
	return _msg

func set_path(path):
	_path = path

func get_path():
	return _path

func modal_in(path):
	set_path(path)
	aPlayer.play("MODAL_IN")

func _on_OK_pressed():
	if _path == "" or _path == null:
		set_path("res://Scenes/MENU/MENU.tscn")
	Transition.transite(_path)
	
func _on_CANCEL_pressed():
	aPlayer.play("MODAL_OUT")

func _on_MODAL_visibility_changed():
	msg_label.text = _msg
