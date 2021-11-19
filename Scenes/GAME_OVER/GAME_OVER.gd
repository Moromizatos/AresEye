extends Node



func _on_Back_pressed():
	disable()
	Transition.transite("res://Scenes/MENU/MENU.tscn")


func _on_Replay_pressed():
	disable()
	Transition.transite("res://Scenes/GAME/GAME.tscn")

func disable():
	$CanvasLayer/Control/CenterContainer/Menu/HBoxContainer/Back.disabled = true
	$CanvasLayer/Control/CenterContainer/Menu/HBoxContainer/Replay.disabled = true
