extends Area3D
var next_scene_path : String = "res://level2.tscn"
func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_pressed():
		##var next_scene = load(next_scene_path)
		#var player = $"/root/World/Player"
		#var scn = get_tree().change_scene_to_file(next_scene_path)
		#var current_scene = get_tree().current_scene
		#player.get_parent().remove_child(player)
		#current_scene.add_child(player)
		var level_switcher = get_node("/root/LevelSwitcher")
		if level_switcher.level == 1:
			level_switcher.switch_level(2)
		else:
			level_switcher.switch_level(1)
		#if next_scene:
			#get_tree().change_scene_to(next_scene)
			#
		#else:
			#print("Failed to load the new scene.")
