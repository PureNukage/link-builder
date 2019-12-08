event_inherited()

switch(states)
{
	case states.placement:
	
		if input.mouse_left_press and placeable {
				
			states = states.placed
				
			ds_grid_set_grid_region(gridController.grid_items,my_cells_items,0,0,size_width,size_height,topleft_cell_x,topleft_cell_y)
			
			mp_grid_add_rectangle(gridController.mp_grid,topleft_cell_x,topleft_cell_y,bottomright_cell_x,bottomright_cell_y)
				
		}
	
	break
}