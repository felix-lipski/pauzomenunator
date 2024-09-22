extends Area3D

var number = 0
var arabic = false

func arabize(number: int) -> String:
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

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event.is_pressed()):
		number = (number + 1) % 10

func _process(delta: float) -> void:
	if arabic:
		$Model/Number.text = arabize(number)
	else:
		$Model/Number.text = String.num(number)
