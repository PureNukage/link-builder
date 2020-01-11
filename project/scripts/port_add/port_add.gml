///@param x
///@param y
///@param id

var _x = argument[0]
var _y = argument[1]
var _id = argument[2]

var this_port = _id.ports_count
_id.ports_count++

_id.ports[this_port,port_direction] = -1
_id.ports[this_port,port_object] = -1
_id.ports[this_port,port_x] = _x
_id.ports[this_port,port_y] = _y
_id.ports[this_port,port_x_diff] = _id.ports[this_port,port_x] - _id.center_cell_x 
_id.ports[this_port,port_y_diff] = _id.ports[this_port,port_y] - _id.center_cell_y
_id.sockets[this_port] = -1
ds_list_add(gridController.grid_port_objects,_id)
ds_list_add(gridController.grid_port_x,_id.ports[this_port,port_x])
ds_list_add(gridController.grid_port_y,_id.ports[this_port,port_y])

debug_log("Creating Port["+string(this_port)+"] at xy: "+string(_x)+","+string(_y))