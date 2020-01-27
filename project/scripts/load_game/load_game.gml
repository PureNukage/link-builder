//	Clear the current level
with all {
	if object_index != app and object_index != soundSystem and object_index != camera {
		instance_destroy()
	}
}
//	Spawn new gameplay structures
instance_create_layer(0,0,"Instances",game)

ini_open(working_directory + "savedgame.ini")

//	whats the general game information
var node_count = ini_read_real("General","Node Count",0)

//	copy the item databases
var section = "Item Databases"
var database_encoded = ini_read_string(section,"Nodes DB",0)
if is_string(database_encoded) {
	var list = ds_list_create()
	ds_list_read(list,database_encoded)
	var database_copy = list[| 0]
	shop.item_node = database_copy
	ds_list_destroy(list)
}

//	load the nodes that are in the level
var section = "Nodes"
for(var i=0;i<node_count;i++) {
	var key_base = string(i) + "'s: "
	var xx = ini_read_real(section,key_base+"x",0)
	var yy = ini_read_real(section,key_base+"y",0)
	var index = ini_read_real(section,key_base+"item_index",0)
	var ports_string = ini_read_string(section,key_base+"ports",0)
	if is_string(ports_string) {
		var list = ds_list_create()
		list = ds_list_read(list,ports_string)
		var Ports = list[| 0]
		//	clear the ids in the port array
		for(var p=0;p<array_height_2d(Ports);p++) {
			Ports[p, port_object] = -1	
		}
		ds_list_destroy(list)
	} else {
		Ports = -1
	}
	
	var Name = shop.item_node[index, node_name]       
	var Node = item_create(node,0,0,0,Name,s_portrait_node,0)
	shop.item_node[index, node_object_index] = Node
	with Node {
		jobruns = shop.item_node[item_index, node_jobruns]
		jobruns_previous = jobruns
		if is_array(Ports) {
			Node.ports = Ports
			Node.ports_count = array_height_2d(Ports)
		} else {
				
		}
		item_move(xx,yy)
		ports_xyupdate_movement()
		item_check_sockets()
		item_place()
		with System system_dataflow_check()
	}
}
