extends Control

onready var back = $Panel/MarginContainer/VBoxContainer/Back

func _on_Back_pressed():
	back.disabled = true
	Transition.transite("res://Scenes/MENU/MENU.tscn")
