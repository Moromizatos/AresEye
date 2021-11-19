extends CanvasLayer

signal transited()

onready var anim_player = get_node("AnimPlayer")

var colors = [
	Color("ff5277"),
	Color("cc2f7b"),
	Color("9c2a70")]

func transite(path, delay = 0.2):
	var i = randi() % 3
	$Control/Texture.modulate = colors[i]
	$Control/ColorRect.color = colors[i]
	yield(get_tree().create_timer(delay),"timeout")
	anim_player.play("TRANS_IN")
	yield(anim_player,"animation_finished")
	# warning-ignore:return_value_discarded
	get_tree().change_scene(path)
	anim_player.play("FADE_OUT")
	emit_signal("transited")
	get_tree().paused = false
