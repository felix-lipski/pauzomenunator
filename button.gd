extends Area3D
@export var click_button: EventAsset
var toggled = true

func on_press(toggled):
	get_node("/root/LevelSwitcher/World/Sun").shadow_enabled = toggled
	get_node("/root/LevelSwitcher").shadows_enabled = toggled
	for child in get_node("/root/LevelSwitcher/World").get_children():
		if child is OmniLight3D:
			child.shadow_enabled = toggled

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		FMODRuntime.play_one_shot(click_button, self)
		toggled = !toggled
		#get_node("/root/World/Sun").shadow_enabled = toggled
		on_press(toggled)
		$ButtonBinary.toggle(toggled)
		
		#if toggled:
			#var new_color = Color(0, 1, 0, 1)
			#$Model.mesh.surface_get_material(0).albedo_color = new_color
		#else:
			#var new_color = Color(1, 0, 0, 1)
			#$Model.mesh.surface_get_material(0).albedo_color = new_color
