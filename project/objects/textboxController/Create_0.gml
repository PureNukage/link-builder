previous_messages = ds_list_create()
message_queue = ds_list_create()

current_message = -1

if app.tutorial == -1 {
	//	Welcome message
	create_textbox("Welcome to Smart Contract Builder\nThis game is in ALPHA and will contain bugs")
}

//create_textbox("This game is in ALPHA and will contain bugs",s_rory)