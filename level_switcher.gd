extends Node3D

var level = "level1"

func switch_level(new_level: String):
	var player = $World/Player
	var current_scene = $World
	current_scene.remove_child(player)
	remove_child(current_scene)
	
	var new_scene = load("res://" + new_level + ".tscn")
	var instance = new_scene.instantiate()
	if instance.has_node("Player"):
		var p = instance.get_node("Player")
		instance.remove_child(p)
		#p.queue_free()
	instance.add_child(player)
	add_child(instance)
	
	level = new_level


var paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$World/Player/Head/PauseMenu.hide()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if paused:
			$World/Player/Head/PauseMenu.hide()
			Engine.time_scale = 1
			paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			paused = true
			$World/Player/Head/PauseMenu.show()
			Engine.time_scale = 0
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	pass
