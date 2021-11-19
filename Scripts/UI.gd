extends CanvasLayer

onready var heart_points = find_node("HP_Label")
onready var jp_ground = find_node("JP_GND")
onready var jp_wall = find_node("JP_WALL")
onready var coin_points = find_node("CP_Label")

#POPUP INFO
onready var popup = get_node("POPUP")
onready var hp_points_label = get_node("POPUP/Panel/MarginContainer/VBoxContainer/VBoxContainer/HP/value")
onready var jp_points_label = get_node("POPUP/Panel/MarginContainer/VBoxContainer/VBoxContainer/JP/value")
onready var kp_points_label = get_node("POPUP/Panel/MarginContainer/VBoxContainer/VBoxContainer/KP/value")
onready var cp_points_label = get_node("POPUP/Panel/MarginContainer/VBoxContainer/VBoxContainer/CP/value")
onready var total_points_label = get_node("POPUP/Panel/MarginContainer/VBoxContainer/VBoxContainer/Total")


func _ready():
	update_heart_points(5)

func update_jump_points(jp_g = 1, jp_w = 0):
	jp_ground.text = str(jp_g)
	jp_wall.text = str(jp_w)

func _on_TextureButton_pressed():
	get_tree().paused = true

func update_heart_points(hp):
	heart_points.text = str(hp)

func _on_CoinPickable_cp_up(cp):
	coin_points.text = str(int(coin_points.text)+cp)

func _on_Menu_pressed():
	hp_points_label.text = str(Global.hp_count)
	jp_points_label.text = str(Global.jp_count)
	kp_points_label.text = str(Global.kp_count)
	cp_points_label.text = str(Global.cp_count)
	total_points_label.text = str(Global.total())
	get_tree().paused = true
	#$Header/MenuBtn/TouchScreenButton.visible = false
	popup.modal.set_msg("You will loose your progress if you leave, are you sure about leaving?")
	popup.popup_in()
