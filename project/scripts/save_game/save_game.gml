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
ini_write_real(section,"Saved Game",true)
ini_write_string(section,"Saved Game Time",date_datetime_string(date_current_datetime()))
ini_write_string(section,"Version",version)

//	level screenshot
if app.platform == "windows" { 
	surface_save(application_surface,"Saved Game Screenshot")
}

var section = "Resources"
ini_write_real(section,"Value",player.value)
ini_write_real(section,"Money",player.money)
ini_write_real(section,"Link",player.link)
ini_write_real(section,"Eth",player.eth)
ini_write_real(section,"Link Trade",shop.link_trade)
ini_write_real(section,"Eth Trade",shop.eth_trade)

var section = "Time"
ini_write_real(section,"Stream",time.stream)
ini_write_real(section,"Stream Seconds",time.stream_seconds)
ini_write_real(section,"Seconds",time.seconds)
ini_write_real(section,"Minutes",time.minutes)

var section = "Chaos"
ini_write_real(section,"Timer",chaosEvents.timer)
var String = ds_list_write(chaosEvents.affected_data)
ini_write_string(section,"Affected Data",String)

var section = "Bailouts"
ini_write_real(section,"Bailout1 Net",game.bailout1_amount_net)
ini_write_real(section,"Bailout2 Net",game.bailout2_amount_net)
ini_write_real(section,"Bailout2 Trigger",game.bailout2_amount_trigger)
ini_write_real(section,"Game Over Trigger",game.lose_game_trigger)

var section = "Camera"
ini_write_real(section,"x",camera.x)
ini_write_real(section,"y",camera.y)
ini_write_real(section,"zoom_level",camera.zoom_level)

var section = "Sound"
ini_write_real(section,"Music",soundSystem.current_volume)
ini_write_real(section,"Dialogue",soundSystem.current_dialogue_volume)

var section = "Heros"
var new_array = []
var hidden_array = []
var list = ds_list_create()
for(var h=0;h<array_height_2d(personController.heros);h++) {
	new_array[h] = personController.heros[h, hero_new]	
	hidden_array[h] = personController.heros[h, hero_hidden]
}
list[| 0] = new_array
list[| 1] = hidden_array
var list_packed = ds_list_write(list)
ini_write_string(section,"Array",list_packed)
ds_list_destroy(list)

var section = "New Contracts"
var array = []
var list = ds_list_create()
for(var c=0;c<array_height_2d(contracts.contract);c++) {
	array[c] = contracts.contract[c, contract_new]	
}
list[| 0] = array
var list_packed = ds_list_write(list)
ini_write_string(section,"Array",list_packed)
ds_list_destroy(list)

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
			
			//	new ports
			ini_write_real(section,key_base+"ports_count",ports_count)
			for(var p=0;p<ports_count;p++) {
				var add = "port ["+string(p)+"]'s "
				ini_write_real(section,key_base+add+"port_x",ports[p,port_x])
				ini_write_real(section,key_base+add+"port_y",ports[p,port_y])
				ini_write_real(section,key_base+add+"port_x_diff",ports[p,port_x_diff])
				ini_write_real(section,key_base+add+"port_y_diff",ports[p,port_y_diff])
				ini_write_real(section,key_base+add+"port_object",ports[p,port_object])
				ini_write_real(section,key_base+add+"port_direction",ports[p,port_direction])
				
				
			}
			
			
			
			ID++
		}
	}
}
//	No Datas in the room
else {
	
}

var ID = 0
var section = "Contracts"
var newstate = []

////	New State
for(var c=0;c<array_height_2d(contracts.contract);c++) {
	newstate[c] = contracts.contract[c, contract_virgin]
}	

var list = ds_list_create()
list[| 0] = newstate
var list_string = ds_list_write(list)
ini_write_string(section,"New State",list_string)
ds_list_destroy(list)


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