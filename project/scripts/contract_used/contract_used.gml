var _kiosk = contracts.contract[smartcontract, contract_kiosk]

for(var i=0;i<array_height_2d(_kiosk.data_needed);i++) {
	var _data = _kiosk.data_needed[i,0]
	
	if _kiosk.data_needed[i,2] > -1 {
		var _node = _kiosk.data_needed[i,2]
		
		//	the data was used
		with data {
			if data_generated == _data {
				shop.item_data[item_index, item_calls]++	
				
				//	Check for data corruption increase
			}
		}
		
		//	the node did a job
		_node.jobruns++
		
		//	this smart contract was run
		
		
	} else {
		debug_log("ERROR No node id set for this data being given!")
	}	
}
		
//	give the player the reward
player.points += contracts.contract[smartcontract, contract_reward]
var _points = contracts.contract[smartcontract, contract_reward]
debug_log("CONTRACT USED Player to receive: "+string(_points)+" points")

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
create_popup(_kiosk.x,_kiosk.y-64,string(_points),c_green,1,3)
		
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