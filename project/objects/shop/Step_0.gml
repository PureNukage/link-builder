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
					
					//	Delete the item we're currently placing if there is one 
					if instance_exists(c_item) {
						with c_item {
							if states == states.placement {
								instance_destroy()	
							}
						}
					}
					//input.selection = 
					instance_create_layer(mouse_x,mouse_y,"Instances",item[i,3])
					//if ds_list_find_index(input.selections,input.selection) == -1 {
					//	ds_list_add(input.selections,input.selection)	
					//}
				}
			}
			_y += item_height+item_buffer
		}
	
	} else {
		menu_mouseover = false	
	}
#endregion