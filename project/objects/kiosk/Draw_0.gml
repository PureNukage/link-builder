if live_call() return live_result

event_inherited()

switch(states)
{
	case states.placement:
		
		draw_sockets_item()
		
		if !game.vision and !game.temp_vision {
		
			//	Draw stand
			sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
			var color = c_white
			if placeable color = c_white else color = c_red
			draw_sprite_ext(sprite,-1,x,y,1,1,0,color,1)
		
			//	Draw chains
			sprite_set_offset(s_kiosk_chains,sprite_get_width(s_kiosk_chains)/2-1,sprite_get_height(s_kiosk_chains)/2-1)
			draw_sprite(s_kiosk_chains,-1,x,y)
		
			//	Draw blocks idle
			sprite_set_offset(s_kiosk_blocks_idle,sprite_get_width(s_kiosk_blocks_idle)/2-1,sprite_get_height(s_kiosk_blocks_idle)/2-1)
			draw_sprite(s_kiosk_blocks_idle,-1,x,y)
		
		}
		//	Alt vision
		else {
			draw_altmode(object_index)	
		}

	break
	case states.placed:
	
		draw_sockets_item()
		
		if !game.vision and !game.temp_vision {
		
			//	Draw stand
			sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
			draw_sprite(sprite,-1,x,y)
		
			//	Draw stand overlay
			draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha)
		
			//	Draw chains
			sprite_set_offset(s_kiosk_chains,sprite_get_width(s_kiosk_chains)/2-1,sprite_get_height(s_kiosk_chains)/2-1)
			draw_sprite(s_kiosk_chains,-1,x,y)
		
			//	Draw blocks idle
			if !used {
				sprite_set_offset(s_kiosk_blocks_idle,sprite_get_width(s_kiosk_blocks_idle)/2-1,sprite_get_height(s_kiosk_blocks_idle)/2-1)
				draw_sprite(s_kiosk_blocks_idle,-1,x,y)
			} else {
				sprite_set_offset(s_kiosk_blocks_animation,sprite_get_width(s_kiosk_blocks_animation)/2-1,sprite_get_height(s_kiosk_blocks_animation)/2-1)
				draw_sprite(s_kiosk_blocks_animation,used_blocks_frame,x,y)	
			}
		
			if smartcontract > -1 {
			
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
				
				//	Draw the lights on the front of the kiosk
				if array_height_2d(data_needed) == 1 var xx = x-3
				else if array_height_2d(data_needed) == 2 var xx = x-20
				var yy = y+36
				if array_height_2d(data_needed) < 3 {
					for(var l=0;l<array_height_2d(data_needed);l++) {
						var acquired = data_needed[l,1]
						if acquired var color = c_green else var color = c_red
						draw_sprite_ext(s_kiosk_light,0,xx,yy,.5,.5,0,color,1)
						xx += 36
					}
				}
			

				logoX = gridController.grid_positions_x[center_cell_x]+(cell_width/2)			
				logoY = wave(y-100,y-80,.5,5)
		
				if contracts.contract[smartcontract, contract_type] == contract_types.people {
					var scale = .25
					draw_set_color(c_black)
					draw_circle(logoX+1,logoY+32,28,false)
					draw_sprite_ext(portrait,0,logoX-22,logoY,scale,scale,0,c_white,1)
				} else if contracts.contract[smartcontract, contract_type] == contract_types.utility {
					//	Draw the reference feed background
					sprite_set_offset(s_reference_feed_background,sprite_get_width(s_reference_feed_background)/2-1,sprite_get_height(s_reference_feed_background)/2-1)
					if decentralized {
						var _color = c_green
						var _sprite = s_reference_feed_checkmark
					} else {
						var _color = c_red	
						var _sprite = s_reference_feed_x
					}
					draw_sprite(s_reference_feed_background,-1,logoX,logoY)	
					draw_sprite_ext(s_reference_feed_background,-1,logoX,logoY,1,1,0,_color,.3)	
				
					//	Draw the reference feed outline
					sprite_set_offset(s_reference_feed_outline,sprite_get_width(s_reference_feed_outline)/2-1,sprite_get_height(s_reference_feed_outline)/2-1)
					draw_sprite(s_reference_feed_outline,-1,logoX,logoY)
				
					//	Draw the reference feed checkmark or X
					sprite_set_offset(_sprite,sprite_get_width(_sprite)/2-1,sprite_get_height(_sprite)/2-1)
					draw_sprite(_sprite,-1,logoX,logoY)
				
					//	Draw the sonar
					//	Start the next sonar drawing
					if active and time.stream_seconds >= timer and !sonar {//and !sonar and time.stream >= sonar_time {
						sonar_time = time.stream + (60*sonar_cooldown)
						sonar = true
					} 
					//	Expand the sonar
					else if sonar {
					
						var max_radius = contracts.contract[smartcontract, contract_radius]
					
						sonar_size = lerp(sonar_size,max_radius,0.05)
						sonar_alpha = lerp(sonar_alpha,0,0.05)
					
						draw_set_color(c_white)
						draw_set_alpha(sonar_alpha)
						draw_circle(x,y,sonar_size,true)
						draw_set_alpha(1)
					
						if sonar_alpha <= 0.06 {
							sonar_size = 0
							sonar = false
							sonar_alpha = 1
						}
					}
				
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
				
				
				
				
			}
		} 
		//	Alt vision mode
		else {
			draw_altmode(object_index)
			
		}
		
	break
}