extends Node

var _general_volume : int = 50 setget set_volume, get_volume
var _audio_effects : int = 50 setget set_effects, get_effects

enum {POOR,DETAILED}
var _graphics : int = DETAILED setget set_graphics, get_graphics

func set_volume(value:int) -> void:
	_general_volume = value
func get_volume() -> int:
	return _general_volume

func set_effects(value:int) -> void:
	_audio_effects = value
func get_effects() -> int:
	return _audio_effects

func set_graphics(value:int) -> void:
	_graphics = value
func get_graphics() -> int:
	return _graphics
