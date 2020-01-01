switch(states)
{
	#region Idle
		case states.idle:
			
			speed = 0
			
			if timer > 0 timer-- 
			
			if timer == 0 {
			
				//	I don't have a smart contract currently
				if smartcontract == -1 {
						if !ds_list_empty(smartcontracts) and cooldown == 0 {
							smartcontract = smartcontracts[| 0]
				
							debug_log("I want to use smartcontract "+string(contracts.contract[smartcontract, contract_name]))
				
							//	Create goal at the kiosk
							if instance_exists(kiosk) {
								with kiosk {
									//	this smartcontracts line isn't filled!
									if smartcontract == other.smartcontract and ds_list_size(line) < contracts.contract[smartcontract, contract_traffic] {
										var w_index = floor(topleft_cell_x+size_width/2)
										var h_index = bottomright_cell_y
										if w_index > -1 and w_index < grid_width and h_index > -1 and h_index < grid_height {
											var _xx = gridController.grid_positions_x[floor(topleft_cell_x+size_width/2)]+(cell_width/2)
											var _yy = gridController.grid_positions_y[bottomright_cell_y]+cell_height
											other.goal_current = instance_create_layer(_xx,_yy,"Instances",goal)
											other.goal_current.goal_type = goal_type.walking_to_kiosk
											other.states = states.move
											with other debug_log("I am starting a walk to the kiosk")
										}
									} 
									//	this smartcontracts line is filled! lets idlewalk
									else if smartcontract == other.smartcontract {
										with other debug_log("This line is filled. I am going to idlewalk")
										with other person_idlewalk()
									}
								}
							}
					} 
					//	I either don't want to use any smart contracts or I'm on cooldown, lets idlewalk
					else {
						debug_log("Either smartcontracts list is empty or I'm on cooldown")
						person_idlewalk()
					}
				} else {
					debug_log("ERROR I already have a smartcontract")
					person_idlewalk()
				}
			
			}
			
			
		break
	#endregion
	#region Walk
		case states.move:
		
			//If I have a goal
			if goal_current > -1 {
			
				if point_distance(x,y,goal_current.x,goal_current.y) > 2 {
					
					//	lets go into an idlewalk if the line is filled
					if smartcontract > -1 and goal_current.goal_type == goal_type.walking_to_kiosk and ds_list_size(contracts.contract[smartcontract, contract_kiosk].line) >= contracts.contract[smartcontract, contract_traffic] {
						if goal_current.object_index == goal {
							instance_destroy(goal_current)
						}
						goal_current = -1
						person_idlewalk()
						debug_log("This line is filled. I am going to idlewalk")
						exit
					}
				
					move_towards_point(goal_current.x,goal_current.y,movespeed)
				
				} 
				//	arrived at destination!
				else {
					
					//	switch of the status of the line
					switch(goal_current.goal_type)
					{
						#region Getting into line
						case goal_type.walking_to_kiosk:
							//	line is under 5, lets get into line!
							if smartcontract > -1 and ds_list_size(contracts.contract[smartcontract, contract_kiosk].line) < contracts.contract[smartcontract, contract_traffic] {
								
								//	hop into line
								ds_list_add(contracts.contract[smartcontract, contract_kiosk].line,id)
								
								//	delete our current goal
								if goal_current.object_index == goal {
									instance_destroy(goal_current)
								}
								
								//	create our goal where the next point in line is
								var _point_in_line = ds_list_size(contracts.contract[smartcontract, contract_kiosk].line)
								var _kiosk = contracts.contract[smartcontract, contract_kiosk]
								_point_in_line = _point_in_line * 64
								var w_index = floor(_kiosk.topleft_cell_x+_kiosk.size_width/2)
								var h_index = _kiosk.bottomright_cell_y
								if w_index > -1 and w_index < grid_width and h_index > -1 and h_index < grid_height {
									var _xx = gridController.grid_positions_x[w_index]+(cell_width/2) - 64 - _point_in_line
									var _yy = gridController.grid_positions_y[h_index]+cell_height
									goal_current = instance_create_layer(_xx,_yy,"Instances",goal)
									goal_current.goal_type = goal_type.waiting_in_line
									debug_log("Getting into line")
								}
								
							}
							//	line is filled, lets go to idlewalk
							 else {
								if goal_current.object_index == goal {
									instance_destroy(goal_current)
								}
								goal_current = -1
								person_idlewalk()
								debug_log("This line is filled. I am going to idlewalk")
							 }	
						break
						#endregion
						
						#region Idlewalk
						case goal_type.idlewalk:
						
							if goal_current.object_index == goal {
								instance_destroy(goal_current)
							}
							goal_current = -1
							states = states.idle
						
						break
						#endregion
						
						#region Waiting in Line
							case goal_type.waiting_in_line:
								
								states = states.wait_in_line
								
								if goal_current.object_index == goal {
									instance_destroy(goal_current)
								}
								goal_current = -1
								speed = 0
								
							break
						#endregion
						
						#region Using Smartcontract
							case goal_type.using_smartcontract:
								
								if goal_current.object_index == goal {
									instance_destroy(goal_current)
								}
								goal_current = -1
								timer = time.seconds + contracts.contract[smartcontract, contract_channel]
								if timer >= 60 timer -= 60
								debug_log("[DEBUG] timer set to: "+string(timer))
								states = states.using_smartcontract		
								speed = 0
													
							break
						#endregion
						
					}
				}
			
			
			}
			
			
		break
	#endregion
	#region Waiting in Line
		case states.wait_in_line:
			
			var _kiosk = contracts.contract[smartcontract, contract_kiosk]
			var pos = ds_list_find_index(_kiosk.line,id) 
			
			//	I am first in line! 
			if pos == 0 {
				//	Kiosk is free, lets use it!
				if !_kiosk.busy {
					
					var w_index = floor(_kiosk.topleft_cell_x+_kiosk.size_width/2)
					var h_index = _kiosk.bottomright_cell_y
					if w_index > -1 and w_index < grid_width and h_index > -1 and h_index < grid_height {
						var _xx = gridController.grid_positions_x[w_index]+(cell_width/2)
						var _yy = gridController.grid_positions_y[h_index]+cell_height
						goal_current = instance_create_layer(_xx,_yy,"Instances",goal)
						goal_current.goal_type = goal_type.using_smartcontract
						debug_log("I am moving to use smartcontract "+contracts.contract[smartcontract, contract_name])
						states = states.move
						_kiosk.busy = true
					}
					
				}
			} 
			
		break
	#endregion
	#region Using smartcontract
		case states.using_smartcontract:
			
			//	finished using smart contract
			if time.seconds >= timer {
				
				contract_used()
				
				ds_list_delete(smartcontracts,0)
				smartcontract = -1
				
				//	walk out of line
				person_idlewalk()
				
				timer = 0
				
			}
			
			
		break
	#endregion
}

//	Constants
if cooldown > 0 cooldown--

depth = -y