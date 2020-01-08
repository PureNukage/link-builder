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
		
		//	Draw stand overlay
		draw_sprite_ext(sprite,-1,x,y,1,1,0,c_black,used_alpha)
		
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
			

			logoX = gridController.grid_positions_x[center_cell_x]+(cell_width/2)			
			logoY = wave(y-100,y-80,.5,5)
		
			if contracts.contract[smartcontract, contract_type] == contract_types.people {
				sprite_set_offset(s_eth,sprite_get_width(s_eth)/2-1,sprite_get_height(s_eth)/2-1)
				draw_sprite_ext(s_eth,image_index,logoX,logoY,1,1,0,c_white,1)
			} else if contracts.contract[smartcontract, contract_type] == contract_types.utility {
				//	Draw the reference feed background
				sprite_set_offset(s_reference_feed_background,sprite_get_width(s_reference_feed_background)/2-1,sprite_get_height(s_reference_feed_background)/2-1)
				if decentralized {
					var _color = c_green
					var _sprite = s_reference_feed_checkmark
				} else {
					var _color = c_red	
					var _sprite = s_reference_feed_x
				}
				draw_sprite(s_reference_feed_background,-1,logoX,logoY)	
				draw_sprite_ext(s_reference_feed_background,-1,logoX,logoY,1,1,0,_color,.3)	
				
				//	Draw the reference feed outline
				sprite_set_offset(s_reference_feed_outline,sprite_get_width(s_reference_feed_outline)/2-1,sprite_get_height(s_reference_feed_outline)/2-1)
				draw_sprite(s_reference_feed_outline,-1,logoX,logoY)
				
				//	Draw the reference feed checkmark or X
				sprite_set_offset(_sprite,sprite_get_width(_sprite)/2-1,sprite_get_height(_sprite)/2-1)
				draw_sprite(_sprite,-1,logoX,logoY)
				
			}
		}
		
	break
}