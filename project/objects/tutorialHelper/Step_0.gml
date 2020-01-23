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
					
					var _kiosk = item_create(kiosk,0,0,3,"LinkPal",s_portrait_linkpal,0,3)
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
					create_textbox("Also known as a Node")
					create_textbox("To get the LinkPal Contract online you will have to use 2 Nodes")
				
					create_textbox("White Wires represent Off-Chain Data",s_tutorial_offchain)
					create_textbox("Blue Wires represent On-Chain Data",s_tutorial_onchain)
					stage++
					
				break
				//	Wait for LinkPal to be placed 
				case 2:
					if instance_exists(kiosk) and kiosk.states == states.placed and kiosk.smartcontract == 1 {
						create_textbox("Good job!")
						create_textbox("A Smart Contract is code that lives and executes on a blockchain. LinkPal is written for the Ethereum blockchain specifically.")
						//create_textbox("Smart Contracts that don't require data outside of its network are ")
						create_textbox("LinkPal requires off-chain data to function. Open the LinkPal contract info to find which types")
						stage++
					}
				break
				//	Wait for the LinkPal contract data info to be opened
				case 3:
					if contracts.data_open {
						create_textbox("Since LinkPal executes a trade of Ether it will need access to the price of ETH")
						create_textbox("Place down the CryptoCompare ETH/USD Data Source")
						shop.item_data[1, item_available] = true
						stage++
					}
				break
				//	Wait for the CryptoCompare data source to be placed 
				case 4:
					if instance_exists(data) and data.data_generated == data_types.cryptocompare_ETHUSD and data.states == states.placed {
						create_textbox("Use Wires to connect different items and build systems")	
						stage++
					}
				break
				//	Wait for the Data to be connected to the Kiosk
				case 5:
					for(var i=0;i<ds_list_size(systemController.systems);i++) {
						var _system = systemController.systems[| i]
						var data_found = false
						var contract_found = false
						for(var p=0;p<ds_list_size(_system.parts);p++) {
							var _item = _system.parts[| p]
							if _item.object_index == data and _item.data_generated == data_types.cryptocompare_ETHUSD {
								data_found = true	
							}
							if _item.object_index == kiosk and _item.smartcontract = 1 {
								contract_found = true	
							}
						}
					}
					if data_found and contract_found {
						create_textbox("Blockchains cannot access data and events outside of their network. This is the known as The Oracle Problem")
						create_textbox("To solve this problem we are going to use a piece of blockchain middleware, or a 'Node'")
						create_textbox("Placed down a Node from the Shop")
						with data item_delete()
						if instance_exists(wire) with wire item_delete()
						shop.item_node[0, node_available] = true
						stage++
					}
				break
				//	Wait for them to place down a node
				case 6:
					if instance_exists(node) and node.states == states.placed {
						//	Is it connected to the contract?
						for(var s=0;s<ds_list_size(systemController.systems);s++) {
							var node_needed = false
							var contract_needed = false
							var _system = systemController.systems[| s]
							for(var p=0;p<ds_list_size(_system.parts);p++) {
								var _item = _system.parts[| p]
								if _item.object_index == node {
									node_needed = true
								}
								if _item.object_index == kiosk and kiosk.smartcontract == 1 {
									contract_needed = true
								}
							
							}
							if node_needed and contract_needed {
								create_textbox("Good job!")
								create_textbox("Now lets place down the ETH/USD data source again except this time lets connect it to the node")
								stage++
							}
						}
					}	
				break
				//	Wait for the data to get hooked up
				case 7:
					if contracts.contract[1, contract_kiosk].data_needed[0,1] {
						create_textbox("Good work. The ETH/USD data in the Contract window has turned green indicating that data source has been connected")
						create_textbox("Since LinkPal enables trades of Ether to USD using an Ether transfer and a PayPal invoice, it requires connection to PayPal to see the status of the invoice")
						create_textbox("Place down a second node then connect the PayPal data source to the node")
						shop.item_node[1, node_available] = true
						shop.item_data[3, item_available] = true
						stage++	
					}
			
				break
				//	Wait for the paypal to get hooked up
				case 8:
					if contracts.contract[1, contract_kiosk].active {
						create_textbox("Congratulations, you've built your first decentralized application, or dApp")
						create_textbox("Press OK to go back to the Main Menu",-1,-1,1234)
						stage++
					}
				break
				//	Wait for the player to head back to the main menu
				case 9:
					if textbox_in_history(1234) {
						back_to_mainmenu()
						stage++
					}			
				break
			}
		
		break
	#endregion

}