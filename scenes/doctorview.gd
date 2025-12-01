extends Node2D

@onready var animation_player = $AnimationPlayer
@export var first = true
@export var second = false
@onready var patient_dialog = $Patientdialog
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#DialogueManager.reset_flow()
	show_patient(DialogueManager.get_ch_name(DialogueManager.get_current_ch()))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if first :
		patient_dialog._dialog.text = DialogueManager.get_dialogue(DialogueManager.get_current_ch())[0]
		patient_dialog._name.text = DialogueManager.get_current_ch()
		
		animation_player.play("fade_in")
		await animation_player.animation_finished
		first = false
		#next_character()
	if second:
		patient_dialog._dialog.text = DialogueManager.get_dialogue(DialogueManager.get_current_ch())[1]
		patient_dialog._name.text = DialogueManager.get_current_ch()
		second = false
		#add fade out animation
		animation_player.play("fade_out")
		await animation_player.animation_finished
		next_character()
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

func next_character() -> void:
	if DialogueManager.has_character():
		DialogueManager.advance_character_in_flow()
		show_patient(DialogueManager.get_ch_name(DialogueManager.get_current_ch()))
		first = true
	else:
		#end game credits
		pass
	pass
func _on_computer_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/computer.tscn")
	#next_character()


func _on_patient_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/patientinview.tscn")
