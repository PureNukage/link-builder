switch(mode)
{
	case mode.off:
	
	break
	case mode.object:	//	Object Variables
	
	var _y = 32
	var _x = 256
	draw_set_color(c_white)
	
	draw_text(_x,_y,"GENERAL")													_y += 15 
	draw_text(_x,_y,"mouse_gui_x: "+string(mouse_gui_x))						_y += 15 
	draw_text(_x,_y,"mouse_gui_y: "+string(mouse_gui_y))						_y += 15 
																				_y += 15
	draw_text(_x,_y,"grid x: "+string(input.grid_x))							_y += 15 
	draw_text(_x,_y,"grid y: "+string(input.grid_y))							_y += 15
																				_y += 15
	draw_text(_x,_y,"gui layer width: "+string(display_get_gui_width()))		_y += 15 
	draw_text(_x,_y,"gui layer height: "+string(display_get_gui_height()))		_y += 15 
	
	
																				_y += 15
	with camera {
		draw_text(_x,_y,"CAMERA")												_y += 15 
		draw_text(_x,_y,"camera view border x: "+string(camera_get_view_border_x(Camera)))	_y += 15 
		draw_text(_x,_y,"camera view border y: "+string(camera_get_view_border_y(Camera)))	_y += 15 
																				_y += 15
		draw_text(_x,_y,"edgeX: "+string(camera_get_view_width(Camera)/2))		_y += 15 
		draw_text(_x,_y,"edgeY: "+string(camera_get_view_height(Camera)/2))		_y += 15 
		
	}
	
	break
}