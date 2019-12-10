enum states {
	placement,
	placed,
	limbo,
	
}

enum mode {
	off,
	grid,
	object
	
	
}

#macro in 0
#macro out 1
#macro port_object 0
#macro port_direction 1
#macro port_x 2
#macro port_y 3

#macro gui_mouse_x device_mouse_x_to_gui(0)
#macro gui_mouse_y device_mouse_y_to_gui(0)