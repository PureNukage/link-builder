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
var section = "General"
var node_count = ini_read_real(section,"Node Count",0)
var data_count = ini_read_real(section,"Data Count",0)
var contract_count = ini_read_real(section,"Contracts Count",0)

//	resources
var section = "Resources"
player.value = ini_read_real(section,"Value",0)
player.money = ini_read_real(section,"Money",0)
player.link = ini_read_real(section,"Link",0)
player.eth = ini_read_real(section,"Eth",0)

//	copy the item databases
var section = "Item Databases"
var database_encoded = ini_read_string(section,"Nodes DB",0)
if is_string(database_encoded) {
	var db_list = ds_list_create()
	ds_list_read(db_list,database_encoded)
	var n_database_copy = db_list[| 0]
	var d_database_copy = db_list[| 1]
	var c_database_copy = db_list[| 2]
	shop.item_node = n_database_copy
	shop.item_data = d_database_copy
	contracts.contract = c_database_copy
	ds_list_destroy(db_list)
}

//	load the nodes that are in the level
var section = "Nodes"
for(var i=0;i<node_count;i++) {
	var key_base = string(i) + "'s: "
	var xx = ini_read_real(section,key_base+"x",0)
	var yy = ini_read_real(section,key_base+"y",0)
	var index = ini_read_real(section,key_base+"item_index",0)
	var Rotation = ini_read_real(section,key_base+"rotation",0)
	var ports_string = ini_read_string(section,key_base+"ports",0)
	if is_string(ports_string) {
		var list = ds_list_create()
		ds_list_read(list,ports_string)
		var Ports = list[| 0]
		var Sockets = list[| 1]
		ds_list_destroy(list)
	} else {
		Ports = -1
		Sockets = -1
	}
	
	var Name = shop.item_node[index, node_name]       
	var Node = item_create(node,0,0,index,Name,s_portrait_node,0)
	shop.item_node[index, node_object_index] = Node
	with Node {
		rotation = Rotation
		jobruns = shop.item_node[item_index, node_jobruns]
		jobruns_previous = jobruns
		if is_array(Ports) {
			Node.ports = Ports
			Node.sockets = Sockets
			Node.ports_count = array_height_2d(Ports)
		} else {
				
		}
		item_move(xx, yy)
		ports_xyupdate_movement()
		item_check_sockets()
		item_place()
	}
}

var section = "Data"
for(var d=0;d<data_count;d++) {
	var key_base = string(d) + "'s: "
	var xx = ini_read_real(section,key_base+"x",0)
	var yy = ini_read_real(section,key_base+"y",0)
	var index = ini_read_real(section,key_base+"item_index",0)
	var Rotation = ini_read_real(section,key_base+"rotation",0)
	var ports_string = ini_read_string(section,key_base+"ports",0)
	if is_string(ports_string) {
		var list = ds_list_create()
		ds_list_read(list,ports_string)
		var Ports = list[| 0]
		var Sockets = list[| 1]
		ds_list_destroy(list)
	} else {
		Ports = -1
		Sockets = -1
	}
	
	var Name = shop.item_data[index, item_name]       
	var Portrait = shop.item_data[index, item_portrait]
	var Data = item_create(data,0,0,index,Name,Portrait,0)
	shop.item_data[index, item_object_index] = Data
	with Data {
		rotation = Rotation
		data_generated = shop.item_data[index, item_data_generated]
		if is_array(Ports) {
			ports = Ports
			sockets = Sockets
			ports_count = array_height_2d(Ports)
		} else {
				
		}
		item_move(xx, yy)
		ports_xyupdate_movement()
		item_check_sockets()
		item_place()
	}
	
}

var section = "Contracts"
for(var c=0;c<contract_count;c++) {
	var key_base = string(c) + "'s: "
	var xx = ini_read_real(section,key_base+"x",0)
	var yy = ini_read_real(section,key_base+"y",0)
	var Smartcontract = ini_read_real(section,key_base+"item_index",0)
	var Rotation = ini_read_real(section,key_base+"rotation",0)
	var ports_string = ini_read_string(section,key_base+"ports",0)
		if is_string(ports_string) {
		var list = ds_list_create()
		ds_list_read(list,ports_string)
		var Ports = list[| 0]
		var Sockets = list[| 1]
		ds_list_destroy(list)
	} else {
		Ports = -1
		Sockets = -1
	}
	
	var Name = contracts.contract[Smartcontract, contract_name]       
	var Portrait = contracts.contract[Smartcontract, contract_portrait]
	var Contract = item_create(kiosk,800,800,Smartcontract,Name,Portrait,0,Smartcontract)
	contracts.contract[Smartcontract, contract_kiosk] = Contract
	with Contract {
		rotation = Rotation
		data_needed = contracts.contract[Smartcontract, contract_data]
		if is_array(Ports) {
			Contract.ports = Ports
			Contract.sockets = Sockets
			Contract.ports_count = array_height_2d(Ports)
		} else {
				
		}
		item_move(xx, yy)
		ports_xyupdate_movement()
		item_check_sockets()
		item_place()
	}
	
	
}

