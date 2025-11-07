extends Control

signal angle_changed(new_angle: float)
signal success

@export var min_angle := 0.0
@export var max_angle := 180.0
@export var rotation_range := 180.0  # degrees dial rotates visually
@onready var needle := $Needle

var angle := 0.0
var target_angle := 0.0
var tolerance := 3.0

var dragging := true
var drag_start_x := 0.0
var drag_start_angle := 0.0

func _ready():
	randomize()
	target_angle = randf_range(min_angle, max_angle)
	print(target_angle)
	angle = min_angle
	update_needle()

func set_angle(value: float) -> void:
	angle = clamp(value, min_angle, max_angle)
	update_needle()
	emit_signal("angle_changed", angle)
	check_success()

func update_needle() -> void:
	# Map angle (0-180) to rotation range (-90 to +90 degrees for example)
	var rotation_deg = lerp(-rotation_range / 2, rotation_range / 2, (angle - min_angle) / (max_angle - min_angle))
	needle.rotation_degrees = rotation_deg

func _unhandled_input(event: InputEvent) -> void:
	print("Input Event: ", event)
	print("Dial rect: ", get_global_rect())
	if event is InputEventMouseButton:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			print('left clicked')
			if event.pressed and get_global_rect().has_point(event.position):
				dragging = true
				drag_start_x = event.position.x
				drag_start_angle = angle
				grab_focus()
			else:
				dragging = false
		
	elif event is InputEventMouseMotion and dragging:
		print('left dragged')
		var delta_x = event.position.x - drag_start_x
		var degrees_per_pixel = 0.5
		set_angle(clamp(drag_start_angle + delta_x * degrees_per_pixel, min_angle, max_angle))
	elif event is InputEventKey and has_focus():
		if event.pressed:
			if event.keycode == Key.KEY_UP:
				set_angle(angle + 1)
			elif event.keycode == Key.KEY_DOWN:
				set_angle(angle - 1)

func check_success() -> void:
	if abs(angle - target_angle) <= tolerance:
		emit_signal("success")
