size_width = 5						//	Set; cells width this item takes up
size_height = 5						//	Set; cells height this item takes up
sprite = s_chainlink				//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 4						//	Set; holds the number of ports in this item has

// Inherit the parent event
event_inherited()

#region Ports
my_cells_items[# 4, 2] = -2
my_cells_items[# 2, 4] = -2
my_cells_items[# 0, 2] = -2
my_cells_items[# 2, 0] = -2

ports[0,port_x] = 4
ports[0,port_y] = 2

ports[1,port_x] = 2
ports[1,port_y] = 4

ports[2,port_x] = 0
ports[2,port_y] = 2

ports[3,port_x] = 2
ports[3,port_y] = 0
#endregion