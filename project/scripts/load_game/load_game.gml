if !app.game_loading {
	//	Clear the current level
	with all {
		if object_index != app and object_index != soundSystem and object_index != camera and object_index != obj_gmlive {
			instance_destroy()
		}
	}
	//	Spawn new gameplay structures
	//instance_create_layer(0,0,"Instances",game)
	app.game_loading = true
}

else {
	//	Spawn new gameplay structures
	instance_create_layer(0,0,"Instances",game)
	app.game_loading = false

	ini_open(working_directory + "savedgame.ini")

	//	whats the general game information
	var section = "General"
	var node_count = ini_read_real(section,"Node Count",0)
	var data_count = ini_read_real(section,"Data Count",0)
	var contract_count = ini_read_real(section,"Contracts Count",0)
	var wire_count = ini_read_real(section,"Wire Count",0)

	//	resources
	var section = "Resources"
	player.value = ini_read_real(section,"Value",0)
	player.money = ini_read_real(section,"Money",0)
	player.link = ini_read_real(section,"Link",0)
	player.eth = ini_read_real(section,"Eth",0)
	shop.link_trade = ini_read_real(section,"Link Trade",1)
	shop.eth_trade = ini_read_real(section,"Eth Trade",1)
	
	//	time
	var section = "Time"
	time.stream = ini_read_real(section,"Stream",0)
	time.stream_seconds = ini_read_real(section,"Stream Seconds",0)
	time.seconds = ini_read_real(section,"Seconds",0)
	time.minutes = ini_read_real(section,"Minutes",0)
	
	//	chaos
	var section = "Chaos"
	chaosEvents.timer = ini_read_real(section,"Timer",time.minutes+1)
	var String = ini_read_string(section,"Affected Data",0)
	if is_string(String) {
		var new_list = ds_list_create()
		ds_list_read(new_list,String)
		ds_list_clear(chaosEvents.affected_data)
		ds_list_copy(chaosEvents.affected_data,new_list)
		ds_list_destroy(new_list)
	}
	
	//	bailout
	var section = "Bailouts"
	game.bailout1_amount_net = ini_read_real(section,"Bailout1 Net",-1)
	game.bailout2_amount_net = ini_read_real(section,"Bailout2 Net",-1)
	game.bailout2_amount_trigger = ini_read_real(section,"Bailout2 Trigger",0)
	game.lose_game_trigger = ini_read_real(section,"Game Over Trigger",-1)

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
		//contracts.contract = c_database_copy
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
		var Skillpoints = shop.item_node[index, node_skillpoints]
		var Skills = shop.item_node[index, node_skills]
		var max_ports = 2
		for(var s=0;s<array_height_2d(Skills);s++) {
			if Skills[s,skill_type] == skills.two_more_ports and Skills[s,skill_acquired] {
				max_ports += 2	
			}
		}
		shop.item_node[index, node_object_index] = Node
		with Node {
			item_index = index
			rotation = Rotation
			jobruns = shop.item_node[item_index, node_jobruns]
			jobruns_previous = jobruns
			skillpoints = Skillpoints
			ports_count_max = max_ports
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
			item_index = index
			rotation = Rotation
			if is_array(Ports) {

			} else {
				
			}
			ports_count = ini_read_real(section,key_base+"ports_count",1)
			for(var p=0;p<ports_count;p++) {
				var add = "port ["+string(p)+"]'s "	
				ports[p,port_x] = ini_read_real(section,key_base+add+"port_x",0)
				ports[p,port_y] = ini_read_real(section,key_base+add+"port_y",0)
				ports[p,port_x_diff] = ini_read_real(section,key_base+add+"port_x_diff",0)
				ports[p,port_y_diff] = ini_read_real(section,key_base+add+"port_y_diff",0)
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
		var Contract = item_create(kiosk,0,0,Smartcontract,Name,Portrait,0,Smartcontract)
		//contracts.contract[Smartcontract, contract_kiosk] = Contract
		with Contract {
			rotation = Rotation
			data_needed = contracts.contract[Smartcontract, contract_data]
			if is_array(Ports) {
				Contract.ports = Ports
				Contract.sockets = Sockets
				Contract.ports_count = array_height_2d(Ports)
			}
			item_move(xx,yy)
			ports_xyupdate_movement()
			item_check_sockets()
			item_place()
		}
	}

	//	Wires
	var section = "Wires"
	for(var W=0;W<wire_count;W++) {
		var key_base = string(W) + "'s: "
		var xx = ini_read_real(section,key_base+"x",0)
		var yy = ini_read_real(section,key_base+"y",0)
		var Rotation = ini_read_real(section,key_base+"rotation",0)
		var Straight = ini_read_real(section,key_base+"straight",0)
		var Color = ini_read_real(section,key_base+"color",c_sergey_blue)
		var ports_string = ini_read_string(section,key_base+"ports",0)
		if xx == 25 and yy == 11 {
			var DE = true	
		}
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
	
		var Wire = item_create(wire,800,800,-1,"Wire",s_portrait_wire,0)
		with Wire {
			rotation = Rotation
			straight = Straight
			color = Color
			var Sprites = []
			Sprites[1] = s_wire
			Sprites[0] = s_wire_corner
			sprite = Sprites[straight]
			if is_array(Ports) {
				ports = Ports
				sockets = Sockets
				ports_count = array_height_2d(Ports)
			} else {
			
			}
			item_move(xx,yy)
			cell_x1 = xx
			cell_y1 = yy
			//if port1 > -1 ds_list_clear(port1)
			port1 = ports_check(cell_x1,cell_y1)
			#region Wire Placement
				var _wire = id
				states = states.placed
				var _x = gridController.grid_positions_x[xx]+(cell_width/2)
				var _y = gridController.grid_positions_y[yy]+(cell_height/2)
				mp_grid_add_instances(gridController.mp_grid,id,false)
				//	Add ports
				for(var _p=0;_p<_wire.ports_count;_p++) {
					var _grid = gridController.grid_port_objects
					var _grid_x = gridController.grid_port_x
					var _grid_y = gridController.grid_port_y
					ds_list_add(_grid,_wire)
					ds_list_add(_grid_x,_wire.ports[_p,port_x])
					ds_list_add(_grid_y,_wire.ports[_p,port_y])
					gridController.grid_items[# ports[_p,port_x], ports[_p,port_y]] = -2
				}
				ds_grid_set_grid_region(gridController.grid_items,my_cells_items,0,0,size_width,size_height,topleft_cell_x,topleft_cell_y)
				item_placeid()
			
				for(var p=0;p<ports_count;p++) {
					//	This port is connected to something already
					if ports[p,port_object] > -1 {
						//	Find the object at this ports x,y
						var X = ports[p,port_x]
						var Y = ports[p,port_y]
						var connecting_object = gridController.grid_objects[# X, Y]
						if connecting_object > -1 {
							ports[p,port_object] = connecting_object
							//	Connect us to this objects port
							for(var pp=0;pp<connecting_object.ports_count;pp++) {
								if connecting_object.ports[pp,port_x] == center_cell_x and connecting_object.ports[pp,port_y] == center_cell_y { 
									connecting_object.ports[pp,port_object] = id
									connecting_object.sockets[pp] = id
								}
							}
						} 
						//	no object in this cell
						else {
							ports[p,port_object] = -1
							sockets[p] = -1
						}
					}
				}
						
				//	add sockets
				for(var _p=0;_p<_wire.ports_count;_p++) {
					if _wire.ports[_p,port_object] == -1 {
						_wire.sockets[_p] = -1
					} else {
						_wire.sockets[_p] = _wire.ports[_p,port_object]	
						//	set this items sockets too
						var _item = _wire.sockets[_p]
						for(var pp=0;pp<_item.ports_count;pp++) {
							//	this socket is connected to now
							if _item.sockets[pp] == -1 and _item.ports[pp,port_object] > -1 {
								_item.sockets[pp] = _item.ports[pp,port_object]	
							}
						}
					}
				}
							
				with _wire {
					system_set()	
				}
			#endregion
		}
	}

	ini_close()
}