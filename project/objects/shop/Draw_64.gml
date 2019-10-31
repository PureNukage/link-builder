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
draw_set_font(font_reg)
draw_text(buttonX+button_width/2,buttonY+button_height/2,button_text)
draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

//	The Shop menu 
if menu_open == true {
	//	Drawing the Shop menu background
	draw_set_color(c_dkgray)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,false)
	
	//	Drawing the Shop menu outline
	draw_set_color(c_black)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,true)
	draw_roundrect(menuX+1,menuY+1,menuX+menu_width-1,menuY+menu_height-1,true)
	
	//	Drawing the items
	var _x = menuX+16
	var _y = menuY+16
	for(var i=0;i<array_height_2d(item);i++) {
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_set_color(c_black)
		var item_name = item[0,i]
		draw_text(_x,_y,item_name)
		
		draw_set_halign(fa_right)
		draw_text(menuX+menu_width-16,_y,string(item[1,i]))
		_y += string_height(item_name)+16
	}
}	