extends Area3D
@export var buttonsound: EventAsset

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		FMODRuntime.play_one_shot(buttonsound, self)
		InputMap.action_erase_events(get_parent().action_name)
		$"../Key/Model/Label3D".text = "..."
