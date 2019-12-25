enum states {
	placement,
	placed,
	limbo,
	
}

enum mode {
	off,
	grid,
	object
	
	
}

enum data_types {
	binance_ETHUSD,	
}

#macro contract_name 0
#macro contract_online 1
#macro contract_kiosk 2
enum contract_types {
	eth_transfer,	
}

#macro in 0
#macro out 1
#macro port_object 0
#macro port_direction 1
#macro port_x 2
#macro port_y 3

#macro right 0
#macro down 1
#macro left 2
#macro up 3

#macro gui_mouse_x device_mouse_x_to_gui(0)
#macro gui_mouse_y device_mouse_y_to_gui(0)

#macro mouse_in_grid (topleft_cell_x > -1 and bottomright_cell_x < grid_width) and (topleft_cell_y > -1 and bottomright_cell_y < grid_height)