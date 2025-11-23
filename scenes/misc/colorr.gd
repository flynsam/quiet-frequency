extends Sprite2D

var is_dragging: bool = false
var offset1: Vector2 = Vector2.ZERO
@onready var blue = preload("res://assets/sorting/blue.png")
@onready var green = preload("res://assets/sorting/green.png")
@onready var yellow = preload("res://assets/sorting/yllow.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var c = [blue,green,yellow]
	var i = randi_range(0,2)
	$".".texture = c[i]
	self.modulate = Color(1, 1, 1, 0.5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position() + offset1



func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				#print("dragging")
				is_dragging = true
				# Calculate the offset to prevent the object from snapping to the mouse origin
				offset = global_position - get_global_mouse_position()
				get_viewport().set_input_as_handled()
			elif event.is_released():
				is_dragging = false
				get_viewport().set_input_as_handled()
				#print("not dragging")
	
