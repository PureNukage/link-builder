///@param width
///@param height

var _width = argument[0]
var _height = argument[1]

app.resolution_width = _width
app.resolution_height = _height

with camera {
	var _center = false
	if app.resolution_width != _width _center = true else _center = false
	camera_refresh(_width,_height)
	scale_canvas(base_width,base_height,_width,_height,_center)
	display_set_gui_size(_width,_height)
	//if instance_exists(plaque) with plaque plaque_refresh()
	//if instance_exists(contracts) with contracts contract_refresh()
}