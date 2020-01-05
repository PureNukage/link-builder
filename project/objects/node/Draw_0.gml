event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
		
			var _sockets = []
			for(var i=0;i<ports_count;i++) {
				if ports[i,port_y] < center_cell_y _sockets[i] = true else _sockets[i] = false
			}
			draw_sockets_item(_sockets)
			
			//	Draw the stand
			sprite_set_offset(s_chainlink_stand,sprite_get_width(s_chainlink_stand)/2-1,sprite_get_height(s_chainlink_stand)/2-1)
			draw_sprite(s_chainlink_stand,-1,x,y)
		
			//	Draw the node
			sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
			draw_sprite(sprite,-1,x,y)
		
			//	Draw the node used
			draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha)
		
			for(var i=0;i<ports_count;i++) {
				if ports[i,port_y] < center_cell_y _sockets[i] = false else _sockets[i] = true	
			}
			draw_sockets_item(_sockets)
		
		
		break
	#endregion
	
	#region Placed
	case states.placed:
		
		var _sockets = []
		for(var i=0;i<ports_count;i++) {
			if ports[i,port_y] < center_cell_y _sockets[i] = true else _sockets[i] = false
		}
		draw_sockets_item(_sockets)
			
		//	Draw the stand
		sprite_set_offset(s_chainlink_stand,sprite_get_width(s_chainlink_stand)/2-1,sprite_get_height(s_chainlink_stand)/2-1)
		draw_sprite(s_chainlink_stand,-1,x,y)
		
		//	Draw the node
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)
		
		//	Draw the node used
		draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha)
		
		for(var i=0;i<ports_count;i++) {
			if ports[i,port_y] < center_cell_y _sockets[i] = false else _sockets[i] = true	
		}
		draw_sockets_item(_sockets)
		
	break
	#endregion
}