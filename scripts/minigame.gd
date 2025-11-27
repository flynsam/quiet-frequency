extends Node2D

var freq = preload("res://scenes/miniGames/frequency.tscn")
var ice = preload("res://scenes/miniGames/icebreaker.tscn")
var color = preload("res://scenes/miniGames/sortcolors.tscn")
var start = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func game_start() ->void:
	var f = freq.instantiate()
	var i = ice.instantiate()
	var s = color.instantiate()
	add_child(f)
	$Health.game_start = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_confirm_pressed() -> void:
	if ! start:
		game_start()
		start = true
	else:
		get_child(-1)._on_match_pressed()
	if get_child(-1).game_end:
		#$Label.text = "Sucess"
		$Health.game_end = true
	else:
		$Health.game_end = false
	pass # Replace with function body.


func _on_power_pressed() -> void:
	if $CanvasLayer/Screen.visible:
		$CanvasLayer/Screen.visible = false
		$Health.state = "white"
	else:
		$CanvasLayer/Screen.visible = true
		$Health.state = "black"
		$Health/ColorRect.modulate = Color(0, 0, 0, 1)
	pass # Replace with function body.


func _on_info_pressed() -> void:
	$CanvasLayer/InfoRect.visible = ! $CanvasLayer/InfoRect.visible
	pass # Replace with function body.
