extends Node

func _on_Play_pressed():
	disable()
	Transition.transite("res://Scenes/GAME/GAME.tscn")

func _on_Shop_pressed():
	pass # Replace with function body.
	
func _on_Settings_pressed():
	disable()
	Transition.transite("res://Scenes/Settings/Settings.tscn")
	pass # Replace with function body.

func disable():
	$CanvasLayer/Control/CenterContainer/Menu/HBoxContainer/Play.disabled = true
	$CanvasLayer/Control/CenterContainer/Menu/HBoxContainer/Shop.disabled = true
	$CanvasLayer/Control/CenterContainer/Menu/HBoxContainer/Settings.disabled = true
