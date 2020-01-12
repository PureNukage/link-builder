#region Data 

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
	item_node = 0

	var _string = "A ChainLink node.\n\nSome say its the 4th industrial revolution\nOthers say its made of cheese"
	create_node("YorkyRoad",_string,100)

	create_node("gonsinator",_string,100)

	create_node("DataBlaster",_string,100)

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
	
#endregion

item_height = 64
item_buffer = 16
item_placing = 0


#region GUI

	buttonX = 32
	buttonY = 32
	button_width = 128
	button_height = 64
	button_text = "Shop"
	button_mouseover = false

	#region Shop Menu Header Stuff

		menu_button_name_width = 155

		menu_button_name_height = 80
		menu_button_nameX = 127
		menu_button_nameY = 120

		menu_button_left_width = 80
		menu_button_left_height = 80
		menu_button_leftX = 40
		menu_button_leftY = 120
		menu_button_left_mouseover = false

		menu_button_right_width = 80
		menu_button_right_height = 80
		menu_button_rightX = menu_button_nameX+menu_button_name_width+6
		menu_button_rightY = 120
		menu_button_right_mouseover = false

		menu_header_width = menu_button_name_width + menu_button_left_width + menu_button_right_width + 32  //274
		menu_header_height = 106
		
		header_buffer = 12
	
	#endregion

	#region Shop Menu Body stuff

		menuX = buttonX
		menuY = buttonY + button_height + 16 // 16 is a buffer between the elements
		menu_width = 400
		menu_height = 246 //280 - menu_header_height
		menu_mouseover = false
		menu_open = false
		menu_pressed = false

	#endregion
	
	menu_index = 2
	menu_choices[0] = "Data"
	menu_choices[1] = "Nodes"
	menu_choices[2] = "Contracts"
	menu_index_string = menu_choices[menu_index]
	switch(menu_index_string)
	{
		case "Data":
			icon = s_resource_link_shop
			array = item_data
		break
		case "Nodes":
			icon = s_resource_link_shop
			array = item_node
		break
		case "Contracts":
			icon = s_resource_value_shop
			array = contracts.contract
		break
	}
	
	const_bar_width = 55
	const_handle_width = 42
	
	list_spacer = 8
	name_spacer = 16
	name_width = 100	//	default
	icon_width = sprite_get_width(icon)
	price_spacer = 8
	price_width = 28
	
	list_width = (list_spacer*2)+(name_spacer*2)+name_width+icon_width+(price_spacer*2)+price_width
	list_height = 40
	price_width = 40
	icon_width = 40
		
	amount_of_items = array_height_2d(array)
	if menu_index_string == "Contracts" {
		amount_of_items = 0
		for(var i=0;i<array_height_2d(array);i++) {
			if !array[i, contract_purchased] amount_of_items++
		}
	}
	item_index = 0
	item_clamp = 4
	item_mouseover = -1
	amount_of_items = clamp(amount_of_items,0,item_clamp)
	
	#region	Lets get our list width (todo: height)
	draw_set_font(fnt_shop)
	for(var i=0;i<array_height_2d(array);i++) {
		var _name = array[i, item_name]
		var _price = array[i, item_price]
		var _name_width = string_width(_name)
		//var _string_height = string_height(_name)
		var _price_width = string_width(string(_price))
		
		var this_list_width = (list_spacer*2)+(name_spacer*2)+_name_width+icon_width+(price_spacer*2)+_price_width
		
		if this_list_width > list_width list_width = this_list_width
		
	}
	draw_set_font(-1)
	#endregion
	
	//	Shop Menu scrollbar
	bar_width = const_bar_width
	bar_height = amount_of_items*60-20
	barX = menuX+menu_width - bar_width - 6
	barY = menuY+menu_header_height-header_buffer+6
	
	handle_width = const_handle_width
	handle_height = round(bar_height/(amount_of_items-1))
	handleX = menuX+menu_width - handle_width - 12
	handleY = menuY+menu_header_height-header_buffer+6  +(item_index*round(bar_height/(amount_of_items-1)))
	handle_mouseover = false


	nodes_open = false
	data_open = false
	
#endregion