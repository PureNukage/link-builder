live_call()

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

#region	Drawing available contracts
if button_open == true {
	
	var menu_width = 340
	var menu_height = 256
	var side_spacer = 16
	var menuX = display_get_gui_width() - menu_width - side_spacer
	var menuY = 120
	
	var contract_index = 0
	var contract_clamp = 3
	var contract_open = 1
	
	var name_width = 100
	var icon_width = 64
	var name_spacer = 32
	var icon_spacer = 16
	
	
	var line_width = name_width + icon_width + (name_spacer*2) + (icon_spacer*2)
	var line_height = 64
	
	var amount_of_contracts = 0
	for(var i=0;i<array_height_2d(contract);i++) {
		if contract[i, contract_purchased] amount_of_contracts++
		
		var _name = contract[i, contract_name]
		var _online = contract[i, contract_online]
		
		var _name_width = string_width(_name)

	}
	//	TEST DELETE THIS WHEN FINISHED
	amount_of_contracts = 4
	
	var bar_width = 55
	var bar_height =  amount_of_contracts*line_height-20
	var barX = menuX + 6
	var barY = menuY + 6
	
	var handle_width = 42
	var handle_height = round(bar_height/(amount_of_contracts-1))
	var handleX = menuX + 12
	var handleY = barY + (contract_index*round(bar_height/(amount_of_contracts-1)))
	
	//	Draw Menu background
	draw_set_color(c_dkgray)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,false)
	
	var _xx = menuX + 16 + bar_width
	var _yy = menuY + 6
	
	#region	Draw Contracts
	for(var c=0;c<array_height_2d(contract);c++) {
		if c > contract_index-1 and c < contract_index + contract_clamp {
		
			var _name = contract[c, contract_name]
			var _price = contract[c, contract_price]
			var _online = contract[c, contract_online]
		
			var _name_width = string_width(_name)
			var _price_width = string_width(string(_price))
		
			draw_set_color(c_gray4)	
			
			if contract_open == c {
				//	Finish with draw_contract_info script
				line_height = 280
				
				draw_contract_info(_xx,_yy,line_width,line_height,c)
				
			} else {
				line_height = 64
				
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
	#endregion
	
	//	Draw Menu scrollbar
	draw_set_color(c_gray4)
	draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
	
	//	Draw scrollbar handle
	draw_set_color(c_gray)
	draw_roundrect(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
	
}
#endregion