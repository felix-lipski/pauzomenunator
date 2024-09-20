extends Area3D
@export var chest_key_select: EventAsset
var number = 0

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		number = (number + 1) % 10
		FMODRuntime.play_one_shot(chest_key_select, self) 
func _process(delta: float) -> void:
	$Model/Number.text = String.num(number)
