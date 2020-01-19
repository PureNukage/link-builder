iconY = wave(y-(sprite_get_height(icon)/2)+(height/2)+iconBuffer,y-(sprite_get_height(icon)/2)+(height/2)-iconBuffer,.5,0)
iconY = round(iconY)

x = display_get_gui_width()/2 - width/2
iconX = x-sprite_get_width(icon)-buffer-8

if fade > -1 and !done {
	fade -= .05
}
if fade == 0 {
	//	put our ID into the previous_message list and wait for eventual cleanup	
	if textboxController.current_message == id {
		textboxController.current_message = -1	
		ds_list_add(textboxController.previous_messages,id)
		if ds_list_size(textboxController.previous_messages) > 25 {
			if instance_exists(textboxController.previous_messages[| 0]) instance_destroy(textboxController.previous_messages[| 0])
			ds_list_delete(textboxController.previous_messages,0)	
		}
	}
	done = true
}

if timer > 0 timer--
if timer == 0 {
	fade = 1
	timer = -1
}