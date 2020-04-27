event_inherited()

if !game.game_over {
	switch(states)
	{
		#region Placement
			case states.placement:
	
				if input.grid_moved {
					ports_xyupdate_movement()
					//data_update_ports_xy(rotation)
				
					item_check_sockets()
				}
	
				if (input.rotate_right or input.rotate_left) and !multireplace  {
					//data_update_ports_xy(rotation)
					ports_xyupdate_rotation(input.rotate_right - input.rotate_left)
				
					item_check_sockets()
				}
	
				if input.mouse_left_press and placeable and !multireplace  {
					item_place()			
				}	
	
				if input.mouse_right_press and !(app.tutorial == tutorial.basics and tutorialHelper.stage < 7) {
				
					//	check for sockets 
					for(var p=0;p<ports_count;p++) {
						if sockets[p] > -1 {//and _item.ports[p,port_object] == -1 {
							var socket_item = sockets[p]
							if instance_exists(socket_item) {
								for(var pp=0;pp<socket_item.ports_count;pp++) {
									if socket_item.sockets[pp] > -1 and socket_item.ports[pp,port_object] == -1 {
										socket_item.sockets[pp] = -1	
									}
								}
							}
						}
					}
				
					if replace or multireplace {
						replace_id.selected = true
						if ds_list_find_index(input.selections,replace_id) == -1 {
							ds_list_add(input.selections,replace_id)
						}
						if ds_list_find_index(input.selections,id) > -1 {
							ds_list_delete(input.selections,ds_list_find_index(input.selections,id))	
						}
						input.selection = replace_id
					}
					instance_destroy()	
				}
	
	
			break
		#endregion
		#region Placed
			case states.placed:
			
				if selected {
				
					//	I want to move this item somewhere else
					if input.keypress_r and ds_list_size(input.selections) == 1 and input.selection == id {
					
						var _xx = gridController.grid_positions_x[input.grid_x]+(cell_width/2)
						var _yy = gridController.grid_positions_y[input.grid_y]+(cell_height/2)
						var new_item = instance_create_layer(_xx,_yy,"Instances",object_index)
					
						//	pass important data into this new item
						new_item.data_generated = data_generated
						new_item.item_index = item_index
						new_item.portrait = shop.item_data[item_index ,item_portrait]
						new_item.ports = ports
						for(var p=0;p<ports_count;p++) {
							if new_item.ports[p,port_object] > -1 new_item.ports[p,port_object] = -1	
						}
					
						new_item.name = name
					
						//	deselect this item
						selected = false
						if ds_list_find_index(input.selections,id) > -1 {
							ds_list_delete(input.selections,ds_list_find_index(input.selections,id))
						}
					
						//	select new item
						new_item.selected = true
						if ds_list_find_index(input.selections,new_item) == -1 {
							ds_list_add(input.selections,new_item)	
						}
						input.selection = new_item
					
						new_item.replace = true
						new_item.replace_id = id
					
						with new_item item_move(input.grid_x,input.grid_y)
					
					}	
				}
		
				if used {
					//	First frame of being used
					if used_time == -1 {
						used_time = time.stream
						used_lightup = true
					}
					//  Lighting up then lighting down
					else {
						//	 lighting up
						if used_lightup {
							used_alpha = lerp(used_alpha,.75,.1)
							if used_alpha > .65 {
								used_lightup = false	
							}
						} 
						//	lighting down
						else {
							used_alpha = lerp(used_alpha,0,.1)
							if used_alpha < 0.11 {
								used_alpha = 0
								used = false
								used_time = -1
							}
						}
					}
				
					if misfire {
						if used_color != c_red used_color = c_red
					} else {
						if used_color != c_green used_color = c_green
					}
				}
			
			break
		#endregion
	}	
}

depth = -y