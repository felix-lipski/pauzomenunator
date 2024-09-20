extends Area3D

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		queue_free()
		var menu = get_node("/root/LevelSwitcher/World/Player/Head/PauseMenu/Modules")
		var module = get_node("/root/LevelSwitcher/World/Player/Head/PauseMenu/Modules/" + name)
		menu.modules_n += 1
		module.show()
		module.position.y = menu.modules_n * -0.1
