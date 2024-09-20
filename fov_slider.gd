extends "res://slider.gd"

func apply_value(delta: float) -> void:
	var camera = get_node("/root/LevelSwitcher/World/Player/Head/FirstPersonCameraReference/Camera3D")
	camera.fov = 50 + (delta * 50)
