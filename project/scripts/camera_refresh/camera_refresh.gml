with camera {
	base_width = app.resolution_width
	base_height = app.resolution_height
	width = base_width
	height = base_height
	
	var viewmat = matrix_build_lookat(width,height,-10,width,height,0,0,1,0)
	var projmat = matrix_build_projection_ortho(width,height,1.0,32000.0)

	camera_set_view_mat(Camera,viewmat)
	camera_set_proj_mat(Camera,projmat)
	
	camera_set_view_size(Camera,width,height)
	camera_set_view_border(Camera,width,height)
}