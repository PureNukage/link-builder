event_inherited()

switch(states)
{
	case states.placement:
		
		draw_sockets_item()
		
		//	Draw stand
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)
		
		//	Draw chains
		sprite_set_offset(s_kiosk_chains,sprite_get_width(s_kiosk_chains)/2-1,sprite_get_height(s_kiosk_chains)/2-1)
		draw_sprite(s_kiosk_chains,-1,x,y)
		
		//	Draw blocks idle
		sprite_set_offset(s_kiosk_blocks_idle,sprite_get_width(s_kiosk_blocks_idle)/2-1,sprite_get_height(s_kiosk_blocks_idle)/2-1)
		draw_sprite(s_kiosk_blocks_idle,-1,x,y)

	break
	case states.placed:
	
		draw_sockets_item()
		
		//	Draw stand
		sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)
		draw_sprite(sprite,-1,x,y)
		
		//	Draw chains
		sprite_set_offset(s_kiosk_chains,sprite_get_width(s_kiosk_chains)/2-1,sprite_get_height(s_kiosk_chains)/2-1)
		draw_sprite(s_kiosk_chains,-1,x,y)
		
		//	Draw blocks idle
		if !used {
			sprite_set_offset(s_kiosk_blocks_idle,sprite_get_width(s_kiosk_blocks_idle)/2-1,sprite_get_height(s_kiosk_blocks_idle)/2-1)
			draw_sprite(s_kiosk_blocks_idle,-1,x,y)
		} else {
			sprite_set_offset(s_kiosk_blocks_animation,sprite_get_width(s_kiosk_blocks_animation)/2-1,sprite_get_height(s_kiosk_blocks_animation)/2-1)
			draw_sprite(s_kiosk_blocks_animation,used_blocks_frame,x,y)	
		}
		
		if smartcontract > -1 {
			var _subimage = -1
			logoX = gridController.grid_positions_x[center_cell_x]+(cell_width/2)
			if used {
				_subimage = image_index
			} else {
				//if image_index != 9 lerp(image_index,9,1)
				_subimage = image_index
			}			
			logoY = wave(y-100,y-80,.5,5)
		
			sprite_set_offset(s_eth,sprite_get_width(s_eth)/2-1,sprite_get_height(s_eth)/2-1)
			draw_sprite_ext(s_eth,image_index,logoX,logoY,1,1,0,c_white,1)
		}
		
	break
}