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
					draw_roundrect(_x0+3,_y0+3,_x1-3,_y1-3,false)
				}
				
			}	
	
			if cell_x1 == -1 and cell_y1 == -1 {
				//	Draw the item
				sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2)
				draw_sprite_ext(sprite,0,x,y,1,1,rotation,c_white,1)	
			}
	
			//if cell_x1 > -1 and cell_y1 > -1 {
			//	var _x = gridController.grid_positions_x[cell_x1]+(cell_width/2)
			//	var _y = gridController.grid_positions_y[cell_y1]+(cell_height/2)
			//	draw_path(path,_x,_y,true)	
			//}
	
		break
	#endregion
	
	#region Limbo
		case states.limbo:
		
			//	Draw the item
			sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2)
			draw_sprite_ext(sprite,0,x,y,1,1,rotation,color,1)
			
			if pos == 0 or pos == path_get_number(ID.path)-1 {
				draw_sockets_wire_limbo()
			}
			
		break
	#endregion
	
	#region Placed
		case states.placed:
		
			if selected {
				draw_set_alpha(.25)
				draw_set_color(c_white)
				var buffer = 4
				for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
					for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
						if w > -1 and w < grid_width and h > -1 and h < grid_height {
							var x1 = gridController.grid_positions_x[w]
							var y1 = gridController.grid_positions_y[h]
							var x2 = x1+cell_width
							var y2 = y1+cell_height
							draw_rectangle(x1+buffer,y1+buffer,x2-buffer,y2-buffer,false)	
						}
					}
				}
				draw_set_alpha(1)
			}
		
			draw_sockets_wire()
		
			sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2)
			draw_sprite_ext(sprite,0,x,y,1,1,rotation,color,1)
		
		break
	#endregion
}