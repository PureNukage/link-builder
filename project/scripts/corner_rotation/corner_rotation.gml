///@param id
///@param ports

var _id = argument[0]
var _ports = argument[1]

var port0_direction = port_get_direction(_id,_ports[0,port_object])
var port1_direction = port_get_direction(_id,_ports[1,port_object])

var _right = 0
var _down = 0
var _left = 0
var _up = 0

var _rotation = -1

//	Is a port on the left?
if port0_direction[0] > 0 or port1_direction[0] > 0 {
	_left = 1	
}
//	Is a port on the right?
if port0_direction[0] < 0 or port1_direction[0] < 0 {
	_right = 1
}
//	Is a port above us?
if port0_direction[1] > 0 or port1_direction[1] > 0 {
	_up = 1	
}
//	Is a port under us?
if port0_direction[1] < 0 or port1_direction[1] < 0 {
	_down = 1	
}

if _up and _right {
	_rotation = 0
}
if _right and _down {
	_rotation = 270
}
if _down and _left {
	_rotation = 180	
}
if _left and _up {
	_rotation = 90
}

return _rotation