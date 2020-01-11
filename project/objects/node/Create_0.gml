size_width = 5						//	Set; cells width this item takes up
size_height = 5						//	Set; cells height this item takes up
sprite = s_chainlink				//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 2						//	Set; holds the number of ports in this item has
portrait = s_portrait_node			//	Set; holds the portrait for this item
name = "Node"
jobruns = 0
jobruns_previous = 0

// Inherit the parent event
event_inherited()

#region Ports

ports[0,port_x] = bottomright_cell_x+1
ports[0,port_y] = center_cell_y
ports[0,port_x_diff] = ports[0,port_x] - center_cell_x
ports[0,port_y_diff] = ports[0,port_y] - center_cell_y

ports[1,port_x] = topleft_cell_x-1
ports[1,port_y] = center_cell_y
ports[1,port_x_diff] = ports[1,port_x] - center_cell_x
ports[1,port_y_diff] = ports[1,port_y] - center_cell_y

//ports[2,port_x] = center_cell_x
//ports[2,port_y] = bottomright_cell_y+1

//ports[3,port_x] = center_cell_x
//ports[3,port_y] = topleft_cell_y-1
#endregion

data_held = ds_list_create()

used = false
used_alpha_max = .3
used_alpha = used_alpha_max
used_time = -1
used_lightup = false