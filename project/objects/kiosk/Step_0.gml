event_inherited()

switch(states) 
{
	#region Placement
		case states.placement:
			
			if input.grid_moved {
				
				ports_xyupdate_movement()
				
				item_check_sockets()
			}
			
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
		
			//	I am being replaced, darken myself
			if input.selection > -1 and input.selection.object_index == object_index and input.selection.replace_id == id {
				used_alpha = .6
			} else if used_alpha != used_alpha_max used_alpha = used_alpha_max
			
			if selected {
				
				//	I want to move this item somewhere else
				if input.keypress_r and input.selection == id {
					
					var _xx = gridController.grid_positions_x[input.grid_x]+(cell_width/2)
					var _yy = gridController.grid_positions_y[input.grid_y]+(cell_height/2)
					var new_item = instance_create_layer(_xx,_yy,"Instances",object_index)
					
					//	pass important data into this new item
					new_item.smartcontract = smartcontract
					new_item.portrait = portrait
					new_item.data_needed = data_needed
					new_item.ports_count = ports_count
					new_item.rotation = rotation
					new_item.name = name
					ds_list_copy(new_item.contracts_supporting,contracts_supporting)
					
					//	Turn off decentralized data
					for(var d=0;d<array_height_2d(new_item.data_needed);d++) {
						new_item.data_needed[d,3] = false	
					}
					
					//	Pass along ports xy but not objects
					for(var p=0;p<ports_count;p++) {
						new_item.ports[p,port_x] = ports[p,port_x]
						new_item.ports[p,port_y] = ports[p,port_y]
						new_item.ports[p,port_x_diff] = ports[p,port_x_diff]
						new_item.ports[p,port_y_diff] = ports[p,port_y_diff]
					}
					
					with new_item {
						ports_xyupdate_movement()
						ports_xyupdate_rotation(rotation)
					}
					
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
					
					with new_item placeable = is_placeable()
					
				}	
				
				//	DEBUG level up this contract
				if keyboard_check_pressed(vk_pageup) and contracts.contract[smartcontract, contract_level] < 3 {
					contracts.contract[smartcontract, contract_level]++
				} 
			}
		
			#region We have a smart contract
			if smartcontract > -1 {
				
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
					if active {
						image_speed = .5
					} else {
						image_speed = 0	
					}
				}
				
				#region People Contract
				if contracts.contract[smartcontract, contract_type] == contract_types.people {
			
					//	lets add our contract into a persons queue
					if active and ds_exists(line,ds_type_list) and ds_list_size(line) < contracts.contract[smartcontract, contract_linesize] and contracts.contract[smartcontract, contract_traffic_live] < contracts.contract[smartcontract, contract_traffic] {
						if contracts.contract[smartcontract, contract_reliability] > 50 {
							if !ds_list_empty(personController.people) {
								if ds_list_size(personController.people) > 1 {
									var Random = irandom_range(0,ds_list_size(personController.people)-1)
								} else var Random = 0
								var _person = personController.people[| Random]
								//	this contract is not in this persons queue, lets add it
								if ds_list_find_index(_person.smartcontracts,smartcontract) == -1 {
									ds_list_add(_person.smartcontracts,smartcontract)
									contracts.contract[smartcontract, contract_traffic_live]++
									debug_log("Giving person the smart contract: "+string(contracts.contract[smartcontract, contract_name]))
								}
							}
						} else {
							if time.seconds_switch debug_log("Contract: "+string(contracts.contract[smartcontract, contract_name]+" is too unreliable! Nobody wants to use it!"))	
						}
					}	
					//	Why can't I assign a contract ??
					else {
						if time.seconds_switch {
							
							//	line list data structure doesn't exist
							if !ds_exists(line,ds_type_list) {
								debug_log("CONTRACT ASSIGN ERROR "+string(contracts.contract[smartcontract, contract_name])+"'s ds_list 'line' does not exist!")	
							}
							
							//	line is filled
							if ds_list_size(line) >= contracts.contract[smartcontract, contract_linesize] {
								debug_log("CONTRACT ASSIGN ERROR "+string(contracts.contract[smartcontract, contract_name])+"'s line is filled!")	
							}
							
							//	enough people have my contract already!
							if contracts.contract[smartcontract, contract_traffic_live] >= contracts.contract[smartcontract, contract_traffic] {
								debug_log("CONTRACT ASSIGN ERROR enough people have "+string(contracts.contract[smartcontract, contract_name])+" already!")
							}
							
						}
					}
				}
				#endregion
				
				#region Utility Contract
				else {
					
					if active {
					
						//	Setting new spawn time
						if timer == -1 {
							timer = time.stream_seconds + contracts.contract[smartcontract, contract_channel]
						}
					
						//	Time to use the utility contract!
						var gasfee = contracts.contract[smartcontract, contract_gasfee_total]
						var linkfee = contracts.contract[smartcontract, contract_linkfee]
						if time.stream_seconds >= timer {
							if player.link >= linkfee and player.eth >= gasfee {
								debug_log("Using reference price feed!")
								
								resource_changed("ETH",contracts.contract[smartcontract, contract_gasfee_base],x,y-128,false)
								
								used = true
							
								price_feed_push()
						
								var got_at_least_one = 0
								var how_many_sources = 0
								var price_i_need = is_price(shop.item_data[data_needed[0,0],item_name], true)
								var nodes = ds_list_create()
								for(var i=0;i<ds_list_size(data_held);i++) {
									var _data_held = data_held[| i]
									var data_held_string = shop.item_data[_data_held, item_name]
									//	This is a price data I can use
									if is_price(data_held_string) and string_pos(price_i_need,data_held_string) {
										with data {
											if data_generated == _data_held {
												how_many_sources++
												//	Check for data misfire
												var chance = irandom_range(1,100)
												//	This data misfired!
												if chance < shop.item_data[item_index, item_corruption] {
													//contract_misfire++
													used = true
													misfire = true
												} else {
													got_at_least_one++
													used = true
													misfire = false
												}
								
												shop.item_data[item_index, item_calls]++
												
												//	Lets find the node with this data and bump it up
												with node {
													if ds_list_find_index(data_held,_data_held) != -1 {
														used = true
														shop.item_node[item_index, node_jobruns]++
														jobruns++
														if node_levelCheck() {
															//	Event leveled up
															var Node_name = name
															var Node_level = shop.item_node[item_index, node_level]
															var Portrait = s_event_node_levelup
															skillpoints++
															shop.item_node[item_index, node_skillpoints] = skillpoints
															if !textbox_in_queue(Node_level,event_types.levelup,id) {
																create_textbox(Node_name+" is now Level "+string(Node_level+1),Portrait,event_duration,Node_level,event_types.levelup,id)	
															}
														}
														if ds_list_find_index(nodes,id) == -1 {
															resource_changed("ETH",1,x,y-128,false)
															ds_list_add(nodes,id)
														}
													}
												}	
				
												//	Check for data corruption increase
												if app.data_corruption == mode.on data_corruption_check()	
											}
										}
									}
								}
								ds_list_destroy(nodes)
								
								if ((got_at_least_one / how_many_sources)*100)-1 > 65 {
									decentralized = true	
								} else {
									if decentralized {
										debug_log("Reference price feed is no longer accurate enough")
										decentralized = false	
										price_feed_refresh()
									}
								}
							
								timer = -1
							}
							//	Not enough money 
							else {
								//if decentralized {
									debug_log("Not enough ETH or LINK to use this contract!")
									decentralized = false
									active = false
									price_feed_refresh()
								//}
							}
							
						} 
					
					}
					
				}	
				#endregion
			}
			#endregion
			
		break
	#endregion
}

depth = -y