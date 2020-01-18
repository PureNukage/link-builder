if gui {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_popup)
	draw_set_color(color)
	draw_text_outlined(x,y,text,color,c_black)
	draw_set_font(-1)	
	if icon > -1 {
		draw_sprite(icon,0,x-string_width(text)-sprite_get_width(icon)-8,y)	
	}
}