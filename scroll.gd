extends Area3D

@export var down = false

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_pressed():
		if down:
			$"../../../Modules".position.y += 0.1
		else:
			$"../../../Modules".position.y -= 0.1
