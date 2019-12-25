size_width = 5						//	Set; cells width this item takes up
size_height = 5						//	Set; cells height this item takes up
sprite = s_kiosk					//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 2						//	Set; holds the number of ports in this item has

event_inherited()

ports[0,port_x] = topleft_cell_x - 1
ports[0,port_y] = center_cell_y
ports[1,port_x] = bottomright_cell_x + 1
ports[1,port_y] = center_cell_y

data_held = ds_list_create()

smartcontract = -1
active = false

data_needed = []
data_needed[0,0] = data_types.binance_ETHUSD
data_needed[0,1] = false

