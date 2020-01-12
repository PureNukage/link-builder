#region Shop Button Interaction
	if point_in_rectangle(mouse_gui_x,mouse_gui_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
		button_mouseover = true
		if input.mouse_left_press {
			menu_open = !menu_open
			menu_pressed = true
			//menu_height = 256
			//menu_width = 128
			nodes_open = false
			data_open = false
			
			#region Calculate menu variables
			if menu_open {
				
				//draw_set_font(fnt_shop)
				//for(var i=0;i<array_height_2d(array);i++) {
				//	var _name = array[i, item_name]
				//	var _price = array[i, item_price]
				//	var _name_width = string_width(_name)
				//	//var _string_height = string_height(_name)
				//	var _price_width = string_width(string(_price))
		
				//	var this_list_width = (list_spacer*2)+(name_spacer*2)+_name_width+icon_width+(price_spacer*2)+_price_width
		
				//	if this_list_width > list_width list_width = this_list_width	
				//}
				//draw_set_font(-1)
			
				
			}
			#endregion
		}
	} else {
		button_mouseover = false
	}	
#endregion

#region Shop Menu
	
	if (point_in_rectangle(mouse_gui_x,mouse_gui_y,menuX,menuY,menuX+menu_header_width,menuY+menu_header_height) or point_in_rectangle(mouse_gui_x,mouse_gui_y,menuX,menuY+menu_header_height-header_buffer,menuX+menu_width,menuY+menu_header_height+menu_height-header_buffer)) 
	and menu_open {

		#region Scroll through List
		
			if input.scroll_up or input.scroll_down {
				item_index -= input.scroll_up - input.scroll_down
				item_index = clamp(item_index,0,amount_of_items-2)
				handleY = menuY+menu_header_height-header_buffer+6  +(item_index*round(bar_height/(amount_of_items-1)))
				//shop_refresh()
			}
			
		#endregion

		#region	Arrow buttons
		//	Left arrow
		if point_in_rectangle(mouse_gui_x,mouse_gui_y,menu_button_leftX,menu_button_leftY,menu_button_leftX+menu_button_left_width,menu_button_leftY+menu_button_left_height) {
			menu_button_left_mouseover = true
			if input.mouse_left_press {
				
				menu_index--
				if menu_index < 0 menu_index = 2
				shop_refresh()
			}
		}
		else menu_button_left_mouseover = false
		
		//	Right arrow
		if point_in_rectangle(mouse_gui_x,mouse_gui_y,menu_button_rightX,menu_button_rightY,menu_button_rightX+menu_button_right_width,menu_button_rightY+menu_button_right_height) {
			menu_button_right_mouseover = true
			if input.mouse_left_press {
				
				menu_index++
				if menu_index > 2 menu_index = 0
				shop_refresh()
				
			}
		} else menu_button_right_mouseover = false
		
	#endregion

		menu_mouseover = true	
		
		#region List
		
		var _xx = 40
		var _yy = menuY+menu_header_height-header_buffer+6 //210
		
		item_mouseover = -1
		for(var i=0;i<array_height_2d(array);i++) {
			if i > item_index-1 and i < item_index + item_clamp {
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+list_width,_yy+list_height) {
					item_mouseover = i
					if input.mouse_left_press {
					
					}
				}
				_yy += 60
			}
		}
		
		
		#endregion
		
		#region Scrollbar
		
		var _x = menuX+menu_width - handle_width - 12
		var _y = menuY+menu_header_height-header_buffer+6
		
		segment = round(bar_height/(amount_of_items-1))
		handle_mouseover = false
		for(var s=0;s<amount_of_items-1;s++) {
			//if i > item_index-1 and i < item_index + item_clamp {
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+handle_width,_y+segment) {
					if item_index == s {
						handle_mouseover = true
					}
					if input.mouse_left {
						item_index = s
						handleY = menuY+menu_header_height-header_buffer+6  +(item_index*round(bar_height/(amount_of_items-1)))
					}
				}
				_y += segment
			//}
		}
		
		#endregion
		
		
	}
	
	else {
		menu_mouseover = false
		handle_mouseover = false
		item_mouseover = -1
		menu_button_left_mouseover = false
		menu_button_right_mouseover = false
	}


#endregion

#region Shop Menu Interaction
	//if point_in_rectangle(mouse_gui_x,mouse_gui_y,menuX,menuY,menuX+menu_width,menuY+menu_height) and menu_open == true {
	//	menu_mouseover = true	
		
	//	if input.selection > -1 with input.selection placeable = is_placeable()
	
	//	//	Menu item mouse click check
	//	var _x = menuX+item_buffer
	//	var _y = menuY+item_buffer
		
	//	//	Check for Wire click
	//	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
	//		if input.mouse_left_press {
	//			//	Delete the item we're currently placing if there is one 
	//			if instance_exists(c_item) {
	//				with c_item {
	//					if states == states.placement {
	//						instance_destroy()	
	//					}
	//				}
	//			}
	//			input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",item[2,3])
	//			input.selection.selected = true
	//			input.selection.item_index = 2
	//			input.selection.price = item[2,1]
	//			if ds_list_find_index(input.selections,input.selection) == -1 {
	//				ds_list_add(input.selections,input.selection)	
	//			}			
	//		}
	//	}
		
	//	_y += 32+item_buffer
		
	//	//	Check for Nodes click
	//	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
	//		nodes_mouseover = true
	//		if input.mouse_left_press {
	//			nodes_open = !nodes_open
	//			menu_pressed = true				
	//			//menu_width = 128
	//		}
			
	//	} else {
	//		nodes_mouseover = false	
	//	}
		
	//	_y += 32+item_buffer
		
	//	if nodes_open {
	//		for(var n=0;n<array_height_2d(item_node);n++) {
	//			if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
	//				if input.mouse_left_press {
	//					//	Delete the item we're currently placing if there is one 
	//					if instance_exists(c_item) {
	//						with c_item {
	//							if states == states.placement {
	//								instance_destroy()	
	//							}
	//						}
	//					}
	//					input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",item_node[n,node_object_index])
	//					input.selection.selected = true
	//					input.selection.item_index = n
	//					input.selection.price = item_node[n,node_price]
	//					input.selection.jobruns = item_node[n,node_jobruns]
	//					input.selection.jobruns_previous = item_node[n,node_jobruns]
	//					input.selection.level = item_node[n,node_level]
	//					if ds_list_find_index(input.selections,input.selection) == -1 {
	//						ds_list_add(input.selections,input.selection)	
	//					}		
	//				}
	//			}
	//			_y += 32+item_buffer
	//		}
	//	}
		
	//	//	Check for Data click
	//	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
	//		data_mouseover = true
	//		if input.mouse_left_press {
	//			data_open = !data_open	
	//			menu_pressed = true				
	//			menu_width = 128
	//		}
	//	} else {
	//		data_mouseover = false	
	//	}
		
	//	_y += 32+item_buffer
		
	//	//	Check for specific Data item click
	//	if data_open {
	//		for(var d=0;d<array_height_2d(item_data);d++) {
	//			if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32) {
	//				if input.mouse_left_press {
	//					//	Delete the item we're currently placing if there is one 
	//					if instance_exists(c_item) {
	//						with c_item {
	//							if states == states.placement {
	//								instance_destroy()	
	//							}
	//						}
	//					}
	//					input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",item_data[d,3])
	//					input.selection.selected = true
	//					input.selection.item_index = d
	//					input.selection.portrait = item_data[d,item_portrait]
	//					input.selection.price = item_data[d,item_price]
	//					input.selection.data_generated = item_data[d,item_data_generated]
	//					if ds_list_find_index(input.selections,input.selection) == -1 {
	//						ds_list_add(input.selections,input.selection)	
	//					}	
	//				}
	//			} 		
	//			_y += 32+item_buffer
	//		}
	//	}		
	
	//} else {
	//	menu_mouseover = false	
	//}
#endregion