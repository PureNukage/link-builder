//	Switch modes
if input.control_press {
	mode++
	if mode > 1 mode = 0
}

if input.space {
	
	app.world_width = 3840
	app.world_height = 3840
	//room_restart()
	with all {
		if object_index == app or object_index == camera {
			
		} else {
			instance_destroy()	
		}
	}
	instance_create_layer(0,0,"Instances",game)
	
	create_textbox("Poop")
	
}

switch(mode)
{
	#region Grid
	case mode.grid:
		//	If mouse is over debug window
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,window_gridX,window_gridY,window_gridX+window_grid_width,window_gridY+window_grid_height) {
			if input.mouse_left_press {
				window_grid_offsetX = gui_mouse_x - window_gridX
				window_grid_offsetY = gui_mouse_y - window_gridY
				window_grid_pressed = true
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
				button_systemsX = window_gridX + 16
				button_systemsY = window_gridY + button_mpgrid_height + 32
				window_grid_pressed = true
			}
		
			if input.mouse_left_release {
				window_grid_offsetX = -1
				window_grid_offsetY = -1
				button_mpgridX = window_gridX + 16
				button_mpgridY = window_gridY + 16
				window_grid_pressed = false
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
			
			//	If mouse is over button_systems
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,button_systemsX,button_systemsY,button_systemsX+button_systems_width,button_systemsY+button_systems_height) {
			
				button_systems_mouseover = true
				button_systems_color = button_systems_color_mouseover
				if input.mouse_left_press { 
					button_systems_color = button_systems_color_pressed
					draw_systems = !draw_systems
				}
			
			} 
			//	Mouse is not over button_systems
			else {
				button_systems_mouseover = false	
				button_systems_color = button_systems_color_free
			}
			
			
		}
		
		//	Variable window logic
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,window_variableX,window_variableY,window_variableX+window_variable_width,window_variableY+window_variable_height) {
				
				if input.mouse_left_press {
					window_variable_offsetX = gui_mouse_x - window_variableX
					window_variable_offsetY = gui_mouse_y - window_variableY
					window_variable_pressed = true
				}
				
				if input.mouse_left {
					if window_variable_offsetX == -1 or window_variable_offsetY == -1 {
						window_variable_offsetX = gui_mouse_x - window_variableX
						window_variable_offsetY = gui_mouse_y - window_variableY	
					}
					window_variableX = gui_mouse_x - window_variable_offsetX
					window_variableY = gui_mouse_y - window_variable_offsetY
					window_variable_pressed = true
				}
				
				if input.mouse_left_release {
					window_variable_offsetX = -1
					window_variable_offsetY = -1
					window_variable_pressed = false
				}
				
			}
		
		
	break
	#endregion
}