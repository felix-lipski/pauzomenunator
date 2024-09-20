extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$KeyInputGroup.action_name = name.to_snake_case()
	$Label.mesh = $Label.mesh.duplicate()
	$Label.mesh.text = name.substr(4)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
