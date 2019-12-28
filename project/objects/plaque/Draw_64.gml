if input.selection > -1 {
	
	//	Draw portrait background
	draw_set_color(c_gray)
	draw_roundrect(window_portraitX,window_portraitY,window_portraitX+window_portrait_width,window_portraitY+window_portrait_height,false)
	
	//	Draw window two background
	draw_roundrect(window_twoX,window_twoY,window_twoX+window_two_width,window_twoY+window_two_height,false)
	
	//	Draw portrait
	var _portrait = input.selection.portrait
	draw_sprite(_portrait,0,window_portraitX+window_portrait_offsetX,window_portraitY+window_portrait_offsetY)
	
	//	Draw name background
	draw_roundrect(window_twoX,window_twoY-16,window_twoX+window_two_width,window_twoY-48,false)
	
	//	Draw name
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(window_twoX+window_two_width/2,window_twoY-32,input.selection.name)
}