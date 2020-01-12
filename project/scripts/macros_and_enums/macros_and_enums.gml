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
	object
	
}

enum menu {
	main,
	options,
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
	bravenewcoin_ETHUSD,
	paypal,
	github,
	
}

enum goal_type {
	walking_to_kiosk,	
	idlewalk,
	waiting_in_line,
	using_smartcontract,
	leaving
	
}

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
#macro contract_purchased 10
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

enum contract_types {
	people,
	utility
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

#macro item_name 0
#macro item_object_index 3
#macro item_price 1
#macro item_placed 2
#macro item_text 4
#macro item_data_generated 5
#macro item_portrait 6
#macro item_calls 7
#macro item_corruption 8

#macro menu_name 0
#macro menu_selected 1
#macro menu_active 2
#macro menu_submenu 3
#macro menu_data0 4
#macro menu_data1 5

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

#macro gui_mouse_x device_mouse_x_to_gui(0)
#macro gui_mouse_y device_mouse_y_to_gui(0)

#macro mouse_in_grid (topleft_cell_x > -1 and bottomright_cell_x < grid_width) and (topleft_cell_y > -1 and bottomright_cell_y < grid_height)
#macro mouse_in_grid2 (input.grid_x > -1 and input.grid_x < grid_width and input.grid_y > -1 and input.grid_y < grid_height)