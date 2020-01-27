if instance_exists(mainmenu) exit

if point_in_rectangle(mouse_gui_x,mouse_gui_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) and button_active {
	button_mouseover = true
	if input.mouse_left_press {
		button_open = !button_open
		
		if button_open {
			contract_refresh()
			if textboxController.messages_open textboxController.messages_open = false
		}
	}
} else {
	button_mouseover = false
}

if button_open {
	
	//	If mousing over rectangle
	if point_in_rectangle(mouse_gui_x,mouse_gui_y,menuX,menuY,menuX+menu_width,menuY+menu_height) {
		menu_mouseover = true
		
		
		//	Scroll with mouse
		if input.scroll_up or input.scroll_down {
			contract_index -= input.scroll_up - input.scroll_down	
			contract_index = clamp(contract_index,0,amount_of_contracts-2)
			handleY = barY + (contract_index*round(bar_height/(amount_of_contracts-1)))
		}
		var _x = menuX + 12
		var _y = barY
		var segment = round(bar_height/(amount_of_contracts-1)) 
		handle_mouseover = false
		for(var s=0;s<segment;s++) {
			if point_in_rectangle(mouse_gui_x,mouse_gui_y,_x,_y,_x+handle_width,_y+handle_height) {
				if contract_index == s {
					handle_mouseover = true	
				}
				if input.mouse_left {
					contract_index = s
					handleY = barY + (contract_index*round(bar_height/(amount_of_contracts-1)))
					contract_open = -1
				}
			}
			_y += segment 
		}
	}
	
	else {
		menu_mouseover = false	
		handle_mouseover = false
	}
	
	
	
}