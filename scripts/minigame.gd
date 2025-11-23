extends Node2D

var freq = preload("res://scenes/miniGames/frequency.tscn")
var ice = preload("res://scenes/miniGames/icebreaker.tscn")
var color = preload("res://scenes/miniGames/sortcolors.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var f = freq.instantiate()
	var i = ice.instantiate()
	var s = color.instantiate()
	add_child(f)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
