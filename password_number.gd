extends Area3D

var number = 0

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		number = (number + 1) % 10

func _process(delta: float) -> void:
	$Model/Number.text = String.num(number)
