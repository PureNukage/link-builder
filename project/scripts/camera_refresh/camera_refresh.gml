///@param width
///@param height

var Width = argument[0]
var Height = argument[1]

with camera {
	//base_width = app.resolution_width
	//base_height = app.resolution_height
	//width = base_width
	//height = base_height
	
	width = Width
	height = Height
	
	base_width = app.resolution_width
	base_height = app.resolution_height
	
	var viewmat = matrix_build_lookat(Width,Height,-10,Width,Height,0,0,1,0)
	var projmat = matrix_build_projection_ortho(Width,Height,1.0,32000.0)

	camera_set_view_mat(Camera,viewmat)
	camera_set_proj_mat(Camera,projmat)
	
	camera_set_view_size(Camera,Width,Height)
	camera_set_view_border(Camera,Width,Height)
	
	default_zoom_width = camera_get_view_width(Camera)
	default_zoom_height = camera_get_view_height(Camera)
}