event_inherited()

switch(states) 
{
	case states.placement:
	
		if !game.vision and !game.temp_vision {
		
			//	Draw the item
			sprite_set_offset(s_data_stand,sprite_get_width(s_data_stand)/2-1,sprite_get_height(s_data_stand)/2-1)
			draw_sprite(s_data_stand,-1,x,y)
			sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2+12)
			var color = c_white
			if placeable color = c_white else color = c_red
			draw_sprite_ext(sprite,-1,x,y,1,1,0,color,1)
		}
		//	Alt vision
		else {
			draw_altmode(object_index)	
		}
	break
	case states.placed:
	
		draw_sockets_item()
		
		if !game.vision and !game.temp_vision {
	
			//	Draw the stand
			sprite_set_offset(s_data_stand,sprite_get_width(s_data_stand)/2-1,sprite_get_height(s_data_stand)/2-1)
			draw_sprite(s_data_stand,-1,x,y)
		
			//	Draw usage
			draw_set_color(used_color)
			draw_set_alpha(used_alpha)
			draw_rectangle(x-38,y-37,x+37,y+26,false)
			draw_set_alpha(1)
		
			//	Draw the database
			sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2+12)
			draw_sprite(sprite,-1,x,y)
		
			//	Draw database overlay
			//draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha2)
			if input.selection > -1 and input.selection.object_index == data and input.selection.replace_id == id {
				draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,.5)
				draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,.5)
				used_color = c_black
				used_alpha = .5
			}
		
			//	Draw an icon if we're not connected
			if !connected {
				iconY = wave(y-64,y-96,.5,0)
				draw_sprite_ext(s_wire_socket,0,x,iconY,1,1,0,c_sergey_blue,1)
				draw_sprite(s_notconnected,0,x,iconY)
			} else if connected == connected.incorrect_connected {
				iconY = wave(y-64,y-96,.5,0)
				sprite_set_offset(s_chainlink,sprite_get_width(s_chainlink)/2,sprite_get_height(s_chainlink)/2)
				draw_sprite_ext(s_chainlink,0,x,iconY+5,.33,.33,0,c_white,1)
				draw_sprite(s_notconnected,0,x,iconY)
			}
		}
		//	Alt vision mode
		else {
			draw_altmode(object_index)
		}
		
		
	break
}