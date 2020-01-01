event_inherited()

switch(states)
{
	case states.placement:
		draw_sockets_item()
		
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)
		
		sprite_set_offset(s_eth_docked,sprite_get_width(s_eth_docked)/2-1,sprite_get_height(s_eth_docked)/2-1)	
		draw_sprite_ext(s_eth_docked,0,x,y-33,.75,.75,0,c_white,1)
	break
	case states.placed:
	
		draw_sockets_item()
		
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)	
		
		if active {
			sprite_set_offset(s_eth,sprite_get_width(s_eth)/2-1,sprite_get_height(s_eth)/2-1)
			draw_sprite(s_eth,-1,x,y-100)
		} else {
			sprite_set_offset(s_eth_docked,sprite_get_width(s_eth_docked)/2-1,sprite_get_height(s_eth_docked)/2-1)	
			draw_sprite_ext(s_eth_docked,0,x,y-33,.75,.75,0,c_white,1)
		}
		
	break
}