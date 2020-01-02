draw_set_color(c_black)
draw_set_alpha(.05)
if camera.zoom_level <= .7 {
	for(var w=0;w<grid_width;w++) {
		for(var h=0;h<grid_height;h++) {
			if gridController.grid_fog[# w, h] > 0 {
				var _xx = gridController.grid_positions_x[w]
				var _yy = gridController.grid_positions_y[h]
				draw_rectangle(_xx,_yy,_xx+cell_width,_yy+cell_height,true)	
				draw_rectangle(_xx+1,_yy+1,_xx+cell_width-1,_yy+cell_height-1,true)
			}
		}
	}
}
draw_set_alpha(1)