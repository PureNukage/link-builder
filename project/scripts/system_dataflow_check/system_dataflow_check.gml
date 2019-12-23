var databases = ds_list_create()
var nodes = ds_list_create()
var kiosks = ds_list_create()

for(var i=0;i<ds_list_size(parts);i++) {
	if parts[| i].object_index == data { 
		ds_list_add(databases,parts[| i])
	}
}

#region Database loops
	if ds_list_size(databases) > 0 {
		for(var i=0;i<ds_list_size(databases);i++) {
		
			var db = databases[| i]
		
			//	loop through ports
			for(var p=0;p<db.ports_count;p++) {
				//	there is something connected to this port
				if db.ports[p,port_object] > -1 {
				
					var current_wire = db.ports[p,port_object]
					var loop = true
					while loop == true {
					
						var _object_index = current_wire.object_index
					
						if _object_index == wire {
						
							//	check this wires ports
							for(var loop_port=0;loop_port<current_wire.ports_count;loop_port++) {
								//	this port is empty, this is a dead end!
								if current_wire.ports[loop_port,port_object] == -1 {
									loop = false
								} 
								//	there is something attached to this wire and its not ourselves
								else if current_wire.ports[loop_port,port_object] > -1 and current_wire.ports[loop_port,port_object] != current_wire {
									//	set my port In and Out directions
									current_wire.ports[loop_port,port_direction] = out
									var other_port = loop_port
									other_port = !other_port
									current_wire.ports[other_port,port_direction] = in
									
									current_wire = current_wire.ports[loop_port,port_object]
								} else if current_wire.ports[loop_port,port_object] == current_wire {

								}
							}
						} else if _object_index == node {
							//	toss this dbs type into the nodes held list
							ds_list_add(current_wire.data_held,db.data_generated)
							ds_list_add(nodes,current_wire)
							loop = false
						
						} else {
							//	databases and kiosks...
							loop = false
						}
						
						
					}	
				}
			}
		
		
		}
	}
#endregion

#region Node loops

if ds_list_empty(nodes) {
	
} else {
	
	for(var i=0;i<ds_list_size(nodes);i++) {
		var current_node = nodes[| i]
		
		//	Loop through ports
		for(var p=0;p<current_node.ports_count;p++) {
			if current_node.ports[p,port_object] > -1 {
				
				var current_loop = current_node.ports[p,port_object]
				var loop = true
				while loop == true {
					
					var _object_index = current_loop.object_index
					
					if _object_index == wire {
							
					}
				}
				
				
			}
		}
		
	}
	
}

#endregion