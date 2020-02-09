if instance_exists(mainmenu) exit

#region Shop Button Interaction
	if point_in_rectangle(mouse_gui_x,mouse_gui_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) and button_active {
		button_mouseover = true
		if input.mouse_left_press {
			menu_open = !menu_open
			menu_pressed = true
			nodes_open = false
			data_open = false
			
			#region Calculate menu variables
			if menu_open {
				shop_refresh()
				
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
				var Direction = input.scroll_up - input.scroll_down
				item_index -= Direction
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
		var items = 0
		for(var i=item_index;i<array_height_2d(array);i++) {
			if i < array_height_2d(array) {
				if array[i, item_available] and items < item_clamp {
					var good = true
					if menu_index_string == "Contracts" and array[i, contract_kiosk] > -1 {
						good = false
					}
					if good {
						items++
						if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+list_width,_yy+list_height) {
							item_mouseover = i
							if menu_index_string == "Contracts" {
								if !shop_plaqueCheck() {
									Plaque = instance_create_layer(0,0,"Instances",plaque)
									Plaque.windowX = menuX+menu_width+8
									Plaque.windowY = menuY+menu_header_height-header_buffer
									Plaque.mode = mode.on
									Plaque.index = i
								} else if Plaque.index != i {
									instance_destroy(Plaque)
									Plaque = instance_create_layer(0,0,"Instances",plaque)
									Plaque.windowX = menuX+menu_width+8
									Plaque.windowY = menuY+menu_header_height-header_buffer
									Plaque.mode = mode.on
									Plaque.index = i
								}
							}
						
							if input.mouse_left_press {
								
								if shop_plaqueCheck() {
									instance_destroy(Plaque)
									Plaque = -1
								}
						
								switch(menu_index_string)
								{
									case "Nodes":
								
										//	Delete the item we're currently placing if there is one 
										if ds_list_size(input.selections) > 0 {
											for(var i=0;i<ds_list_size(input.selections);i++) {
												input.selections[| i].selected = false	
											}
										}
										ds_list_clear(input.selections)
										if instance_exists(c_item) {
											with c_item {
												if states == states.placement {
													instance_destroy()	
												}
											}
										}
								
										input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",node)
										input.selection.selected = true
										input.selection.item_index = item_mouseover
										input.selection.name = item_node[item_mouseover, node_name]
										if !item_node[item_mouseover, node_purchased] input.selection.price = item_node[item_mouseover, node_price]
										else input.selection.price = 0
										input.selection.jobruns = item_node[item_mouseover, node_jobruns]
										input.selection.jobruns_previous = item_node[item_mouseover, node_jobruns]
										if ds_list_find_index(input.selections,input.selection) == -1 {
											ds_list_add(input.selections,input.selection)	
										}
								
								
									break
									case "Data":
								
										//	Delete the item we're currently placing if there is one 
										if ds_list_size(input.selections) > 0 {
											for(var i=0;i<ds_list_size(input.selections);i++) {
												input.selections[| i].selected = false	
											}
										}
										ds_list_clear(input.selections)
										if instance_exists(c_item) {
											with c_item {
												if states == states.placement {
													instance_destroy()	
												}
											}
										}
								
										input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",data)
										input.selection.selected = true
										input.selection.item_index = item_mouseover
										input.selection.name = item_data[item_mouseover, item_name]
										input.selection.portrait = item_data[item_mouseover, item_portrait]
										if !item_data[item_mouseover, item_purchased] input.selection.price = item_data[item_mouseover, item_price]
										else input.selection.price = 0
										input.selection.data_generated = item_data[item_mouseover, item_data_generated]
										if ds_list_find_index(input.selections,input.selection) == -1 {
											ds_list_add(input.selections,input.selection)	
										}
								
									break
									case "Contracts":
								
										//	Delete the item we're currently placing if there is one 
										if ds_list_size(input.selections) > 0 {
											for(var i=0;i<ds_list_size(input.selections);i++) {
												if instance_exists(input.selections[| i]) {
													input.selections[| i].selected = false	
												}
											}
										}
										ds_list_clear(input.selections)
										if instance_exists(c_item) {
											with c_item {
												if states == states.placement {
													instance_destroy()	
												}
											}
										}
										input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",kiosk)
										input.selection.selected = true
										input.selection.item_index = 3
										input.selection.name = contracts.contract[item_mouseover, contract_name]
										input.selection.price = contracts.contract[item_mouseover, contract_price]
										input.selection.smartcontract = item_mouseover
										input.selection.data_needed = contracts.contract[item_mouseover, contract_data]	
										input.selection.portrait = contracts.contract[item_mouseover, contract_portrait]
										var level = contracts.contract[item_mouseover, contract_level]
										var ports_level = contracts.contract[item_mouseover, contract_level_ports]
										input.selection.ports_count = ports_level[level]
										if ds_list_find_index(input.selections,input.selection) == -1 {
											ds_list_add(input.selections,input.selection)	
										}	
								
									break
								
								}
						
						
						
							}
						}
						_yy += 60
					}
				}
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
		
		if shop_plaqueCheck() {
			instance_destroy(Plaque)	
			Plaque = -1
		}
	}


#endregion