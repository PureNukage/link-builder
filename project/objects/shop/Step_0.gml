#region Shop Button Interaction
	if point_in_rectangle(mouse_gui_x,mouse_gui_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
		button_mouseover = true
		if input.mouse_left_press {
			menu_open = !menu_open
			menu_pressed = true
			menu_height = 256
			menu_width = 128
			nodes_open = false
			data_open = false
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
		
		//	Check for Wire click
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
			if input.mouse_left_press {
				//	Delete the item we're currently placing if there is one 
				if instance_exists(c_item) {
					with c_item {
						if states == states.placement {
							instance_destroy()	
						}
					}
				}
				input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",item[2,3])
				input.selection.selected = true
				input.selection.item_index = 2
				input.selection.price = item[2,1]
				if ds_list_find_index(input.selections,input.selection) == -1 {
					ds_list_add(input.selections,input.selection)	
				}			
			}
		}
		
		_y += 32+item_buffer
		//	Check for Kiosk click
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
			if input.mouse_left_press {
				//	Delete the item we're currently placing if there is one 
				if instance_exists(c_item) {
					with c_item {
						if states == states.placement {
							instance_destroy()	
						}
					}
				}
				input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",item[3,3])
				input.selection.selected = true
				input.selection.item_index = 3
				input.selection.price = item[3,1]
				if ds_list_find_index(input.selections,input.selection) == -1 {
					ds_list_add(input.selections,input.selection)	
				}			
			}
		}
		_y += 32+item_buffer
		
		//	Check for Nodes click
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
			nodes_mouseover = true
			if input.mouse_left_press {
				nodes_open = !nodes_open
				menu_pressed = true				
				//menu_width = 128
			}
			
		} else {
			nodes_mouseover = false	
		}
		
		_y += 32+item_buffer
		
		if nodes_open {
			for(var n=0;n<array_height_2d(item_node);n++) {
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
					if input.mouse_left_press {
						//	Delete the item we're currently placing if there is one 
						if instance_exists(c_item) {
							with c_item {
								if states == states.placement {
									instance_destroy()	
								}
							}
						}
						input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",item_node[n,3])
						input.selection.selected = true
						input.selection.item_index = n
						input.selection.price = item_node[n,1]
						if ds_list_find_index(input.selections,input.selection) == -1 {
							ds_list_add(input.selections,input.selection)	
						}		
					}
				}
				_y += 32+item_buffer
			}
		}
		
		//	Check for Data click
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
			data_mouseover = true
			if input.mouse_left_press {
				data_open = !data_open	
				menu_pressed = true				
				menu_width = 128
			}
		} else {
			data_mouseover = false	
		}
		
		_y += 32+item_buffer
		
		//	Check for specific Data item click
		if data_open {
			for(var d=0;d<array_height_2d(item_data);d++) {
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
					if input.mouse_left_press {
						//	Delete the item we're currently placing if there is one 
						if instance_exists(c_item) {
							with c_item {
								if states == states.placement {
									instance_destroy()	
								}
							}
						}
						input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",item_data[d,3])
						input.selection.selected = true
						input.selection.item_index = d
						input.selection.portrait = item_data[d,item_portrait]
						input.selection.price = item_data[d,item_price]
						input.selection.data_generated = item_data[d,item_data_generated]
						if ds_list_find_index(input.selections,input.selection) == -1 {
							ds_list_add(input.selections,input.selection)	
						}	
					}
				} 		
				_y += 32+item_buffer
			}
		}		
	
	} else {
		menu_mouseover = false	
	}
#endregion