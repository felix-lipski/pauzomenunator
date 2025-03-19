extends Node3D
@export var ui_menu_open: EventAsset
@export var ui_menu_close: EventAsset
@export var ambience_lvl_1: EventAsset
var instance_lvl_1: EventInstance
@export var ambience_lvl_2: EventAsset
var instance_lvl_2: EventInstance
#var level = "level1"
var level = 1

var levels = [null, null, null]
var postions = [null, Vector3(), Vector3()]
var language = "traditional"

func switch_level(new_level: int):
	if new_level ==1:
		instance_lvl_2.stop(FMODStudioModule.FMOD_STUDIO_STOP_ALLOWFADEOUT)
		instance_lvl_1.start()
	else:
		instance_lvl_1.stop(FMODStudioModule.FMOD_STUDIO_STOP_ALLOWFADEOUT)
		instance_lvl_2.start()
	
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
	instance_lvl_1 = FMODRuntime.create_instance(ambience_lvl_1)
	instance_lvl_2 = FMODRuntime.create_instance(ambience_lvl_2)
	instance_lvl_1.start()
	$World/Player/Head/PauseMenu.hide()
	#pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if paused:
			FMODRuntime.play_one_shot(ui_menu_close, self) 
			$World/Player/Head/PauseMenu.hide()
			Engine.time_scale = 1
			paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			FMODRuntime.play_one_shot(ui_menu_open, self) 
			paused = true
			$World/Player/Head/PauseMenu.show()
			Engine.time_scale = 0
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					
	pass
	
