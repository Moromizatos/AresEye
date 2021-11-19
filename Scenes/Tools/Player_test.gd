class_name Player_test
extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 18

signal hurt_signal
#signal _died_signal

var velocity = Vector2()
var jumps = 2
var hp = 8

func _ready():
	velocity.x = run_speed
	$AnimationPlayer.play("Running")

	
func _physics_process(_delta):
	if is_on_ceiling():
		velocity.y = 0
	if is_on_wall():
		velocity.x *= -1
		if $Sprite.flip_h:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	if is_on_floor():
		jumps = 2
		$AnimationPlayer.play("Running")
		if velocity.y > gravity:
			velocity.y = gravity
	else:
		
		velocity.y += gravity
		if velocity.y < -1:
			$AnimationPlayer.play("Jumping")
		elif velocity.y > gravity*2:
			$AnimationPlayer.play("Falling")
		if is_on_wall():
			jumps += 1
	# warning-ignore:return_value_discarded
	move_and_slide(velocity, Vector2(0, -1))

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed() and jumps > 0 and event.position.y > 30:
		velocity.y = jump_speed
		yield(get_tree().create_timer(0.001),"timeout")
		jumps -= 1

func _on_Hurtbox_area_entered(_area):
	if hp > 1:
		hp -= 1
		$EffectsPlayer.play("hurt")
		yield($EffectsPlayer,"animation_finished")
		emit_signal("hurt_signal", hp)
		
	else:
		emit_signal("hurt_signal", 0)
		$Hurtbox.queue_free()
		$AnimationPlayer.stop()
		var effect = load("res://Scenes/Effects/Effect.tscn").instance()
		add_child(effect)
		set_physics_process(false)
		yield(get_tree().create_timer(0.5),"timeout")
		hp = 8
		Transition.transite("res://Scenes/Tools/LevelFileSaver.tscn")

func _on_HeartPickable_hp_up():
	if hp < 8:
		hp += 1
