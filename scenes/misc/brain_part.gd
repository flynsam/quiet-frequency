extends Sprite2D

var is_dragging: bool = false
var offset1: Vector2 = Vector2.ZERO

func _ready():
	# Optional: Set the mouse filter to ignore for the Sprite2D itself 
	# to ensure Area2D receives events if needed, but usually default works.
	pass

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int):
	# Check for mouse button press/release within the Area2D
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				#print("dragging")
				is_dragging = true
				# Calculate the offset to prevent the object from snapping to the mouse origin
				offset = global_position - get_global_mouse_position()
			elif event.is_released():
				is_dragging = false
				#print("not dragging")

func _process(delta):
	# If dragging, update the object's position to the mouse position plus the offset
	if is_dragging:
		global_position = get_global_mouse_position() + offset1
