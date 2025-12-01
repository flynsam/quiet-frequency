extends Node2D

var freq = preload("res://scenes/miniGames/frequency.tscn")
var ice = preload("res://scenes/miniGames/icebreaker.tscn")
var color = preload("res://scenes/miniGames/sortcolors.tscn")
var start = false
@onready var next = $Back
@onready var scanner_line = $scanner# Get the path to your scanner node
@onready var animation_player = $AnimationPlayer
const SCAN_ANIM_NAME = "XeroxScan"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scanner_line.hide()
	show_patient(DialogueManager.get_ch_name(DialogueManager.get_current_ch()))
	
	pass # Replace with function body.

func game_start() ->void:
	var f = freq.instantiate()
	var i = ice.instantiate()
	var s = color.instantiate()
	var games = [f,i,s]
	add_child(games[DialogueManager.get_game_name(DialogueManager.get_current_ch())])
	$Health.game_start = true
	$Health.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_confirm_pressed() -> void:
	if $ParallaxBackground/Screen/off.visible:
		return
	if not animation_player.is_playing():
		scanner_line.show()
		animation_player.play(SCAN_ANIM_NAME)
		await animation_player.animation_finished
		scanner_line.hide()
		print("animation")
	if ! start:
		game_start()
		start = true
	else:
		get_child(-1)._on_match_pressed()
	if get_child(-1).game_end:
		#$Label.text = "Sucess"
		$Health.game_end = true
		next.visible = true
	else:
		$Health.game_end = false
	 # Replace with function body.


func _on_power_pressed() -> void:
	if $ParallaxBackground/Screen/on.visible:
		$ParallaxBackground/Screen/on.visible = false
		$ParallaxBackground/Screen/off.visible = true
		$Health.state = "white"
		if start:
			get_child(-1).visible = false
			$Health.visible = false
	else:
		$ParallaxBackground/Screen/on.visible = true
		$ParallaxBackground/Screen/off.visible = false
		
		if start:
			get_child(-1).visible = true
			$Health.visible = true
	pass # Replace with function body.


func _on_info_pressed() -> void:
	$CanvasLayer/InfoRect.visible = ! $CanvasLayer/InfoRect.visible
	pass # Replace with function body.


func show_patient(sprite_name_to_show: String):
	var found_child_node = $ParallaxBackground/patient.get_node_or_null(sprite_name_to_show)
	
	if found_child_node == null:
		print("Error: Sprite with name '", sprite_name_to_show, "' not found.")
		return

	# 1. Hide all children first
	for child in $ParallaxBackground/patient.get_children():
		# Check if the child can be hidden (e.g., Sprite2D, Node2D, Control)
		if child is CanvasItem:
			child.visible = false
	
	# 2. Show only the specific child that was requested
	# We already checked it exists and is valid
	found_child_node.visible = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == SCAN_ANIM_NAME:
		scanner_line.hide()
		#print("done")
	pass # Replace with function body.


func _on_back_pressed() -> void:
	var new_scene_resource = preload("res://scenes/patientinview.tscn")
	var new_scene_instance = new_scene_resource.instantiate() 
	
	new_scene_instance.patientout = true
	new_scene_instance.pateintin = false
	get_tree().get_root().add_child(new_scene_instance)
	get_tree().set_current_scene(new_scene_instance)
	queue_free()
	pass # Replace with function body.
