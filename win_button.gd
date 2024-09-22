extends Area3D
var next_scene_path : String = "res://level2.tscn"
func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_pressed():
		get_tree().quit()
