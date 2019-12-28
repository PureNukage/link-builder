if selection_x1 > -1 and selection_y1 > -1 and selection_x2 > -1 and selection_y2 > -1 {
	draw_set_color(c_black)
	draw_rectangle(selection_x1,selection_y1,selection_x2,selection_y2,true)	
}