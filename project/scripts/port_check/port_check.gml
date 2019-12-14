var _x1 = argument[0]
var _y1 = argument[1]

var found = 0
for(var _object=0;_object<ds_list_size(gridController.grid_port_objects);_object++) {
	
	var _x = gridController.grid_port_x[| _object]
	var _y = gridController.grid_port_y[| _object]
	//	This cell is a port!
	if _x == _x1 and _y == _y1 {
		var connected_object = gridController.grid_port_objects[| _object]
		return connected_object
		found = 1
	}
}
if found == 0 return false
