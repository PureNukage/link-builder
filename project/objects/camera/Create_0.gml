var _width = 1280
var _height = 720

#region Enabling Use of Views

	view_enabled = true

	view_set_visible(0,true)

	view_set_wport(0,_width)
	view_set_hport(0,_height)

#endregion
#region Resize and Center Game Window

	window_set_rectangle((display_get_width()-view_wport[0])*0.5,(display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0])
	
	surface_resize(application_surface,view_wport[0],view_hport[0])
	
	display_set_gui_size(_width,_height)


#endregion
#region Camera Create

	Camera = camera_create()

	var viewmat = matrix_build_lookat(_width,_height,-10,_width,_height,0,0,1,0)
	var projmat = matrix_build_projection_ortho(_width,_height,1.0,32000.0)

	camera_set_view_mat(Camera,viewmat)
	camera_set_proj_mat(Camera,projmat)
	
	camera_set_view_pos(Camera,x,y)
	camera_set_view_size(Camera,_width,_height)
	
	camera_set_view_speed(Camera,200,200)
	camera_set_view_border(Camera,_width,_height)
	
	camera_set_view_target(Camera,id)

	view_camera[0] = Camera
	
#endregion

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)

panspeed = 10

zoom_level = 1
default_zoom_width = camera_get_view_width(Camera)
default_zoom_height = camera_get_view_height(Camera)

camera_mode = 0