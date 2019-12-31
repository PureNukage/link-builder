event_inherited()

switch(states)
{
	case states.placement:
		
		//	Draw the item
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)	
		
		
	break
	#region Placed
	case states.placed:
	
		draw_sockets_item()
			
		//	Draw the item
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)
		
	break
	#endregion
}