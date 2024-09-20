extends Node3D

@export var initial = [0,0,0]
@export var password = [0,0,0]
@export var chest_unlocked: EventAsset
var locked = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Password/Key1.number = initial[0]
	$Password/Key2.number = initial[1]
	$Password/Key3.number = initial[2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Password/Key1.number == password[0] and $Password/Key2.number == password[1] and $Password/Key3.number == password[2]:
		$Lid.rotation.x = -deg_to_rad(20)
		if locked:
			FMODRuntime.play_one_shot(chest_unlocked, self)
			locked = false
