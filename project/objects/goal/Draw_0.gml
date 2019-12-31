var sprite = s_goal

sprite_set_offset(sprite,sprite_get_width(sprite)/2-1,sprite_get_height(sprite)/2-1)

if debug.mode > 0 {
	draw_sprite(sprite,0,x,y)	
}