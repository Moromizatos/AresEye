extends Node

var hp_count := 23
var jp_count := 56
var cp_count := 17
var kp_count := 453

func on_jump_signal():
	jp_count += 1

func reset():
	hp_count = 0
	jp_count = 0
	cp_count = 0
	kp_count = 0

func total() -> int:
	return ((hp_count*16)+(kp_count*16)+(cp_count*12)-(jp_count*2))
