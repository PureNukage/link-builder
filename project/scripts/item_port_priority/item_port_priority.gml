for(var p=0;p<ports_count;p++) {
	if ports[p,port_object] == -1 {
		var _x = ports[p,port_x]
		var _y = ports[p,port_y]
		gridController.grid_items[# _x, _y] = -2
	}
}