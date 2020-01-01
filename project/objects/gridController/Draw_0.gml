draw_set_color(c_white)
draw_set_alpha(.05)
for(var w=0;w<grid_width;w++) {
	for(var h=0;h<grid_height;h++) {
		if gridController.grid_fog[# w, h] > 0 {
			var _xx = gridController.grid_positions_x[w]
			var _yy = gridController.grid_positions_y[h]
			draw_rectangle(_xx,_yy,_xx+cell_width,_yy+cell_height,true)	
		}
	}
}
draw_set_alpha(1)