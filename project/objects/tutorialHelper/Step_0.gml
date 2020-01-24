//	The first frame of this tutorial
if timer == -1 and stage == -1 {
			
	timer = time.stream

	//	Disable everything in the shop
	disable_shopitems()

	app.data_corruption = mode.off
	
	stage = 0
			
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
					shop.button_active = false
					contracts.button_active = false
					
					create_textbox("Welcome to the Smart Contract Builder basics")
		
					create_textbox("This tutorial is going to introduce you to the basics of the game")
					
					create_textbox("Messages such as this are stored in the Message menu")
					
					create_textbox("Open the Message menu",-1,-1,24)
					stage++
				break
				//	Wait for the previous menu to close
				case 1:
					if textbox_in_history(24) {
						var xx = contracts.buttonX - (contracts.button_width + 16)
						var yy = contracts.buttonY
						create_pointer(xx-128,yy+32,contracts.buttonX,contracts.buttonY+32,true,32)
						stage++	
					}
				break
				//	Wait for player to open the alarm menu
				case 2:
					if textboxController.messages_open {
						destroy_pointer(32)
						create_textbox("Good job!")
						create_textbox("Open the Shop menu to advance",-1,-1,101)
						stage++
					}
				break
				//	Wait for player to press the previous message
				case 3:
					if textbox_in_history(101) {
						shop.button_active = true
						create_pointer(shop.buttonX+shop.button_width+128,shop.buttonY+32,shop.buttonX,shop.buttonY+32,true,66)
						stage++
					}
				break
				//	Wait for the player to open the Shop
				case 4:
					if shop.menu_open {
						destroy_pointer(66)
						create_textbox("The Shop sells Nodes, Data and Contracts. All the things needed to build decentralized apps")
						create_textbox("Select the Binance ETH/USD data source from the Shop menu")
						shop.item_data[0, item_available] = true
						stage++
					}
				
				break
				//	Wait for the player to select the data
				case 5:
					if instance_exists(data) and data.data_generated == data_types.binance_ETHUSD {
						create_textbox("Good job! Items in placement can be rotated by pressing Q or E")
						create_textbox("Rotate the data now")
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
						create_textbox("Good job! Place the data source somewhere into the level")
						stage++	
					}
				break
				//	Wait for the player to place the data
				case 7:
					if data.states == states.placed {
						create_textbox("Good job! Items can be re-placed by selecting it and pressing R")
						create_textbox("Go ahead and re-place the Data into a different cell")
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
							create_textbox("Good job!")
							create_textbox("Wires are used to connect items to form systems")
							create_textbox("Press the Wire button to place down a wire and then connect the Data to the Node that was just placed",-1,-1,123)
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
							create_textbox("Good job!")
							create_textbox("A Price Feed Contract has been placed into the level")
							create_textbox("After Contracts are purchased, they will appear in the Contracts menu")
							create_textbox("To build it we will need to know the Data sources it needs connected")
							create_textbox("Open the Contracts Menu and then open the Price Feed Contract to view this",-1,-1,22)
							
							var distance_between_items = 5
							var max_distance_between_items = 7
							var loop = true
							var Contract = item_create(kiosk,0,0,3,"Price Feed",s_portrait_ethereum,0,3)
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
						contracts.button_active = true
						create_pointer(contracts.buttonX+contracts.button_width/2,contracts.buttonY+192,contracts.buttonX+contracts.button_width/2,contracts.buttonY,true,42)
						stage++
					}
				break
				//	Wait for player to open the Price Feed Contract
				case 13:
					if contracts.button_open {
						destroy_pointer(42)
						//	Pointer aiming at the Contract
						if instance_number(finger) == 0 create_pointer(contracts.menuX - 128,contracts.menuY+92,contracts.menuX,contracts.menuY,true,99)
						
					}
					if contracts.button_open and contracts.contract_open == 3 {
						destroy_pointer(99)
						create_pointer(contracts.menuX-128,430,contracts.menuX,430,true,38)
						stage++
					}
				
				break
				//	Wait for them to open the required data
				case 14:
					if contracts.button_open and contracts.contract_open == 3 and contracts.data_open {
						destroy_pointer(38)
						create_textbox("Good job! We can see that this Contract requires an ETH/USD Price Feed")
						create_textbox("Luckily for us we have a Node connected to Binance's ETH/USD API")
						create_textbox("Lets go ahead and connect the Node to the Price Feed Contract now")
						stage++
					}
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
						create_textbox("Good job! This Contract is now online")
						create_textbox("This completes the Smart Contract Builder basics tutorial")
						create_textbox("Press OK to return to the Tutorial menu",-1,-1,6969)
						stage++
					}
				break
				//	Wait for the OK button to be hit and send them back to the main menu
				case 17:
					if textbox_in_history(6969) {
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
					shop.resources_active = false
				
					create_textbox("Welcome to The Oracle Problem, or Your First dApp")

					create_textbox("This tutorial is going to take you through building the LinkPal contract")
					
					var _kiosk = item_create(kiosk,0,0,3,"LinkPal",s_portrait_linkpal,0,1)
					with _kiosk {
						item_move(22,12)
						item_place()
					}
					stage++
				break	
				//	Information regarding Wires
				case 1:
					create_textbox("dApps or Decentralized Applications consist of one or more Smart Contracts")
					create_textbox("A Smart Contract is code that lives and executes on a blockchain")
					create_textbox("The apps that we know utilize data in systems. dApps are no different however there exists a problem")
					create_textbox("Smart Contracts cannot access the systems that code for regular apps can. This is known as The Oracle Problem")
					create_textbox("To solve this problem and create Smart Contracts that provide tremendous value we must utilize blockchain middleware")
					create_textbox("In Smart Contract Builder this is known as a Node",-1,-1,11)
					stage++
					
				break
				//	Wait for them to open the last of the previous messages and then  
				case 2:
					if textbox_in_history(11) {
						timer = time.stream + 80
						shop.item_node[0,node_available] = true
						shop.item_node[1,node_available] = true
						shop.item_data[0,item_available] = true
						shop.item_data[3,item_available] = true
						stage++
					}
					
				break
				//	Wait for timer then give them more information
				case 3:
					if time.stream >= timer {
						create_textbox("To get the LinkPal Contract online you will have to use 2 Nodes")
				
						create_textbox("Reminder, white Wires represent Off-Chain Data while...",s_tutorial_offchain)
						create_textbox("...blue Wires represent On-Chain Data",s_tutorial_onchain)	
						stage++
						timer = time.stream + 120
					}
				break
				//	Periodically check if they have data connected to the contract and if the contract is finished
				case 4:
					if time.stream >= timer {
						if instance_exists(data) with data {
							if connected == connected.incorrect_connected {
								create_textbox("Remember! Data has to pass through a Node first",-1,-1,420)
								other.timer = time.stream + 300
							}
						}
						
						if kiosk.active {
							create_textbox("Good job! You have built your first dApp")
							timer = time.stream + 480
							stage++
						}
					}
				break
				//	Wait 3 seconds then allow them to return to menu
				case 5:
					if time.stream >= timer {
						create_textbox("Press OK to return to the Main Menu",-1,-1,1234)
						stage++
					}
				break
				//	Return to main menu
				case 6:
					if textbox_in_history(1234) {
						back_to_mainmenu()	
					}
				break
				
			}
		
		break
	#endregion

}