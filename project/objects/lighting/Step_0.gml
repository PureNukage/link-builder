//	surfaces are volatile
if surface_exists(surf) {
	surface_set_target(surf)
	
	//	set the dark overlay
	draw_set_color(c_black)
	draw_set_alpha(0.3)
	draw_rectangle(0,0,room_width,room_height,0)
	
	//	setting blend mode to "subtract" is what allows us to cut holes
	gpu_set_blendmode(bm_subtract)
	draw_set_color(c_white)
	draw_set_alpha(.33)
	
	for(var w=0;w<grid_width;w++) {
		for(var h=0;h<grid_height;h++) {
			if gridController.grid_fog[# w, h] > 0 {
				var _xx = gridController.grid_positions_x[w]
				var _yy = gridController.grid_positions_y[h]
				var buffer = -1
				if os_browser == browser_not_a_browser buffer = 1
				else buffer = 0
				draw_rectangle(_xx,_yy,_xx+cell_width-buffer,_yy+cell_height-buffer,false)	
			}
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