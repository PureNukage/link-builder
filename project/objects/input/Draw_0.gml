if selection_x1 > -1 and selection_y1 > -1 and selection_x2 > -1 and selection_y2 > -1 {
	var w1 = min(selection_cell_x1, selection_cell_x2)
	var h1 = min(selection_cell_y1, selection_cell_y2)
	var w2 = max(selection_cell_x1, selection_cell_x2)
	var h2 = max(selection_cell_y1, selection_cell_y2)
	draw_set_color(c_white)
	draw_set_alpha(.25)
	for(var w=w1;w<=w2;w++) {
		for(var h=h1;h<=h2;h++) {
			if w > -1 and w < grid_width and h > -1 and h < grid_height {
				var _x = gridController.grid_positions_x[w]
				var _y = gridController.grid_positions_y[h]
				var buffer = 4
				draw_rectangle(_x+buffer,_y+buffer,_x+cell_width-buffer,_y+cell_height-buffer,false)
			}
		}	
	}
}
draw_set_alpha(1)