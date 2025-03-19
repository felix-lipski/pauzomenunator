extends Area3D

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		queue_free()
		get_node("/root/LevelSwitcher/World/Player/Head/PauseMenu/Scroll").show()
