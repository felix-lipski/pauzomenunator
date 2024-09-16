extends Node3D

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if paused:
			$Player/Head/PauseMenu.hide()
			paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			paused = true
			$Player/Head/PauseMenu.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	pass
