event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
		
			draw_sockets_item()
			
			//	Draw the stand
			sprite_set_offset(s_chainlink_stand,sprite_get_width(s_chainlink_stand)/2-1,sprite_get_height(s_chainlink_stand)/2-1)
			draw_sprite(s_chainlink_stand,-1,x,y)
		
			//	Draw the node
			sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
			draw_sprite(sprite,-1,x,y)
		
			//	Draw the node used
			draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha)
		
		
		break
	#endregion
	
	#region Placed
	case states.placed:
		
		draw_sockets_item()
			
		//	Draw the stand
		sprite_set_offset(s_chainlink_stand,sprite_get_width(s_chainlink_stand)/2-1,sprite_get_height(s_chainlink_stand)/2-1)
		draw_sprite(s_chainlink_stand,-1,x,y)
		
		//	Draw the node
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)
		
		//	Draw the node used
		draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha)
		
		//	Draw the possible port cells if we're selected and input is in port_placement mode
		if input.selection_mode == selection_mode.port_placement and selected {
				
			//	Loop through cells, only draw the possible port cells
			for(var w=topleft_cell_x-1;w<topleft_cell_x+size_width+1;w++) {
				for(var h=topleft_cell_y-1;h<topleft_cell_y+size_height+1;h++) {
					if w > -1 and w < grid_width and h > -1 and h < grid_height {
						if w == topleft_cell_x-1 and (h != topleft_cell_y-1 and h != bottomright_cell_y+1) 
						or w == bottomright_cell_x+1 and (h != bottomright_cell_y+1 and h != topleft_cell_y-1) 
						or h == topleft_cell_y-1 and w != topleft_cell_x-1 and w != bottomright_cell_x+1 
						or h == bottomright_cell_y+1 and w != bottomright_cell_x+1 and w != topleft_cell_x-1 { 
							if gridController.grid_items[# w, h] == -1 {
								draw_set_color(c_yellow)
								var _xx = gridController.grid_positions_x[w]
								var _yy = gridController.grid_positions_y[h]
								draw_rectangle(_xx+3,_yy+3,_xx+cell_width-3,_yy+cell_height-3,false)
							}
						}	
					}
				}
			}		
		}
		
	break
	#endregion
}