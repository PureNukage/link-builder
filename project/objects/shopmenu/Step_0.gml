if point_in_rectangle(mouse_gui_x,mouse_gui_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
	button_mouseover = true
} else {
	button_mouseover = false
}	
//debug_log("button mouseover: "+string(button_mouseover))