event_inherited()

switch(states)
{
	case states.placement:
	
		if input.grid_moved {
			node_update_ports_xy(rotation)	
		}
	
		// Placement
		if input.mouse_left_press and placeable {
			
			states = states.placed
			
			ds_grid_set_grid_region(gridController.grid_items,my_cells_items,0,0,size_width,size_height,topleft_cell_x,topleft_cell_y)
			
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
			
		}
		
		//	Rotation
		if input.rotate_right or input.rotate_left {
			var port0_x = ports[0,port_x]
			var port0_y = ports[0,port_y]
			debug_log("old Port 0: "+string(port0_x)+ ","+string(port0_y))
			//ports = grid_rotation(input.rotate_right - input.rotate_left,my_cells_items,ports)	
			node_update_ports_xy(rotation)
			var port0_x = ports[0,port_x]
			var port0_y = ports[0,port_y]
			debug_log("new Port 0: "+string(port0_x)+ ","+string(port0_y))
		}
		
		//	Clamp rotation
		if abs(rotation) == 360 rotation = 0
		
		//	Delete item
		if input.mouse_right_press {
			instance_destroy()
		}
	
	break
	case states.placed:
		
		// Draw the item
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)
		
		
	break
}