event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
	
			if input.grid_moved {
				data_update_ports_xy(rotation)
			}
	
			if input.rotate_right or input.rotate_left {
				data_update_ports_xy(rotation)
			}
		
			if abs(rotation) == 360 {
				rotation = 0
				data_update_ports_xy(rotation)
			}
	
			if input.mouse_left_press and placeable {
			
				states = states.placed
			
				ds_grid_set_grid_region(gridController.grid_items,my_cells_items,0,0,size_width,size_height,topleft_cell_x,topleft_cell_y)
				item_placeid()
			
				var _x1 = gridController.grid_positions_x[topleft_cell_x]+(cell_width/2)
				var _y1 = gridController.grid_positions_y[topleft_cell_y]+(cell_height/2)
				var _x2 = gridController.grid_positions_x[bottomright_cell_x]+(cell_width/2)
				var _y2 = gridController.grid_positions_y[bottomright_cell_y]+(cell_height/2)
			
				mp_grid_add_rectangle(gridController.mp_grid,_x1,_y1,_x2,_y2)
			
				//	Add ports
				for(var _p=0;_p<ports_count;_p++) {
					var _grid = gridController.grid_port_objects
					var _grid_x = gridController.grid_port_x
					var _grid_y = gridController.grid_port_y
					ds_list_add(_grid,id)
					ds_list_add(_grid_x,ports[_p,port_x])
					ds_list_add(_grid_y,ports[_p,port_y])
					gridController.grid_items[# ports[_p,port_x], ports[_p,port_y]] = -2
				}
			
				system_set()
			
			}	
	
			if input.mouse_right_press {
				instance_destroy()	
			}
	
	
		break
	#endregion
	#region Placed
		case states.placed:
			
		break
	#endregion
}	