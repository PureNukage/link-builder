var _x = x
var _y = y
for(var _w=0;_w<grid_width;_w++) {
	_y = y
	_x += cell_width
	for(var _h=0;_h<grid_height;_h++) {
		_y += cell_height
		draw_roundrect(_x,_y,_x+cell_width,_y+cell_height,true)
	}
}