extends Area3D

var toggled = true

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		toggled = !toggled
		get_node("/root/World/Sun").shadow_enabled = toggled
		
		if toggled:
			var new_color = Color(0, 1, 0, 1)
			$Model.mesh.surface_get_material(0).albedo_color = new_color
		else:
			var new_color = Color(1, 0, 0, 1)
			$Model.mesh.surface_get_material(0).albedo_color = new_color
		print(toggled)
