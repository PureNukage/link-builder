//	surfaces are volatile
if surface_exists(surf) {
	surface_set_target(surf)
	
	//	set the dark overlay
	draw_set_color(c_black)
	draw_set_alpha(0.0)
	draw_rectangle(0,0,room_width,room_height,0)
	
	//	setting blend mode to "subtract" is what allows us to cut holes
	gpu_set_blendmode(bm_subtract)
	draw_set_color(c_white)
	
	//	draw circles in the overlay with your different light sources
	with c_item {
		if states == states.placed {
		
			//draw_set_alpha(1)
			//var distance = (center_cell_x - topleft_cell_x) * (cell_width*2)
			//if distance = 0 distance = 1 * (cell_width*2)
			//var _xx = gridController.grid_positions_x[center_cell_x]+(cell_width/2)
			//var _yy = gridController.grid_positions_y[center_cell_y]+(cell_height/2)

			//draw_circle(_xx,_yy,distance,false)
			
			
		
			//var buffer = 0
			//draw_set_alpha(1)
			//var x1 = gridController.grid_positions_x[topleft_cell_x] + (cell_width/2) - buffer
			//var y1 = gridController.grid_positions_y[topleft_cell_y] + (cell_height/2) - buffer
			//var x2 = gridController.grid_positions_x[bottomright_cell_x] + (cell_width/2) + buffer
			//var y2 = gridController.grid_positions_y[bottomright_cell_y] + (cell_height/2) + buffer
			//draw_rectangle(x1,y1,x2,y2,false)
		
			//buffer = 64
			//draw_set_alpha(.33)
			//var x1 = gridController.grid_positions_x[topleft_cell_x] + (cell_width/2) - buffer
			//var y1 = gridController.grid_positions_y[topleft_cell_y] + (cell_height/2) - buffer
			//var x2 = gridController.grid_positions_x[bottomright_cell_x] + (cell_width/2) + buffer
			//var y2 = gridController.grid_positions_y[bottomright_cell_y] + (cell_height/2) + buffer
			//draw_rectangle(x1,y1,x2,y2,false)
		
			//buffer = 256
			//draw_set_alpha(.10)
			//var x1 = gridController.grid_positions_x[topleft_cell_x] + (cell_width/2) - buffer
			//var y1 = gridController.grid_positions_y[topleft_cell_y] + (cell_height/2) - buffer
			//var x2 = gridController.grid_positions_x[bottomright_cell_x] + (cell_width/2) + buffer
			//var y2 = gridController.grid_positions_y[bottomright_cell_y] + (cell_height/2) + buffer
			//draw_rectangle(x1,y1,x2,y2,false)
		
		}	
	}
	
	//	reset all draw stuff
	gpu_set_blendmode(bm_normal)
	draw_set_alpha(1)
	surface_reset_target()
} else {
	//	create surface
	surf = surface_create(room_width, room_height)

	//	clears the surface, no guarantee a surface doesn't initiate with garbage
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0)

	//	reset to application surface
	surface_reset_target()	
}