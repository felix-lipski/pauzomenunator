extends "res://slider.gd"
@export var sound: EventAsset
var instance: EventInstance
var playing = false

func _ready():
	instance = FMODRuntime.create_instance(sound)


func apply_value(delta: float) -> void:
	var player = get_node("/root/LevelSwitcher/World/Player")
	player.mouse_sensitivity = delta * 3


func _process(delta: float) -> void:
	if self.holding and not playing:
		instance.start()
		playing = true
	if (not self.holding) and playing:
		instance.stop(FMODStudioModule.FMOD_STUDIO_STOP_IMMEDIATE)
		playing = false
