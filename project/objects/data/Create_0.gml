size_width = 5						//	Set; cells width this item takes up
size_height = 5						//	Set; cells height this item takes up
sprite = s_database					//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 1						//	Set; holds the number of ports in this item has

// Inherit the parent event
event_inherited()

ports[0,port_x] = bottomright_cell_x+1
ports[0,port_y] = center_cell_y

data_generated = data_types.binance_ETHUSD