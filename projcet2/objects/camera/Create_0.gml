#region Enabling Use of Views

	view_enabled = true

	view_set_visible(0,true)

	view_set_wport(0,1280)
	view_set_hport(0,720)

#endregion
#region Resize and Center Game Window

	window_set_rectangle((display_get_width()-view_wport[0])*0.5,(display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0])
	
	surface_resize(application_surface,view_wport[0],view_hport[0])


#endregion
#region Camera Create

	Camera = camera_create()

	var viewmat = matrix_build_lookat(1280,720,-10,1280,720,0,0,1,0)
	var projmat = matrix_build_projection_ortho(1280,720,1.0,32000.0)

	camera_set_view_mat(Camera,viewmat)
	camera_set_proj_mat(Camera,projmat)
	
	camera_set_view_pos(Camera,x,y)
	camera_set_view_size(Camera,1280,720)
	
	camera_set_view_speed(Camera,-1,-1)
	camera_set_view_border(Camera,32,32)
	
	camera_set_view_target(Camera,id)

	view_camera[0] = Camera
	
#endregion

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)

panspeed = 10

zoom_level = 1
default_zoom_width = camera_get_view_width(Camera)
default_zoom_height = camera_get_view_height(Camera)