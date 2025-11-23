extends Sprite2D

@onready var blue = preload("res://assets/sorting/bluerec.png")
@onready var green = preload("res://assets/sorting/greenrec.png")
@onready var yellow = preload("res://assets/sorting/yellowrec.png")
@onready var purple = preload("res://assets/sorting/purplerec.png")
@export var box_color = -1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var c = [blue,green,yellow,purple]
	box_color = randi_range(0,3)
	$".".texture = c[box_color]
	var s = randf_range(0.3,0.7)
	$".".scale = Vector2(s,s)
	self.modulate = Color(1, 1, 1, 0.5)



func number_of_overlaps() -> Array[int]:
	var overlapping_bodies = $Area2D.get_overlapping_areas()
	var number_of_bodies: Array[int]  = [0,0,0,0]
	for b in overlapping_bodies:
		number_of_bodies[b.get_parent().circle_color] += 1
	
	print("Number of overlapping bodies: ", number_of_bodies)
	return number_of_bodies
