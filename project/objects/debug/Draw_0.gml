switch(mode) 
{
	case mode.off:
	
	break
	
	#region Grid
		case mode.grid:	
	
			with gridController {
			
				for(var _w=0;_w<grid_width;_w++) {
					for(var _h=0;_h<grid_height;_h++) {
						var _x = grid_positions_x[_w]
						var _y = grid_positions_y[_h]
					
						//	Draw cell outline
						draw_set_alpha(.33)
						draw_set_color(c_white)
						draw_rectangle(_x,_y,_x+cell_width,_y+cell_width,true)
						draw_set_alpha(1)
					
						//	This cell is not empty
						if grid_items[# _w,_h] != -1 {
							//	This cell contains an item
							if grid_items[# _w,_h] > -1 {
								draw_set_color(c_orange)
							} 
							
							if other.draw_systems and grid_items[# _w, _h] > -1 {
								var _id = grid_objects[# _w, _h]
								var _index = ds_list_find_index(systemController.systems,_id.System)
								draw_set_color(system_colors(_index))
							}
							
							//	This cell contains a port
							else if grid_items[# _w, _h] == -2 {
								draw_set_color(c_purple)	
							}
							
								//	Drawing the rectangle
								draw_set_alpha(.33)
								draw_rectangle(_x+3,_y+3,_x+cell_width-3,_y+cell_height-3,false)
								draw_set_alpha(1)
						}
					}	
				}	
			}
			
			if draw_mp_grid {
				mp_grid_draw(gridController.mp_grid)
			}
		
			if instance_exists(c_item) {
				with c_item {
					
					//	If item is being placed
					if states == states.placement {
						
						#region Draw each cell for an item
						if (topleft_cell_x > -1 and topleft_cell_x < grid_width) and 
						(topleft_cell_y > -1 and topleft_cell_y < grid_height) {
					
							//	Drawing the rectangle of the item
							for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
								for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
							
									var _x = gridController.grid_positions_x[w]
									var _y = gridController.grid_positions_y[h]
									draw_set_color(c_orange)
									draw_set_alpha(.33)
									draw_rectangle(_x+1,_y+1,_x+cell_height,_y+cell_height,false)
									draw_set_alpha(1)
							
								}
							}
						}
						#endregion
						
						#region Draw ports
						
						for(var i=0;i<ports_count;i++) {
							var _w = ports[i,port_x]
							var _h = ports[i,port_y]
							
							if _w > -1 and _w < grid_width and _h > -1 and _h < grid_height {
								var _x1 = gridController.grid_positions_x[_w]
								var _y1 = gridController.grid_positions_y[_h]
								var _x2 = _x1 + cell_width
								var _y2 = _y1 + cell_height
							
								draw_set_color(c_purple)
								draw_set_alpha(.33)
								draw_rectangle(_x1,_y1,_x2,_y2,false)
								draw_set_alpha(1)
							}
						}
						
						#endregion
						
					}
					
					
					#region Draw cell placeable for wire path
					if object_index == wire and !ds_list_empty(path_points_x) {
						for(var i=0;i<ds_list_size(path_points_x);i++) {
						
							var w = path_points_x[| i]
							var h = path_points_y[| i]
							var _xx = gridController.grid_positions_x[w]
							var _yy = gridController.grid_positions_y[h]
						
							if gridController.grid_items[# w,h] == -1 {
								draw_set_color(c_orange)	
							} else {
								draw_set_color(c_red)	
							}
						
							draw_set_alpha(.33)
							draw_roundrect(_xx+3,_yy+3,_xx+cell_width-3,_yy+cell_height-3,false)
							draw_set_alpha(1)
						
						}
					}
					#endregion
				
				
				}
			}
	
		break
	#endregion
	
}