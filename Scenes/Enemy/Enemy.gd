extends KinematicBody2D

onready var notifier = $VisibilityNotifier2D
onready var hitbox = $hitbox

var direction = Vector2.LEFT

func _ready():
	set_physics_process(false)
	$Sprite.play("Flying")

func _physics_process(_delta):
	if !is_on_wall():
		if position.x > 192:
			direction = Vector2.LEFT
			$Sprite.flip_h = false
			$hitbox.rotation_degrees = 0
		if position.x < -32:
			direction = Vector2.RIGHT
			$Sprite.flip_h = true
			$hitbox.rotation_degrees = 180.0
	else:
		direction = direction * -1
		$Sprite.flip_h = false if $Sprite.flip_h else true
		$hitbox.rotation_degrees += 180 
	# warning-ignore:return_value_discarded
	move_and_slide(direction * 120)

func _on_stomp_body_entered(body):
	if(body is Player):
		Global.kp_count += 1
		self.set_collision_layer(0)
		$hitbox.queue_free()
		$stomp.queue_free()
		$CollisionShape2D.queue_free()
		var effect = load("res://Scenes/Effects/Effect.tscn").instance()
		add_child(effect)
		set_physics_process(false)
		body.velocity.y = -200
		$Sprite.play("Dying")
		yield(get_tree().create_timer(0.8),"timeout")
		if (randi() % 10) <= 3:
			var heart = load("res://Scenes/Pickups/Heart/Heart.tscn").instance()
			heart.position = position
			get_tree().root.get_node("GAME").find_node("Game").add_child(heart)
		else:
			var coin = load("res://Scenes/Pickups/Coin/Coin.tscn").instance()
			coin.position = position
			get_tree().root.get_node("GAME").find_node("Game").add_child(coin)
		queue_free()

func _on_Process_body_entered(body):
	if body is Player:
		set_physics_process(true)
	
func _on_Process_body_exited(body):
	if body is Player:
		set_physics_process(false)
