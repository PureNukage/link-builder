var _kiosk = contracts.contract[smartcontract, contract_kiosk]
var contract_misfire = 0

for(var i=0;i<array_height_2d(_kiosk.data_needed);i++) {
	var _data = _kiosk.data_needed[i,0]
	var _data_string = shop.item_data[_data, item_name]
	
	if is_price(_data_string) {
		var needed_price_string = is_price(_data_string,true)	
	}
	
	if _kiosk.data_needed[i,2] > -1 {
		var _node = _kiosk.data_needed[i,2]
		
		//	the data was used
		//with data {
			//	Our needed data is a price
			if is_price(_data_string) {
				
				var got_at_least_one = 0
				for(var dd=0;dd<ds_list_size(_kiosk.data_held);dd++) {
					var _data_held = _kiosk.data_held[| dd]
					var _data_held_string = shop.item_data[_data_held, item_name]
					//	This data is the correct price that I need!
					if string_pos(needed_price_string,_data_held_string) != 0 {
						with data {
							if data_generated == _data_held {
								//	Check for data misfire
								var chance = irandom_range(1,100)
								//	This data misfired!
								if chance < shop.item_data[item_index, item_corruption] {
									//contract_misfire++
									used = true
									misfire = true
								} else {
									got_at_least_one++
									used = true
									misfire = false
								}
								
								shop.item_data[item_index, item_calls]++
				
								//	Check for data corruption increase
								data_corruption_check()
							}
						}
						
					}
					//	This data is NOT the correct price that I need
					else {
						
					}
				}
				
				if got_at_least_one > 0 {
						
				} else {
					contract_misfire++	
				}
			}
			
			else {
				with data {
					if data_generated == _data {
						//	Check for data misfire
						var chance = irandom_range(1,100)
						//	This data misfired!
						if chance < shop.item_data[item_index, item_corruption] {
							contract_misfire++
							used = true
							misfire = true
						} else {
							used = true
							misfire = false
						}
				
						shop.item_data[item_index, item_calls]++
				
						//	Check for data corruption increase
						data_corruption_check()
					}
				}
			}
		//}
		
		//	the node did a job
		_node.jobruns++
		_node.used = true
		
		//	this smart contract was run
		
		
	} else {
		debug_log("ERROR No node id set for this data being given!")
	}	
}

if contract_misfire > 0 debug_log("Contract "+contracts.contract[smartcontract, contract_name]+" misfired!")

_kiosk.used = true

contracts.contract[smartcontract, contract_uses]++

//	This smart contract misfired
if contract_misfire > 0 {
	contracts.contract[smartcontract, contract_misfires]++
	
	//	Calculate new reliability percentage
	var _misfires = contracts.contract[smartcontract, contract_misfires]
	var _successes = contracts.contract[smartcontract, contract_uses] - _misfires
	contracts.contract[smartcontract, contract_reliability] = (_successes / contracts.contract[smartcontract, contract_uses]) * 100
}
		
//	give the player the reward
if !contract_misfire {
	player.points += contracts.contract[smartcontract, contract_reward]
	var _points = contracts.contract[smartcontract, contract_reward]
	debug_log("CONTRACT USED Player to receive: "+string(_points)+" points")
} else var _points = 0

//	Refresh is_placeable in the selected unit if there is one
if input.selection > -1 and input.selection.states == states.placement {
	with input.selection placeable = is_placeable()	
}
		
//	I'm now on cooldown and can't use a contract again for a bit
cooldown = 80
		
//	Get me out of the contracts_traffic_live
contracts.contract[smartcontract, contract_traffic_live]--
		
//	I'm hopping out of line now
var index = ds_list_find_index(_kiosk.line,id)
ds_list_delete(_kiosk.line,index)
		
//	This kiosk isn't busy anymore
_kiosk.busy = false
		
//	Spawn a popup for the kiosk
var _color 
if !contract_misfire {
	_color = c_green	
} else {
	_color = c_red	
	pissed = true
}
create_popup(_kiosk.x,_kiosk.y-64,string(_points),_color,1,3)
		
//	Move everyone up in line
for(var i=0;i<ds_list_size(_kiosk.line);i++) {
	var _person = _kiosk.line[| i]
	var w_index = floor(_kiosk.topleft_cell_x+_kiosk.size_width/2)
	var h_index = _kiosk.bottomright_cell_y
	with _person {
		if w_index > -1 and w_index < grid_width and h_index > -1 and h_index < grid_height {
			var _xx = gridController.grid_positions_x[w_index]+(cell_width/2) - 64 - (i*64)
			var _yy = gridController.grid_positions_y[h_index]+cell_height
						
			//	Advance in line
			if point_distance(x,y,_xx,_yy) > 2 {
				if instance_exists(goal_current) and goal_current.object_index == goal instance_destroy(goal_current)
				goal_current = instance_create_layer(_xx,_yy,"Instances",goal)
				goal_current.goal_type = goal_type.waiting_in_line
				debug_log("Moving up in line")
				states = states.move
			}
		}
	}
}