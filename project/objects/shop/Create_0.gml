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

nodes_open = false
nodes_mouseover = false
data_open = false
data_mouseover = false

item = []
item[0,0] = "Node"		//	Item name in a string
item[0,1] = 100			//	Item price
item[0,2] = 0			//	Has this item been placed?
item[0,3] = node		//	Object index of the item

item_node[0,0] = "Node"
item_node[0,1] = 100
item_node[0,2] = 0
item_node[0,3] = node

item[1,0] = "Data"
item[1,1] = 500
item[1,2] = 0
item[1,3] = data

item_data[0,0] = "Binance ETH/USD"
item_data[0,1] = 500
item_data[0,2] = 0
item_data[0,3] = data

item[2,0] = "Wire"
item[2,1] = 0
item[2,2] = 0
item[2,3] = wire

item[3,0] = "Kiosk"
item[3,1] = 0
item[3,2] = 250
item[3,3] = kiosk


item_height = 64
item_buffer = 16
item_placing = 0