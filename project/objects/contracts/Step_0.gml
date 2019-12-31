if point_in_rectangle(mouse_gui_x,mouse_gui_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
	button_mouseover = true
	if input.mouse_left_press {
		button_open = !button_open
	}
} else {
	button_mouseover = false
}	

var _menu_mouseover = 0
for(var i=0;i<ds_list_size(contracts_purchased);i++) {
	var name_width = contract[i, contract_width]
	var _yy = buttonY+button_height+buttonY
	var contract_active = contract[i, contract_online]
	var _contract_kiosk = contract[i, contract_kiosk]
	var _contract_purchased = contract[i, contract_purchased]
	var _price = contract[i, contract_price]
	var _xx = buttonX - name_width
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,buttonX-name_width,_yy,buttonX+button_width,_yy+64) and button_open {
		_menu_mouseover++
		if input.mouse_left_press {
			//	this contract is purchased
			if _contract_purchased { 
				//	this contract is placed in a kiosk already
				if _contract_kiosk > -1 {
					camera.camera_mode = 1
					camera.x = _contract_kiosk.x
					camera.y = _contract_kiosk.y
				
					input.selection = _contract_kiosk
					input.selection.selected = true
					if ds_list_find_index(input.selections,_contract_kiosk) == -1 {
						ds_list_add(input.selections,_contract_kiosk)	
					}
				}
				//	this contract is not in a kiosk, lets place it into one
				else {
					if input.selection > -1 {
						input.selection.selected = false
						if ds_list_find_index(input.selections,input.selection) > -1 {
							ds_list_delete(input.selections,ds_list_find_index(input.selections,input.selection))	
						}
						input.selection = -1
					}
					input.selection_mode = selection_mode.contract_placement
					input.contract = i
				}
			}
			//	this contract isn't purchased yet
			else if player.points >= _price {
				player.points -= _price
				contract[i, contract_purchased] = true
			}
			
		}
	}
	
}
if _menu_mouseover > 0 menu_mouseover = true else menu_mouseover = false