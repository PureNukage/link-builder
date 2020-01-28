var connections = 0
var _systems = ds_list_create()

//	lets count stuff
for(var p=0;p<ports_count;p++) {
	if ports[p,port_object] > -1 and instance_exists(ports[p,port_object]) and ports[p,port_object].System > -1 and instance_exists(ports[p,port_object].System) {
		//	we have an object!
		connections++
		
		//	add it to our list of systems if its a new system
		if ds_list_find_index(_systems,ports[p,port_object].System) == -1 {
			ds_list_add(_systems,ports[p,port_object].System)
		}	
	}
}

//	we're making our own system
if connections == 0 {
	System = instance_create_layer(x,y,"Instances",system)
	ds_list_add(System.parts,id)
	//with System { 
	//	system_dataflow_check()	
	//}
} 
//	we have connections
else if connections > 0 {
	var amount_of_systems = ds_list_size(_systems)
	
	//	only one system, lets join it
	if amount_of_systems == 1 {
		ds_list_add(_systems[| 0].parts,id)	
		System = _systems[| 0]
		
		with System { 
			system_dataflow_check()	
		}
	} 
	//	more than one system, lets make a new system and combine the others into it
	else if amount_of_systems > 1 {
		System = instance_create_layer(x,y,"Instances",system)
		ds_list_add(System.parts,id)
		
		for(var i=0;i<amount_of_systems;i++) {
			for(var a=0;a<ds_list_size(_systems[| i].parts);a++) {
				if ds_list_find_index(System.parts,_systems[| i].parts[| a]) == -1 {
					ds_list_add(System.parts,_systems[| i].parts[| a])
					_systems[| i].parts[| a].System = System
				}
			}
		}
		
		with System { 
			system_dataflow_check()	
		}
		
		//	delete old system objects
		for(var i=0;i<ds_list_size(_systems);i++) {
			instance_destroy(_systems[| i])	
		}
		
	}
}

ds_list_destroy(_systems)