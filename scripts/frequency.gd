extends Node2D



var _frequency = 1
var _amplitude = 100
var game_end = false

var userFrequency = int(randi_range(-10,10))
var userAmplitidue = int(randi_range(-15,15)*10) 


func _process(_delta):
	if !game_end:
		queue_redraw()
	
	
	
func draw_dashed_sine(amplitude: float, frequency: float, phase_shift: float, center_y: float,color,
				 dash_length: int = 15, gap_length: int = 10):
	var total_length = 866#get_parent().shape.size.x
	var current_x = 128

	while current_x < total_length:
		var next_x = min(current_x + dash_length, total_length)
		var prev_y = amplitude * sin(frequency * current_x * 0.03 + phase_shift) + center_y

		var i = current_x + 1
		while i <= next_x:
			var y = amplitude * sin(frequency * i * 0.03 + phase_shift) + center_y
			draw_line(Vector2(i - 1, prev_y), Vector2(i, y),color,3)
			prev_y = y
			i += 1
			
		current_x += dash_length + gap_length



func _draw():
	var offset = Time.get_ticks_msec() / 300.0 
	var start_y = 576 / 2  
	#var total_length = parent_size.x

	
	draw_dashed_sine(userAmplitidue,userFrequency,offset,start_y,Color8(138, 154, 91),15,0)
	draw_dashed_sine(_amplitude,_frequency,offset,start_y,Color8(218, 17, 218),15,0)


func _on_match_pressed() -> void:
	print(userFrequency,"da",userAmplitidue)
	if userAmplitidue == _amplitude and userFrequency == _frequency:
		game_end = true 
		print("sucess")
	pass # Replace with function body.


func _on_frequency_decrease_pressed() -> void:
	userFrequency -= 1
	pass # Replace with function body.
	


func _on_frequency_increase_pressed() -> void:
	userFrequency += 1
	pass # Replace with function body.


func _on_amplitude_decrease_pressed() -> void:
	userAmplitidue -= 10
	pass # Replace with function body.


func _on_amplitude_increase_pressed() -> void:
	userAmplitidue += 10
	pass # Replace with function body.
