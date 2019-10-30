var _x = x
var _y = y
for(var _w=0;_w<grid_width;_w++) {
	_y = y
	_x += cell_width
	for(var _h=0;_h<grid_height;_h++) {
		_y += cell_height
		if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+cell_width,_y+cell_height) {
			grid_mouse_w = _w
			grid_mouse_h = _h
			exit
		} else {
			grid_mouse_w = -1
			grid_mouse_h = -1
		}
	}
}