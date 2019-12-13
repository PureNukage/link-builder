x = mouse_x
y = mouse_y

if input.rotate_right or input.rotate_left {
	var _direction = input.rotate_right - input.rotate_left
	grid_rotation(_direction,mygrid)
	width = width + height
	height = width - height
	width = width - height
}