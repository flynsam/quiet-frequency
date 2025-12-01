extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.reset_flow()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/doctorview.tscn")




func _on_leave_pressed() -> void:
	get_tree().quit()
