extends Node

var night = ["0e1d5d","091042"]
onready var camera = find_node("Camera2D")
onready var player = find_node("Player")
onready var tilemap = find_node("TileMap")
onready var borders = {"right":find_node("RightBorder"),"left":find_node("LeftBorder")}
onready var header = find_node("Header")
onready var game = find_node("Game")

export(OpenSimplexNoise) var noise
export var level_size = Vector2(8,16)
export var platform_cap = 0.5

var last_y_tile = 0
var level = 0
var level_generated = false

func _ready():
	#reseting all the points
	Global.reset()
	randomize()
	make_platforms()
#	make_level()
#	get_tree().paused = true


func _process(_delta):
	if(!get_tree().paused):
		borders.right.position.y = player.position.y
		borders.left.position.y = player.position.y
		if player.visible:
			camera.position.y = player.position.y-32
		else:
			camera.position.y += 1
#	else:
#		camera.position.y -= 1

func make_platforms():
	for i in 11:
		noise.seed = randi()
		for x in range(0,level_size.x+1): #COLLUMNS
			for y in range(0,level_size.y+1): #ROWS
				var a = noise.get_noise_2d(x,y)
				if y%16 == 0:
					tilemap.set_cell(x,-(y+last_y_tile+1),1)
					if x == 8:
						last_y_tile += y
				if a > platform_cap:
					tilemap.set_cell(x,-(y+last_y_tile+1),1)
	tilemap.update_bitmask_region(Vector2.ZERO, Vector2(level_size.x, -level_size.y*last_y_tile))
