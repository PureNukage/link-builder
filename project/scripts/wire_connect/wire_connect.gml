///@param portID
///@param cell_x
///@param cell_y

var _port = argument[0]
var cell_x = argument[1]
var cell_y = argument[2]

	
if _port > 0 {
		
	var _object_index = _port.object_index
		
	//	Setting the port I'm connecting to
	for(var p=0;p<_port.ports_count;p++) {
		if _port.ports[p,port_x] == cell_x and _port.ports[p,port_y] == cell_y {
			if _port.ports[p,port_object] > 0 debug_log("ERROR already an object in this port!")
			_port.ports[p,port_object] = id
			with _port debug_log("Just set port["+string(p)+"] to "+string(other.id))
		}
	}
		
	//	Setting my own ports
	for(var my_p=0;my_p<ports_count;my_p++) {
		var _x = ports[my_p,port_x]
		var _y = ports[my_p,port_y]

		for(var w=_port.topleft_cell_x;w<_port.topleft_cell_x+_port.size_width;w++) {
			for(var h=_port.topleft_cell_y;h<_port.topleft_cell_y+_port.size_height;h++) {
				if _x == w and _y == h {
					if ports[my_p,port_object] > 0 debug_log("ERROR already an object in this port!")
					ports[my_p,port_object] = _port
					debug_log("Just set port["+string(my_p)+"] to "+string(_port))
				}	
			}
		}

	}
		
		
}
