switch(mode) 
{
	case 0:
	
	break
	case 1:
	
		with gridController {
			
			for(var _w=0;_w<grid_width;_w++) {
				for(var _h=0;_h<grid_height;_h++) {
					var _x = grid_positions_x[# _w, _h]
					var _y = grid_positions_y[# _w, _h]
					draw_rectangle(_x,_y,_x+cell_width,_y+cell_width,true)
				}	
			}
			
			draw_text(mouse_x+64,mouse_y-50,"grid_mouse_w: "+string(grid_mouse_w))
			draw_text(mouse_x+64,mouse_y-35,"grid_mouse_h: "+string(grid_mouse_h))
			
		}
	
	
	break
}