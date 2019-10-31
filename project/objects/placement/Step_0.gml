x = mouse_x - 80
y = mouse_y - 80

var a = 160
if !place_snapped(a,a) {
	move_snap(a,a)	
}

if input.mouse_left_press and shop.button_mouseover = 0 and shop.menu_mouseover = 0 {
	gridController.grid[# gridController.grid_mouse_w, gridController.grid_mouse_h] = type
	instance_destroy()
}

if input.mouse_right_press {
	instance_destroy()	
}