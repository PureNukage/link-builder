for(var p=0;p<ports_count;p++) {
	if ports[p,port_object] == -1 or ports[p,port_object].object_index == wire {
		var _w = ports[p,port_x]
		var _h = ports[p,port_y]
					
		var directionX = -1
		var directionY = -1
					
		directionX = sign(_w - center_cell_x)
		directionY = sign(_h - center_cell_y)
		
		var _x = gridController.grid_positions_x[_w]+(cell_width/2)-(directionX*20)
		var _y = gridController.grid_positions_y[_h]+(cell_height/2)-(directionY*20)
		
		//if ports[p,port_object].object_index == wire {
		//	_x = _x - directionX * 28
		//	_y = _y - directionY * 28
		//}
					
		var _rotation = -1
		if directionX > 0 and directionY == 0 _rotation = 0
		if directionX < 0 and directionY == 0 _rotation = 180
		if directionX == 0 and directionY > 0 _rotation = 270
		if directionX == 0 and directionY < 0 _rotation = 90
					
		var _sprite
		if ports[p,port_object] == -1 {
			_sprite = s_wire_socket	
		} else if ports[p,port_object].object_index == wire {
			_sprite = s_wire_socket_connected	
		}
					
		sprite_set_offset(_sprite,sprite_get_width(_sprite)/2,sprite_get_height(_sprite)/2)
		draw_sprite_ext(_sprite,0,_x,_y,1,1,_rotation,c_white,1)	
	} 
}