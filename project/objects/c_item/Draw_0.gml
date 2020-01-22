switch(states)
{

	case states.placement:
	
		draw_sockets_item()
		
		//	Draw the grid outline
		if mouse_in_grid {
			var xx = gridController.grid_positions_x[topleft_cell_x]
			var yy = gridController.grid_positions_y[topleft_cell_y]
			
			if placeable {
				draw_set_color(c_black)
			} else {
				draw_set_color(c_red)	
			}
			
			draw_set_alpha(.33)	
			draw_roundrect(xx,yy,xx+(size_width*cell_width),yy+(size_height*cell_height),true)
			draw_set_alpha(1)
			
		}
		
		//	Draw the individual cells
		if debug.mode != mode.grid {
		for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
			for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
				
				if (w > -1 and w < grid_width) and (h > -1 and h < grid_height) {
					if gridController.grid_items[# w, h] < 0 or (replace and replace_id == gridController.grid_objects[# w, h]) {
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
		}}		

	break
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
	
	
	break
	
}