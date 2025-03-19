extends Label3D

@export var number: int
var camera: Node
var arabic = true

func convert_to_arabic_numerals(number: int) -> String:
	var western_to_arabic = {
		'0': '٠', '1': '١', '2': '٢', '3': '٣',
		'4': '٤', '5': '٥', '6': '٦', '7': '٧',
		'8': '٨', '9': '٩'
	}
	var number_str = str(number)
	var arabic_str = ""
	
	for digit in number_str:
		arabic_str += western_to_arabic.get(digit, digit)
	
	return arabic_str

func _ready() -> void:
	camera = get_node("/root/LevelSwitcher/World/Player/Head/FirstPersonCameraReference/Camera3D")

func _process(delta: float) -> void:
	if get_node("/root/LevelSwitcher").language == "traditional":
		self.text = convert_to_arabic_numerals(number)
	else:
		self.text = str(number)
	
	scale = (100/camera.fov) * Vector3(1,1,1)
