extends Node3D

var level = "level1"

func switch_level(new_level: String):
	var scene = load("res://" + new_level + ".tscn")
	var player = $World/Player
	var current
	#get_tree().change_scene_to_file(next_scene_path)
	#var current_scene = get_tree().current_scene
	#player.get_parent().remove_child(player)
	#current_scene.add_child(player)

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
