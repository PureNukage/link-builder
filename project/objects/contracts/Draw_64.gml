//	Drawing the Contract button background
draw_set_color(c_dkgray)
draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

//	Drawing the Contract button outline
draw_set_color(c_black)
draw_roundrect(buttonX+1,buttonY+1,buttonX+button_width-1,buttonY+button_height-1,true)
draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

//	Drawing the Contract button text
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_set_font(font_reg)
draw_text(buttonX+button_width/2,buttonY+button_height/2,button_text)
draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

//	Drawing available contracts
if button_open == true {
	if ds_list_size(contracts_list) > 0 {
		var _yy = buttonY+button_height+buttonY
		for(var i=0;i<ds_list_size(contracts_list);i++) {
			var contract_data = contracts_list[| i]
			
			var contract_height = 32+(32*array_height_2d(contract_data))
			
			//	Draw the Contract background
			draw_set_color(c_dkgray)
			draw_roundrect(buttonX,_yy,buttonX+button_width,_yy+contract_height,false)	
			
			//	Draw the Contract outline
			draw_set_color(c_black)
			draw_roundrect(buttonX,_yy,buttonX+button_width,_yy+contract_height,true)
			draw_roundrect(buttonX+1,_yy+1,buttonX+button_width-1,_yy+contract_height-1,true)
			
			//	Draw the Contract name
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_text(buttonX+button_width/2,_yy+16,contract_data[0,0])
			
			//	Draw the Contract data requirements
			var _yyy = _yy+32
			for(var a=1;a<array_height_2d(contract_data);a++) {
				if contract_data[a,1] == 1 {
					draw_set_color(c_green)	
				} else {
					draw_set_color(c_red)	
				}
				draw_circle(buttonX+16,_yyy+32,8,false)
				
				draw_set_color(c_white)
				draw_set_halign(fa_left)
				draw_text(buttonX+64,_yyy+32,edata_strings[contract_data[a,0]])
				
				_yyy += 32
			}
			
			
			_yy += button_height+buttonY
		}
	}
}