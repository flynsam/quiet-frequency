extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var doctor = $doctordialog


@export var name_text = 'Doctor'

@export var pateintin = true
@export var patientout = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_patient(DialogueManager.get_ch_name(DialogueManager.get_current_ch()))
	patientout=true
	pateintin=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pateintin :
		patient_in()
		pateintin = false
	if patientout:
		patient_out()
		patientout = false
		
		
	pass

func patient_in()->void:
	doctor._dialog.text = DialogueManager.get_dialogue(name_text)[1]
	doctor._name.text = name_text
	doctor._dialog.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	doctor._dialog.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	animation_player.play("dialog_visi")
	await animation_player.animation_finished
	_on_minigamescreen_pressed()

func patient_out() -> void:
	doctor._dialog.text = DialogueManager.get_dialogue(name_text)[2]
	doctor._name.text = name_text
	doctor._dialog.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	doctor._dialog.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	animation_player.play("dialog_visi")
	await animation_player.animation_finished
	back_to_main_room()
	
func _on_minigamescreen_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/miniGames/minigame.tscn")

func back_to_main_room() -> void:
	
	var new_scene_resource = preload("res://scenes/doctorview.tscn")
	var new_scene_instance = new_scene_resource.instantiate() 
	
	new_scene_instance.first = false
	new_scene_instance.second = true
	get_tree().get_root().add_child(new_scene_instance)
	get_tree().set_current_scene(new_scene_instance)
	queue_free()
	pass 
	
func show_patient(sprite_name_to_show: String):
	var found_child_node =$patient.get_node_or_null(sprite_name_to_show)
	
	if found_child_node == null:
		print("Error: Sprite with name '", sprite_name_to_show, "' not found.")
		return

	# 1. Hide all children first
	for child in $patient.get_children():
		# Check if the child can be hidden (e.g., Sprite2D, Node2D, Control)
		if child is CanvasItem:
			child.visible = false
	
	# 2. Show only the specific child that was requested
	# We already checked it exists and is valid
	found_child_node.visible = true
