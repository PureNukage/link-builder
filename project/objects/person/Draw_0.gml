if !game.vision and !game.temp_vision {
	
	//	Normie, reee
	if hero == -1 {
		var scale = .85
		draw_sprite_ext(legs,0,x,y,image_xscale*scale,1*scale,0,legs_color,1)
		draw_sprite_ext(body,0,x,y,image_xscale*scale,1*scale,0,body_color,1)
		draw_sprite_ext(hand,0,x,y,image_xscale*scale,1*scale,0,head_color,1)
		draw_sprite_ext(head,0,x,y,image_xscale*scale,1*scale,0,head_color,1)
		draw_sprite_ext(hair,0,x,y,image_xscale*scale,1*scale,0,hair_color,1)
	} 
	//	Hero
	else {
		draw_sprite_ext(personController.heros[hero, hero_sprite],0,x,y,image_xscale,1,0,c_white,1)
	}
}

if pissed {
	sprite_set_offset(s_madface,sprite_get_width(s_madface)/2-1,sprite_get_height(s_madface)/2-1)
	draw_sprite(s_madface,0,x,y-100)	
}