event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
	
			if input.grid_moved {
				ports_xyupdate_movement()
			
				item_check_sockets()
			}
	
			// Placement
			if input.mouse_left_press and placeable {				
				item_place()
			}
		
			//	Rotation
			if input.rotate_right or input.rotate_left {
				ports_xyupdate_rotation(input.rotate_right - input.rotate_left)
				
				item_check_sockets()
			}
		
			//	Clamp rotation
			if abs(rotation) == 360 rotation = 0
		
			//	Delete item
			if input.mouse_right_press {
			
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
				
				if replace {
					replace_id.selected = true
					if ds_list_find_index(input.selections,replace_id) == -1 {
						ds_list_add(input.selections,replace_id)
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
				if input.keypress_r and input.selection == id and app.tutorial != tutorial.decentralizing {
					
					var _xx = gridController.grid_positions_x[input.grid_x]+(cell_width/2)
					var _yy = gridController.grid_positions_y[input.grid_y]+(cell_height/2)
					var new_item = instance_create_layer(_xx,_yy,"Instances",object_index)
					
					//	pass important data into this new item
					new_item.jobruns = jobruns
					new_item.jobruns_previous = jobruns
					
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
					
					new_item.item_index = item_index
					new_item.replace = true
					new_item.replace_id = id
					
					with new_item placeable = is_placeable()
					
				}	
				
				if keyboard_check_pressed(vk_pageup) and shop.item_node[item_index, node_level] < 3 {
					shop.item_node[item_index, node_level]++
				}
			}
			
			if used {
				//	First frame of being used
				if used_time == -1 {
					used_time = time.stream
					used_lightup = true
				}
				//	Animation
				else {
					var amount = 0.08
					if used_lightup {
						used_alpha = lerp(used_alpha,used_alpha_max,amount)
						if used_alpha > used_alpha_max-amount-0.01 {
							used_lightup = false	
						}
					}
					
					else { 
						used_alpha = lerp(used_alpha,0,amount)	
						if used_alpha < amount-0.01 {
							used = false
							used_alpha = 0
							used_time = -1
						}
					}
				}
			}
		
		
		break
	#endregion
}