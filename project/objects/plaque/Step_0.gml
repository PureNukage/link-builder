selection_switch = false

if input.selection > -1 and input.selection != selection {
	selection = input.selection
	
	if selection != previous_selection {
		previous_selection = selection	
		selection_switch = true
	}
} else if input.selection == -1 {
	selection = -1
	previous_selection = -1
}

if selection > -1 {
	
	//	Collision check window two
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,window_twoX,window_twoY,window_twoX+window_two_width,window_twoY+window_two_height) {
		window_two_mouseover = true
		
	} else {
		window_two_mouseover = false	
	}
	
	//	Collision check delete button
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,button_deleteX,button_deleteY,button_deleteX+button_delete_width,button_deleteY+button_delete_height) and selection.states == states.placed {
		button_delete_mouseover = true	
		button_delete_color = button_delete_color_mouseover
		
		if input.mouse_left_press or input.mouse_left { 
			button_delete_color = button_delete_color_pressed
			
		}
		
		if input.mouse_left_release {
			with c_item {
				if selected {				
					item_delete()				
				}
			}	
			button_delete_mouseover = false
		}
	} else {
		button_delete_mouseover = false	
		button_delete_color = button_delete_color_free
	}
	
	
}