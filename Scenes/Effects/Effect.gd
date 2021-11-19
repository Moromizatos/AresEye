extends Node2D

onready var animation = find_node("AnimationPlayer")

func _ready():
	animation.play("Hit")
	yield(animation,"animation_finished")
	queue_free()
