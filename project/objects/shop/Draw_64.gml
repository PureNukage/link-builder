#region Shop Button
	//	Drawing the Shop button background
	draw_set_color(c_dkgray)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

	//	Drawing the Shop button outline
	draw_set_color(c_black)
	draw_roundrect(buttonX+1,buttonY+1,buttonX+button_width-1,buttonY+button_height-1,true)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

	//	Drawing the Shop button text
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(fnt_shop)
	draw_text(buttonX+button_width/2,buttonY+button_height/2,button_text)
	draw_set_font(-1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
#endregion 

#region Shop Menu
if menu_open == true {
	
	//	Drawing the Shop menu background
	draw_set_color(c_dkgray)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,false)
	
	//	Drawing the Shop menu outline
	draw_set_color(c_black)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,true)
	draw_roundrect(menuX+1,menuY+1,menuX+menu_width-1,menuY+menu_height-1,true)
	
	//	Drawing the items
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var _x = menuX+item_buffer
	var _y = menuY+item_buffer
	
	//	Draw wire
	var _string = "Wire"
	var default_width = menu_width-item_buffer-item_buffer
	var name_width = string_width(_string)
	if name_width > default_width default_width = name_width+item_buffer
	else if name_width < default_width default_width = name_width	
	if string_width(_string) > menu_width-item_buffer-item_buffer {
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+default_width,_y+32) {
			gui_popup(menuX,_y,menuX+menu_width,_y+32,0,"Use Wire to connect items")
			draw_set_color(c_ltgray)
		} else {
			draw_set_color(c_gray)		
		}
		draw_roundrect(_x,_y,_x+default_width,_y+32,false)
		draw_set_color(c_black)
		draw_roundrect(_x,_y,_x+default_width,_y+32,true)
	} else {
		var _xx = _x+(menu_width-item_buffer-item_buffer)/2
		var difference = abs(_xx - _x)
		var buffer = 16
		default_width += buffer
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32) {
			gui_popup(menuX,_y,menuX+menu_width,_y+32,0,"Use Wire to connect items")
			draw_set_color(c_ltgray)	
		} else {
			draw_set_color(c_gray)		
		}
		draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,false)
		draw_set_color(c_black)
		draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,true)	
	}
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	var _yy = _y + 16
	draw_text(_xx,_yy,_string)
	
	_y += 32+item_buffer
	
	//	Draw kiosk
	var _string = "Kiosk"
	var _price = item[3,2]
	var default_width = menu_width-item_buffer-item_buffer
	var name_width = string_width(_string)
	if name_width > default_width default_width = name_width+item_buffer
	else if name_width < default_width default_width = name_width	
	if string_width(_string) > menu_width-item_buffer-item_buffer {
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+default_width,_y+32) {
			var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,"Kiosks allow for the storing and using of contracts")
			gui_popup(array[0],array[1],array[2],array[3],1,string(_price))
			draw_set_color(c_ltgray)	
		} else {
			draw_set_color(c_gray)		
		}
		draw_roundrect(_x,_y,_x+default_width,_y+32,false)
		draw_set_color(c_black)
		draw_roundrect(_x,_y,_x+default_width,_y+32,true)
	} else {
		var _xx = _x+(menu_width-item_buffer-item_buffer)/2
		var difference = abs(_xx - _x)
		var buffer = 16
		default_width += buffer
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32) {
			var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
			gui_popup(array[0],array[1],array[2],array[3],1,"Kiosks allow for the storing and using of contracts")
			draw_set_color(c_ltgray)	
		} else {
			draw_set_color(c_gray)		
		}
		draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,false)
		draw_set_color(c_black)
		draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,true)	
	}
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	var _yy = _y + 16
	draw_text(_xx,_yy,_string)
	
	_y += 32+item_buffer
	
	//	Draw Nodes menu
	draw_set_color(c_gray4)
	var _string = ""
	if nodes_open _string = "- NODES" else _string = "+ NODES"
	
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
	draw_set_color(c_black)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,true)
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	var _yy = _y + 16
	draw_text(_xx,_yy,_string)
	
	_y += 32+item_buffer
	
	if nodes_open {
		for(var n=0;n<array_height_2d(item_node);n++) {
			//	Draw node background
			var _string = item_node[n,0]
			var _price = item_node[n,item_price]
			var _item_string = item_node[n,item_text]
			var default_width = menu_width-item_buffer-item_buffer
			var name_width = string_width(_string)
			if name_width > default_width default_width = name_width+item_buffer
			else if name_width < default_width default_width = name_width
			if string_width(_string) > menu_width-item_buffer-item_buffer {
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+default_width,_y+32) {
					draw_set_color(c_ltgray)	
				} else {
					draw_set_color(c_gray)		
				}
				draw_roundrect(_x,_y,_x+default_width,_y+32,false)
				draw_set_color(c_black)
				draw_roundrect(_x,_y,_x+default_width,_y+32,true)
			} else {
				var _xx = _x+(menu_width-item_buffer-item_buffer)/2
				var difference = abs(_xx - _x)
				var buffer = 16
				default_width += buffer
				
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32) {
					var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
					gui_popup(array[0],array[1],array[2],array[3],1,_item_string)
					
					draw_set_color(c_ltgray)	
				} else {
					draw_set_color(c_gray)		
				}
				
				draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,false)
				draw_set_color(c_black)
				draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,true)	
			}
			
			draw_set_color(c_white)
			draw_set_color(c_white)
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			var _xx = _x+(menu_width-item_buffer-item_buffer)/2
			var _yy = _y + 16
			draw_text(_xx,_yy,_string)
			
			if (string_width(_string) - menu_width) > 0 menu_width = string_width(_string) + 16
			
			_y += 32+item_buffer	
		}
	}
	
	//	Draw Data menu
	draw_set_color(c_gray4)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
	draw_set_color(c_black)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,true)
	var _string = ""
	if data_open _string = "- DATA" else _string = "+ DATA"
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	var _yy = _y + 16
	draw_text(_xx,_yy,_string)
	
	_y += 32+item_buffer
	
	if data_open {
		for(var d=0;d<array_height_2d(item_data);d++) {
			var _string = item_data[d,0]
			var _price = item_data[d,item_price]
			var _item_text = item_data[d,item_text]
			var default_width = menu_width-item_buffer-item_buffer
			var name_width = string_width(_string)
			if name_width > default_width default_width = name_width+item_buffer
			else if name_width < default_width default_width = name_width
			if string_width(_string) > menu_width-item_buffer-item_buffer {
				#region Mouseover check
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+default_width,_y+32) {
						//	Draw data background
						if item_data[d,2] {
							draw_set_color(c_gray4)	
						} else {
							draw_set_color(c_ltgray)
							var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
							gui_popup(array[0],array[1],array[2],array[3],1,_item_text)
						}	
					} else {
						//	Draw data background
						if item_data[d,2] {
							draw_set_color(c_gray4)	
						} else {
							draw_set_color(c_gray)
							var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
							gui_popup(array[0],array[1],array[2],array[3],1,_item_text)
						}
					}
				#endregion
				draw_roundrect(_x,_y,_x+default_width,_y+32,false)
				draw_set_color(c_black)
				draw_roundrect(_x,_y,_x+default_width,_y+32,true)
			} else {
				var _xx = _x+(menu_width-item_buffer-item_buffer)/2
				var difference = abs(_xx - _x)
				var buffer = 16
				default_width += buffer
				var _already_placed = item_data[d,item_placed]
				
				#region Mouseover check
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32) {
						//	Draw data background
						if item_data[d,item_placed] {
							var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
							var array2 = gui_popup(array[0],array[1],array[2],array[3],1,_item_text)
							gui_popup(array2[0],array2[1],array2[2],array2[3],1,"Already placed")							
							draw_set_color(c_gray4)	
						} else {
							var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
							gui_popup(array[0],array[1],array[2],array[3],1,_item_text)
							draw_set_color(c_ltgray)
						}	
					} else {
						//	Draw data background
						if item_data[d,item_placed] {					
							draw_set_color(c_gray4)	
							
						} else {
							draw_set_color(c_gray)
						}
					}
				#endregion
					draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,false)
					draw_set_color(c_black)
					draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,true)	
				}
			
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			var _xx = _x+(menu_width-item_buffer-item_buffer)/2
			var _yy = _y + 16
			draw_text(_xx,_yy,_string)
			
			if (default_width - menu_width) > 0 menu_width = default_width + 16
			
			_y += 32+item_buffer
			
		}
	}
	
	//	Set the menu height
	menu_height = _y-92

	
}	
#endregion

#region Points

var _xx = buttonX+button_width+32
var _yy = buttonY

//	Draw background
draw_set_color(c_dkgray)
draw_roundrect(_xx,_yy,_xx+128,_yy+64,false)

//	Draw outline
draw_set_color(c_black)
draw_roundrect(_xx,_yy,_xx+128,_yy+64,true)
draw_roundrect(_xx+1,_yy+1,_xx+128-1,_yy+64-1,true)

//	Draw points
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_text(_xx+128/2,_yy+32,string(player.points))

#endregion