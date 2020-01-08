event_inherited()

switch(states) 
{
	case states.placement:
		//	Draw the item
		sprite_set_offset(s_data_stand,sprite_get_width(s_data_stand)/2-1,sprite_get_height(s_data_stand)/2-1)
		draw_sprite(s_data_stand,-1,x,y)
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2+12)
		draw_sprite(sprite,-1,x,y)	
	break
	case states.placed:
	
		draw_sockets_item()
	
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
		draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha2)
		
		
	break
}