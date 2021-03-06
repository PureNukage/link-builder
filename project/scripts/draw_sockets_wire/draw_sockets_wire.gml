for(var p=0;p<ports_count;p++) {
	var _w = ports[p,port_x]
	var _h = ports[p,port_y]
					
	if _w > -1 and _w < grid_width and _h > -1 and _h < grid_height {
		
		var directionX = 0
		var directionY = 0
		var _rotation = 0
		
		//	Right side
		if _w == bottomright_cell_x+1 {
			directionX = 1
			_rotation = 0
		}	
		//	Bottom side
		else if _h == bottomright_cell_y+1 {
			directionY = 1
			_rotation = 270
		}
		//	Left side
		else if _w == topleft_cell_x-1 {
			directionX = -1
			_rotation = 180
		}
		//	Top side
		else if _h == topleft_cell_y-1 {
			directionY = -1
			_rotation = 90
		}	
		
		var _x = gridController.grid_positions_x[_w]+(cell_width/2)-(directionX*15)
		var _y = gridController.grid_positions_y[_h]+(cell_height/2)-(directionY*15)
		
		if directionX > 0 or directionX < 0 _x -= directionX*0
		if directionY > 0 or directionY < 0 _y -= directionY*0
			
		var _sprite = -1
		if sockets[p] == -1 {
			_sprite = s_wire_socket
			//debug_log(string(id)+" sockets["+string(p)+"] is: "+string(sockets[p]))
		} else {
			if sockets[p] > -1 and instance_exists(sockets[p]) and sockets[p].object_index != wire {
				_sprite = s_wire_socket_connected	
				//debug_log(string(id)+" sockets["+string(p)+"] is: "+string(sockets[p]))
			} else if sockets[p] > -1 and instance_exists(sockets[p]) and sockets[p].object_index == wire {
				_sprite = -1
				//debug_log(string(id)+" sockets["+string(p)+"] is: "+string(sockets[p]))
			}
		}
		
		if _sprite != -1 {
			sprite_set_offset(_sprite,sprite_get_width(_sprite)/2,sprite_get_height(_sprite)/2)
			draw_sprite_ext(_sprite,0,_x,_y,1,1,_rotation,color,1)	
		}
	}
}