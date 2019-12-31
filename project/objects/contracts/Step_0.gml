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
	var _xx = buttonX - name_width
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,buttonX-name_width,_yy,buttonX+button_width,_yy+64) and button_open {
		_menu_mouseover++
		if input.mouse_left_press {
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
			
		}
	}
	
}
if _menu_mouseover > 0 menu_mouseover = true else menu_mouseover = false