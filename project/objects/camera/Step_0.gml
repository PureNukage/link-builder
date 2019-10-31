x += (keyboard_check(ord("D")) - keyboard_check(ord("A")))*panspeed
y += (keyboard_check(ord("S")) - keyboard_check(ord("W")))*panspeed

#region Zooming Up and Down

	zoom_level = clamp((zoom_level + (mouse_wheel_down()-mouse_wheel_up())*0.1),0.1,1.5)

	camera_set_view_pos(camera,
	        clamp( camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera) ),
	        clamp( camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera) ));

	var view_w = camera_get_view_width(cam)
	var view_h = camera_get_view_height(cam)

	var rate = 0.2

	var new_w = lerp(view_w, zoom_level *  default_zoom_width, rate)
	var new_h = lerp(view_h, zoom_level * default_zoom_height, rate)

	camera_set_view_size(cam, new_w, new_h)

	//ReAlignment
	var shift_x = camera_get_view_x(cam) - (new_w - view_w) * 0.5
	var shift_y = camera_get_view_y(cam) - (new_h - view_h) * 0.5

	camera_set_view_pos(cam,shift_x, shift_y)

#endregion

var edgeX = camera_get_view_width(cam)/2
var edgeY = camera_get_view_height(cam)/2
x = clamp(x,0+edgeX,room_width-edgeX)
y = clamp(y,0+edgeY,room_height-edgeY)

//	Edge Pan Checks
var panX, panY
edgeX = camera_get_view_border_x(cam)/8
edgeY = camera_get_view_border_y(cam)/8
if mouse_gui_x > camera_get_view_border_x(cam)-edgeX {
	panX = 1	
} else if mouse_gui_x < 0+edgeX {
	panX = -1	
} else {
	panX = 0	
}
if mouse_gui_y > camera_get_view_border_y(cam)-edgeY {
	panY = 1	
} else if mouse_gui_y < 0+edgeY {
	panY = -1
} else {
	panY = 0	
}

//	Check if we're moused over any gui elements before applying pan
var _shopmenu = 0
if shopmenu.menu_mouseover = 1 and shopmenu.open = 1 _shopmenu = 1 else _shopmenu = 0
if shopmenu.button_mouseover == 0 and _shopmenu = 0 {
	y += panY * panspeed 
	x += panX * panspeed
}