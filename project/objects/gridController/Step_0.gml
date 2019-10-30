var _x = x-160
var _y = y-160
for(var _w=0;_w<grid_width;_w++) {
	_y = y-160
	_x += cell_width
	for(var _h=0;_h<grid_height;_h++) {
		_y += cell_height
		if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+cell_width,_y+cell_height) {
			grid_mouse_w = _w
			grid_mouse_h = _h
			if mouse_check_button_pressed(mb_left) {
				ds_grid_add(grid,_w,_h,1)
				if grid[# _w,_h] == 3 {
					grid[# _w,_h] = 0
				}
			}	
			exit
		} else {
			grid_mouse_w = -1
			grid_mouse_h = -1
		}
	}
}