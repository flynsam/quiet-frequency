extends Node2D

var colors = []
var color = preload("res://scenes/misc/colorr.tscn")
var panel = preload("res://scenes/misc/colorpanel.tscn")
var total_colors: Array[int]  = [0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var p = panel.instantiate()
	p.position.x = randi_range(400,600) 
	p.position.y = randi_range(300,400)
	add_child(p)
	var n = randi_range(10,20)
	for i in range(n):
		colors.append(color.instantiate())
		colors[i].position.x =  randi_range(128+100,896-100)
		colors[i].position.y =  randi_range(64+100,576-100)
		add_child(colors[i])
		total_colors[colors[i].get_child(0).circle_color] += 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_match_pressed() -> void:
	var panel_node = get_node("Colorpanel/Sprite2D")
	var c = panel_node.number_of_overlaps()
	panel_node =  panel_node.box_color
	var suc = 0
	for i in range(4):
		if i == panel_node and total_colors[i] == c[i]:
			suc += 1
		elif c[i] == 0:
			suc += 1
	if suc == 4:
		print("sucess")
			 
	
	
	
	pass # Replace with function body.
