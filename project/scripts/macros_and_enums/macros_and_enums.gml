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

enum selection_mode {
	free,
	contract_placement,
	
}

enum data_types {
	binance_ETHUSD,	
	paypal,
	
}

enum goal_type {
	walking_to_kiosk,	
	idlewalk,
	waiting_in_line,
	using_smartcontract,
}

#macro contract_name 0
#macro contract_online 1
#macro contract_kiosk 2
#macro contract_traffic 3
#macro contract_reward 4
#macro contract_price 5
#macro contract_traffic_live 6
#macro contract_channel 7
#macro contract_width 8
#macro contract_height 9
#macro contract_purchased 10
#macro contract_text 11
#macro contract_data 12
#macro contract_portrait 13
#macro contract_linesize 14

enum contract_types {
	eth_transfer,	
}

#macro item_name 0
#macro item_object_index 3
#macro item_price 1
#macro item_placed 2
#macro item_text 4
#macro item_data_generated 5
#macro item_portrait 6

#macro in 0
#macro out 1
#macro port_object 0
#macro port_direction 1
#macro port_x 2
#macro port_y 3

#macro c_gray4 make_color_rgb(94,94,94)

#macro right 0
#macro down 1
#macro left 2
#macro up 3

#macro gui_mouse_x device_mouse_x_to_gui(0)
#macro gui_mouse_y device_mouse_y_to_gui(0)

#macro mouse_in_grid (topleft_cell_x > -1 and bottomright_cell_x < grid_width) and (topleft_cell_y > -1 and bottomright_cell_y < grid_height)
#macro mouse_in_grid2 (input.grid_x > -1 and input.grid_x < grid_width and input.grid_y > -1 and input.grid_y < grid_height)