if point_in_rectangle(mouse_gui_x,mouse_gui_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
	button_mouseover = true
	if input.mouse_left_press {
		menu_open = !menu_open
	}
} else {
	button_mouseover = false
}	

if point_in_rectangle(mouse_gui_x,mouse_gui_y,menuX,menuY,menuX+menu_width,menuY+menu_height) and menu_open == true {
	menu_mouseover = true	
	//for(var i=0;i<array_height_2d(item);i++) {
	//	if point_in_rectangle(mouse_gui_x,mouse_gui_y,
			
	//	)	
	//}
} else {
	menu_mouseover = false	
}
