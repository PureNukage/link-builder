selection_switch = false

if input.selection > -1 and input.selection != selection {
	selection = input.selection
	
	if selection != previous_selection {
		previous_selection = selection	
		selection_switch = true
	}
} else if input.selection = -1 {
	selection = -1
	previous_selection = -1
}

if selection > -1 {
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,window_twoX,window_twoY,window_twoX+window_two_width,window_twoY+window_two_height) {
		window_two_mouseover = true
		
	} else {
		window_two_mouseover = false	
	}
	
	
}