enum states {
	placement,
	placed,
	limbo,
	
	idle,
	wait_in_line,
	move,
	using_smartcontract,
	
}

enum mode {
	off,
	grid,
	object,
	on,
	
}

enum chaos_events {
	corruption,	
}

enum connected {
	not_connected,
	is_connected,
	incorrect_connected,
}

enum menu {
	main,
	options,
	tutorials,
	in_game,
	play,
}

enum selection_mode {
	free,
	contract_placement,
	port_placement,
	
}

enum camera_mode {
	free,
	moved_to,
	fixed,
}

enum data_types {
	binance_ETHUSD,	
	cryptocompare_ETHUSD,
	coinbase_ETHUSD,
	coingecko_ETHUSD,
	coinpaprika_ETHUSD,
	coinmarket_ETHUSD,
	bravenewcoin_ETHUSD,
	alphacurrency_ETHUSD,
	kaiko_ETHUSD,
	
	binance_LINKUSD,
	cryptocompare_LINKUSD,
	coinbase_LINKUSD,
	coingecko_LINKUSD,
	coinpaprika_LINKUSD,
	coinmarket_LINKUSD,
	bravenewcoin_LINKUSD,
	alphacurrency_LINKUSD,
	kaiko_LINKUSD,
	
	//binance_XRPUSD,
	//cryptocompare_XRPUSD,
	//bravenewcoin_XRPUSD,
	//alphacurrency_XRPUSD,
	//kaiko_XRPUSD,
	
	emailAPI,
	paypal,
	github,
	twitter,
	youtube,
	docusignAPI,
	visaPayment,
	flightAPI,
	videogameAPI,
	firewallAPI,
	gpsAPI,
	weatherAPI,
	vehicleAPI,
	vehicle_freezerAPI,
	//bitcoinPayment,
	swiftPayment,
	
}

enum data_filters {
	pricedata,
	webdata,
}

enum goal_type {
	walking_to_kiosk,	
	idlewalk,
	waiting_in_line,
	using_smartcontract,
	leaving,
	leaving_game_over,
	
}

enum tutorial {
	basics,
	my_first_contract,
	decentralizing,
	price_feed,
	
}

enum event_types {
	out_of_link,
	out_of_eth,
	reliability_change,
	levelup,
	online,
	sn_start,
	sn_debt1,
	sn_debt2,
	sn_debt3,
	sn_lose
	
}

enum skills {
	two_more_ports,	
}

#macro condition_type 0 
#macro condition_value 1
#macro condition_string 2
#macro condition_met 3

enum conditions {
	cnd_active,
	cnd_payment_eth,
	cnd_reliability_high,
}

#macro corruption_calls_min 0
#macro corruption_calls_max 1
#macro corruption_amount 2

#macro tutorial_name 0
#macro tutorial_selected 1

#macro contract_name 0
#macro contract_online 5
#macro contract_kiosk 2
#macro contract_traffic 3
#macro contract_reward 4
#macro contract_price 1
#macro contract_traffic_live 6
#macro contract_channel 7
#macro contract_width 8
#macro contract_height 9
#macro contract_purchased 30
#macro contract_text 11
#macro contract_data 12
#macro contract_portrait 13
#macro contract_linesize 14
#macro contract_value 15
#macro contract_misfires 16
#macro contract_reliability 17
#macro contract_uses 18
#macro contract_type 19
#macro contract_level 20
#macro contract_level_ports 21
#macro contract_available 22
#macro contract_gasfee_base 23
#macro contract_gasfee_total 24
#macro contract_linkfee 25
#macro contract_radius 26
#macro contract_conditions 27
#macro contract_type2 28
#macro contract_new 29
#macro contract_virgin 31

enum contract_types {
	people,
	utility,
	
	hackathon,
	defi,
	enterprise
}

#macro node_name 0
#macro node_object_index 3
#macro node_price 1
#macro node_placed 2
#macro node_text 4
#macro node_level 5
#macro node_level_ports 8
#macro node_jobruns 6
#macro node_uptime 7
#macro node_levels 9
#macro node_skills 10
#macro node_skillpoints 11
#macro node_new 12
#macro node_purchased 30
#macro node_available 22

#macro skill_acquired 0
#macro skill_text 1
#macro skill_type 2

#macro item_name 0
#macro item_object_index 3
#macro item_price 1
#macro item_placed 2
#macro item_text 4
#macro item_data_generated 5
#macro item_portrait 6
#macro item_calls 7
#macro item_corruption 8
#macro item_corruption_levels 9 
#macro item_filter 10
#macro item_new 11
#macro item_purchased 30
#macro item_available 22

#macro menu_name 0
#macro menu_selected 1
#macro menu_active 2
#macro menu_submenu 3
#macro menu_data0 4
#macro menu_data1 5

#macro hero_name 0
#macro hero_acquired 1
#macro hero_available 2
#macro hero_condition_string 3
#macro hero_hidden 4
#macro hero_conditions 5
#macro hero_id 6
#macro hero_sprite 7
#macro hero_head 8
#macro hero_new 9
#macro hero_virgin 10

enum hero {
	rory,
	adelyn,
	thomas,
	cz,
	chicocrypto,
	aaronwright,
	krown,
	gaben,
	duck,
	pepe,
	//pomp,
	//sergey,
	//vitalik
	
}


#macro in 0
#macro out 1
#macro port_object 0
#macro port_direction 1
#macro port_x 2
#macro port_y 3
#macro port_x_diff 4
#macro port_y_diff 5

#macro c_gray4 make_color_rgb(85,85,85)
#macro c_gray5 make_color_rgb(60,60,60)
#macro c_sergey_blue make_color_rgb(42,89,218)

#macro right 0
#macro down 1
#macro left 2
#macro up 3

#macro event_duration textboxController.Event_duration

#macro gui_mouse_x device_mouse_x_to_gui(0)
#macro gui_mouse_y device_mouse_y_to_gui(0)

#macro mouse_in_grid (topleft_cell_x > -1 and bottomright_cell_x < grid_width) and (topleft_cell_y > -1 and bottomright_cell_y < grid_height)
#macro mouse_in_grid2 (input.grid_x > -1 and input.grid_x < grid_width and input.grid_y > -1 and input.grid_y < grid_height)