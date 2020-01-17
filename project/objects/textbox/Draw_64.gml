//	Draw window outline
draw_set_color(c_black)
draw_roundrect(x-buffer-4,y-buffer-4,x+width+buffer+4,y+height+buffer+4,false)

//	Draw window background
draw_set_color(c_dkgray)
draw_roundrect(x-buffer,y-buffer,x+width+buffer,y+height+buffer,false)

//	Draw text
draw_set_font(fnt_shop)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_text_ext(x+4,y+4,text,string_height(text)+4,width_max)

height = string_height_ext(text,string_height(text)+4,width_max)
width = string_width_ext(text,string_height(text),width_max)