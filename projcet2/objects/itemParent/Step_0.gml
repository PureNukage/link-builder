switch(states)
{
	#region State Placement
		case states.placement:
		
			var _xx = gridController.grid_positions_x[gridController.grid_mouse_w]
			var _yy = gridController.grid_positions_y[gridController.grid_mouse_h]
			_xx += cell_width/2
			_yy += cell_height/2
		
			x = _xx
			y = _yy
		
			if moved == true {
			
				center_cell_x  = gridController.grid_mouse_w
				center_cell_y = gridController.grid_mouse_h
				
				topleft_cell_x = center_cell_x-floor(size_width/2)
				topleft_cell_y = center_cell_y-floor(size_height/2)
			
				var _x, _y
				_x = gridController.grid_positions_x[topleft_cell_x]
				for(var _w=0;_w<size_width;_w++) {
					_y = gridController.grid_positions_y[topleft_cell_y]
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
		
			if input.mouse_left_press {
				
				states = states.placed
				
				ds_grid_set_grid_region(gridController.grid_items,my_cells_items,0,0,size_width,size_height,topleft_cell_x,topleft_cell_y)
				
				
			}
		
		
		break
	#endregion
	#region State Placed
	
	
	
	#endregion
}