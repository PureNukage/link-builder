event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
	
			if input.grid_moved {
				node_update_ports_xy(rotation)	
			
				item_check_sockets()
			}
	
			// Placement
			if input.mouse_left_press and placeable {
			
				ds_grid_add_disk(gridController.grid_fog,center_cell_x,center_cell_y,16,1)
			
				if !replace player.points -= shop.item_node[item_index,1]
			
				states = states.placed
			
				ds_grid_set_grid_region(gridController.grid_items,my_cells_items,0,0,size_width,size_height,topleft_cell_x,topleft_cell_y)
				item_placeid()
			
				var _x1 = gridController.grid_positions_x[topleft_cell_x]+(cell_width/2)
				var _y1 = gridController.grid_positions_y[topleft_cell_y]+(cell_height/2)
				var _x2 = gridController.grid_positions_x[bottomright_cell_x]+(cell_width/2)
				var _y2 = gridController.grid_positions_y[bottomright_cell_y]+(cell_height/2)
			
				mp_grid_add_rectangle(gridController.mp_grid,_x1,_y1,_x2,_y2)
			
				//	Add ports
				for(var _p=0;_p<ports_count;_p++) {
					var _grid = gridController.grid_port_objects
					var _grid_x = gridController.grid_port_x
					var _grid_y = gridController.grid_port_y
					ds_list_add(_grid,id)
					ds_list_add(_grid_x,ports[_p,port_x])
					ds_list_add(_grid_y,ports[_p,port_y])
					gridController.grid_items[# ports[_p,port_x], ports[_p,port_y]] = -2
					//	if we have ports to connect
					if sockets[_p] > -1 and ports[_p,port_object] == -1 {
						ports[_p,port_object] = sockets[_p]
						debug_log("Connecting "+string(sockets[_p])+" to Port["+string(_p)+"]")
						for(var _pp=0;_pp<sockets[_p].ports_count;_pp++) {
							//	lets connect our items port to us as well
							if sockets[_p].sockets[_pp] > -1 and sockets[_p].ports[_pp,port_object] == -1 {
								sockets[_p].ports[_pp,port_object] = id
								with sockets[_p] {
									debug_log("Connecting "+string(other.id)+" to Port["+string(_pp)+"]")	
								}
							}
						}
					}
				}
			
				system_set()
			
				x = gridController.grid_positions_x[center_cell_x]+(cell_width/2)
				y = gridController.grid_positions_y[center_cell_y]+(cell_height/2)
				
				//	If this node was already placed 
				if replace and instance_exists(replace_id) {
					
					with replace_id item_delete()
					
				}
			
			}
		
			//	Rotation
			if input.rotate_right or input.rotate_left {
				var port0_x = ports[0,port_x]
				var port0_y = ports[0,port_y]
				debug_log("old Port 0: "+string(port0_x)+ ","+string(port0_y))
				//ports = grid_rotation(input.rotate_right - input.rotate_left,my_cells_items,ports)	
				node_update_ports_xy(rotation)
				var port0_x = ports[0,port_x]
				var port0_y = ports[0,port_y]
				debug_log("new Port 0: "+string(port0_x)+ ","+string(port0_y))
				
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
		
			//	I am being replaced, darken myself
			if input.selection > -1 and input.selection.object_index == node and input.selection.replace_id == id {
				used_alpha = .6
			} else if used_alpha != used_alpha_max and !used used_alpha = used_alpha_max
		
			if selected {
				
				//	I want to move this item somewhere else
				if input.keypress_r {
					
					var _xx = gridController.grid_positions_x[input.grid_x]+(cell_width/2)
					var _yy = gridController.grid_positions_y[input.grid_y]+(cell_height/2)
					var new_item = instance_create_layer(_xx,_yy,"Instances",object_index)
					
					//	pass important data into this new item
					new_item.jobruns = jobruns
					
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
						used_alpha = lerp(used_alpha,0,amount)
						if used_alpha < amount-0.01 {
							used_lightup = false	
						}
					}
					
					else { 
						used_alpha = lerp(used_alpha,used_alpha_max,amount)	
						if used_alpha > used_alpha_max-amount-0.01 {
							used = false
							used_alpha = used_alpha_max
							used_time = -1
						}
					}
				}
			}
		
		
		break
	#endregion
}