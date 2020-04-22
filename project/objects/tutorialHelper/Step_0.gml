//	The first frame of this tutorial
if timer == -1 and stage == -1 {
			
	timer = time.stream

	//	Disable everything in the shop
	disable_shopitems()

	app.data_corruption = mode.off
	
	personController.heromenu_active = false
	
	stage = 0
	
	script_index = 0
			
}	
switch(tutorial)
{
	#region #1 Smart Contract Builder intro
		case tutorial.basics:
			switch(stage) 
			{
				//	Tutorial Start
				case 0:
					shop.resources_active = false
					shop.wire_active = false
					topmenu.data_active = false
					topmenu.nodes_active = false
					topmenu.contracts_active = false
					textboxController.draw_active = false
					
					var text = script[# tutorial, 0] script_index++	//	0 -> 1
					//var text = "Welcome to the Smart Contract Builder basics"
					create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_0)
		
					var text = script[# tutorial, 1] script_index++	//	1 -> 2
					//var text = "This tutorial is going to introduce you to the controls of the game"
					create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_1)
					
					var text = script[# tutorial, 2] script_index++	//	2 -> 3
					//var text = "Messages like this are stored in the Message menu"
					create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_2)
					
					var text = script[# tutorial, 3] script_index++	//	3 -> 4
					//var text = "Open the Message menu"
					create_textbox(text,-1,-1,24,-1,-1,snd_dialogue_0_3)
					stage++
				break
				//	Wait for the previous menu to close
				case 1:
					if textbox_in_history(24) {
						var xx = display_get_gui_width() - 100
						var yy = contracts.buttonY
						create_pointer(xx-128,yy+32,display_get_gui_width()-100,contracts.buttonY+32,true,49)
						textboxController.draw_active = true
						stage++	
					}
				break
				//	Wait for player to open the alarm menu
				case 2:
					if textboxController.messages_open {
						destroy_pointer(49)
						var text = script[# tutorial, script_index] script_index++	//	4 -> 5
						create_textbox(text,-1,-1,101,-1,-1,snd_dialogue_0_4)
						//create_textbox("",-1,-1,101)
						stage++
					}
				break
				//	Wait for player to press the previous message
				case 3:
					if textbox_in_history(101) {
						var text = script[# tutorial, script_index] script_index++	//	5 -> 6
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_5)
						var text = script[# tutorial, script_index] script_index++	//	6 -> 7
						create_textbox(text,-1,-1,6767,-1,-1,snd_dialogue_0_6)
						stage++
					}
				break
				//	Wait for the player to open the Shop
				case 4:
					if textbox_in_history(6767) {
						topmenu.data_active = true
						shop.item_data[0, item_available] = true
						stage++
					}
				
				break
				//	Wait for the player to select the data
				case 5:
					if instance_exists(data) and data.data_generated == data_types.binance_ETHUSD {
						var text = script[# tutorial, script_index] script_index++	//	7 -> 8
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_7)
						var text = script[# tutorial, script_index] script_index++	//	8 -> 9
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_8)
						conditions[0] = false
						conditions[1] = false
						stage++
					}
				break
				//	Wait for the player to rotate the data
				case 6:
					if input.rotate_left {
						conditions[0] = true
					}
					if input.rotate_right {
						conditions[1] = true	
					}
					if conditions[0] and conditions[1] {
						var text = script[# tutorial, script_index] script_index++	//	9 -> 10
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_9)
						stage++	
					}
				break
				//	Wait for the player to place the data
				case 7:
					if data.states == states.placed {
						var text = script[# tutorial, script_index] script_index++	//	10 -> 11
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_10)
						var text = script[# tutorial, script_index] script_index++	//	11 -> 12
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_11)
						//conditions[0] = false
						conditions[0] = data.center_cell_x
						conditions[1] = data.center_cell_y
						stage++
					} 
					
				break
				//	Wait for the player to replace the data
				case 8:
					if instance_number(data) == 1 and (conditions[0] != data.center_cell_x or conditions[1] != data.center_cell_y) {
						stage++
						
					}
				break
				//	Spawn a node near to the data the player placed
				case 9:
					var distance_between_items = 5
					var max_distance_between_items = 7
					var loop = true
					var _node = item_create(node,0,0,0,"TheHodge",s_portrait_node,0)
					while loop {
						var xx = irandom_range(4,grid_width-5)
						var yy = irandom_range(4,grid_height-5)
						with _node item_move(xx,yy)
						var distance = floor(point_distance(_node.center_cell_x,_node.center_cell_y,data.center_cell_x,data.center_cell_y))
						if _node.placeable and distance >= distance_between_items and distance <= max_distance_between_items {
							with _node item_place()
							loop = false
							var text = script[# tutorial, 4] //	good job	
							create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_4)
							var text = script[# tutorial, script_index] script_index++	//	12 -> 13
							create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_12)
							var text = script[# tutorial, script_index] script_index++	//	13 -> 14
							create_textbox(text,-1,-1,123,-1,-1,snd_dialogue_0_13)
							var text = script[# tutorial, script_index] script_index++	//	14 -> 15
							stage++
						}	
					}
				break
				//	Wait for player to click the final message then activate the Wire button for them
				case 10:
					if textbox_in_history(123) {
						shop.wire_active = true
						stage++
					}
				break
				//	Wait for the player to connect the Data to the Node
				case 11:
					for(var s=0;s<ds_list_size(systemController.systems);s++) {
						var System = systemController.systems[| s]
						var items_i_need = 0
						for(var p=0;p<ds_list_size(System.parts);p++) {
							var item = System.parts[| p]
							if item.object_index == node {
								items_i_need++	
							}
							if item.object_index == data {
								items_i_need++	
							}
						}
						if items_i_need == 2 {
							create_textbox("Good job!",-1,-1,-1,-1,-1,snd_dialogue_0_4)
							//var text = script[# tutorial, script_index] script_index++
							//create_textbox(text)
							var text = script[# tutorial, script_index] script_index++	//	15 -> 16
							create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_15)
							var text = script[# tutorial, script_index] script_index++	//	16 -> 17
							create_textbox(text,-1,-1,22,-1,-1,snd_dialogue_0_16)
							var text = script[# tutorial, script_index] //script_index++	//	17 -> 18
							
							var distance_between_items = 5
							var max_distance_between_items = 7
							var loop = true
							var Contract = item_create(kiosk,0,0,3,"ETH/USD Price Feed",s_portrait_pricefeed,0,3)
							while loop {
								var xx = irandom_range(4,grid_width-5)
								var yy = irandom_range(4,grid_height-5)	
								with Contract item_move(xx,yy)
								var distance = floor(point_distance(Contract.center_cell_x,Contract.center_cell_y,node.center_cell_x,node.center_cell_y))
								if Contract.placeable and distance >= distance_between_items and distance <= max_distance_between_items {
									with Contract item_place()
									loop = false
									stage++
								}
							}
						}
					}
				break
				//	Unlock the Contracts menu and point to it
				case 12:
					if textbox_in_history(22) {
						//contracts.button_active = true
						create_pointer(kiosk.x-192,kiosk.y,kiosk.x,kiosk.y,false,42)
						stage++
					}
				break
				//	Wait for player to open the Price Feed Contract
				case 13:
					if kiosk.selected {//and input.selection == kiosk {
						destroy_pointer(42)
						stage++
						//	Pointer aiming at the Contract
						//if instance_number(finger) == 0 create_pointer(contracts.menuX - 128,contracts.menuY+92,contracts.menuX,contracts.menuY,true,99)
						
					}
				
				break
				//	Wait for them to open the required data
				case 14:
					//if contracts.button_open and contracts.contract_open == 3 and contracts.data_open {
					//	destroy_pointer(38)
						var text = script[# tutorial, script_index] script_index++	//	19 -> 20
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_17)
						var text = script[# tutorial, script_index] script_index++	//	20 -> 21
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_18)
						var text = script[# tutorial, script_index] script_index++	//	21 -> 22
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_19)
						stage++
					//}
				break
				//	Wait for the Node to be connected and then start a timer
				case 15:
					for(var s=0;s<ds_list_size(systemController.systems);s++) {
						var System = systemController.systems[| s]
						var items_i_need = 0
						for(var p=0;p<ds_list_size(System.parts);p++) {
							var item = System.parts[| p]
							if item.object_index == node {
								items_i_need++	
							}
							if item.object_index == data {
								items_i_need++	
							}
							if item.object_index == kiosk {
								items_i_need++	
							}
						}
						if items_i_need == 3 {
							timer = time.stream + 240
							stage++
						}
					}
				break
				//	Wait four seconds
				case 16:
					if time.stream >= timer {
						var text = script[# tutorial, script_index] script_index++	//	22 -> 23
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_20)
						var text = script[# tutorial, script_index] script_index++	//	23 -> 24
						create_textbox(text,-1,-1,-1,-1,-1,snd_dialogue_0_21)
						var text = script[# tutorial, script_index] script_index++	//  24 -> 25
						create_textbox(text,-1,-1,6969,-1,-1,snd_dialogue_0_22)
						stage++
					}
				break
				//	Wait for the OK button to be hit and send them back to the main menu
				case 17:
					if textbox_in_history(6969) {
						ga_addProgressionEvent(GA_PROGRESSIONSTATUS_COMPLETE, "Main Menu")
						back_to_mainmenu()	
					}
				break
			}
		break
	#endregion
	
	#region #2 Building the first contract LinkPal
		case tutorial.my_first_contract:
			switch(stage)
			{
				//	Tutorial start
				case 0:
					topmenu.data_active = false
					shop.resources_active = false
					topmenu.nodes_active = false
					topmenu.contracts_active = false
					shop.wire_active = false
				
					create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_1_0) script_index++

					create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_1_1) script_index++
					
					var _kiosk = item_create(kiosk,0,0,1,"LinkPal",s_portrait_linkpal,0,1)
					with _kiosk {
						item_move(22,12)
						item_place()
					}
					stage++
				break	
				//	Information regarding Wires
				case 1:
					create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_1_2) script_index++
					create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_1_3) script_index++
					create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_1_4) script_index++
					create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_1_5) script_index++
					create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_1_6) script_index++
					create_textbox(script[# tutorial, script_index],-1,-1,11,-1,-1,snd_dialogue_1_7) script_index++
					stage++
					
				break
				//	Wait for them to open the last of the previous messages and then  
				case 2:
					if textbox_in_history(11) {
						timer = time.stream + 80
						topmenu.data_active = true
						shop.wire_active = true
						shop.item_node[0,node_available] = true
						shop.item_node[1,node_available] = true
						//shop.item_node[2,node_available] = false
						shop.item_data[0,item_available] = true
						shop.item_data[19,item_available] = true
						stage++
					}
					
				break
				//	Wait for timer then give them more information
				case 3:
					if time.stream >= timer {
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_1_8) script_index++
						topmenu.nodes_active = true
				
						create_textbox(script[# tutorial, script_index],s_tutorial_offchain,-1,-1,-1,-1,snd_dialogue_1_9) script_index++
						create_textbox(script[# tutorial, script_index],s_tutorial_onchain,-1,-1,-1,-1,snd_dialogue_1_10)	script_index++
						stage++
						timer = time.stream + 120
					}
				break
				//	Periodically check if they have data connected to the contract and if the contract is finished
				case 4:
					if time.stream >= timer {
						if instance_exists(data) with data {
							if connected == connected.incorrect_connected {
								create_textbox(script[# tutorial, 11],-1,-1,420,-1,-1,snd_dialogue_1_11)
								other.timer = time.stream + 300
							}
						}
						
						if kiosk.active {
							create_textbox(script[# tutorial, 12],-1,-1,-1,-1,-1,snd_dialogue_1_12) script_index = 13
							timer = time.stream + 480
							stage++
						}
					}
				break
				//	Wait 3 seconds then allow them to return to menu
				case 5:
					if time.stream >= timer {
						create_textbox(script[# tutorial, script_index],-1,-1,1234,-1,-1,snd_dialogue_1_13) script_index++
						stage++
					}
				break
				//	Return to main menu
				case 6:
					if textbox_in_history(1234) {
						ga_addProgressionEvent(GA_PROGRESSIONSTATUS_COMPLETE, "Main Menu")
						back_to_mainmenu()	
					}
				break
				
			}
		
		break
	#endregion
	
	#region #3 The Need For Decentralizing 
		case tutorial.decentralizing:
			switch(stage)
			{
				//	spawn all the parts needed for a working linkpal contract
				case 0:
					shop.resources_active = false
					//topmenu.data_active = false
					topmenu.nodes_active = false
					topmenu.contracts_active = false
					shop.wire_active = false
					
				
					var Node1 = item_create(node,0,0,0,"BryceMathsters",s_portrait_node,0)
					var Node2 = item_create(node,0,0,1,"Feetsy",s_portrait_node,0)
					var Paypal = item_create(data,0,0,19,"PayPal",s_portrait_paypal,0)
					var ethusd = item_create(data,0,0,6,"BraveNewCoin ETH/USD",s_portrait_ethereum,0)
					var Contract = item_create(kiosk,0,0,1,"LinkPal",s_portrait_linkpal,0,1)
					
					with Contract { 
						item_move(24, 10)
						ports_xyupdate_movement()
						item_check_sockets()
						item_place()
					}
					with Node1 {
						item_move(29, 10)
						ports_xyupdate_movement()
						item_check_sockets()
						item_place()
					}
					with Node2 {
						item_move(19 ,10)
						ports_xyupdate_movement()
						item_check_sockets()
						item_place()
					}
					with Paypal {
						item_move(33, 10)
						ports_xyupdate_movement()
						ports_xyupdate_rotation(1)
						item_check_sockets()
						ports_xyupdate_rotation(1)
						item_check_sockets()
						item_place()
					}
					with ethusd {
						item_move(15, 10)
						ports_xyupdate_movement()
						item_check_sockets()
						item_place()
					}	
					stage++
					timer = time.stream + 240
				
				break
				//	Wait 4 seconds then give the player information
				case 1:
					if time.stream >= timer {
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_0) script_index++
						
						create_textbox(script[# tutorial, script_index],-1,-1,55,-1,-1,snd_dialogue_2_1) script_index++
						
						stage++
					}
				break
				//	Wait for the player to close the last message then wait 1.5 seconds
				case 2:
					if textbox_in_history(55) {
						timer = time.stream + 90		
						stage++
					}
				break
				//	Wait for the timer then give the player more information
				case 3:
					if time.stream >= timer {
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_2) script_index++
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_3) script_index++
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_4) script_index++
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_5) script_index++
						create_textbox(script[# tutorial, script_index],-1,-1,1234,-1,-1,snd_dialogue_2_6) script_index++
						stage++
					}
				break
				//	If the player has clicked on the last message
				case 4:
					if textbox_in_history(1234) {
						timer = time.stream + 90
						stage++
					}
				break
				//	Wait for the timer to go then tell the player more information
				case 5:
					if time.stream >= timer {
						create_textbox(script[# tutorial, script_index],-1,-1,6969,-1,-1,snd_dialogue_2_7) script_index++
						stage++
					}
				break
				//	Wait for the player to click the textbox then set the timer
				case 6:
					if textbox_in_history(6969) {
						timer = time.stream + 90
						stage++
					}
				break
				//	Wait for the timer to go then give the data source a 100% chance of corruption
				case 7:
					var corruption_level = 100
					if time.stream >= timer {
						with data {
							if data_generated == data_types.bravenewcoin_ETHUSD {
								shop.item_data[item_index, item_corruption] = corruption_level	
								other.stage++
								other.timer = time.stream + 360
							}
						}
					}
				break
				//	Wait a few seconds and let the contract run
				case 8:
					if time.stream >= timer {
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_8) script_index++
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_9) script_index++
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_10) script_index++
						create_textbox(script[# tutorial, script_index],-1,-1,-1,-1,-1,snd_dialogue_2_11) script_index++
						create_textbox(script[# tutorial, script_index],-1,-1,777,-1,-1,snd_dialogue_2_12) script_index++ 
						stage++
						shop.item_data[0,item_available] = true
						shop.item_data[1,item_available] = true
						shop.item_data[6,item_available] = true
						shop.item_data[6, item_new] = false
						topmenu.data_active = true
						shop.wire_active = true
						with node {
							if name == "Feetsy" {
								port_add(center_cell_x-1,topleft_cell_y-1,id)
								port_add(center_cell_x+1,topleft_cell_y-1,id)
							}
						}
					}
				break
				//	Wait for the player to press the final textbox
				case 9:
					if textbox_in_history(777) {
						stage++
					}
				break
				//	Wait for them to connect the other 2 ETH/USD sources and then reset the Contracts reliability to 100
				case 10:
					var sources = 0
					with node {
						for(var d=0;d<ds_list_size(data_held);d++) {
							var Data = data_held[| d]
							var data_string = shop.item_data[Data, item_name]
							if is_price(data_string) {
								sources++	
							}
						}
					}
					if sources == 3 {
						create_textbox("Good job!",-1,-1,-1,-1,-1,snd_dialogue_0_4)
						contracts.contract[1, contract_reliability] = 100
						contracts.contract[1, contract_misfires] = 0
						var new_use_list = ds_list_create()
						new_use_list[| 0] = true
						ds_list_destroy(contracts.contract[1,contract_uses])
						contracts.contract[1,contract_uses] = new_use_list
						stage++
						timer = time.stream + 240
					}
					
				break
				//	Wait for 4 seconds then allow them to return to the main menu
				case 11:
					if time.stream >= timer {
						create_textbox(script[# tutorial, script_index],-1,-1,123456,-1,-1,snd_dialogue_1_13)
						stage++
					}
				break
				//	Wait to return to main menu
				case 12:
					if textbox_in_history(123456) {
						ga_addProgressionEvent(GA_PROGRESSIONSTATUS_COMPLETE, "Main Menu")
						back_to_mainmenu()	
					}
					
				break
				
				
				
			}
		break
	#endregion
	
	#region #4 Building a Decentralized Price Feed
	
	#endregion

}