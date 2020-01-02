///@param width
///@param height

var _width = argument[0]
var _height = argument[1]

with camera {
	width = _width
	height = _height
	//	Camera stuff
	camera_set_view_size(Camera,width,height)
	camera_set_view_border(Camera,width,height)
	scale_canvas(base_width,base_height,width,height,true)
	display_set_gui_size(width,height)
}