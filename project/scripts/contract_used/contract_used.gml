var _kiosk = contracts.contract[smartcontract, contract_kiosk]
var Smartcontract = smartcontract
var contract_misfire = 0

for(var i=0;i<array_height_2d(_kiosk.data_needed);i++) {
	var _data = _kiosk.data_needed[i,0]
	var _data_string = shop.item_data[_data, item_name]
	
	if is_price(_data_string) {
		var needed_price_string = is_price(_data_string,true)	
	}
	
	if _kiosk.data_needed[i,2] > -1 {
		var _jobruns = 0
		var _node = _kiosk.data_needed[i,2]
		
		//	the data was used
		//	Our needed data is a price
		if is_price(_data_string) {
				
			//	This price feed is sufficiently decentralized!
			if _kiosk.data_needed[i,3] {
				
			} else {
				
				var got_at_least_one = 0
				var how_many_sources = 0
				for(var dd=0;dd<ds_list_size(_kiosk.data_held);dd++) {
					var _data_held = _kiosk.data_held[| dd]
					var _data_held_string = shop.item_data[_data_held, item_name]
					//	This data is the correct price that I need!
					if string_pos(needed_price_string,_data_held_string) != 0 {
						with data {
							if data_generated == _data_held {
								how_many_sources++
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
								if app.data_corruption == mode.on data_corruption_check()
								
								_jobruns++
							}
						}
						
					}
					//	This data is NOT the correct price that I need
					else {
						
					}
				}
				
				if ((got_at_least_one / how_many_sources)*100)-1 > 65 {
						
				} else {
					contract_misfire++	
				}
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
					
					_jobruns++
				
					shop.item_data[item_index, item_calls]++
				
					//	Check for data corruption increase
					if app.data_corruption == mode.on data_corruption_check()
				}
			}
		}
		
		//	If this is decentralized data
		if _kiosk.data_needed[i,3] {
			
		} else {	
			//	the node did a job
			shop.item_node[_node.item_index, node_jobruns] += _jobruns
			_node.jobruns += _jobruns
			_node.used = true
			with _node {
				if node_levelCheck() {
					//	Event leveled up
					var Node_name = name
					var Node_level = shop.item_node[item_index, node_level]
					var Portrait = s_event_node_levelup
					skillpoints++
					shop.item_node[item_index, node_skillpoints] = skillpoints
					if !textbox_in_queue(Node_level,event_types.levelup,id) {
						create_textbox(Node_name+" is now Level "+string(Node_level+1),Portrait,event_duration,Node_level,event_types.levelup,id)	
					}	
				}
			}
			resource_changed("ETH",1,_node.x,_node.y-128,false)
		}
		
		//	this smart contract was run
		
		
	} else {
		if _kiosk.data_needed[i,3] {
			//	First find which Price Feed is supporting is and then verify it is decentralized enough. if not, we misfire
			var ID = -1
			var supported_price_string = is_price(shop.item_data[_kiosk.data_needed[i,0], item_name], true)
			with kiosk {
				if (ds_list_find_index(contracts_supporting,_kiosk) != -1) {
					var pricefeed_price_string = is_price(shop.item_data[data_needed[0,0], item_name],true)
					if supported_price_string == pricefeed_price_string ID = id	
				}
			}
			if ID > -1 and !ID.decentralized {
				contract_misfire++				
			}
		
			//debug_log("ERROR No node id set for this data being given!")
		}
	}	
}

if contract_misfire > 0 debug_log("Contract "+contracts.contract[Smartcontract, contract_name]+" misfired!")

_kiosk.used = true

//contracts.contract[smartcontract, contract_uses]++

//	This smart contract misfired
if contract_misfire > 0 {
	contracts.contract[Smartcontract, contract_misfires]++
	ds_list_add(contracts.contract[Smartcontract, contract_uses],false)
	
	if !audio_is_playing(snd_angryuser_1) and !audio_is_playing(snd_angryuser_2)
	and !audio_is_playing(snd_angryuser_3) and !audio_is_playing(snd_angryuser_4) {
		var Sound = choose(snd_angryuser_1, snd_angryuser_2, snd_angryuser_3, snd_angryuser_4)
		playSoundEffect(Sound)
	}
	
	//	Calculate new reliability percentage
	//var _misfires = contracts.contract[Smartcontract, contract_misfires]
	//var _successes = contracts.contract[smartcontract, contract_uses] - _misfires
	//contracts.contract[smartcontract, contract_reliability] = (_successes / contracts.contract[smartcontract, contract_uses]) * 100
} else {
	ds_list_add(contracts.contract[Smartcontract, contract_uses],true)	
}

//	Calculate reliability based on the past 100 uses
var list = contracts.contract[Smartcontract, contract_uses]
var list_size = ds_list_size(list)
var succeses = 0
var misfires = 0
//	Only remember the past 100 uses
while ds_list_size(list) > 100 {
	ds_list_delete(list,0)
}
var list_size = ds_list_size(list)
for(var u=0;u<list_size;u++) {
	var Use = list[| u]
	//	This use was a success
	if Use {
		succeses++
	} 
	//	This was use a failure
	else {
		misfires++
	}	
}
contracts.contract[Smartcontract, contract_reliability] = (succeses / (misfires+succeses)) * 100

with _kiosk contract_conditionCheck()
		
//	give the player the reward
if !contract_misfire {
	var reward = contracts.contract[Smartcontract, contract_reward]
	if hero > -1 reward = reward * 2
	resource_changed("$$",-reward,_kiosk.x,_kiosk.y-64,false)
	resource_changed("ETH",contracts.contract[Smartcontract, contract_gasfee_base],_kiosk.x,_kiosk.y-128,false)
	//player.money += contracts.contract[smartcontract, contract_reward]
	var _points = contracts.contract[Smartcontract, contract_reward]
	debug_log("CONTRACT USED Player to receive: "+string(_points)+" points")
	if app.tutorial == -1 playSoundEffect(snd_contractpay)
} else {
	resource_changed("$$",contracts.contract[Smartcontract, contract_reward],_kiosk.x,_kiosk.y-64,false)
	resource_changed("ETH",contracts.contract[Smartcontract, contract_gasfee_base],_kiosk.x,_kiosk.y-128,false)
}

//	Refresh is_placeable in the selected unit if there is one
if input.selection > -1 and input.selection.states == states.placement {
	with input.selection placeable = is_placeable()	
}
		
//	I'm now on cooldown and can't use a contract again for a bit
cooldown = 80
		
//	Get me out of the contracts_traffic_live
contracts.contract[Smartcontract, contract_traffic_live]--
		
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