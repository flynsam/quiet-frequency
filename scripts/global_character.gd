extends Node
var character_sequence_flow = ["Patience", "Sirene", "Ram","Offish","Demon","Cyborg","Coolguy","Cat"] # The order of characters for the current scene
var current_flow_index: int = 0
var current_dialogue_line_index: int = 0
# A global dictionary storing character data and dialogues
var character_data = {
	"Doctor": {
		"name": "doctor",
		"dialogue": [
			"Hello, patient. What can i help you with today?",
			"Please lie down for the scan.",
            "You should feel better now."
		]
	},
	"Cat": {
		"name": "cat",
		"dialogue": [
			"Hi, Doctor. I have trouble focussing on one thing. Please help me",
            "Thank you, Doctor. I feel much better now"
		],
		"game":1
	},
	"Coolguy": {
		"name": "coolguy",
		"dialogue": [
			"Hi, Doctor. I have a brain freeze. Could you help me clear that",
            "Thank you, Doctor. I feel much better now"
		],
		"game":2
	},
	"Cyborg": {
		"name": "cyborg",
		"dialogue": [
			"Hi, Doctor. My brain is malfunctioning. Could you help me with that",
            "Thank you, Doctor. I feel much better now"
		],
		"game":0
	},
	"Demon": {
		"name": "demon",
		"dialogue": [
			"Hi, Doctor. I have trouble focussing on one thing. Please help me",
            "Thank you, Doctor. I feel much better now"
		],
		"game":1
	},
	"Offish": {
		"name": "offish",
		"dialogue": [
			"Hi, Doctor. I have a brain freeze. Could you help me clear that",
            "Thank you, Doctor. I feel much better now"
		],
		"game":2
	},
	"Ram": {
		"name": "ram",
		"dialogue": [
			"Hi, Doctor. My brain is malfunctioning. Could you help me with that",
            "Thank you, Doctor. I feel much better now"
		],
		"game":0
	},
	"Sirene": {
		"name": "sirene",
		"dialogue": [
			"Hi, Doctor. I have trouble focussing on one thing. Please help me",
            "Thank you, Doctor. I feel much better now"
		],
		"game":1
	},
	"Patience": {
		"name": "patience",
		"dialogue": [
			"Hi, Doctor. My brain is malfunctioning. Could you help me with that",
            "Thank you, Doctor. I feel much better now"
		],
		"game":0
	}
}

# A function to easily retrieve dialogue
func get_dialogue(character_name: String):
	if character_data.has(character_name):
		return character_data[character_name]["dialogue"]
	else:
		print("Error: Character name not found in global dialogue dictionary.")
		return []

# A function to get the sprite path
func get_ch_name(character_name: String):
	if character_data.has(character_name):
		return character_data[character_name]["name"]
	else:
		return "" # Return empty if not found

func get_game_name(character_name: String):
	if character_data.has(character_name):
		return character_data[character_name]["game"]
	else:
		return "" # Return empty if not found

func reset_flow():
	current_flow_index = 0
	current_dialogue_line_index = 0
	
func advance_character_in_flow():
	current_flow_index += 1
	current_dialogue_line_index = 0 # Reset line index for the new character

func get_current_ch():
	var current_char_name = character_sequence_flow[current_flow_index]
	return current_char_name

func has_character() -> bool:
	if current_flow_index < len(character_sequence_flow)-1:
		return true
	return false
