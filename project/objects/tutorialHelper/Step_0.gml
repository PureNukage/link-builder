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
					
					create_textbox("Everything I've said can be found by clicking on the alarm icon")
					stage++
				break
				//	Active the shop menu and tell them about it
				case 1:
					
					
				break
			}
		break
	#endregion
	
	#region #2 Building the the first contract LinkPal
		case tutorial.my_first_contract:
			switch(stage)
			{
				//	Tutorial start
				case 0:
					shop.resources_active = false
				
					create_textbox("Welcome to Your first externally-aware contract")

					create_textbox("This tutorial is going to take you through building the LinkPal contract")

					create_textbox("To start, select the LinkPal contract from the Shop")
					stage++
				break	
				//	Make LinkPal available
				case 1:
					contracts.contract[1, contract_available] = true
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
					if instance_exists(textboxController) {
						for(var m=0;m<ds_list_size(textboxController.previous_messages);m++) {
							var messageID = textboxController.previous_messages[| m]
							var message_uniqueID = messageID.uniqueID
							if message_uniqueID == 1234 {
								back_to_mainmenu()
								exit
								stage++
							}
						}
					}
				
				break
			}
		
		break
	#endregion

}