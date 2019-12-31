if input.selection > -1 {
	
	if selection_switch {
		window_two_width = 128
		node_stats = false
		node_info = false
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
	
	//	Draw delete button
	if input.selection.states == states.placed {
		ui_draw_button(button_delete_width,button_delete_height,button_deleteX,button_deleteY,button_delete_color,button_delete_string,button_delete_mouseover)
	}
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var _item = input.selection
	switch(_item.object_index) 
	{
		case node:
		
			var _xx = window_twoX + 4
			var _yy = window_twoY + 4
			
			var _string = ""
			var x1 = _xx
			var y1 = _yy
			var x2 = x1 + string_width("- Info")
			var y2 = y1 + string_height("- Info")
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,x1,y1,x2,y2) {
				draw_set_color(c_white)	
				
				if input.mouse_left_press {
					node_info = !node_info
				}
			} else {
				draw_set_color(c_dkgray)	
			}
			
			if node_info {
				_string = "- Info"	
			} else {
				_string = "+ Info"	
			}
			
			draw_text(_xx,_yy,_string)
			_yy += 15
			
			if node_info {
				draw_set_color(c_black)
				draw_text(_xx,_yy,"Level: "+string(_item.level))
				_yy += 15
				draw_text(_xx,_yy,"Jobruns: "+string(_item.jobruns))
				_yy += 15
			}
			
			var _string = ""
			var x1 = _xx
			var y1 = _yy
			var x2 = x1 + string_width("- Data")
			var y2 = y1 + string_height("- Data")
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,x1,y1,x2,y2) {
				draw_set_color(c_white)	
				
				if input.mouse_left_press {
					node_stats = !node_stats
				}
			} else {
				draw_set_color(c_dkgray)	
			}
			
			if node_stats {
				_string = "- Data"	
			} else {
				_string = "+ Data"	
			}
			
			draw_text(_xx,_yy,_string)
			_yy += 15
			
			if node_stats {
				if !ds_list_empty(_item.data_held) {
					var amount = ds_list_size(_item.data_held)
					for(var i=0;i<amount;i++) {
					
						var _data = _item.data_held[| i]
						draw_set_color(c_black)
						draw_text(_xx,_yy,item_data[_data, item_name])
						_yy += 15
					
						if (string_width(item_data[_data, item_name]) - window_two_width) > 0 {
							window_two_width = string_width(item_data[_data, item_name]) + 16
						}
					
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
				_yy += 15
			}
		
		
		break
		
		case data:
			
			var _xx = window_twoX + 4
			var _yy = window_twoY + 4
			
			draw_set_color(c_dkgray)
			draw_text(_xx,_yy,"data generated")  _yy += 15
			
			draw_set_color(c_black)
			var _string = shop.item_data[_item.data_generated, item_name]
			draw_text(_xx,_yy,_string)
			
			if (string_width(_string) - window_two_width) > 0 {
				window_two_width = string_width(_string) + 16
			}
			
		
		break
		
	}
}