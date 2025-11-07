extends Node2D

@onready var frequency_input = $FrequencyInput
@onready var amplitude_input = $AmplitudeInput



var _frequency = 1
var _amplitude = 100



func _process(_delta):
	queue_redraw()
	
	
func draw_dashed_sine(amplitude: float, frequency: float, phase_shift: float, center_y: float,color,
				 dash_length: int = 15, gap_length: int = 10):
	var total_length = get_parent().size.x
	var current_x = 0

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
	var parent_size = get_parent().size
	var start_y = parent_size.y / 2
	var total_length = parent_size.x

	
	draw_dashed_sine(_amplitude,_frequency+2,offset,start_y,Color8(138, 154, 91),15,0)
	draw_dashed_sine(-_amplitude,_frequency,offset,start_y,Color8(218, 17, 218),15,0)
