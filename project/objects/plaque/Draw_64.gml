if input.selection > -1 {
	
	if selection_switch {
		window_two_width = 148
		node_stats = true
		node_info = true
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
	draw_roundrect(window_nameX,window_nameY,window_nameX+window_name_width,window_nameY+window_name_height,false)
	
	//	Draw name
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_shop)
	draw_text(window_nameX+(window_name_width/2),window_nameY+(window_name_height/2),input.selection.name)
	
	//	Draw delete button
	if input.selection.states == states.placed {
		ui_draw_button(button_delete_width,button_delete_height,button_deleteX,button_deleteY,button_delete_color,button_delete_string,button_delete_mouseover)
	}
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var _item = input.selection
	switch(_item.object_index) 
	{
		#region Node
			case node:
		
				var _xx = window_twoX + 4
				var _yy = window_twoY + 4
				
				//	Level up!
				var level = shop.item_node[_item.item_index, node_level]
				var ports_level = shop.item_node[_item.item_index, node_level_ports]
				//	I have unassigned ports!
				if _item.ports_count < ports_level[level] {
					var how_many = ports_level[level] - _item.ports_count
					var _string = string(how_many)+" levels to assign"
					var _string_width = string_width(_string)
					var _string_height = string_height(_string)
					var buffer = 16
						
					window_level_width = _string_width + buffer
					window_level_height = _string_height
						
					draw_set_color(c_yellow)
					draw_roundrect(window_levelX,window_levelY,window_levelX+window_level_width,window_levelY+window_level_height,false)
						
					draw_set_color(c_black)
					draw_roundrect(window_levelX,window_levelY,window_levelX+window_level_width,window_levelY+window_level_height,true)
						
					draw_set_halign(fa_center)
					draw_set_valign(fa_middle)
					draw_text(window_levelX+(window_level_width/2),window_levelY+(window_level_height/2),_string)
				}
				
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
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
					draw_text(_xx,_yy,"Level: "+string(shop.item_node[_item.item_index, node_level]+1))
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
							draw_text(_xx,_yy,shop.item_data[_data, item_name])
							_yy += 15
					
							if (string_width(shop.item_data[_data, item_name]) - window_two_width) > 0 {
								window_two_width = string_width(shop.item_data[_data, item_name]) + 16
							}
					
						}
					}
				}
			
			break
		#endregion
		
		#region Kiosk
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
				
				if _item.smartcontract > -1 {
					
					//	Level up!
					var level = contracts.contract[_item.smartcontract, contract_level]
					var ports_level = contracts.contract[_item.smartcontract, contract_level_ports]
					//	I have unassigned ports!
					if _item.ports_count < ports_level[level] {
						var how_many = ports_level[level] - _item.ports_count
						var _string = string(how_many)+" levels to assign"
						var _string_width = string_width(_string)
						var _string_height = string_height(_string)
						var buffer = 16
						
						window_level_width = _string_width + buffer
						window_level_height = _string_height
						
						draw_set_color(c_yellow)
						draw_roundrect(window_levelX,window_levelY,window_levelX+window_level_width,window_levelY+window_level_height,false)
						
						draw_set_color(c_black)
						draw_roundrect(window_levelX,window_levelY,window_levelX+window_level_width,window_levelY+window_level_height,true)
						
						draw_set_halign(fa_center)
						draw_set_valign(fa_middle)
						draw_text(window_levelX+(window_level_width/2),window_levelY+(window_level_height/2),_string)
					}
					
					draw_set_halign(fa_left)
					draw_set_valign(fa_top)
					//	Draw uses
					draw_set_color(c_dkgray)
					draw_text(_xx,_yy,"Uses") 
					_yy += 15
					
					draw_set_color(c_black)
					draw_text(_xx,_yy,string(contracts.contract[_item.smartcontract, contract_uses]))
					_yy += 15
					
					//	Draw reliability
					draw_set_color(c_dkgray)
					draw_text(_xx,_yy,"Reliability")
					_yy += 15 
					
					draw_set_color(c_black)
					draw_text(_xx,_yy,string(contracts.contract[_item.smartcontract, contract_reliability])+" %")
					
					
				}
		
		
			break
		#endregion
		
		#region Data
			case data:
			
				var _xx = window_twoX + 4
				var _yy = window_twoY + 4
			
				draw_set_color(c_dkgray)
				draw_text(_xx,_yy,"Data Generated")  _yy += 16
			
				draw_set_color(c_black)
				var _string = shop.item_data[_item.data_generated, item_name]
				draw_text(_xx,_yy,_string)				_yy += 16
			
				draw_set_color(c_dkgray)
				draw_text(_xx,_yy,"Calls")				_yy += 16
			
				draw_set_color(c_black)
				draw_text(_xx,_yy,string(shop.item_data[_item.item_index, item_calls])) _yy += 16
			
				draw_set_color(c_dkgray)
				draw_text(_xx,_yy,"Corruption")			_yy += 16
			
				draw_set_color(c_black)
				var _corruption = string(shop.item_data[_item.item_index, item_corruption]) + " %"
				draw_text(_xx,_yy,_corruption)
			
				if string_width(_string) > window_two_width {
					window_two_width = string_width(_string) + 16
				}	
		
			break
		#endregion
		
	}
}