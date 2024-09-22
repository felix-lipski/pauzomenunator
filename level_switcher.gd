extends Node3D

#var level = "level1"
var level = 1

var levels = [null, null, null]
var postions = [null, Vector3(), Vector3()]
var language = "traditional"

func switch_level(new_level: int):
	var player = $World/Player
	postions[level] = player.position

	var current_scene = $World
	current_scene.remove_child(player)
	remove_child(current_scene)
	levels[level] = current_scene
	

	#var instance = new_scene.instantiate()
	var instance = levels[new_level]
	if instance == null:
		var new_scene = load("res://level" + String.num(new_level) + ".tscn")
		instance = new_scene.instantiate()
	
	
	if instance.has_node("Player"):
		var p = instance.get_node("Player")
		instance.remove_child(p)
		#p.queue_free()
	instance.add_child(player)
	player.position = postions[new_level]

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
