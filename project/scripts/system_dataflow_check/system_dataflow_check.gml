var databases = ds_list_create()
var nodes = ds_list_create()
var kiosks = ds_list_create()

for(var i=0;i<ds_list_size(parts);i++) {
	if parts[| i].object_index == data { 
		ds_list_add(databases,parts[| i])
	} else if parts[| i].object_index == node {
		ds_list_clear(parts[| i].data_held)
		//ds_list_add(nodes,parts[| i])	
	} else if parts[| i].object_index == kiosk {
		ds_list_add(kiosks,parts[| i])
		ds_list_clear(parts[| i].data_held)
		ds_list_clear(parts[| i].data_held_ids)
	}	
	
}

//if !ds_list_empty(kiosks) {
	//if !ds_list_empty(databases) {

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
									if current_loop != wire {
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
								}
								loop = false
						
							} else {
								//	databases and kiosks...
								loop = false
							}
						
						
						}	
					}
				}
		
		
			}

		#endregion

		#region Node loops

		if ds_list_empty(nodes) {
	
		} else  if !ds_list_empty(nodes) and !ds_list_empty(kiosks) {
	
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
									if current_loop != wire {
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

		for(var i=0;i<ds_list_size(kiosks);i++) {
	
			var _kiosk = kiosks[| i]
			var amount_of_data_req = array_height_2d(_kiosk.data_needed)
			var amount_of_data_had = 0
	
			for(var d=0;d<amount_of_data_req;d++) {
				var _data_needed = _kiosk.data_needed[d,0]
				for(var a=0;a<ds_list_size(_kiosk.data_held);a++) {
					var _data_held = _kiosk.data_held[| a]
					if _data_held == _data_needed {
						_kiosk.data_needed[d,1] = true	
						_kiosk.data_needed[d,2] = _kiosk.data_held_ids[| a]
						amount_of_data_had++
					} else {
						_kiosk.data_needed[d,1] = false	
					}
				}
			}
	
			//	this kiosk has all the data it needs!
			if amount_of_data_had == amount_of_data_req {
				if !_kiosk.active {
					_kiosk.active = true
					contracts.contract[_kiosk.smartcontract, contract_online] = true
					ds_list_add(contracts.contracts_online,_kiosk.smartcontract)
					debug_log("Kiosk "+string(_kiosk)+" is now active with smartcontract ["+contracts.contract[_kiosk.smartcontract, contract_name]+"]")
				}
			} 
			//	this kiosk does NOT have all the data it needs
			else {
				if _kiosk.active {
					_kiosk.active = false
					contracts.contract[_kiosk.smartcontract, contract_online] = false
					if ds_list_find_index(contracts.contracts_online,_kiosk.smartcontract) > -1 {
						ds_list_delete(contracts.contracts_online,ds_list_find_index(contracts.contracts_online,_kiosk.smartcontract))	
					}
					debug_log("Kiosk "+string(_kiosk)+" is now inactive")
				}
			}
	
		}

		#endregion
	//}
//}

ds_list_destroy(databases)
ds_list_destroy(nodes)
ds_list_destroy(kiosks)