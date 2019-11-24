switch(mode) 
{
	case 0:
	
	break
	case 1:
	
		with gridController {
			
			draw_set_color(c_white)
			for(var _w=0;_w<grid_width;_w++) {
				for(var _h=0;_h<grid_height;_h++) {
					var _x = grid_positions_x[_w]
					var _y = grid_positions_y[_h]
					draw_rectangle(_x,_y,_x+cell_width,_y+cell_width,true)
				}	
			}
			
			draw_text(mouse_x+64,mouse_y-50,"grid_mouse_w: "+string(grid_mouse_w))
			draw_text(mouse_x+64,mouse_y-35,"grid_mouse_h: "+string(grid_mouse_h))
			
		}
	
	
	break
}