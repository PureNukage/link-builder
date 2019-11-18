#region Shop Button Interaction
	if point_in_rectangle(mouse_gui_x,mouse_gui_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
		button_mouseover = true
		if input.mouse_left_press {
			menu_open = !menu_open
		}
	} else {
		button_mouseover = false
	}	
#endregion

#region Shop Menu Interaction
	if point_in_rectangle(mouse_gui_x,mouse_gui_y,menuX,menuY,menuX+menu_width,menuY+menu_height) and menu_open == true {
		menu_mouseover = true	
	
		//	Menu item mouse click check
		var _x = menuX+item_buffer
		var _y = menuY+item_buffer
		for(var i=0;i<array_height_2d(item);i++) {
			if point_in_rectangle(mouse_gui_x,mouse_gui_y,_x,_y,_x+menu_width,_y+item_height) {
				if input.mouse_left_press {
					instance_create_layer(mouse_x,mouse_y,"Instances",node)
				}
			}
			_y += item_height+item_buffer
		}
	
	} else {
		menu_mouseover = false	
	}
#endregion