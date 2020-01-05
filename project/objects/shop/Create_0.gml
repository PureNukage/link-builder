buttonX = 32
buttonY = 32
button_width = 128
button_height = 64
button_text = "Shop"
button_mouseover = false

menuX = buttonX
menuY = buttonY + button_height + 16 // 16 is a buffer between the elements
menu_width = 128
menu_height = 256
menu_mouseover = false
menu_open = false
menu_pressed = false

nodes_open = false
nodes_mouseover = false
data_open = false
data_mouseover = false

//	CREATE DATA 
item_data = 0

var _string = "This endpoint to Binance gives\nthe current USD price of Ether"
create_data("Binance ETH/USD",500,data,_string,s_portrait_binance,data_types.binance_ETHUSD)

var _string = ""
create_data("CryptoCompare ETH/USD",500,data,_string,s_portrait_blank,data_types.cryptocompare_ETHUSD)

var _string = ""
create_data("BraveNewCoin ETH/USD",500,data,_string,s_portrait_blank,data_types.bravenewcoin_ETHUSD)

var _string = "This endpoint gives access to PayPal"
create_data("PayPal",750,data,_string,s_portrait_paypal,data_types.paypal)

var _string = "This endpoint gives access to Github"
create_data("Github",1000,data,_string,s_portrait_github,data_types.github)

//	CREATE NODES
item_node[0,item_name] = "Node"
item_node[0,item_price] = 100
item_node[0,item_placed] = 0
item_node[0,item_object_index] = node
item_node[0,item_text] = "A ChainLink node.\n\nSome say its the 4th industrial revolution\nOthers say its made of cheese"

item = []
item[0,item_name] = "Node"		//	Item name in a string
item[0,item_price] = 100			//	Item price
item[0,item_placed] = 0			//	Has this item been placed?
item[0,item_object_index] = node		//	Object index of the item

item[1,item_name] = "Data"
item[1,item_price] = 500
item[1,item_placed] = 0
item[1,item_object_index] = data

item[2,item_name] = "Wire"
item[2,item_price] = 0
item[2,item_placed] = 0
item[2,item_object_index] = wire

item[3,item_name] = "Kiosk"
item[3,item_price] = 250
item[3,item_placed] = 0
item[3,item_object_index] = kiosk

item_height = 64
item_buffer = 16
item_placing = 0