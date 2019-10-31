var _x = x-160
var _y = y-160
for(var _w=0;_w<grid_width;_w++) {
	_y = y-160
	_x += cell_width
	for(var _h=0;_h<grid_height;_h++) {
		_y += cell_height
		
		//	Cell highlight if moused over
		if grid_mouse_w == _w and grid_mouse_h == _h and instance_exists(placement) {
			draw_set_color(c_white)
			draw_rectangle(_x+1,_y+1,_x+cell_width-1,_y+cell_height-1,true)
			draw_rectangle(_x,_y,_x+cell_width,_y+cell_height,true)
		} 
		
		//	Draw any objects placed in this cell
		var gap = 80
		switch(grid[# _w, _h])
		{
			case 1:
				draw_sprite(s_chainlink,0,_x+gap,_y+gap)
			break
			case 2:
				draw_sprite(s_database,0,_x+gap,_y+gap)
			break
		}	
		
	}
}