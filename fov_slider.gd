extends "res://slider.gd"
@export var fov: EventAsset
var instance: EventInstance
var playing = false

func _ready():
	instance = FMODRuntime.create_instance(fov)

func apply_value(delta: float) -> void:
	var camera = get_node("/root/LevelSwitcher/World/Player/Head/FirstPersonCameraReference/Camera3D")
	#FMODRuntime.play_one_shot(fov, self)
	camera.fov = 50 + (delta * 50)


func _process(delta: float) -> void:
	if self.holding and not playing:
		instance.start()
		playing = true
	if (not self.holding) and playing:
		instance.stop(FMODStudioModule.FMOD_STUDIO_STOP_IMMEDIATE)
		playing = false
