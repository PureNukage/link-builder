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
		
		//	Speech
		if current_speech > -1 {
			var myLine = personController.heroSpeech[hero, current_speech]
			var width = string_width(myLine) + 64
			var height = string_height(myLine) + 64
			
			var sWidth = sprite_get_width(s_speech2)
			var sHeight = sprite_get_height(s_speech2)
			
			var adjust = width / 24
			
			sWidth *= adjust
			sHeight *= adjust
			
			var X = x-width/2
			var Y = y-80-sHeight
			draw_set_alpha(current_speech_alpha)
			draw_sprite_ext(s_speech2,0,X,Y,adjust,adjust,0,c_white,current_speech_alpha)
			
			draw_set_color(c_black)
			draw_set_halign(fa_center)
			draw_set_valign(fa_bottom)
			draw_text(X+sWidth/2,Y+sHeight/3+12,myLine)
			draw_set_alpha(1)
		}
	}
}

if pissed {
	sprite_set_offset(s_madface,sprite_get_width(s_madface)/2-1,sprite_get_height(s_madface)/2-1)
	draw_sprite(s_madface,0,x,y-100)	
}