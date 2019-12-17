size_width = 5						//	Set; cells width this item takes up
size_height = 5						//	Set; cells height this item takes up
sprite = s_chainlink				//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 4						//	Set; holds the number of ports in this item has
port = []

// Inherit the parent event
event_inherited()

#region Ports
//my_cells_items[# 4, 2] = -2
//my_cells_items[# 2, 4] = -2
//my_cells_items[# 0, 2] = -2
//my_cells_items[# 2, 0] = -2

ports[0,port_x] = bottomright_cell_x+1
ports[0,port_y] = center_cell_y

ports[1,port_x] = center_cell_x
ports[1,port_y] = bottomright_cell_y+1

ports[2,port_x] = topleft_cell_x-1
ports[2,port_y] = center_cell_y

ports[3,port_x] = center_cell_x
ports[3,port_y] = topleft_cell_y-1
#endregion