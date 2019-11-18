switch(states)
{
	case states.placement:
		
		x = mouse_x
		y = mouse_y
		
		var _x = cell_width
		var _y = cell_height
		if !place_snapped(_x,_y) {
			move_snap(_x,_y)	
		}
		
		if moved == true {
			
			center_cell_x  = gridController.grid_mouse_w
			center_cell_y = gridController.grid_mouse_h
			
			var _x, _y
			_x = gridController.grid_positions_x[# center_cell_x-floor(size_width/2), center_cell_y]
			for(var _w=0;_w<size_width;_w++) {
				_y = gridController.grid_positions_y[# center_cell_x, center_cell_y-floor(size_height/2)]
				for(var _h=0;_h<size_height;_h++) {
					my_cells_x[# _w, _h] = _x
					my_cells_y[# _w, _h] = _y
					_y += cell_height
				}
				_x += cell_width
			}	
		}
		
		if input.mouse_right_press {
			instance_destroy()	
		}
		
		
	break
}