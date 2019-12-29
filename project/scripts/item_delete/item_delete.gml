if argument_count == 1 var _id = argument[0]

//	clear the ports of the items im connected to 
var items = ds_list_create()
for(var p=0;p<ports_count;p++) {
	if ports[p,port_object] > -1 {
		ds_list_add(items,ports[p,port_object])
		with ports[p,port_object] {
			for(var other_p=0;other_p<ports_count;other_p++) {
				if ports[other_p,port_object] = other.id {
					ports[other_p,port_object] = -1	
				}
			}
		}
	}
}

if ds_list_empty(items) {
		
} 
//	Refresh these items systems
else {
	var master_system = System
	var new_systems = []
	for(var i=0;i<ds_list_size(items);i++) {
		var _item = items[| i]
		var new_system = ds_list_create()
		new_systems[i,0] = new_system
		
		for(var p=0;p<_item.ports_count;p++) {
			//	if theres something connected to this port
			if _item.ports[p,port_object] > -1 {
				
				var previous_loop = _item
				var current_loop = _item.ports[p,port_object]
				
				var loops = ds_list_create()
				ds_list_add(loops,current_loop)
				while !ds_list_empty(loops) {
					
					var _object_index = current_loop.object_index
					
					//	Check this wires ports
					for(var loop_port=0;loop_port<current_loop.ports_count;loop_port++) {
						var other_port = loop_port
						other_port = !other_port
						//	empty port
						if current_loop.ports[loop_port,port_object] == -1 {
							loop = false
						} 
						//	another object is attached!
						else if current_loop.ports[loop_port,port_object] > -1 and current_loop.ports[loop_port,port_object] != previous_loop {
							
						}
					}
					
				}
				
			}
			
		}
		ds_list_destroy(new_system)
		
	}
}