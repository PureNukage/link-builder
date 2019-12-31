x += (keyboard_check(ord("D")) - keyboard_check(ord("A")))*panspeed
y += (keyboard_check(ord("S")) - keyboard_check(ord("W")))*panspeed

#region Zooming Up and Down

	zoom_level = clamp((zoom_level + (mouse_wheel_down()-mouse_wheel_up())*0.1),0.1,1.5)

	camera_set_view_pos(Camera,
	        clamp( camera_get_view_x(Camera), 0, room_width - camera_get_view_width(Camera) ),
	        clamp( camera_get_view_y(Camera), 0, room_height - camera_get_view_height(Camera) ));

	var view_w = camera_get_view_width(Camera)
	var view_h = camera_get_view_height(Camera)

	var rate = 0.2

	var new_w = lerp(view_w, zoom_level *  default_zoom_width, rate)
	var new_h = lerp(view_h, zoom_level * default_zoom_height, rate)

	camera_set_view_size(Camera, new_w, new_h)

	//ReAlignment
	var shift_x = camera_get_view_x(Camera) - (new_w - view_w) * 0.5
	var shift_y = camera_get_view_y(Camera) - (new_h - view_h) * 0.5

	camera_set_view_pos(Camera,shift_x, shift_y)

#endregion

if camera_mode == 0 {
	var edgeX = camera_get_view_width(Camera)/2
	var edgeY = camera_get_view_height(Camera)/2
	x = clamp(x,0+edgeX,room_width-edgeX)
	y = clamp(y,0+edgeY,room_height-edgeY)
} else {
	if point_distance(x,y,display_get_gui_width()/2,display_get_gui_height()/2) < 64 {
		camera_mode = 0	
	}
}

//	Edge Pan Checks
var panX, panY
edgeX = camera_get_view_border_x(Camera)/8
edgeY = camera_get_view_border_y(Camera)/8
if mouse_gui_x > camera_get_view_border_x(Camera)-edgeX {
	panX = 1	
} else if mouse_gui_x < 0+edgeX {
	panX = -1	
} else {
	panX = 0	
}
if mouse_gui_y > camera_get_view_border_y(Camera)-edgeY {
	panY = 1	
} else if mouse_gui_y < 0+edgeY {
	panY = -1
} else {
	panY = 0	
}

//	Check if we're moused over any gui elements before applying pan
if shop.menu_open == 0 and contracts.button_open == 0 {
	y += panY * panspeed 
	x += panX * panspeed
}