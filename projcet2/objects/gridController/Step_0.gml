var _x = grid_start_x
var _y = grid_start_y
for(var _w=0;_w<grid_width;_w++) {
	for(var _h=0;_h<grid_height;_h++) {
		_x = grid_positions_x[_w]
		_y = grid_positions_y[_h]
		if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+cell_width-1,_y+cell_height-1) { 
			grid_mouse_w = _w
			grid_mouse_h = _h
			exit
		} else {
			grid_mouse_w = -1
			grid_mouse_h = -1
		}
	}
}