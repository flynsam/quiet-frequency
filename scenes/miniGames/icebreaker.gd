extends Node2D

var num_ice_nodes = randi_range(3,5)
var ice_nodes = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ice = preload("res://scenes/misc/ice.tscn")
	for i in range(num_ice_nodes):
		ice_nodes.append(ice.instantiate())
		ice_nodes[i].position.x = randi_range(128+100,896-100)#+get_parent().shape.positon.x
		ice_nodes[i].position.y = randi_range(64+100,576-100)#+get_parent().positon.y
		if randi_range(0,2) == 0:
			ice_nodes[i].with_dollar = true
			print('hasdollar')
		add_child(ice_nodes[i])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_match_pressed() -> void:
	var count = 0
	for b in ice_nodes:
		if b.brain_part.visible:
			count += 1
	if count == len(ice_nodes):
		print('sucess')

	pass # Replace with function body.
