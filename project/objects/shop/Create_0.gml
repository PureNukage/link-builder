#region Data 

	//	CREATE DATA 
	item_data = 0

	var name = "Binance ETH/USD"
	var price = 500
	var Object_index = data
	var _string = "This endpoint to Binance gives\nthe current USD price of Ether"
	var portrait = s_portrait_blank
	var Data_types = data_types.binance_ETHUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)

	var name = "CryptoCompare ETH/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.cryptocompare_ETHUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Coinbase ETH/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.coinbase_ETHUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)

	var name = "BraveNewCoin ETH/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.bravenewcoin_ETHUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "AlphaCurrency ETH/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.alphacurrency_ETHUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Kaiko ETH/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.kaiko_ETHUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Binance LINK/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.binance_LINKUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Cryptocompare LINK/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.cryptocompare_LINKUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Coinbase LINK/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.coinbase_LINKUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "BraveNewCoin LINK/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.bravenewcoin_LINKUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "AlphaCurrency LINK/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.alphacurrency_LINKUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Kaiko LINK/USD"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.kaiko_LINKUSD
	var Corruption = create_data_corruption(0,99,0,100,249,10,250,499,20,500,999,30,1000,-1,40)
	var Data_filters = data_filters.pricedata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)

	var name = "PayPal"
	var price = 750
	var Object_index = data
	var _string = "This endpoint gives access to PayPal"
	var portrait = s_portrait_paypal
	var Data_types = data_types.paypal
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)

	var name = "Github"
	var price = 750
	var Object_index = data
	var _string = "This endpoint gives access to Github"
	var portrait = s_portrait_github
	var Data_types = data_types.github
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Email API"
	var price = 500
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.emailAPI
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Twitter"
	var price = 750
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.twitter
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Flight API"
	var price = 1000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.flightAPI
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Videogame API"
	var price = 1000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.videogameAPI
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Firewall API"
	var price = 1000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.firewallAPI
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "gps API"
	var price = 1000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.gpsAPI
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Weather API"
	var price = 1000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.weatherAPI
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Vehicle API"
	var price = 1000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.vehicleAPI
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Shipment Temperature API"
	var price = 1000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.vehicle_freezerAPI
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "Swift gpi Payment"
	var price = 5000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.swiftPayment
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	var name = "VISA Payment"
	var price = 3000
	var Object_index = data
	var _string = ""
	var portrait = s_portrait_blank
	var Data_types = data_types.visaPayment
	var Corruption = create_data_corruption(0,-1,0)
	var Data_filters = data_filters.webdata
	create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)
	
	//var name = "Bitcoin Payment"
	//var price = 3000
	//var Object_index = data
	//var _string = ""
	//var portrait = s_portrait_blank
	//var Data_types = data_types.bitcoinPayment
	//var Corruption = create_data_corruption(0,-1,0)
	//var Data_filters = data_filters.webdata
	//create_data(name,price,Object_index,_string,portrait,Data_types,Corruption,true,Data_filters)

	//	CREATE NODES
	item_node = 0

	var _string = "A ChainLink node.\n\nSome say its the 4th industrial revolution\nOthers say its made of cheese"
	var levels = create_levels(0, 100, 400, 1200, 3500, 10000)
	create_node("YorkyRoad",_string,100,0,0,levels,true)
	
	create_node("gonsinator",_string,350,0,0,levels,false)

	create_node("HashBlaster",_string,750,0,0,levels,false)
	
	//create_node("test1",_string,100,0,0,levels,true)
	
	//create_node("test2",_string,100,0,0,levels,true)
	
	//create_node("test3",_string,100,0,0,levels,true)
	
	node_portrait = s_portrait_node

	item = []
	item[0,item_name] = "Node"				//	Item name in a string
	item[0,item_price] = 100				//	Item price
	item[0,item_placed] = 0					//	Has this item been placed?
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

	//	Plaque info
	Plaque = -1

	//	Resources
	link_trade = 1
	eth_trade = 1
	
	link_price = 1
	eth_price = 2
	
	link_mouseover = false
	eth_mouseover = false
	
	button_active = true
	wire_active = true
	resources_active = true
	
	exchange_open = false
	exchange_mouseover = false
	exchange_currency = "LINK"

	buttonX = 32
	buttonY = 48
	button_width = 128
	button_height = 64
	button_text = "Shop"
	button_mouseover = false
	
	button_wire_mouseover = false

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
			icon = s_resource_money
			array = item_data
		break
		case "Nodes":
			icon = s_resource_money
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
	name_width = 120	//	default
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
			if array[i, contract_kiosk] == -1 amount_of_items++
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
	handle_height = round(bar_height/(amount_of_items))
	handleX = menuX+menu_width - handle_width - 12
	handleY = barY + (item_index*round(bar_height/(amount_of_items)))
	handle_mouseover = false


	nodes_open = false
	data_open = false
	
#endregion