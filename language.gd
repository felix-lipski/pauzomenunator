extends Node3D
#extends Area3D
@export var buttonsound: EventAsset

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		#FMODRuntime.play_one_shot(buttonsound, self)
		var level_switcher = get_node("/root/LevelSwitcher")
		if level_switcher.language == "traditional":
			level_switcher.language = "modern"
		else:
			level_switcher.language = "traditional"
		$Key/Model/Label3D.text = level_switcher.language
