if live_call() return live_result

//	Draw window outline
if fade != -1 {
	draw_set_alpha(fade)	
}
if !instance_exists(mainmenu) {
	draw_set_color(c_black)
	draw_roundrect(x-buffer-4,y-buffer-4,x+width+buffer+4,y+height+buffer+4,false)

	//	Draw window background
	draw_set_color(c_dkgray)
	draw_roundrect(x-buffer,y-buffer,x+width+buffer,y+height+buffer,false)

	//	Draw text
	draw_set_font(fnt_shop)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_color(c_white)
	draw_text_ext(x+4,y+4,text,string_height(text)+4,width_max)

	height = string_height_ext(text,string_height(text)+4,width_max)
	width = string_width_ext(text,string_height(text),width_max)

	buttonX = x+ (width/2) - (button_width/2)
	buttonY = y+height + button_height - 16

	//	Draw icon
	if icon > -1 {
		var offset = 4
		draw_set_color(c_black)
		draw_roundrect(iconX+crop-offset-1,iconY+crop-offset-1,iconX+crop+offset+(sprite_get_width(icon)-(crop*2)),iconY+crop+offset+(sprite_get_height(icon)-(crop*2)),false)
		draw_sprite_part(icon,0,crop,crop,sprite_get_width(icon)-(crop*2),sprite_get_height(icon)-(crop*2),iconX+(crop),iconY+(crop))	
	}

	//	Draw button
	//	Draw button outline
	draw_set_color(c_black)
	draw_roundrect(buttonX-2,buttonY-2,buttonX+button_width+2,buttonY+button_height+2,false)
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
		if !done button_mouseover = true
		draw_set_color(c_gray)	
	
		if input.mouse_left_press {
			if !done playSoundEffect(snd_click_1)
			//	put our ID into the previous_message list and wait for eventual cleanup	
			if textboxController.current_message == id {
				textboxController.current_message = -1	
				if (uniqueID == -1 and event_types == -1 and object_id == -1) or (uniqueID > -1 and !textbox_in_history(uniqueID)) or (uniqueID > -1 and !textbox_in_history(uniqueID,event_types,object_id)) {//(uniqueID == -1 and !textbox_in_history(-1,event_types,object_id)) {
					ds_list_add(textboxController.previous_messages,id)
					if dialogue > -1 and audio_is_playing(dialogue) audio_stop_sound(dialogue)
				} 
				if ds_list_size(textboxController.previous_messages) > 25 {
					if instance_exists(textboxController.previous_messages[| 0]) instance_destroy(textboxController.previous_messages[| 0])
					ds_list_delete(textboxController.previous_messages,0)	
					//textboxController.message_index++
					//textboxController.message_index = clamp(textboxController.message_index,0,ds_list_size(textboxController.previous_messages)-2)
				}
			}	
			fade = 0
			done = true
		}
	} else {
		button_mouseover = false
		draw_set_color(c_dkgray)
	}
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

	//	Draw button string
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(buttonX+button_width/2,buttonY+button_height/2,button_string)

	if event_types == event_types.sn_start or event_types == event_types.sn_debt1 or event_types == event_types.sn_debt2 or event_types == event_types.sn_debt3 or event_types == event_types.sn_lose {
		var String = "S. N"
		var width_spacer = 24
		var spacer = 4
		var sw = string_width(String) + spacer + width_spacer
		var sh = string_height(String) + spacer
		var x1 = iconX + 128 - sw/2
		var y1 = iconY+230
		draw_set_color(c_gray)
		draw_roundrect(x1,y1,x1+sw,y1+sh,false)
	
		draw_set_color(c_black)
		draw_text(x1+sw/2,y1+sh/2,String)
	
	}

	draw_set_alpha(1)
}