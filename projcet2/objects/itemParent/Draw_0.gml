switch(states)
{

	case states.placement:
	
		//	Draw the item
		sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2)
		draw_sprite(sprite,-1,x,y)

		//	Draw the grid outline
		var _x0 = my_cells_x[# 0, 0]
		var _y0 = my_cells_y[# 0, 0]
		var _x1 = my_cells_x[# ds_grid_width(my_cells_x)-1, 0]
		var _y1 = my_cells_y[# 0, ds_grid_height(my_cells_y)-1]
		draw_rectangle(_x0,_y0,_x1,_y1,true)
		
	break
	
}