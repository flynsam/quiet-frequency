extends Label

var full_text: String # The complete text you want to display
var characters_per_second: float = 20.0 # Typing speed in chars/sec
var time_elapsed: float = 0.0
var finished_typing: bool = false

func _ready():
	
	
	# Set initial visible characters to 0
	#visible_characters = 0 
	# Start the typing effect
	#start_typing()
	finish_typing_immediately()

func start_typing():
	time_elapsed = 0.0
	finished_typing = false
	# Use process to update the text visibility every frame
	set_process(true) 

func _process(delta):
	if not finished_typing:
		time_elapsed += delta
		# Calculate how many characters should be visible based on time elapsed and speed
		var chars_to_show = floor(time_elapsed * characters_per_second)
		
		# Update the built-in property
		visible_characters = chars_to_show
		
		# Check if all characters are now visible
		if visible_characters >= text.length():
			visible_characters = text.length() # Ensure all text is shown exactly
			finished_typing = true
			set_process(false) # Stop the process updates
			#print("Typing animation finished!")

func finish_typing_immediately():
	visible_characters = text.length()
	finished_typing = true
	
	set_process(false) 
	
