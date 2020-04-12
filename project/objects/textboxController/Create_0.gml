previous_messages = ds_list_create()
message_queue = ds_list_create()

current_message = -1

button_mouseover = false
messages_open = false
messages_mouseover = false

message_index = 0
message_clamp = 5

barX = -1
barY = -1
bar_width = 64
bar_height = -1

handleX = -1
handleY = -1
handle_width = 32
handle_height = -1

Event_duration = 60

clickfix = false

if app.tutorial == -1 {
	//	Welcome message
	create_textbox("Welcome to Smart Contract Builder\nThis game is in ALPHA and may contain bugs")
}

if app.new_game {
	app.new_game = false
	//	SN Introduction
	var String = "A mysterious man known only by his initials has given you the objective of building out the 4th Industrial Revolution. He has entrusted you with a starting sum of capital and hopes to see swift progress"
	create_textbox(String,s_event_sn,-1,-1,event_types.sn_start,-1)
}

//create_textbox("This game is in ALPHA and will contain bugs",s_rory)