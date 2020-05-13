event_inherited()

if live_call() return live_result

switch(states)
{
	#region Placement
		case states.placement:
		
			draw_sockets_item()
			
			if !game.vision and !game.temp_vision {
			
				//	Draw the stand
				sprite_set_offset(s_chainlink_stand,sprite_get_width(s_chainlink_stand)/2-1,sprite_get_height(s_chainlink_stand)/2-1)
				draw_sprite(s_chainlink_stand,-1,x,y)
		
				//	Draw the node
				sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
				var color = c_white
				if placeable color = c_white else color = c_red
				draw_sprite_ext(sprite,-1,x,y,1,1,0,color,1)
		
				//	Draw the node used
				draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha)
			
			}
			//	Alt vision
			else {
				draw_altmode(object_index)
			}
		
		
		break
	#endregion
	
	#region Placed
	case states.placed:
		
		draw_sockets_item()
		
		if !game.vision and !game.temp_vision {
			
			//	Draw the stand
			sprite_set_offset(s_chainlink_stand,sprite_get_width(s_chainlink_stand)/2-1,sprite_get_height(s_chainlink_stand)/2-1)
			draw_sprite(s_chainlink_stand,-1,x,y)
		
			//	Draw the node
			sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
			draw_sprite(sprite,-1,x,y)
		
			//	Determine if I have unassigned new ports, if so make flash me gold!
			var amount = 0.04
			//	I have unassigned ports!
			if skillpoints > 0 and time.stream >= gold_flash_cd {
				if !gold_flash gold_flash = true
			} else {
				if gold_flash {
					gold_flash = false	
					gold_flash_alpha = 0
				}
			}
		
			if gold_flash {
				if gold_flash_lightup {
					gold_flash_alpha = lerp(gold_flash_alpha,gold_flash_alpha_max + amount,amount)
					if gold_flash_alpha >= gold_flash_alpha_max + amount-0.01 {
						gold_flash_lightup = false	
					}
				} else {
					gold_flash_alpha = lerp(gold_flash_alpha,0,amount)
					if gold_flash_alpha <= amount+0.01 {
						gold_flash_cd = time.stream + 120
						gold_flash_lightup = true
					}
				}	
			}
			draw_sprite_ext(sprite,-1,x,y,1,1,0,c_yellow,gold_flash_alpha)
		
			//	Draw the node used
			sprite_set_offset(s_chainlink_highlights,sprite_get_width(s_chainlink_highlights)/2,sprite_get_height(s_chainlink_highlights)/2)
			draw_sprite_ext(s_chainlink_highlights,-1,x,y,1,1,0,c_white,used_alpha)
		
			//	Draw the node not connected
			if !connected {
				draw_sprite_ext(sprite,0,x,y,1,1,0,c_black,.3)	
			}
		
			//	Darken ourselves if we're being replaced
			if (input.selection > -1 and input.selection.object_index == node and input.selection.replace_id == id) or (multireplaced) {
				draw_sprite_ext(sprite,0,x,y,1,1,0,c_black,.5)	
			}
		
		} 
		//	Alt Vision mode
		else {
			draw_altmode(object_index)
		}
		
		//	Draw the possible port cells if we're selected and input is in port_placement mode
		if input.selection_mode == selection_mode.port_placement and selected {
				
			//	Loop through cells, only draw the possible port cells
			for(var w=topleft_cell_x-1;w<topleft_cell_x+size_width+1;w++) {
				for(var h=topleft_cell_y-1;h<topleft_cell_y+size_height+1;h++) {
					if w > -1 and w < grid_width and h > -1 and h < grid_height {
						if w == topleft_cell_x-1 and (h != topleft_cell_y-1 and h != bottomright_cell_y+1) 
						or w == bottomright_cell_x+1 and (h != bottomright_cell_y+1 and h != topleft_cell_y-1) 
						or h == topleft_cell_y-1 and w != topleft_cell_x-1 and w != bottomright_cell_x+1 
						or h == bottomright_cell_y+1 and w != bottomright_cell_x+1 and w != topleft_cell_x-1 { 
							if input.grid_x == w and input.grid_y == h {
								if gridController.grid_items[# w, h] == -1 {
									var max_ports = input.selection.ports_count_max
									var used_ports = input.selection.ports_count
									var available_ports = max_ports - used_ports
									if available_ports > 0 {
										var _xx = gridController.grid_positions_x[w]+cell_width/2
										var _yy = gridController.grid_positions_y[h]+cell_height/2
										var angle = cell_direction_modified(w,h,id)
										draw_sprite_ext(s_wire_socket,0,_xx,_yy,1,1,angle,c_sergey_blue,1)
										if input.mouse_left_press {
											port_add(w,h,input.selection)
											gridController.grid_items[# w, h] = -2
										}
									} else {
										draw_set_color(c_yellow)
										var _xx = gridController.grid_positions_x[w]
										var _yy = gridController.grid_positions_y[h]
										draw_rectangle(_xx+3,_yy+3,_xx+cell_width-3,_yy+cell_height-3,false)	
									}
								} 
								//	Moused over a cell that already has a port
								else {
									if gridController.grid_items[# w, h] == -2 {
										draw_set_color(c_red)
										var _xx = gridController.grid_positions_x[w]
										var _yy = gridController.grid_positions_y[h]
										draw_rectangle(_xx+3,_yy+3,_xx+cell_width-3,_yy+cell_height-3,false)
										if input.mouse_left_press {
											var index = -1
											var data_index = ds_list_find_index(gridController.grid_port_objects,id)
											ds_list_delete(gridController.grid_port_x,data_index)
											ds_list_delete(gridController.grid_port_y,data_index)
											ds_list_delete(gridController.grid_port_objects,data_index)
											//	Remove port
											for(var p=0;p<ports_count;p++) {
												if ports[p,port_x] == w and ports[p,port_y] == h {
													index = p
												}
											}
											var new_ports = []
											var new_sockets = []
											for(var p=0;p<ports_count;p++) {
												if p < index {
													new_ports[p,port_x] = ports[p,port_x]
													new_ports[p,port_y] = ports[p,port_y]
													new_ports[p,port_x_diff] = ports[p,port_x_diff]
													new_ports[p,port_y_diff] = ports[p,port_y_diff]
													new_ports[p,port_object] = ports[p,port_object]
													new_ports[p,port_direction] = ports[p,port_direction]
													new_sockets[p] = sockets[p]
												} else if p == index {
														
												} else if p > index {
													new_ports[p-1,port_x] = ports[p,port_x]
													new_ports[p-1,port_y] = ports[p,port_y]
													new_ports[p-1,port_x_diff] = ports[p,port_x_diff]
													new_ports[p-1,port_y_diff] = ports[p,port_y_diff]
													new_ports[p-1,port_object] = ports[p,port_object]
													new_ports[p-1,port_direction] = ports[p,port_direction]	
													new_sockets[p-1] = sockets[p]
												}
											}
											ports = new_ports
											sockets = new_sockets
											ports_count = array_height_2d(ports)
											if gridController.grid_items[# w, h] == -2 gridController.grid_items[# w, h] = -1
										}
									}
								}
							} else {
								if gridController.grid_items[# w, h] == -1 {
									draw_set_color(c_yellow)
									var _xx = gridController.grid_positions_x[w]
									var _yy = gridController.grid_positions_y[h]
									draw_rectangle(_xx+3,_yy+3,_xx+cell_width-3,_yy+cell_height-3,false)
								}
							}
						}	
					}
				}
			}		
		}
		
	break
	#endregion
}