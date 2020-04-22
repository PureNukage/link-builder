tutorial = -1

timer = -1

stage = -1

conditions = []

//script = ds_grid_create(4,1)

if os_browser != browser_not_a_browser {
	script = ds_grid_create(50,50)
	var tut = 0
	var index = 0
	script[# tut, index] = "Welcome to the Smart Contract Builder basics" index++
	script[# tut, index] = "This tutorial is going to introduce you to the controls of the game" index++
	script[# tut, index] = "Messages like this are stored in the Message menu" index++
	script[# tut, index] = "Open the Message menu" index++
	script[# tut, index] = "Good job!" index++
	script[# tut, index] = "To build Decentralized Applications, 3 things will be needed: Data, Oracles and Contracts" index++
	script[# tut, index] = "Select the Binance ETH/USD data source from the Data menu" index++
	script[# tut, index] = "Good job! Items in placement can be rotated by pressing Q or E" index++
	script[# tut, index] = "Rotate the data now" index++
	script[# tut, index] = "Good job! Place the data source somewhere into the level" index++
	script[# tut, index] = "Good job! Items can be re-placed by selecting it and pressing R" index++
	script[# tut, index] = "Go ahead and re-place the Data into a different cell" index++
	script[# tut, index] = "Wires are used to connect items to form systems" index++
	script[# tut, index] = "An Oracle has been placed. Press the Wire button to place down a wire and then connect the Data to the Oracle" index++
	script[# tut, index] = "A Price Feed Contract has been placed into the level" index++
	script[# tut, index] = "To build the Contract we will need to know the Data sources it requires" index++
	script[# tut, index] = "Select the Contract and then view the Data Required" index++
	script[# tut, index] = "Good job! We can see that this Contract requires an ETH/USD Data source" index++
	script[# tut, index] = "Luckily for us we have an Oracle connected to Binance's ETH/USD API" index++
	script[# tut, index] = "Lets go ahead and connect the Oracle to the Price Feed Contract now" index++
	script[# tut, index] = "Good job! This Contract is now online" index++
	script[# tut, index] = "This completes the Smart Contract Builder basics tutorial" index++
	script[# tut, index] = "Press OK to return to the Main Menu" index++
	
	tut++ index = 0
	
	script[# tut, index] = "Welcome to The Oracle Problem, or Your First dApp" index++
	script[# tut, index] = "This tutorial is going to take you through building the LinkPal contract" index++
	script[# tut, index] = "dApps or Decentralized Applications consist of one or more Smart Contracts" index++
	script[# tut, index] = "A Smart Contract is code that lives and executes on a blockchain" index++
	script[# tut, index] = "The apps of today utilize data in systems. dApps are no different however there exists a problem" index++
	script[# tut, index] = "Smart Contracts cannot access the systems that regular apps can. This is known as The Oracle Problem" index++
	script[# tut, index] = "To solve this problem we must utilize blockchain middleware" index++
	script[# tut, index] = "This is also known as an Oracle" index++
	script[# tut, index] = "To get the LinkPal Contract online you will have to use 2 Oracles" index++
	script[# tut, index] = "Reminder, white Wires represent Off-Chain Data..." index++
	script[# tut, index] = "...while blue Wires represent On-Chain Data" index++
	script[# tut, index] = "Remember! Data has to pass through an Oracle first" index++
	script[# tut, index] = "Congratulations! You have built your first dApp" index++
	script[# tut, index] = "Press OK to return to the Main Menu" index++
	
	tut++ index = 0 
	
	script[# tut, index] = "Welcome to The Need to Decentralize" index++
	script[# tut, index] = "This tutorial will explain Data misfires and what happens if a Contract uses bad data" index++
	script[# tut, index] = "Jane has $100 in PayPal and wants to buy $100 worth of ETH. Meanwhile Bob has ETH and is willing to trade with her" index++
	script[# tut, index] = "Money in PayPal is not a cryptocurrency and on a blockchain therefore it cannot natively be traded for ETH" index++
	script[# tut, index] = "To solve this, LinkPal requires that Bob opens an invoice on PayPal for $100 while also having $100 of ETH" index++
	script[# tut, index] = "When Jane sees that Bob has $100 of ETH, Jane will pay $100 to the Invoice, the Oracle will see and release the $100 ETH to Jane" index++
	script[# tut, index] = "This means it is very important that the LinkPal Contract is able to know the price of ETH. If the wrong price of ETH was used Jane could end up receiving more or less than $100." index++
	script[# tut, index] = "The ETH/USD Data source is going to get a 100% corruption level meaning when it is called by a Contract it has a 100% chance of giving bad data" index++
	script[# tut, index] = "People don't like it when technology doesn't work, especially when it comes to their money" index++
	script[# tut, index] = "To make sure the Contract gets a reliable price of ETH we can use Decentralization" index++
	script[# tut, index] = "This means placing down multiple sources of ETH/USD data to call and average them out" index++
	script[# tut, index] = "You've been given 3 sources of ETH/USD to place and the Oracle has been given two more Ports" index++
	script[# tut, index] = "You need at least 2/3 of the data to not Misfire for a successful Contract use" index++
	script[# tut, index] = "Press OK to return to the Main Menu" index++
	//script[# tut, index] = "" index++
	//script[# tut, index] = "" index++
	//script[# tut, index] = "" index++
} else {
	script = csv_to_grid("tutorial_scripts.csv",true)	
}