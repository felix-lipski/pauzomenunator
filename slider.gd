extends Area3D

var holding = false

func apply_value(delta: float):
	print("apply_value default", delta)

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event is InputEventMouseButton or (event is InputEventMouseMotion and event.button_mask == 1)):
		holding = true
		var right = global_transform.basis.x
		var delta = (event_position - global_position).dot(right)/0.15
		$Handle.position.x = clamp(delta*0.15, 0, 1)
		apply_value(delta)

func _process(delta: float) -> void:
	if Input.is_action_just_released("left_click"):
		holding = false
		print("released")
