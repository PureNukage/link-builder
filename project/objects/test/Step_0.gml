x = mouse_x
y = mouse_y

if input.rotate_right or input.rotate_left {
	var _direction = input.rotate_right - input.rotate_left
	grid_rotation(_direction,mygrid)
	width = width + height
	height = width - height
	width = width - height
	debug_log("size_width: "+string(width)+", size_height: "+string(height))
	for(var w=0;w<width;w++) {
		for(var h=0;h<height;h++) {
			debug_log("x: "+string(w)+", y: "+string(h)+" contains: "+string(mygrid[# w, h]))
		}
	}
}