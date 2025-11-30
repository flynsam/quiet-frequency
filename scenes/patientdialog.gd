extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ParallaxBackground/dialog/box/Label.text = "Current dialog test testing with the typing animation hoorah Current dialog test testing with the typing animation hoorah Current dialog test testing with the typing animation hoorahCurrent dialog test testing with the typing animation hoorah"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_pressed() -> void:
	$ParallaxBackground/dialog/box/Label.finish_typing_immediately()
