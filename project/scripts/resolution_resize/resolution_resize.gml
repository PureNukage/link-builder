///@param width
///@param height

var _width = argument[0]
var _height = argument[1]

with camera {
	//width = _width
	//height = _height
	//	Camera stuff
	camera_set_view_size(Camera,_width,_height)
	camera_set_view_border(Camera,_width,_height)
	scale_canvas(base_width,base_height,_width,_height,true)
	display_set_gui_size(_width,_height)
}