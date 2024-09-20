extends "res://slider.gd"
@export var fov: EventAsset
func apply_value(delta: float) -> void:
	var camera = get_node("/root/LevelSwitcher/World/Player/Head/FirstPersonCameraReference/Camera3D")
	camera.fov = 75 + (delta * 25)
	FMODRuntime.play_one_shot(fov, self)
