if button_active {
	//	Drawing the Contract button outline
	draw_set_color(c_black)
	draw_roundrect(buttonX-2,buttonY-2,buttonX+button_width+2,buttonY+button_height+2,false)

	//	Drawing the Contract button background
	draw_set_color(c_dkgray)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

	//	Drawing the Contract button text
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(fnt_shop)
	draw_text(buttonX+button_width/2,buttonY+button_height/2,button_text)
	draw_set_font(-1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

#region	Drawing available contracts
if button_open == true {

	//	Draw Menu outline
	draw_set_color(c_black)
	draw_roundrect(menuX-2,menuY-2,menuX+menu_width+2,menuY+menu_height+2,false)
	
	//	Draw Menu background
	draw_set_color(c_dkgray)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,false)
	
	var _xx = menuX + 16 + bar_width
	var _yy = menuY + 6
	
	#region	Draw Contracts
	for(var c=0;c<array_height_2d(contract);c++) {
		if c > contract_index-1 and c < contract_index + contract_clamp {
			if contract[c, contract_purchased] {
		
				var _name = contract[c, contract_name]
				var _price = contract[c, contract_price]
				var _online = contract[c, contract_online]
		
				var _name_width = string_width(_name)
				var _price_width = string_width(string(_price))
			
				//if _name_width > 51 {
				//	//menu_width = 340 + _name_width 
				//	//menuX = display_get_gui_width() - menu_width - side_spacer
				//}
		
				draw_set_color(c_gray4)	
			
				if contract_open == c {
					//	Finish with draw_contract_info script
					line_height = 240
				
					//debug_log("line_width: "+string(line_width))
					//debug_log("line height: "+string(line_height))
					var array = draw_contract_info(_xx,_yy,c)
					if is_array(array) {
						if array[0] >= line_width {
							line_width = array[0]
							if line_width > menu_width {
								menu_width = line_width + 64
								menuX = display_get_gui_width() - menu_width - side_spacer
							}
						}
						if array[1] >= line_height line_height = array[1]
						//contract_refresh()
					}
				
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+line_width,_yy+line_height) {
						if input.doubleclick {
							contract_open = -1
							line_height = 64
							contract_refresh()
						}
					}
				
				
				} else {
					line_height = 64
				
					//	Draw contract window outline
					draw_set_color(c_black)
					draw_roundrect(_xx-2,_yy-2,_xx+line_width+2,_yy+line_height+2,false)
				
					//	Draw contract window background
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+line_width,_yy+line_height) {
						draw_set_color(c_gray)	
					
						if input.mouse_left_press {
							contract_open = c	
						}
					} else {
						draw_set_color(c_dkgray)
					}
					draw_roundrect(_xx,_yy,_xx+line_width,_yy+line_height,false)
				
					//	Draw name
					draw_set_color(c_white)
					draw_set_font(fnt_shop_menu_name)
					draw_set_halign(fa_left)
					draw_set_valign(fa_top)
					draw_text_outlined(_xx+name_spacer-16,_yy+(name_spacer/2),_name,c_white,c_black)
					draw_set_font(fnt_shop)
				
					if _online {
						draw_set_color(c_green)	
					} else draw_set_color(c_red)
							
					icon_width = 18
					draw_circle(_xx+line_width-icon_width-(icon_spacer*2)+18,_yy+name_spacer,icon_width,false)
					
				}
		
				_yy += line_height+16
			}
		}
		
	}
	#endregion
	
	//	No Contracts
	if amount_of_contracts == 0 {
		draw_set_color(c_white)
		draw_set_halign(fa_middle)
		draw_text(menuX+menu_width/2,menuY+64,"No contracts purchased!")	
	}
	
	if amount_of_contracts > contract_clamp - 2 {	
		//	Draw Menu scrollbar
		draw_set_color(c_gray4)
		draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)

		//	Draw scrollbar handle
		if handle_mouseover {
			draw_set_color(c_ltgray)	
		} else draw_set_color(c_gray)
		draw_roundrect(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
	}
	
}
#endregion