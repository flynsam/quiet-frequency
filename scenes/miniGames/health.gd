extends Node2D



var _frequency = 1
var _amplitude = 250
@export var  game_end = false
@export var game_start = false



@export var  state := "error"

func update_color():
	var colors = {
		"white": Color("#cb6ef9"),
		"black": Color("#030303"),
		"success": Color("#bae3e5"),
		"error": Color("#cb6ef9")
		}

	$ColorRect.color = colors[state]
	$ColorRect.modulate = Color(1, 1, 1, 0.7)

	
func _process(_delta):
	update_color()
	
	if game_end:
		state = 'success'
		_frequency = 1
		_amplitude = 250
	elif game_start:
		queue_redraw()
		state = 'error'
	
	
	
func draw_dashed_sine(amplitude: float, frequency: float, phase_shift: float, center_y: float,color,
				 dash_length: int = 15, gap_length: int = 10):
	var total_length = $ColorRect.size.x
	var current_x = 0

	while current_x < total_length:
		var next_x = min(current_x + dash_length, total_length)
		var prev_y = amplitude * sin(frequency * current_x * 0.03 + phase_shift) + center_y

		var i = current_x + 1
		while i <= next_x:
			var y = amplitude * sin(frequency * i * 0.03 + phase_shift) + center_y
			draw_line(Vector2(i - 1, prev_y), Vector2(i, y),color,10)
			prev_y = y
			i += 1
			
		current_x += dash_length + gap_length



func _draw():
	var offset = Time.get_ticks_msec() / 300.0 
	var start_y =  $ColorRect.size.y / 2  
	#var total_length = parent_size.x

	draw_dashed_sine(-_amplitude,_frequency,offset,start_y,Color8(71, 166, 140))
	draw_dashed_sine(_amplitude,_frequency,offset,start_y,Color8(306, 255, 0, 102))
	#draw_dashed_sine(-_amplitude,_frequency,offset,start_y,Color8(138, 154, 91))
	#draw_dashed_sine(_amplitude,_frequency,offset,start_y,Color8(218, 17, 218))
