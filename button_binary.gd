extends Node3D

@export var init_toggled = true

func _ready() -> void:
	if init_toggled:
		$Button_Czerwone.hide()
		$Button_Zielone.show()
	else:
		$Button_Czerwone.show()
		$Button_Zielone.hide()

func toggle(toggled):
	#toggled = !toggled
	if toggled:
		$Button_Czerwone.hide()
		$Button_Zielone.show()
	else:
		$Button_Czerwone.show()
		$Button_Zielone.hide()
