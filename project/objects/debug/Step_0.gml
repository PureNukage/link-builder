//	Switch modes
if input.control_press {
	mode++
	if mode > 2 mode = 0
}

//	Drag debug window
if mode == mode.grid {
	
	//	If mouse is over debug window
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,window_gridX,window_gridY,window_gridX+window_grid_width,window_gridY+window_grid_height) {
		if input.mouse_left_press {
			window_grid_offsetX = gui_mouse_x - window_gridX
			window_grid_offsetY = gui_mouse_y - window_gridY
		}
		
		if input.mouse_left {
			if window_grid_offsetX == -1 or window_grid_offsetY == -1 {
				window_grid_offsetX = gui_mouse_x - window_gridX
				window_grid_offsetY = gui_mouse_y - window_gridY	
			}
			window_gridX = gui_mouse_x - window_grid_offsetX
			window_gridY = gui_mouse_y - window_grid_offsetY	
			button_mpgridX = window_gridX + 16
			button_mpgridY = window_gridY + 16
		}
		
		if input.mouse_left_release {
			window_grid_offsetX = -1
			window_grid_offsetY = -1
			button_mpgridX = window_gridX + 16
			button_mpgridY = window_gridY + 16
		}
		
		//	If mouse is over button_mpgrid
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,button_mpgridX,button_mpgridY,button_mpgridX+button_mpgrid_width,button_mpgridY+button_mpgrid_height) {
			
			button_mpgrid_mouseover = true
			button_mpgrid_color = button_mpgrid_color_mouseover
			if input.mouse_left_press { 
				button_mpgrid_color = button_mpgrid_color_pressed
				draw_mp_grid = !draw_mp_grid
			}
			
		} 
		//	Mouse is not over button_mpgrid
		else {
			button_mpgrid_mouseover = false	
			button_mpgrid_color = button_mpgrid_color_free
		}
		
		
	}
	
	
}