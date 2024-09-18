extends Node3D

var modules_n = 0

func _ready() -> void:
	$FOV.hide()
	$Sensitivity.hide()
	$Head.hide()
	$Shadows.hide()
	$MoveRight.hide()
	$MoveLeft.hide()
