extends Sprite

var moving_rate = 1

func _process(_delta):
	position.y += 1 * moving_rate
	
	if position.y >= 256:
		position.y = -256
