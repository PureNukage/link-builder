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
draw_set_font(fnt_shop)
draw_text(buttonX+button_width/2,buttonY+button_height/2,button_text)
draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

//	Drawing available contracts
if button_open == true {
	if ds_list_size(contracts_purchased) > 0 {
		var _yy = buttonY+button_height+buttonY
		for(var i=0;i<ds_list_size(contracts_purchased);i++) {
			if contracts_purchased[| i] {
				
				var _contract_name = contract[i, contract_name]
				contract[i, contract_width] = string_width(_contract_name)
				contract[i, contract_height] = string_height(_contract_name)
				var name_width = contract[i, contract_width]
				var name_height = contract[i, contract_height]
				var contract_active = contract[i, contract_online]
				var _contract_purchased = contract[i, contract_purchased]
				var _contract_kiosk = contract[i, contract_kiosk]
				var _contract_data = contract[i, contract_data]
				var _contract_data_names_array = []
				for(var d=0;d<array_height_2d(_contract_data);d++) {
					var _item_name = shop.item_data[_contract_data[d,0], item_name]
					if is_price(_item_name) {
						_contract_data_names_array[d] = is_price(_item_name,true)
					} else {
						_contract_data_names_array[d] = _item_name
					}
				}
				var price = contract[i, contract_price]
				
				//	Contracts purchased
				if _contract_purchased {	
					//	Contract is in a kiosk
					if _contract_kiosk > -1 {
						//	Mouse over highlight
						if point_in_rectangle(gui_mouse_x,gui_mouse_y,buttonX-name_width,_yy,buttonX+button_width,_yy+64) {
							gui_popup(buttonX-name_width,_yy,buttonX+button_width,_yy+64,2,"Go to this kiosk")			
							draw_set_color(c_gray)	
						} else {
							draw_set_color(c_dkgray)
						}
					} 
					//	Contract is NOT in a kiosk
					else {
						if input.contract == i {
							draw_set_color(c_gray)	
						} else {
							//	Mouse over highlight
							if point_in_rectangle(gui_mouse_x,gui_mouse_y,buttonX-name_width,_yy,buttonX+button_width,_yy+64) {
								gui_popup(buttonX-name_width,_yy,buttonX+button_width,_yy+64,2,"Place this contract into a kiosk")	
								draw_set_color(c_gray)	
							} else {
								draw_set_color(c_dkgray)
							}	
						}
					}
				} 
				//	Contract is NOT purchased
				else {
					//	Mouse over highlight
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,buttonX-name_width,_yy,buttonX+button_width,_yy+64) {
						var array = gui_popup(buttonX-name_width,_yy,buttonX+button_width,_yy+64,2,"Purchase this contract")
						var _string = ""
						for(var d=0;d<array_length_1d(_contract_data_names_array);d++) {
							if d == 0 _string += "Data required: "+string(_contract_data_names_array[d])
							else {
							_string += "\nData required: "+string(_contract_data_names_array[d])	
							}
						}
						gui_popup(array[0],array[1],array[2],array[3],1,_string)
						draw_set_color(c_gray)							
					} else {
						draw_set_color(c_dkgray)
					}	
				}
				draw_roundrect(buttonX-name_width,_yy,buttonX+button_width,_yy+64,false)
				
				//	Draw the contract outline
				draw_set_color(c_black)
				draw_roundrect(buttonX-name_width,_yy,buttonX+button_width,_yy+64,true)
				
				//	Draw the contract name
				draw_set_color(c_white)
				draw_set_halign(fa_right)
				draw_set_valign(fa_middle)
				draw_text(((buttonX-name_width)+buttonX+button_width)/2,_yy+32,_contract_name)
				
				//	This contract is purchased
				if _contract_purchased {
					//	Draw if its active or not
					if contract_active {
						draw_set_color(c_green)	
					} else {
						draw_set_color(c_red)	
					}	
					draw_circle(buttonX+button_width-32,_yy+32,16,false)
					draw_set_color(c_black)
					draw_circle(buttonX+button_width-32,_yy+32,16,true)
				} 
				//	This contract is not purchased
				else {
					//	Draw price
					draw_set_color(c_white)
					draw_set_halign(fa_right)
					draw_set_valign(fa_middle)
					draw_set_color(c_yellow)
					draw_text(buttonX+button_width-64,_yy+32,string(price))
					draw_sprite(s_lock,0,buttonX+button_width-32,_yy+32)	
				}
				
			}		
			_yy += button_height+buttonY
		}
	}
}