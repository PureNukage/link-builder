ini_open(working_directory + "savedgame.ini")

//	save general game information
if instance_exists(node) var node_count = instance_number(node) 
else var node_count = 0
if instance_exists(data) var data_count = instance_number(data)
else var data_count = 0
if instance_exists(kiosk) var contract_count = instance_number(kiosk)
else var contract_count = 0
if instance_exists(wire) var wire_count = instance_number(wire)
else var wire_count = 0

var section = "General"
ini_write_real(section,"Node Count",node_count)
ini_write_real(section,"Data Count",data_count)
ini_write_real(section,"Contracts Count",contract_count)
ini_write_real(section,"Wire Count",wire_count)

var section = "Resources"
ini_write_real(section,"Value",player.value)
ini_write_real(section,"Money",player.money)
ini_write_real(section,"Link",player.link)
ini_write_real(section,"Eth",player.eth)

var section = "Item Databases"
//	save the node item database
var n_database_copy = shop.item_node
for(var n=0;n<array_height_2d(n_database_copy);n++) {
	n_database_copy[n, node_object_index] = -1
	n_database_copy[n, node_placed] = false
}
//	save the data item database
var d_database_copy = shop.item_data
for(var d=0;d<array_height_2d(d_database_copy);d++) {
	d_database_copy[d, item_object_index] = -1	
	d_database_copy[d, item_placed] = false
}
//	save the contract database
var c_database_copy = contracts.contract
for(var c=0;c<array_height_2d(c_database_copy);c++) {
	c_database_copy[c, contract_kiosk] = -1	
	c_database_copy[c, contract_traffic_live] = 0
}

var list = ds_list_create()
list[| 0] = n_database_copy
list[| 1] = d_database_copy
list[| 2] = c_database_copy
var string_encoded = ds_list_write(list)
ini_write_string(section,"Nodes DB",string_encoded)
ds_list_destroy(list)

////	save the items that are in the level
//var previous_index = -1
//var ID = 0
//with all {
//	if (object_index == node or object_index == kiosk or object_index == data) and states == states.placed {
//		//	Start of a new loop with a new index
//		if previous_index != object_index {
//			previous_index = object_index
//			var ID = 0
//		}
//		//	Looping through objects in the level and saving their information
//		else {
//			if object_index == node var section = "Nodes"
//			if object_index == kiosk var section = "Contracts"
//			if object_index == data var section = "Data"
//			var key_base = string(ID)+"'s: "
//			ini_write_real(section,key_base+"x",center_cell_x)
//			ini_write_real(section,key_base+"y",center_cell_y)
			
//			//	if node or db, use item index
//			if object_index == node or object_index == data 
//			ini_write_real(section,key_base+"item_index",item_index)
//			else if object_index == kiosk 
//			ini_write_real(section,key_base+"item_index",smartcontract)
			
//			//	convert ports array into a ds_list and then encode it into a string
//			var list = ds_list_create()
//			var Ports = ports
//			var Sockets = sockets
//			for(var p=0;p<ports_count;p++) {
//				Ports[p,port_object] = -1
//			}
//			list[| 0] = Ports
//			list[| 1] = Sockets
//			var string_encoded = ds_list_write(list)
//			ini_write_string(section,key_base+"ports",string_encoded)
//			ds_list_destroy(list)
			
//			ID++
			
//		}
//	}
//}

//	save the nodes that are in the level
var ID = 0
var section = "Nodes"
if instance_exists(node) {
	with node {
		if states == states.placed {
			var key_base = string(ID)+"'s: "
			ini_write_real(section,key_base+"x",center_cell_x)
			ini_write_real(section,key_base+"y",center_cell_y)
			ini_write_real(section,key_base+"item_index",item_index)
			ini_write_real(section,key_base+"rotation",rotation)
		
			//	convert ports array into a ds_list and then encode it into a string
			var list = ds_list_create()
			var Ports = ports
			var Sockets = sockets
			for(var p=0;p<ports_count;p++) {
				Ports[p,port_object] = -1
				Sockets[p] = -1
			}
			list[| 0] = Ports
			list[| 1] = Sockets
			var string_encoded = ds_list_write(list)
			ini_write_string(section,key_base+"ports",string_encoded)
			ds_list_destroy(list)
			ID++

		}
	}
}
//	No Nodes in the room
else {
	
}

var ID = 0
var section = "Data"
if instance_exists(data) {
	with data {
		if states == states.placed {
			var key_base = string(ID)+"'s: "	
			ini_write_real(section,key_base+"x",center_cell_x)
			ini_write_real(section,key_base+"y",center_cell_y)
			ini_write_real(section,key_base+"item_index",item_index)
			ini_write_real(section,key_base+"rotation",rotation)
			
			//	convert ports array into a ds_list and then encode it into a string
			var list = ds_list_create()
			var Ports = ports
			var Sockets = sockets
			for(var p=0;p<ports_count;p++) {
				Ports[p,port_object] = -1
				Sockets[p] = -1
			}
			list[| 0] = Ports
			list[| 1] = Sockets
			var string_encoded = ds_list_write(list)
			ini_write_string(section,key_base+"ports",string_encoded)
			ds_list_destroy(list)
			ID++
		}
	}
}
//	No Datas in the room
else {
	
}

var ID = 0
var section = "Contracts"
if instance_exists(kiosk) {
	with kiosk {
		if states == states.placed {
			var key_base = string(ID)+"'s: "	
			ini_write_real(section,key_base+"x",center_cell_x)
			ini_write_real(section,key_base+"y",center_cell_y)
			ini_write_real(section,key_base+"item_index",smartcontract)
			ini_write_real(section,key_base+"rotation",rotation)
		
			//	convert ports array into a ds_list and then encode it into a string
			var list = ds_list_create()
			var Ports = ports
			var Sockets = sockets
			for(var p=0;p<ports_count;p++) {
				Ports[p,port_object] = -1
				Sockets[p] = -1
			}
			list[| 0] = Ports
			list[| 1] = Sockets
			var string_encoded = ds_list_write(list)
			ini_write_string(section,key_base+"ports",string_encoded)
			ds_list_destroy(list)		
			ID++
			
			
		}
	}
}
//	No Contracts in the level
else {
	
}

//	Wires
var ID = 0 
var section = "Wires"
if instance_exists(wire) {
	with wire {
		if states == states.placed {
			var key_base = string(ID)+"'s: "
			ini_write_real(section,key_base+"x",center_cell_x)
			ini_write_real(section,key_base+"y",center_cell_y)
			ini_write_real(section,key_base+"rotation",rotation)
			ini_write_real(section,key_base+"straight",straight)
			ini_write_real(section,key_base+"color",color)
			
			//	converts port array into a ds_list and then encode it into a string
			var list = ds_list_create()
			var Ports = ports
			var Sockets = sockets
			for(var p=0;p<ports_count;p++) {
				//Ports[p,port_object] = -1
				//Sockets[p] = -1
			}
			list[| 0] = Ports
			list[| 1] = Sockets
			var string_encoded = ds_list_write(list)
			ini_write_string(section,key_base+"ports",string_encoded)
			ds_list_destroy(list)	
			
			
			ID++
		}
	}
}
//	No wires in the level
else {
		
}

//	People


ini_close()