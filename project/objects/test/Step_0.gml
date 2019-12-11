x = mouse_x
y = mouse_y

if input.rotate_right or input.rotate_left {
	grid_rotation(input.rotate_right - input.rotate_left,mygrid)
}