mouse_left_press = mouse_check_button_pressed(mb_left)
mouse_left = mouse_check_button(mb_left)
mouse_left_release = mouse_check_button_released(mb_left)

mouse_right_press = mouse_check_button_pressed(mb_right)

space = keyboard_check_pressed(vk_space)

rotate_right = keyboard_check_pressed(ord("E")) //or mouse_wheel_down()
rotate_left = keyboard_check_pressed(ord("Q")) //or mouse_wheel_up()

control_press = keyboard_check_pressed(vk_control)

#region Calculating grid_x,y and grid_moved 
	var _x = gridController.grid_start_x
	var _y = gridController.grid_start_y
	for(var _w=0;_w<grid_width;_w++) {
		_y = gridController.grid_start_y
		for(var _h=0;_h<grid_height;_h++) {
				if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+cell_width,_y+cell_height) {
					grid_xprevious = grid_x
					grid_yprevious = grid_y
					grid_x = _w
					grid_y = _h
					if grid_xprevious != grid_x or grid_yprevious != grid_y {
						grid_moved = true	
					} else {
						grid_moved = false
					}	
					exit
				} else {
					if _w == grid_width and _h == grid_height {
						grid_xprevious = grid_x
						grid_yprevious = grid_y
						grid_x = -1
						grid_y = -1
						if grid_xprevious != grid_x or grid_yprevious != grid_y {
							grid_moved = true	
						} else {
							grid_moved = false
						}
					}
				}
			_y += cell_height
		}
		_x += cell_width
	}
#endregion