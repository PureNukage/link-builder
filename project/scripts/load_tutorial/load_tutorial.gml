///@param tutorial

var _tutorial = argument[0]

//	Disable everything in the shop
disable_shopitems()

app.data_corruption = mode.off

switch(_tutorial)
{
	case tutorial.basics:
		
		create_textbox("Welcome to the Smart Contract Builder basics")
		
		create_textbox("This tutorial is going to take you through the ")
		
	break
	case tutorial.my_first_contract:

		create_textbox("Welcome to Your first externally-aware contract")

		create_textbox("This tutorial is going to take you through building the LinkPal contract")

		create_textbox("To start, select the LinkPal contract from the Shop")
	
	break
}