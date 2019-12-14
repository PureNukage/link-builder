//event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
		
			//	Draw the grid outline
			if (input.grid_x > -1 and input.grid_x < grid_width) and (input.grid_y > -1 and input.grid_y < grid_height) {
				var _x0 = gridController.grid_positions_x[input.grid_x]
				var _y0 = gridController.grid_positions_y[input.grid_y]
				var _x1 = _x0 + cell_width
				var _y1 = _y0 + cell_height
			
				if placeable {
					draw_set_color(c_black)
				} else {
					draw_set_color(c_red)	
				}
			
				draw_set_alpha(.33)
				draw_roundrect(_x0,_y0,_x1,_y1,true)
				draw_roundrect(_x0+1,_y0+1,_x1-1,_y1-1,true)	
				draw_set_alpha(1)
			
			}
		
			//	Draw the individual cells
			if debug.mode != mode.grid {
				if (input.grid_x > -1 and input.grid_x < grid_width) and (input.grid_y > -1 and input.grid_y < grid_height) {
					if gridController.grid_items[# center_cell_x, center_cell_y] < 0 {
						draw_set_color(c_green)	
					} else {
						draw_set_color(c_red)	
					}
				
					//var _x0 = gridController.grid_positions_x[center_cell_x]
					//var _y0 = gridController.grid_positions_y[center_cell_y]
					//var _x1 = _x0 + cell_width
					//var _y1 = _y1 + cell_height
					draw_roundrect(_x0+3,_y0+3,_x1-3,_y1-3,false)
				}
				
			}	
	
			if cell_x1 == -1 and cell_y1 == -1 {
				//	Draw the item
				sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
				draw_sprite_ext(sprite,0,x,y,1,1,rotation,c_white,1)	
			}
	
			if cell_x1 > -1 and cell_y1 > -1 {
				var _x = gridController.grid_positions_x[cell_x1]+(cell_width/2)
				var _y = gridController.grid_positions_y[cell_y1]+(cell_height/2)
				draw_path(path,_x,_y,true)	
			}
	
	
			//if !ds_list_empty(path_points_x) {
			//	for(var i=0;i<ds_list_size(path_points_x);i++) {
				
			//		var w = path_points_x[| i]
			//		var h = path_points_y[| i]
			//		var _xx = gridController.grid_positions_x[w]
			//		var _yy = gridController.grid_positions_y[h]
				
			//		if gridController.grid_items[# w,h] == -1 {
			//			draw_set_color(c_green)	
			//		} else {
			//			draw_set_color(c_red)	
			//		}
			//		draw_set_alpha(.33)
			//		draw_roundrect(_xx+3,_yy+3,_xx+cell_width-3,_yy+cell_height-3,false)
			//		draw_set_alpha(1)
				
			//		draw_sprite_ext(s_wire,0,_xx+(cell_width/2),_yy+(cell_height/2),1,1,path_objects[| i].rotation,c_white,1)
				
			//	}
			
			
			//}
	
		break
	#endregion
	
	#region Limbo
		case states.limbo:
			
			draw_sprite_ext(sprite,0,x,y,1,1,rotation,c_white,1)
			
		break
	#endregion
	
	#region Placed
		case states.placed:
		
			draw_sprite_ext(sprite,0,x,y,1,1,rotation,c_white,1)
		
		break
	#endregion
}