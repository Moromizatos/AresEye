extends StaticBody2D

signal cp_up
onready var sprite = $Sprite
var type = 1
var points = 1

func _ready():
	var UI = get_node("../../UI")
	connect("cp_up", UI, "_on_CoinPickable_cp_up")
	match type:
		1:
			sprite.animation = "Cooper"
			points = 1
		2:
			sprite.animation = "Silver"
			points = 5
		3:
			sprite.animation = "Gold"
			points = 10

func _on_Pickable_body_entered(body):
	if body is Player:
		Global.cp_count += 1
		emit_signal("cp_up", points)
		queue_free()
