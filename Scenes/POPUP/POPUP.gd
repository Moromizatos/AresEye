extends ColorRect

onready var aPlayer = $aPlayer
onready var modal = $MODAL

var destination = ""

func popup_in():
	aPlayer.play("POPUP_IN")

func _on_Home_pressed():
	destination = "res://Scenes/MENU/MENU.tscn"
	modal.modal_in(destination)
	
func _on_Shop_pressed():
	destination = ""
	modal.modal_in(destination)

func _on_Restart_pressed():
	destination = "res://Scenes/GAME/GAME.tscn"
	modal.modal_in(destination)

func _on_Continue_pressed():
	aPlayer.play("POPUP_OUT")
	get_tree().paused = false

func able():
	find_node("Home").disabled = false
	find_node("Shop").disabled = false
	find_node("Restart").disabled = false
	find_node("Continue").disabled = false
	
func disable():
	find_node("Home").disabled = true
	find_node("Shop").disabled = true
	find_node("Restart").disabled = true
	find_node("Continue").disabled = true
