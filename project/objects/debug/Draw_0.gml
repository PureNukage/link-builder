switch(mode) 
{
	case 0:
	
	break
	case 1:
	
		with gridController {
			
			for(var _w=0;_w<grid_width;_w++) {
				for(var _h=0;_h<grid_height;_h++) {
					var _x = grid_positions_x[_w]
					var _y = grid_positions_y[_h]
					
					//	Draw outline
					draw_set_alpha(.33)
					draw_set_color(c_white)
					draw_rectangle(_x,_y,_x+cell_width,_y+cell_width,true)
					draw_set_alpha(1)
					
					if grid_items[# _w,_h] != -1 {
						draw_set_alpha(.33)
						draw_set_color(c_orange)
						draw_rectangle(_x+3,_y+3,_x+cell_width-3,_y+cell_height-3,false)
						draw_set_alpha(1)
					}
				}	
			}	
		}
		
		if instance_exists(itemParent) {
			with itemParent {
				if states = states.placement {
					if (topleft_cell_x > -1 and topleft_cell_x < grid_width+1) and 
					(topleft_cell_y > -1 and topleft_cell_y < grid_height+1) {
					
						for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
							for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
							
								var _x = gridController.grid_positions_x[w]
								var _y = gridController.grid_positions_y[h]
								draw_set_color(c_orange)
								draw_set_alpha(.33)
								draw_rectangle(_x,_y,_x+cell_height,_y+cell_height,false)
								draw_set_alpha(1)
							
							}
						}
					}
				}
			}
		}
	
	break
}