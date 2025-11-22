extends Node2D

@onready var ice1 = $Ice1
@onready var ice2 = $Ice2
@onready var ice3 = $Ice3
@onready var brain_part = $Brainpart
@onready var dollar = $Dollar
@export var with_dollar = false

var num_of_hits = randi_range(1,3) * 3
var user_hits = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if user_hits == num_of_hits:
		ice3.visible = true
		ice2.visible = false
	elif int(user_hits*3) == num_of_hits:
		ice2.visible = true
		ice1.visible = false
	elif user_hits > num_of_hits:
		ice3.visible = false
		brain_part.visible = true
		if with_dollar:
			dollar.visible = true
			


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			user_hits += 1
	
