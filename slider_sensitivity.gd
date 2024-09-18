extends "res://slider.gd"

func apply_value(delta: float) -> void:
	var player = get_node("/root/World/Player")
	player.mouse_sensitivity = delta * 3
