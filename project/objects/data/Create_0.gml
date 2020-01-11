size_width = 3						//	Set; cells width this item takes up
size_height = 3						//	Set; cells height this item takes up
sprite = s_database					//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 1						//	Set; holds the number of ports in this item has
portrait = s_portrait_blank			//	Set; holds the portrait for this item
name = "Data"

// Inherit the parent event
event_inherited()

ports[0,port_x] = bottomright_cell_x+1
ports[0,port_y] = center_cell_y
ports[0,port_x_diff] = ports[0,port_x] - center_cell_x
ports[0,port_y_diff] = ports[0,port_y] - center_cell_y

data_generated = -1 
used = false
used_alpha = 0
used_color = c_green
used_lightup = false
used_time = -1
misfire = false

used_alpha_max = 0
used_alpha = 0

used_alpha2 = 0
used_alpha2_max = 0