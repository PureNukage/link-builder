if argument_count == 1 var _id = argument[0]

//	clear the ports of the items im connected to 
var items = ds_list_create()
for(var p=0;p<ports_count;p++) {
	//	clear the grid of this port x,y
	var _x = ports[p,port_x]
	var _y = ports[p,port_y]
	if gridController.grid_items[# _x, _y] == -2 gridController.grid_items[# _x, _y] = -1	
	if ports[p,port_object] > -1 {
		ds_list_add(items,ports[p,port_object])
		with ports[p,port_object] {
			for(var other_p=0;other_p<ports_count;other_p++) {
				//	add this items port x,y to grid
				var _x = ports[other_p,port_x]
				var _y = ports[other_p,port_y]
				gridController.grid_items[# _x, _y] = -2
				if ports[other_p,port_object] == other.id {
					ports[other_p,port_object] = -1
					sockets[other_p] = -1
					debug_log("Clearing "+string(id)+"'s Port["+string(other_p)+"] of "+string(other.id))
				}
			}
		}
	}
}

if ds_list_empty(items) {
	//	time to die
	//	clear my grid_items
	for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
		for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
			gridController.grid_items[# w, h] = -1
			gridController.grid_objects[# w, h] = -1
			mp_grid_clear_cell(gridController.mp_grid,w,h)
			
		}
	}
	
	//	delete my ports from the game
	for(var p=0;p<ports_count;p++) {
		if ds_list_find_index(gridController.grid_port_objects,id) > -1 {
			var index = ds_list_find_index(gridController.grid_port_objects,id)
			ds_list_delete(gridController.grid_port_x,index)
			ds_list_delete(gridController.grid_port_y,index)
			ds_list_delete(gridController.grid_port_objects,index)
		}	
	}
	
	//	if I'm selected, unselected me
	if input.selection == id or ds_list_find_index(input.selections,id) > -1 {
		input.selection = -1	
		if ds_list_find_index(input.selections,id) > -1 {
			ds_list_delete(input.selections,ds_list_find_index(input.selections,id))	
		}
	}
	
	//  check if my system is still alive, if it is kill it
	if instance_exists(System) {
		instance_destroy(System)	
	}
	
	//	delete me 
	instance_destroy()	
	
	//	grid priorities
	for(var i=0;i<ds_list_size(systemController.systems);i++) {
		var _system = systemController.systems[| i]
		for(var p=0;p<ds_list_size(_system.parts);p++) {
			var part = _system.parts[| p]
			with part {
				item_port_priority()
				item_index_priority()
			}
		}
	}
} 
//	Refresh these items systems
else {
	var master_system_object = System
	var new_systems = []
	var systems_list = ds_list_create()
	for(var i=0;i<ds_list_size(items);i++) {
		var _item = items[| i]
		var new_system = ds_list_create()
		new_systems[i] = new_system
		ds_list_add(new_system,_item)
		ds_list_insert(systems_list,i,new_system)
		
		for(var p=0;p<_item.ports_count;p++) {
			//	if theres something connected to this port
			if _item.ports[p,port_object] > -1 {
				
				var previous_loop = _item
				var current_loop = _item.ports[p,port_object]
				
				var loops = ds_list_create()
				ds_list_add(loops,current_loop)
				while !ds_list_empty(loops) {
					
					//	Check this wires ports
					for(var loop_port=0;loop_port<current_loop.ports_count;loop_port++) {
						var other_port = loop_port
						other_port = !other_port
						//	empty port
						if current_loop.ports[loop_port,port_object] == -1 {

						} 
						//	another object is attached!
						else if current_loop.ports[loop_port,port_object] > -1 {
							//	this object isn't in our loop queue, lets add it!
							if ds_list_find_index(loops,current_loop.ports[loop_port,port_object]) == -1  and ds_list_find_index(new_system,current_loop.ports[loop_port,port_object]) == -1 {
								ds_list_add(loops,current_loop.ports[loop_port,port_object])
							}
						}
					}
					
					ds_list_add(new_system,current_loop)
					ds_list_delete(loops,0)
					if !ds_list_empty(loops) {
						previous_loop = current_loop
						current_loop = loops[| 0]
					}
					
				}
				ds_list_destroy(loops)
				
			}
			
		}
		
	}
	
	var final_systems = ds_list_create()
	
	//	loop through new systems and filter out the duplicates leaving just the unique systems left
	while !ds_list_empty(systems_list) {
		var current_system = systems_list[| 0]
		
		//	make new array for marking which systems are duplicates
		var new_systems_dupes = ds_list_create()
		
		//	loop through other systems and check if its a duplicate
		for(var i=0;i<ds_list_size(systems_list);i++) {
			var compared_system = systems_list[| i]
			
			//	right off the bat, lets compare sizes of items in them. they'll have to be equal to be a duplicate
			//	these are not the same size and thus are not duplicates
			if ds_list_size(compared_system) != ds_list_size(current_system) {
				new_systems_dupes[| i] = 0
			} 
			//	these are the same size and could be a duplicate. lets compare items in the lists now 
			else {
				var dupes = 0
				//	loop through items in the compared system
				for(var an_item=0;an_item<ds_list_size(compared_system);an_item++) {
					//	this item is in the current system, lets count it as a duplicate
					if ds_list_find_index(current_system,compared_system[| an_item]) != -1 {
						dupes++	
					}
				}
				//	current system and compared system are duplicates!
				if dupes == ds_list_size(compared_system) {
					new_systems_dupes[| i] = 1
				} else {
					new_systems_dupes[| i] = 0	
				}
			}
			
		}
		
		var new_systems2 = ds_list_create()
		var systems_to_delete = ds_list_create()
		//	loop through new_systems_dupes and add the non duplicates into the new systems_list
		for(var i=0;i<ds_list_size(new_systems_dupes);i++) {
			if new_systems_dupes[| i] == 0 {
				ds_list_insert(new_systems2,0,systems_list[| i])	
			} else if systems_list[| i] != current_system{
				ds_list_add(systems_to_delete,systems_list[| i])
			}	
		}
		
		//	add current_system to final_systems because it must be unique
		ds_list_add(final_systems,current_system)
		
		//	delete the duplicate systems
		while !ds_list_empty(systems_to_delete) {
			ds_list_destroy(systems_to_delete[| 0])	
			ds_list_delete(systems_to_delete,0)
		}
		
		//	clear systems_list then copy new_systems2 to it
		ds_list_clear(systems_list)
		ds_list_copy(systems_list,new_systems2)
		ds_list_destroy(new_systems2)	
		ds_list_destroy(new_systems_dupes)

	}
	
	//	check how many final systems we have
	//	we have 1 final system 
	if ds_list_size(final_systems) == 1 {
		//	copy the new system onto the master system objects
		with master_system_object {
			ds_list_clear(master_system_object.parts)
			ds_list_copy(master_system_object.parts,final_systems[| 0])
			system_dataflow_check()
			
			for(var _part=0;_part<ds_list_size(master_system_object.parts);_part++) {
				var part = master_system_object.parts[| _part]
				//	recalc sockets
				for(var _port=0;_port<part.ports_count;_port++) {
					if part.sockets[_port] > -1 and part.ports[_port,port_object] == -1 {
						part.sockets[_port] = -1	
					}
				}
			}
		}
	} 
	//	we have multiple final systems
	else if ds_list_size(final_systems) > 1 {
		//	loop through final systems
		for(var i=0;i<ds_list_size(final_systems);i++) {
			var final_system = final_systems[| i]
			
			//	make new system object
			var new_system_object = instance_create_layer(0,0,"Instances",system)
			
			//	loop through new systems parts
			for(var p=0;p<ds_list_size(final_system);p++) {
				var part = final_system[| p]
				
				//	delete this parts old system object if it exists
				if instance_exists(part.System) instance_destroy(part.System)
				
				//	set this parts system to our new system object
				part.System = new_system_object
				
				//	add this part to our new system objects parts list
				if instance_exists(new_system_object) ds_list_add(new_system_object.parts,part)
				
				//	recalc sockets
				for(var _port=0;_port<part.ports_count;_port++) {
					if part.sockets[_port] > -1 and part.ports[_port,port_object] == -1 {
						part.sockets[_port] = -1	
					}
				}
					
			}
			
			if instance_exists(new_system_object) with new_system_object {
				system_dataflow_check()	
			}
		}
	}
	
	//	time to die
	//	clear my grid_items
	for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
		for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
			gridController.grid_items[# w, h] = -1
			gridController.grid_objects[# w, h] = -1
			mp_grid_clear_cell(gridController.mp_grid,w,h)
			
		}
	}
	
	//	delete my ports from the game
	for(var p=0;p<ports_count;p++) {
		if ds_list_find_index(gridController.grid_port_objects,id) > -1 {
			var index = ds_list_find_index(gridController.grid_port_objects,id)
			ds_list_delete(gridController.grid_port_x,index)
			ds_list_delete(gridController.grid_port_y,index)
			ds_list_delete(gridController.grid_port_objects,index)
		}
	}
	
	//	if I'm selected, unselected me
	if input.selection == id or ds_list_find_index(input.selections,id) > -1 {
		input.selection = -1	
		if ds_list_find_index(input.selections,id) > -1 {
			ds_list_delete(input.selections,ds_list_find_index(input.selections,id))	
		}
	}
	
	//  check if my system is still alive, if it is kill it
	if instance_exists(System) and ds_list_size(final_systems) > 1 {
		instance_destroy(System)	
	}
	
	for(var i=0;i<ds_list_size(final_systems);i++) {
		ds_list_destroy(final_systems[| i])	
	}
	ds_list_destroy(final_systems)
	
	//	grid priorities
	for(var i=0;i<ds_list_size(systemController.systems);i++) {
		var _system = systemController.systems[| i]
		for(var p=0;p<ds_list_size(_system.parts);p++) {
			var part = _system.parts[| p]
			with part {
				item_port_priority()
				item_index_priority()
			}
		}
	}
	
}

ds_list_destroy(items)

//	Delete fog
if object_index != wire {
	ds_grid_add_disk(gridController.grid_fog,center_cell_x,center_cell_y,16,-1)
}

if object_index == kiosk and smartcontract > -1 {
	contracts.contract[smartcontract, contract_kiosk] = -1
	contracts.contract[smartcontract, contract_online] = false
	
	if ds_exists(line,ds_type_list) and ds_list_size(line) > 0 {
		for(var i=0;i<ds_list_size(line);i++) {
			var _person = line[| i]
			with _person {
				if goal_current > -1 {
					instance_destroy(goal_current)
					goal_current = -1
				}
				if smartcontract > -1 {
					ds_list_delete(smartcontracts,0)
					smartcontract = -1	
				}
				
				states = states.idle
			}
		}
	}
	
	for(var p=0;p<ds_list_size(personController.people);p++) {
		var Person = personController.people[| p]
		with Person {
			if smartcontract > -1 and smartcontract == other.smartcontract {
				smartcontract = -1
				ds_list_delete(smartcontracts,0)
				while ds_list_find_index(smartcontracts,other.smartcontract) > -1 {
					ds_list_delete(smartcontracts,ds_list_find_index(smartcontracts,other.smartcontract))	
				}
				states = states.idle
				contracts.contract[other.smartcontract,contract_traffic_live]--
			}			
		}
	}
	
	//with person {
	//	if ds_list_find_index(smartcontracts,other.smartcontract) > -1 {
	//		ds_list_delete(smartcontracts,other.smartcontract)	
	//	}
	//	if smartcontract == other.smartcontract smartcontract = -1
	//}
}

if object_index == node {
	shop.item_node[item_index, node_placed] = false	
	shop.item_node[item_index, node_object_index] = -1
}

if object_index == data {
	shop.item_data[data_generated, item_object_index] = -1
	//if surface_exists(topmenu.data_surface) surface_free(topmenu.data_surface)
}

if object_index == wire {
	var _kiosk = -1
	var _smartcontract = -1
	if instance_exists(kiosk) {
		with kiosk {
			for(var d=0;d<array_height_2d(data_needed);d++) {
				if data_needed[d,2] == other.id {
					_smartcontract = smartcontract
					_kiosk = id
				}
			}
		}
	}
	if _smartcontract > -1 {
		with person {
			if ds_list_find_index(smartcontracts,_smartcontract) {
				ds_list_delete(smartcontracts,_smartcontract)	
			}
			if smartcontract == _smartcontract smartcontract = -1
		}	
	}
}

//	delete me 
instance_destroy()