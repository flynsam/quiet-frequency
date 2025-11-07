extends Control

var top_success: bool = false
var bottom_success: bool = false

func _ready() -> void:
	$TopDial.connect("success", Callable(self, "_on_dial_success"))
	$BottomDial.connect("success", Callable(self, "_on_dial_success"))
	$TopDial.connect("angle_changed", Callable(self, "_on_angle_changed"))
	$BottomDial.connect("angle_changed", Callable(self, "_on_angle_changed"))
	reset_game()

func _on_dial_success() -> void:
	top_success = abs($TopDial.angle - $TopDial.target_angle) <= $TopDial.tolerance
	bottom_success = abs($BottomDial.angle - $BottomDial.target_angle) <= $BottomDial.tolerance
	if top_success and bottom_success:
		print("Success! Both dials matched their targets.")
		# Add your success logic here, e.g. level complete, UI update, etc.

#func _on_angle_changed(new_angle: float) -> void:
	# Optional: update UI with current dial angles if desired

func reset_game() -> void:
	top_success = false
	bottom_success = false
	$TopDial.target_angle = randf_range($TopDial.min_angle, $TopDial.max_angle)
	$BottomDial.target_angle = randf_range($BottomDial.min_angle, $BottomDial.max_angle)
	$TopDial.angle = $TopDial.min_angle
	$BottomDial.angle = $BottomDial.min_angle
