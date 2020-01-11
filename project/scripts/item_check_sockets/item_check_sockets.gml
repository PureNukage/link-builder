for(var p=0;p<ports_count;p++) {
	var _x = ports[p,port_x] 
	var _y = ports[p,port_y]
	
	if _x > -1 and _x < grid_width and _y > -1 and _y < grid_height {
				
		//	disconnect the socket if we already had one
		if sockets[p] > -1 and ports[p,port_object] == -1 {
			with sockets[p] {
				for(var pp=0;pp<other.sockets[p].ports_count;pp++) {
					//	disconnect the sockets socket
					if other.sockets[p].sockets[pp] > -1 and other.sockets[p].ports[pp,port_object] == -1 {
						other.sockets[p].sockets[pp] = -1	
					}
				}
			}
			sockets[p] = -1
		}
				
		//  there is an item at this port, my port is free and I'm placeable
		if gridController.grid_objects[# _x, _y] > -1 and ports[p,port_object] == -1  and placeable {
			//	does this item have its port where it needs to be?
			//	first lets find the direction this item is in
			var _item = gridController.grid_objects[# _x, _y]
			var array = port_get_direction(id,_item)
			var target_x = _x + array[0]
			var target_y = _y + array[1]
					
			for(var other_p=0;other_p<_item.ports_count;other_p++) {
				//	we're connecting to this object 
				if _item.ports[other_p,port_x] == target_x and _item.ports[other_p,port_y] == target_y  and _item.ports[other_p,port_object] == -1 {
					sockets[p] = _item	
					_item.sockets[other_p] = id
					debug_log("Soft connecting "+object_get_name(object_index)+" to "+object_get_name(_item.object_index))

				}
			}
					
					
		}
	}
}