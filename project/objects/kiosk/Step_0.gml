event_inherited()

switch(states) 
{
	#region Placement
		case states.placement:
			
			if input.grid_moved {
				kiosk_update_ports_xy(rotation)
				
				item_check_sockets()
			}
			
			if input.mouse_left_press and placeable {
				
				player.points -= shop.item[item_index,item_price]
				
				states = states.placed
				
				ds_grid_add_disk(gridController.grid_fog,center_cell_x,center_cell_y,16,1)
				
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
				instance_destroy()
			}
			
		break
	#endregion
	
	#region Placed
		case states.placed:
		
			//	I was used!
			if used {
				//	First frame 
				if used_time == -1 {
					used_time = time.stream
					used_logo_speedincrease = true
					used_blocks_play = true
				}
				//	Animation
				else {
					image_speed = used_logo_speed
					var speed_max = 8
					var speed_change = .1
					if used_blocks_play used_blocks_frame++
					if used_blocks_frame > sprite_get_number(s_kiosk_blocks_animation)-1 {
						used_blocks_play = false
						used_blocks_frame = 0
					}
					if used_logo_speedincrease {
						used_logo_speed = lerp(used_logo_speed,speed_max,speed_change)
						if used_logo_speed > speed_max - speed_change - speed_change {
							used_logo_speedincrease = false	
						}
					}
					
					else {
						used_logo_speed = lerp(used_logo_speed,0,speed_change)
						if used_logo_speed < 0 + speed_change + speed_change {
							used = false
							used_logo_speed = 0
							used_time = -1
						}
					}
				}
			} else {
				if image_index != 8 {
					image_index = lerp(image_index,8,1)
				}
			}
			
			//	lets add our contract into a persons queue
			if active and ds_list_size(line) < contracts.contract[smartcontract, contract_linesize] and contracts.contract[smartcontract, contract_traffic_live] < contracts.contract[smartcontract, contract_traffic] {
				for(var i=0;i<ds_list_size(personController.people);i++) {
					var _person = personController.people[| i]
					//	this contract is not in this persons queue, lets add it
					if ds_list_find_index(_person.smartcontracts,smartcontract) == -1 {
						ds_list_add(_person.smartcontracts,smartcontract)
						contracts.contract[smartcontract, contract_traffic_live]++
						debug_log("Giving person the smart contract: "+string(contracts.contract[smartcontract, contract_name]))
					}
		
		
				}
			}	
			
		break
	#endregion
}

depth = -y