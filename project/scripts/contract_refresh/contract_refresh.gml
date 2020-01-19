amount_of_contracts = 0
for(var i=0;i<array_height_2d(contract);i++) {
	if contract[i, contract_purchased] amount_of_contracts++
}	

if amount_of_contracts > contract_clamp - 2 {
	menu_height = 256 + 64
}

var default_menu_width = 340
menu_width = default_menu_width
var biggest_width = 0
var biggest_name_width = 0
//	Determine menu width
for(i=0;i<array_height_2d(contract);i++) {
	if contract[i, contract_purchased] {
		menu_width = default_menu_width
		var _name = contract[i, contract_name]
		var _name_width = string_width(_name)
		if _name_width > 51 {
			var hypo_width = menu_width + (_name_width-51)
			if hypo_width > biggest_width {
				biggest_width = hypo_width
				biggest_name_width = _name_width
				//menu_width = hypo_width
				//menuX = display_get_gui_width() - menu_width - side_spacer
					
				//bar_width = 55
				//bar_height =  amount_of_contracts*line_height-20
				//barX = menuX + 6
				//barY = menuY + 6
	
				//handle_width = 42
				//handle_height = round(bar_height/(amount_of_contracts-1))
				//handleX = menuX + 12
				//handleY = barY + (contract_index*round(bar_height/(amount_of_contracts-1)))
				//handle_mouseover = false
			
				//line_width = 100 + (_name_width-51) + icon_width + (name_spacer*2) + (icon_spacer*2)
			}
		}
		if _name_width > 155 {
			var hypo_width = menu_width + (_name_width-155) 
			if hypo_width > biggest_width { 
				biggest_width = hypo_width
				biggest_name_width = _name_width
				//menu_width += 128
				//menuX = display_get_gui_width() - menu_width - side_spacer
					
				//bar_width = 55
				//bar_height =  amount_of_contracts*line_height-20
				//barX = menuX + 6
				//barY = menuY + 6
	
				//handle_width = 42
				//handle_height = round(bar_height/(amount_of_contracts-1))
				//handleX = menuX + 12
				//handleY = barY + (contract_index*round(bar_height/(amount_of_contracts-1)))
				//handle_mouseover = false
					
				//line_width = 100 + _name_width + 128 + icon_width + (name_spacer*2) + (icon_spacer*2)
			}
		}
	}
}

if biggest_width > 0 {
	menu_width = biggest_width + 64
	menuX = display_get_gui_width() - menu_width - side_spacer
					
	bar_width = 55
	bar_height =  amount_of_contracts*line_height-20
	barX = menuX + 6
	barY = menuY + 6
	
	handle_width = 42
	handle_height = round(bar_height/(amount_of_contracts-1))
	handleX = menuX + 12
	handleY = barY + (contract_index*round(bar_height/(amount_of_contracts-1)))
	handle_mouseover = false
			
	line_width = 100 + biggest_name_width + icon_width + (name_spacer*2) + (icon_spacer*2)	
}