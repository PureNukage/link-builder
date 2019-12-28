if input.selection > -1 {
	
	if selection_switch {
		window_two_width = 128
	}
	
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
	
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var _item = input.selection
	switch(_item.object_index) 
	{
		case node:
			
			if !ds_list_empty(_item.data_held) {
				var amount = ds_list_size(_item.data_held)
				var _xx = window_twoX + 4
				var _yy = window_twoY + 4
				for(var i=0;i<amount;i++) {
					
					var _data = _item.data_held[| i]
					
					draw_set_color(c_black)
					draw_text(_xx,_yy,datatypes.strings[_data])
					
					if (string_width(datatypes.strings[_data]) - window_two_width) > 0 {
						window_two_width = string_width(datatypes.strings[_data]) + 16
					}
					
				}
			}
			
		break
		
		case kiosk:
			
			var _xx = window_twoX + 4
			var _yy = window_twoY + 4
			
			draw_set_color(c_dkgray)
			draw_text(_xx,_yy,"contract")  _yy += 15
			
			draw_set_color(c_black)
			if _item.smartcontract > -1 {
				var _string = contracts.contract[_item.smartcontract, contract_name]
				draw_text(_xx,_yy,_string)
			}
		
		
		break
		
		case data:
			
			var _xx = window_twoX + 4
			var _yy = window_twoY + 4
			
			draw_set_color(c_dkgray)
			draw_text(_xx,_yy,"data generated")  _yy += 15
			
			draw_set_color(c_black)
			var _string = datatypes.strings[_item.data_generated]
			draw_text(_xx,_yy,_string)
			
			if (string_width(_string) - window_two_width) > 0 {
				window_two_width = string_width(_string) + 16
			}
			
		
		break
		
	}
}