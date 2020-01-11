///@param [sockets]

if argument_count > 0 var _sockets = argument[0]

for(var p=0;p<ports_count;p++) {
	var _w = ports[p,port_x]
	var _h = ports[p,port_y]
		
	if _w > -1 and _w < grid_width and _h > -1 and _h < grid_height and (argument_count == 0 or _sockets[p]) {
		
		var directionX = 0
		var directionY = 0
		var _rotation = -1
		
		//	Right side
		if ports[p,port_x] == bottomright_cell_x+1 {
			directionX = 1
			_rotation = 0
		}
		//	Bottom side
		else if ports[p,port_y] == bottomright_cell_y+1 {
			directionY = 1
			_rotation = 270
		}
		//	Left side
		else if ports[p,port_x] == topleft_cell_x-1 {
			directionX = -1
			_rotation = 180
		} 
		//	Top side
		else if ports[p,port_x] == topleft_cell_y-1 {
			directionY = -1
			_rotation = 90
		}
		
		var _x = gridController.grid_positions_x[_w]+(cell_width/2)-(directionX*15)
		var _y = gridController.grid_positions_y[_h]+(cell_height/2)-(directionY*15)
					
		//var _rotation = -1
		//if directionX > 0 and directionY == 0 _rotation = 0
		//if directionX < 0 and directionY == 0 _rotation = 180
		//if directionX == 0 and directionY > 0 _rotation = 270
		//if directionX == 0 and directionY < 0 _rotation = 90
					
		var _sprite = s_wire_socket
		if sockets[p] == -1 {
			_sprite = s_wire_socket 
		} else {
			_sprite = s_wire_socket_connected
			//	Right
			if directionX > 0 _x += directionX*7
			//	Bottom
			if directionY > 0 _y += directionY*7
			//	Left
			if directionX < 0 _x += directionX*7
			//	Top
			if directionY < 0 _y += directionY*7
			//_x -= (directionX*7)
			//_y -= (directionY*7)
		}
		
		var _color
		if object_index == data or (ports[p,port_direction] = in and object_index == node) or (sockets[p] > -1 and instance_exists(sockets[p]) and sockets[p].object_index == data and object_index == node) {
			_color = c_white	
		} else {
			_color = c_sergey_blue	
		}
			
		sprite_set_offset(_sprite,sprite_get_width(_sprite)/2,sprite_get_height(_sprite)/2)
		//draw_sprite_ext(_sprite,0,_x,_y,1,1,_rotation,_color,1)	
	
	}
}