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
	
	if selection.object_index == kiosk and selection.smartcontract > -1 {
		//	Collision check Level Up
		var level = contracts.contract[selection.smartcontract, contract_level]
		var ports_level = contracts.contract[selection.smartcontract, contract_level_ports]
		//	I have unassigned ports!
		if selection.ports_count < ports_level[level] {
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,window_levelX,window_levelY,window_levelX+window_level_width,window_levelY+window_level_height) {
				window_level_mouseover = true	
				
				//	Go into port placement mode
				if input.mouse_left_press {
					
					if ds_list_size(input.selections) > 1 {
						for(var i=0;i<ds_list_size(input.selections);i++) {
							input.selections[| i].selected = false
						}	
						ds_list_clear(input.selections)
					}
					if ds_list_find_index(input.selections,selection) == -1 {
						ds_list_add(input.selections,selection)
					}
					input.selection_mode = selection_mode.port_placement
					
				}
			} else {
				window_level_mouseover = false	
			}
		
		}
	}
	
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