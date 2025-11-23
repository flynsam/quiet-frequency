extends Node2D

var colors = []
var color = preload("res://scenes/misc/colorr.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var n = randi_range(10,20)
	for i in range(n):
		colors.append(color.instantiate())
		colors[i].position.x =  randi_range(128+100,896-100)
		colors[i].position.y =  randi_range(64+100,576-100)
		add_child(colors[i])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
