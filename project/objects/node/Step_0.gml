event_inherited()

switch(states)
{
	case states.placement:
	
		if input.grid_moved {
			node_update_ports_xy(rotation)	
			
			for(var i=0;i<ports_count;i++) {
				var _x = ports[i,port_x] 
				var _y = ports[i,port_y]
				if gridController.grid_items[# _x, _y] == wire {
					var _wire = gridController.grid_objects[# _x, _y]
					var free_ports_array = []
					var free_ports = 0
					var port_index = -1
					for(var p=0;p<_wire.ports_count;p++) {
						if _wire.ports[p,port_object] == -1 {
							free_ports_array[p,port_object] = id
							free_ports++
							port_index = p
						} else {
							free_ports_array[p,port_object] = _wire.ports[p,port_object]
						}
						free_ports_array[p,port_x] = _wire.ports[p,port_x]
						free_ports_array[p,port_y] = _wire.ports[p,port_y]
					}
					if free_ports > 0 {
						free_ports--
						if free_ports == 0 {
							#region Determine straight or corner
							//	Figure out directions
							var _0 = port_get_direction(_wire,free_ports_array[0,port_object])
							var _1 = port_get_direction(_wire,free_ports_array[1,port_object])
							
							//	Straight
							if (abs(_0[0]) == abs(_1[0])) or (abs(_0[1]) == abs(_1[1])) {
								_wire.straight = true
							} else {
								_wire.straight = false	
							}						
							#endregion
							_wire.sprite = _wire.sprites[_wire.straight]
							if _wire.straight {
								_wire.rotation = cell_direction(_wire.center_cell_x,_wire.center_cell_y,center_cell_x,center_cell_y)
							} else {
								_wire.rotation = corner_rotation(_wire,free_ports_array)	
							}
						} else if free_ports == 1 {
							_wire.straight = true	
							_wire.rotation = cell_direction(_wire.center_cell_x,_wire.center_cell_y,center_cell_x,center_cell_y)
							var array = port_get_direction(_wire,id)
							repeat(2) {
								var _index = ds_list_find_index(gridController.grid_port_objects,_wire)
								ds_list_delete(gridController.grid_port_objects,_index)
								ds_list_delete(gridController.grid_port_x,_index)
								ds_list_delete(gridController.grid_port_y,_index)
							}
							if gridController.grid_items[# _wire.ports[port_index,port_x], _wire.ports[port_index,port_y]] == -2 
							gridController.grid_items[# _wire.ports[port_index,port_x], _wire.ports[port_index,port_y]] = -1
							
							_wire.ports[port_index,port_x] = _wire.center_cell_x + array[0]
							_wire.ports[port_index,port_y] = _wire.center_cell_y + array[1]
							gridController.grid_items[# _wire.ports[port_index,port_x], _wire.ports[port_index,port_y]] = -2
							port_index = !port_index
							if gridController.grid_items[# _wire.ports[port_index,port_x], _wire.ports[port_index,port_y]] == -2 
							gridController.grid_items[# _wire.ports[port_index,port_x], _wire.ports[port_index,port_y]] = -1
							_wire.ports[port_index,port_x] = _wire.center_cell_x + (array[0]*-1)
							_wire.ports[port_index,port_y] = _wire.center_cell_y + (array[1]*-1)
							gridController.grid_items[# _wire.ports[port_index,port_x], _wire.ports[port_index,port_y]] = -2
						}
						
					}						
				} else {
					port[i] = -1	
				}
			}
		}
	
		// Placement
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
				if port[_p] > 0 {
					ports[_p,port_object] = port[_p]
					debug_log("Connecting "+string(port[_p])+" to Port["+string(_p)+"]")
				}
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