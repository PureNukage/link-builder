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
	
	#region #3 The Need For Decentralizing 
		case tutorial.decentralizing:
			switch(stage)
			{
				//	spawn all the parts needed for a working linkpal contract
				case 0:
					shop.resources_active = false
				
					var Node1 = item_create(node,0,0,0,"BryceMathsters",s_portrait_node,0)
					var Node2 = item_create(node,0,0,1,"Feetsy",s_portrait_node,0)
					var Paypal = item_create(data,0,0,3,"PayPal",s_portrait_paypal,0)
					var ethusd = item_create(data,0,0,2,"BraveNewCoin ETH/USD",s_portrait_ethereum,0)
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
						create_textbox("Welcome to The Need to Decentralize")
						
						create_textbox("This tutorial will explain Data misfires and what happens if a Contract uses bad data",-1,-1,55)
						
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
						create_textbox("Jane has $100 in PayPal and wants to buy $100 worth of ETH. Meanwhile Bob has ETH and is willing to trade with her")
						create_textbox("Money in PayPal is not a cryptocurrency and on a blockchain therefore it cannot natively be traded for ETH")
						create_textbox("To solve this, LinkPal requires that Bob opens an invoice on PayPal for $100 while also having $100 of ETH")
						create_textbox("When Jane sees that Bob has $100 of ETH, Jane will pay $100 to the Invoice, the Node will see and release the $100 ETH to Jane")
						create_textbox("This means it is very important that the LinkPal Contract is able to know the price of ETH. If the wrong price of ETH was used Jane could end up receiving more or less than $100. That's not good!",-1,-1,1234)
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
						create_textbox("The ETH/USD Data source is going to get a 100% corruption level meaning when it is called by a Contract it has a 100% chance of giving bad data",-1,-1,6969)
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
						create_textbox("People don't like it when technology doesn't work, especially when it comes to their money")
						create_textbox("To make sure the Contract gets a reliable price of ETH we can use Decentralization")
						create_textbox("This means placing down multiple sources of ETH/USD data to call and average them out")
						create_textbox("You've been given 3 sources of ETH/USD to place")
						create_textbox("You need at least 2/3 of the data to not Misfire for a successful Contract use",-1,-1,777)
						stage++
						shop.item_data[0,item_available] = true
						shop.item_data[1,item_available] = true
						shop.item_data[2,item_available] = true
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
						create_textbox("Good job!")
						contracts.contract[1, contract_reliability] = 100
						contracts.contract[1, contract_misfires] = 0
						stage++
						timer = time.stream + 240
					}
					
				break
				//	Wait for 4 seconds then allow them to return to the main menu
				case 11:
					if time.stream >= timer {
						create_textbox("Press OK to return to the Main Menu",-1,-1,123456)
						stage++
					}
				break
				//	Wait to return to main menu
				case 12:
					if textbox_in_history(123456) {
						back_to_mainmenu()	
					}
					
				break
				
				
				
			}
		break
	#endregion
	
	#region #4 Building a Decentralized Price Feed
	
	#endregion

}