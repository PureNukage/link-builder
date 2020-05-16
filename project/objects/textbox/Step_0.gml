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
		if (uniqueID == -1 and event_types == -1 and object_id == -1) or (uniqueID > -1 and !textbox_in_history(uniqueID)) or (uniqueID > -1 and !textbox_in_history(uniqueID,event_types,object_id)) {
			ds_list_add(textboxController.previous_messages,id)
		} else {
			//	Debug log why this message wasn't added
			if uniqueID > -1 and textbox_in_history(uniqueID) debug_log("[uniqueID] this textbox is already in history")
			if (uniqueID > -1 and textbox_in_history(-1,event_types,object_id)) debug_log("[event_type and object_id] this textbox is already in history") 
		}
		if ds_list_size(textboxController.previous_messages) > 25 {
			if instance_exists(textboxController.previous_messages[| 0]) instance_destroy(textboxController.previous_messages[| 0])
			ds_list_delete(textboxController.previous_messages,0)
		}
	}
	done = true
}

if !done {
	if timer > 0 {
		timer--
		debug_log("textbox: "+string(timer)+" seconds left!")
	} else if timer == 0 {
		fade = 1
		timer = -1
		if dialogue > -1 and audio_is_playing(dialogue) {
			audio_stop_sound(dialogue)
		}
	}
}

//	If we're a chaos event and our object isn't affected anymore, lets go away 
if event_types == event_types.chaos_event_eth and object_id > -1 {
	var corruption = shop.item_data[object_id, item_corruption]	
	if corruption == 0 {
		fade = 1
		object_id = -1
		event_types = -1
	}
}