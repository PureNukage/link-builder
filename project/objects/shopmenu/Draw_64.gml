//	Drawing the Shop button background
draw_set_color(c_dkgray)
draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

//	Drawing the Shop button outline
draw_set_color(c_black)
draw_roundrect(buttonX+1,buttonY+1,buttonX+button_width-1,buttonY+button_height-1,true)
draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

//	Drawing the Shop button text
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_text(buttonX+button_width/2,buttonY+button_height/2,button_text)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

//	The Shop menu 
if open == true {
	//	Drawing the Shop menu background
	draw_set_color(c_dkgray)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,false)
	
	//	Drawing the Shop menu outline
	draw_set_color(c_black)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,true)
}	