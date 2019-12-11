var _x = x - 80
var _y = y - 80
for(var w=0;w<5;w++) {
	_y = y - 80
	for(var h=0;h<5;h++) {
		
		//	Draw rectangle
		draw_rectangle(_x,_y,_x+cell_width,_y+cell_height,true)
		
		//	Draw grid value
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(_x+(cell_width/2),_y+(cell_height/2),string(mygrid[# w, h]))
		
		_y += cell_height
		
	}
	_x += cell_width
}	