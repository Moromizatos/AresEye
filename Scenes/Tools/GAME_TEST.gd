extends Node

onready var camera = find_node("Camera2D")
onready var player = find_node("Player")
onready var borders = {"right":find_node("RightBorder"),"left":find_node("LeftBorder")}

func _process(_delta):
	borders.right.position.y = player.position.y
	borders.left.position.y = player.position.y
	if player.visible:
		camera.position.y = player.position.y

