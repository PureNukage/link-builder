///@param cell_x
///@param cell_y

//	Moving the items grid
center_cell_x = argument[0]
center_cell_y = argument[1]

topleft_cell_x = center_cell_x-floor(size_width/2)
topleft_cell_y = center_cell_y-floor(size_height/2)

bottomright_cell_x = topleft_cell_x + (size_width-1)
bottomright_cell_y = topleft_cell_y + (size_height-1)

//	Moving the items x,y 
var _xx = gridController.grid_positions_x[center_cell_x]
var _yy = gridController.grid_positions_y[center_cell_y]
_xx += cell_width/2
_yy += cell_height/2
		
x = _xx
y = _yy

if object_index != wire {
	ports_xyupdate_movement()		
	item_check_sockets()
}
else {
	//wire_update_ports_xy(rotation)
	item_check_sockets()
}

placeable = is_placeable()