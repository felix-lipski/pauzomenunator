extends Area3D


func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	print(event)
	if (event is InputEventMouseButton or (event is InputEventMouseMotion and event.button_mask == 1)):
		var delta = (global_position - event_position).length()/0.12
		print(delta)
		$Handle.position.x = delta*0.12
		get_node("/root/World/Player/Head/FirstPersonCameraReference/Camera3D").fov = 75 + (delta*25)
