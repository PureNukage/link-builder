///	@param x1
/// @param y1

var _x1 = argument[0]
var _y1 = argument[1]

var found = ds_list_create()
for(var _object=0;_object<ds_list_size(gridController.grid_port_objects);_object++) {
	
	var _x = gridController.grid_port_x[| _object]
	var _y = gridController.grid_port_y[| _object]
	//	This cell is a port!
	if _x == _x1 and _y == _y1 {
		var connected_object = gridController.grid_port_objects[| _object]
		ds_list_add(found,connected_object)
	}
}

if ds_list_empty(found) {
	ds_list_destroy(found)
	return -1	
} else {
	return found
}