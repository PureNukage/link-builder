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
	var _center = false
	if app.resolution_width != _width _center = true else _center = false
	scale_canvas(base_width,base_height,_width,_height,_center)
	display_set_gui_size(_width,_height)
	app.resolution_width = _width
	app.resolution_height = _height
	if instance_exists(plaque) with plaque plaque_refresh()
	if instance_exists(contracts) with contracts contract_refresh()
}