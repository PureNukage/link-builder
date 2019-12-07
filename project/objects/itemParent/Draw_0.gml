switch(states)
{

	case states.placement:
		
		//	Draw the grid outline
		if (topleft_cell_x > -1 and topleft_cell_x < grid_width+1) and 
		(topleft_cell_y > -1 and topleft_cell_y < grid_height+1) and 
		(bottomright_cell_x > -1 and bottomright_cell_x < grid_width+1) and
		(bottomright_cell_y > -1 and bottomright_cell_y < grid_height+1) {
			var _x0 = my_cells_x[0]
			var _y0 = my_cells_y[0]
			var _x1 = my_cells_x[size_width-1]
			var _y1 = my_cells_y[size_height-1]
			_x1 += cell_width
			_y1 += cell_height
			
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
		for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
			for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
				
				if (w > -1 and w < grid_width+1) and (h > -1 and h < grid_height+1) {
					if gridController.grid_items[# w, h] == -1 {
						draw_set_color(c_green)	
					} else {
						draw_set_color(c_red)	
					}
				
					var _x = gridController.grid_positions_x[w]
					var _y = gridController.grid_positions_y[h]
					draw_set_alpha(.33)
					draw_roundrect(_x+3,_y+3,_x+cell_width-3,_y+cell_height-3,false)
					draw_set_alpha(1)
				}
			}
		}
		
		//	Draw the item
		sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2)
		draw_sprite(sprite,-1,x,y)
		

	break
	case states.placed:
	
		//	Draw the item
		sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2)
		draw_sprite(sprite,-1,x,y)
	
	
	break
	
}