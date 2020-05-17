var databases = ds_list_create()
var nodes = ds_list_create()
var kiosks_other = ds_list_create()
var kiosks_utility = ds_list_create()

for(var i=0;i<ds_list_size(parts);i++) {
	if instance_exists(parts[| i]) {
		if parts[| i].object_index == data { 
			ds_list_add(databases,parts[| i])
			parts[| i].connected = false
		} else if parts[| i].object_index == node {
			ds_list_clear(parts[| i].data_held)
			parts[| i].connected = false
		
			//	Clear out ports_directions real quick
			for(var pp=0;pp<parts[| i].ports_count;pp++) {
				parts[| i].ports[pp,port_direction] = -1
			}
		
		} else if parts[| i].object_index == kiosk {
			var _kiosk = parts[| i]
			ds_list_clear(parts[| i].data_held)
			ds_list_clear(parts[| i].data_held_ids)
		
			//	lets clear out its decentralization real quick
			for(var dd=0;dd<array_height_2d(_kiosk.data_needed);dd++) {
				_kiosk.data_needed[dd,1] = false
				_kiosk.data_needed[dd,2] = -1
				//_kiosk.data_needed[dd,3] = false
			}
		
			//	Reset this contracts gasfee and linkfee
			if _kiosk.smartcontract > -1 {
				contracts.contract[_kiosk.smartcontract, contract_gasfee_base] = 1
				contracts.contract[_kiosk.smartcontract, contract_gasfee_total] = 1
				contracts.contract[_kiosk.smartcontract, contract_linkfee] = 0
			}
		
			//	This is a utility contract
			if _kiosk.smartcontract > -1 and contracts.contract[_kiosk.smartcontract, contract_type] == contract_types.utility {
				ds_list_add(kiosks_utility,parts[| i])
			} else if (_kiosk.smartcontract == -1 or contracts.contract[_kiosk.smartcontract, contract_type] == contract_types.people) {
				ds_list_add(kiosks_other,parts[| i])	
			}
		}	
	}
}

#region Database loops
	for(var i=0;i<ds_list_size(databases);i++) {
		
		var db = databases[| i]
		
		//	loop through ports
		for(var p=0;p<db.ports_count;p++) {
			//	there is something connected to this port
			if db.ports[p,port_object] > -1 {
					
				var previous_loop = db
				var current_loop = db.ports[p,port_object]
				var loop = true
				while loop == true {
					
					var _object_index = current_loop.object_index
					
					if _object_index == wire {
								
						current_loop.color = c_white
						
						//	check this wires ports
						for(var loop_port=0;loop_port<current_loop.ports_count;loop_port++) {
							var other_port = loop_port
							other_port = !other_port
							//	this port is empty, this is a dead end!
							if current_loop.ports[loop_port,port_object] == -1 {
								loop = false
								current_loop.ports[other_port,port_direction] = in
								current_loop.ports[loop_port,port_direction] = out
								loop_port = current_loop.ports_count
							} 
							//	there is something attached to this wire and its not the previous
							else if current_loop.ports[loop_port,port_object] > -1 and current_loop.ports[loop_port,port_object] != previous_loop {
								//	set my port In and Out directions
								current_loop.ports[loop_port,port_direction] = out
								current_loop.ports[other_port,port_direction] = in
									
								previous_loop = current_loop
								current_loop = current_loop.ports[loop_port,port_object]
								loop_port = current_loop.ports_count
							} else if current_loop.ports[other_port,port_object] > -1 and current_loop.ports[loop_port,port_object] == previous_loop {
								current_loop.ports[loop_port,port_direction] = in 
								current_loop.ports[other_port,port_direction] = out
									
								previous_loop = current_loop
								current_loop = current_loop.ports[other_port,port_object]
								loop_port = current_loop.ports_count
							}
									
							//	if this is connecting to something NOT a wire, set its incoming port to "in"
							if current_loop.object_index != wire {
								for(var a=0;a<current_loop.ports_count;a++) {
									if current_loop.ports[a,port_x] == previous_loop.center_cell_x and current_loop.ports[a,port_y] == previous_loop.center_cell_y { 
										current_loop.ports[a,port_direction] = in
												
									}
								}
							}
									
						}
					} else if _object_index == node {
						//	toss this dbs type into the nodes held list
						if ds_list_find_index(current_loop.data_held,db.data_generated) == -1 {
							ds_list_add(current_loop.data_held,db.data_generated)
							ds_list_add(nodes,current_loop)
							db.connected = true
							current_loop.connected = true
						}
								
						//	set the connected port direction
						for(var d=0;d<current_loop.ports_count;d++) {
							if current_loop.ports[d,port_object] == previous_loop {
								current_loop.ports[d,port_direction] = in	
							}
						}
								
						loop = false
						
					} else {
						//	databases and kiosks...
						loop = false
						db.connected = connected.incorrect_connected
					}
						
						
				}	
			}
		}
		
		
	}

#endregion

#region Node loops

	if ds_list_empty(nodes) {
	
	} else if !ds_list_empty(nodes) { //and !ds_list_empty(kiosks) {
	
		while ds_list_size(nodes) > 0 {
			var current_node = nodes[| 0]
		
			//	Loop through ports
			for(var p=0;p<current_node.ports_count;p++) {
				if current_node.ports[p,port_object] > -1 and current_node.ports[p,port_direction] != in {
				
					var previous_loop = current_node
					var current_loop = current_node.ports[p,port_object]
					var loop = true
					while loop == true {
					
						var _object_index = current_loop.object_index
					
						if _object_index == wire {
							
							//if _object_index.color != c_white {
								current_loop.color = c_sergey_blue
							//}
						
							//	check this wires ports
							for(var loop_port=0;loop_port<current_loop.ports_count;loop_port++) {
								var other_port = loop_port
								other_port = !other_port
								//	this port is empty, this is a dead end!
								if current_loop.ports[loop_port,port_object] == -1 {
									loop = false
									current_loop.ports[other_port,port_direction] = in
									current_loop.ports[loop_port,port_direction] = out
									loop_port = current_loop.ports_count
								} 
								//	there is something attached to this wire and its not the previous
								else if current_loop.ports[loop_port,port_object] > -1 and current_loop.ports[loop_port,port_object] != previous_loop {
									//	set my port In and Out directions
									current_loop.ports[loop_port,port_direction] = out
									current_loop.ports[other_port,port_direction] = in
									
									previous_loop = current_loop
									current_loop = current_loop.ports[loop_port,port_object]
									loop_port = current_loop.ports_count
								} else if current_loop.ports[other_port,port_object] > -1 and current_loop.ports[loop_port,port_object] == previous_loop {
									current_loop.ports[loop_port,port_direction] = in 
									current_loop.ports[other_port,port_direction] = out
									
									previous_loop = current_loop
									current_loop = current_loop.ports[other_port,port_object]
									loop_port = current_loop.ports_count
								}
									
								//	if this is connecting to something NOT a wire, set its incoming port to "in"
								if current_loop.object_index != wire {
									for(var a=0;a<current_loop.ports_count;a++) {
										if current_loop.ports[a,port_x] == previous_loop.center_cell_x and current_loop.ports[a,port_y] == previous_loop.center_cell_y { 
											current_loop.ports[a,port_direction] = in
												
										}
											
									}
								}
									
							}
							
						} else if _object_index == node {
						
							//	we connect to ourselves!
							if current_loop == current_node {

							}
							loop = false
						
						} else if _object_index == kiosk {
						
							//	loop for putting data into kiosk
							for(var d=0;d<ds_list_size(current_node.data_held);d++) {
								if ds_list_find_index(current_loop.data_held,current_node.data_held[| d]) == -1 {
									//	putting this data into the kiosk!
									ds_list_add(current_loop.data_held,current_node.data_held[| d])
									ds_list_add(current_loop.data_held_ids,current_node)
								} else {
									//	data is already in this kiosk!	
								}
							}
							loop = false
							
							//	set the connected port direction
							for(var d=0;d<current_loop.ports_count;d++) {
								if current_loop.ports[d,port_object] == previous_loop {
									current_loop.ports[d,port_direction] = in	
								}
							}
						
						} else {
							//	databases...
							loop = false
						}
					}
				
				
				}
				if p == current_node.ports_count - 1 {
					ds_list_delete(nodes,ds_list_find_index(nodes,current_node))	
				}
			}
		
		}
	
	}

#endregion

#region Kiosk loops

	#region Utility Contract 
		if !ds_list_empty(kiosks_utility) {
			for(var i=0;i<ds_list_size(kiosks_utility);i++) {
				var _kiosk = kiosks_utility[| i]
				var _nodes = ds_list_create()
		
				var _data_needed = _kiosk.data_needed[0,0]
				var price_string = is_price(shop.item_data[_data_needed, item_name],true)
		
				var any_of_my_type = 0
				for(var d=0;d<ds_list_size(_kiosk.data_held);d++) {
					var _data_held = _kiosk.data_held[| d]
					var _data_held_string = shop.item_data[_data_held, item_name]
					if string_pos(price_string,_data_held_string) != 0 {
						_kiosk.data_needed[0,1] = true
						_kiosk.data_needed[0,2] = _kiosk.data_held_ids[| d]
						any_of_my_type++
						contracts.contract[_kiosk.smartcontract, contract_linkfee]++
						if ds_list_find_index(_nodes,_kiosk.data_needed[0,2]) == -1 {
							contracts.contract[_kiosk.smartcontract, contract_gasfee_total]++
							ds_list_add(_nodes,_kiosk.data_needed[0,2])
						}
					}
				}
				if any_of_my_type > 0 {
					if _kiosk.active == false {
						_kiosk.active = true
						contracts.contract[_kiosk.smartcontract, contract_online] = true
						ds_list_add(contracts.contracts_online,_kiosk.smartcontract)
						debug_log("Kiosk "+string(_kiosk)+" is now active with smartcontract ["+contracts.contract[_kiosk.smartcontract, contract_name]+"]")
						if contracts.contract[_kiosk.smartcontract, contract_virgin] {
							
							////	GAME ANALYTICS Resource drop for value
							var Value = contracts.contract[_kiosk.smartcontract, contract_price]
							var cName = contracts.contract[_kiosk.smartcontract, contract_name]
							
							ga_addResourceEvent(GA_RESOURCEFLOWTYPE_SOURCE, "value", Value, "contract online", cName)
							
							contracts.contract[_kiosk.smartcontract, contract_virgin] = false
						}
					}
				} else {
					_kiosk.active = false	
					_kiosk.decentralized = false
					with _kiosk price_feed_refresh()
				}
			
				if _kiosk.decentralized {
				
				}
				ds_list_destroy(_nodes)
			}
		}
	#endregion

	#region dApp Contracts
		for(var i=0;i<ds_list_size(kiosks_other);i++) {
	
			var _kiosk = kiosks_other[| i]
			var _nodes = ds_list_create()
			var prices_used = ds_list_create()
			if _kiosk.smartcontract > -1 {
			
				var amount_of_data_req = array_height_2d(_kiosk.data_needed)
				var amount_of_data_had = 0
	
				for(var d=0;d<amount_of_data_req;d++) {
					var _data_needed = _kiosk.data_needed[d,0]
					var _data_needed_string = shop.item_data[_data_needed, item_name]
			
					if _kiosk.data_needed[d,3] {
						//	Find our Price Feed for this currency
						var needed_price = is_price(_data_needed_string,true)
						with kiosk {
							var Name = contracts.contract[smartcontract, contract_name]
							if (ds_list_find_index(contracts_supporting,_kiosk) > -1) and (is_price(Name) and is_price(Name,true) == needed_price) {
								//	Find our needed price and add it into prices used list
								for(var dd=0;dd<ds_list_size(data_held);dd++) {
									var data_name = shop.item_data[data_held[| dd],item_name]
									if is_price(data_name) and is_price(data_name,true) == needed_price and ds_list_find_index(prices_used,data_name) == -1 {
										ds_list_add(prices_used,data_name)
										_kiosk.data_needed[d,1] = true
										amount_of_data_had++	
										dd = 100
									}
								}
							}
						}
					} else {
						//	This needed data is a price
						if is_price(_data_needed_string) {
							var needed_price_string = is_price(_data_needed_string,true)
						}
						for(var a=0;a<ds_list_size(_kiosk.data_held);a++) {
							var _data_held = _kiosk.data_held[| a]
							//	This needed data is a price
							if is_price(_data_needed_string) {
								var this_data_string = shop.item_data[_data_held, item_name]
								//	This is a price we need!
								if (string_pos(needed_price_string,this_data_string) != 0) and ds_list_find_index(prices_used,this_data_string) == -1 {
									ds_list_add(prices_used,this_data_string)
									_kiosk.data_needed[d,1] = true
									_kiosk.data_needed[d,2] = _kiosk.data_held_ids[| a]
									amount_of_data_had++
									contracts.contract[_kiosk.smartcontract, contract_linkfee]++
									if ds_list_find_index(_nodes,_kiosk.data_needed[d,2]) == -1 {
										ds_list_add(_nodes,_kiosk.data_needed[d,2])
										contracts.contract[_kiosk.smartcontract, contract_gasfee_total]++
									}
									a = 100
								} 
								//	This is not a price we need
								else {
									//_kiosk.data_needed[d,1] = false	
								}
							} 
							//	This needed data is NOT a price
							else {
								if _data_held == _data_needed {
									_kiosk.data_needed[d,1] = true	
									_kiosk.data_needed[d,2] = _kiosk.data_held_ids[| a]
									amount_of_data_had++
									contracts.contract[_kiosk.smartcontract, contract_linkfee]++
									if ds_list_find_index(_nodes,_kiosk.data_needed[d,2]) == -1 {
										ds_list_add(_nodes,_kiosk.data_needed[d,2])
										contracts.contract[_kiosk.smartcontract, contract_gasfee_total]++
									}
								} else {
									//_kiosk.data_needed[d,1] = false	
								}
							}
						}
					}
				}
		
				var amount_of_data_had = 0
				for(var d=0;d<array_height_2d(_kiosk.data_needed);d++) {
					if _kiosk.data_needed[d,1] {
						amount_of_data_had++
					}
				}
	
				//	this kiosk has all the data it needs!
				if amount_of_data_had >= amount_of_data_req and (player.link >= contracts.contract[_kiosk.smartcontract, contract_linkfee] and player.eth >= contracts.contract[_kiosk.smartcontract, contract_gasfee_total] or app.tutorial > -1) {
					if !_kiosk.active {
						_kiosk.active = true
						contracts.contract[_kiosk.smartcontract, contract_online] = true
						ds_list_add(contracts.contracts_online,_kiosk.smartcontract)
						with _kiosk contract_conditionCheck()
						debug_log("Kiosk "+string(_kiosk)+" is now active with smartcontract ["+contracts.contract[_kiosk.smartcontract, contract_name]+"]")
						
						if contracts.contract[_kiosk.smartcontract, contract_virgin] {
							//	Push an event
							var Contract_name = contracts.contract[_kiosk.smartcontract, contract_name]
							if !textbox_in_queue(time.seconds,event_types.online,_kiosk) and !textbox_active(time.seconds,event_types.online,_kiosk) and !textbox_in_history(time.seconds,event_types.online,_kiosk) {
								create_textbox(Contract_name+" is now online!",-1,event_duration,time.seconds,event_types.online,_kiosk)	
							}
							contracts.contract[_kiosk.smartcontract, contract_virgin] = false	
						}
					}
				} 
				//	this kiosk does NOT have all the data it needs
				else {				
					if _kiosk.active {
						_kiosk.active = false
						with _kiosk contract_conditionCheck()
						contracts.contract[_kiosk.smartcontract, contract_online] = false
						if ds_list_find_index(contracts.contracts_online,_kiosk.smartcontract) > -1 {
							ds_list_delete(contracts.contracts_online,ds_list_find_index(contracts.contracts_online,_kiosk.smartcontract))	
						}
						debug_log("Kiosk "+string(_kiosk)+" is now inactive")
						
						with _kiosk {
							busy = false
							if ds_list_size(line) > 0 {
								for(var k=0;k<ds_list_size(line);k++) {
									var _person = line[| k]
									with _person {
										if goal_current > -1 {
											instance_destroy(goal_current)
											goal_current = -1
										}
										if smartcontract > -1 {
											ds_list_delete(smartcontracts,0)
											contracts.contract[smartcontract, contract_traffic_live]--
											smartcontract = -1	
										}
				
										states = states.idle
									}
								}
							}
							
							ds_list_clear(line)
	
							for(var p=0;p<ds_list_size(personController.people);p++) {
								var Person = personController.people[| p]
								with Person {
									if smartcontract > -1 and smartcontract == _kiosk.smartcontract {
										smartcontract = -1
										ds_list_delete(smartcontracts,0)
										while ds_list_find_index(smartcontracts,_kiosk.smartcontract) > -1 {
											ds_list_delete(smartcontracts,ds_list_find_index(smartcontracts,_kiosk.smartcontract))	
										}
										states = states.idle
										contracts.contract[_kiosk.smartcontract,contract_traffic_live]--
									}			
								}
							}						
								
						}
						//	Check if out of LINK
						var Contract_name = contracts.contract[_kiosk.smartcontract, contract_name]
						if player.link < contracts.contract[_kiosk.smartcontract, contract_linkfee] {
							if !textbox_in_queue(time.seconds) and !textbox_active(time.seconds) and !textbox_in_history(time.seconds) {
								create_textbox("Out of LINK!",s_event_out_of_link,event_duration,time.seconds,event_types.out_of_link,_kiosk)
							}
						}
						//	Check if out of ETH
						if player.eth < contracts.contract[_kiosk.smartcontract, contract_gasfee_total] {
							if !textbox_in_queue(time.seconds) and !textbox_active(time.seconds) and !textbox_in_history(time.seconds) {
								create_textbox("Out of ETH!",s_event_out_of_eth,event_duration,time.seconds,event_types.out_of_eth,_kiosk)
							}
						}
						
					}
					
				}

			}
			ds_list_destroy(_nodes)
			ds_list_destroy(prices_used)
		}
	#endregion

#endregion

ds_list_destroy(databases)
ds_list_destroy(nodes)
ds_list_destroy(kiosks_other)
ds_list_destroy(kiosks_utility)