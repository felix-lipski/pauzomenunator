extends Area3D

var waiting = false

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		if waiting:
			pass
		else:
			waiting = true
			InputMap.action_erase_events(get_parent().action_name)
			$Model/Label3D.text = "input key"

func _input(event):
	if event is InputEventKey and waiting:
		print(event.as_text_keycode())
		InputMap.action_add_event(get_parent().action_name, event)
		$Model/Label3D.text = event.as_text_keycode()
		waiting = false
