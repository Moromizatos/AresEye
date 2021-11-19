extends StaticBody2D

signal hp_up

func _on_Pickable_body_entered(body):
	if body is Player:
		Global.hp_count += 1
		connect("hp_up", body, "_on_HeartPickable_hp_up")
		emit_signal("hp_up")
		queue_free()
