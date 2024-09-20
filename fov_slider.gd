extends "res://slider.gd"
@export var fov: EventAsset
func apply_value(delta: float) -> void:
	var camera = get_node("/root/LevelSwitcher/World/Player/Head/FirstPersonCameraReference/Camera3D")
	FMODRuntime.play_one_shot(fov, self)
	camera.fov = 50 + (delta * 50)
