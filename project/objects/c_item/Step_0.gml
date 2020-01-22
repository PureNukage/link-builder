switch(states)
{
	#region State Placement
		case states.placement:
		
			if input.mouse_right_press and !(app.tutorial == tutorial.basics and tutorialHelper.stage < 7) {
				if ds_list_find_index(input.selections,id) > -1 {
					ds_list_delete(input.selections,id)
				}
				if input.selection == id input.selection = -1	
			}
		
			if input.grid_x != -1 and input.grid_y != -1 {
		
				if input.grid_moved {
					
					var _xx = gridController.grid_positions_x[input.grid_x]
					var _yy = gridController.grid_positions_y[input.grid_y]
					_xx += cell_width/2
					_yy += cell_height/2
		
					x = _xx
					y = _yy
			
					center_cell_x = input.grid_x
					center_cell_y = input.grid_y
				
					topleft_cell_x = center_cell_x-floor(size_width/2)
					topleft_cell_y = center_cell_y-floor(size_height/2)
				
					bottomright_cell_x = topleft_cell_x + (size_width-1)
					bottomright_cell_y = topleft_cell_y + (size_height-1)
			
					if mouse_in_grid {
						var _x, _y
						_x = gridController.grid_positions_x[topleft_cell_x]
						for(var _w=0;_w<size_width;_w++) {
							_y = gridController.grid_positions_y[topleft_cell_y]
							for(var _h=0;_h<size_height;_h++) {
								my_cells_x[_w] = _x
								my_cells_y[_h] = _y
								_y += cell_height
							}
							_x += cell_width
						}	
					}
					
					//	Placeable check
					placeable = is_placeable()
					
				}
				
				//	Rotation
				if (input.rotate_right or input.rotate_left) {
					var _direction = input.rotate_right - input.rotate_left
					if _direction == 1 {
						rotation -= 90
					} else {
						rotation += 90
					}
					size_width = size_width + size_height
					size_height = size_width - size_height
					size_width = size_width - size_height
					//Cells
					center_cell_x = input.grid_x
					center_cell_y = input.grid_y

					topleft_cell_x = center_cell_x-floor(size_width/2)
					topleft_cell_y = center_cell_y-floor(size_height/2)

					bottomright_cell_x = topleft_cell_x + (size_width-1)
					bottomright_cell_y = topleft_cell_y + (size_height-1)
				}
				
			}
		
		break
	#endregion
	
	#region State Placed
		case states.placed:		
			
			if selected and input.delete_press and app.tutorial == -1 {				
				item_delete()				
			}
			
		break
	#endregion
}

depth = -y