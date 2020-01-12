live_call()

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
	
	var _menu_width = 290
	var _menu_height = 340

	var menu_button_left_width = 80
	var menu_button_left_height = 80
	var menu_button_leftX = 40
	var menu_button_leftY = 120

	var menu_button_right_width = 80
	var menu_button_right_height = 80
	var menu_button_rightX = 234
	var menu_button_rightY = 120
	
	var menu_button_name_width = 100
	var menu_button_name_height = 80
	var menu_button_nameX = 127
	var menu_button_nameY = 120
	var menu_button_name_string = "Nodes"
	
	//	Draw the Shop menu background
	draw_set_color(c_gray5)
	draw_roundrect(menuX,menuY,menuX+_menu_width,menuY+_menu_height,false)
	
	draw_set_color(c_black)
	draw_roundrect(menuX,menuY,menuX+_menu_width,menuY+_menu_height,true)
	draw_roundrect(menuX-1,menuY+1,menuX+_menu_width-1,menuY+_menu_height-1,true)
	
	//	Draw the Shop menu left and right buttons
	//	Left button background
	draw_set_color(c_gray)
	draw_roundrect(menu_button_leftX,menu_button_leftY,menu_button_leftX+menu_button_left_width,menu_button_leftY+menu_button_left_height,false)
	
	//	Left button outline
	draw_set_color(c_black)
	draw_roundrect(menu_button_leftX,menu_button_leftY,menu_button_leftX+menu_button_left_width,menu_button_leftY+menu_button_left_height,true)
	draw_roundrect(menu_button_leftX-1,menu_button_leftY+1,menu_button_leftX+menu_button_left_width-1,menu_button_leftY+menu_button_left_height-1,true)
	
	//	Right button background
	draw_set_color(c_gray)
	draw_roundrect(menu_button_rightX,menu_button_rightY,menu_button_rightX+menu_button_right_width,menu_button_rightY+menu_button_right_height,false)
	
	//	Right button outline
	draw_set_color(c_black)
	draw_roundrect(menu_button_rightX,menu_button_rightY,menu_button_rightX+menu_button_right_width,menu_button_rightY+menu_button_right_height,true)
	draw_roundrect(menu_button_rightX+1,menu_button_rightY+1,menu_button_rightX+menu_button_right_width-1,menu_button_rightY+menu_button_right_height-1,true)
	
	
	//	Draw the current Shop menu name stuff
	//	Menu name background
	draw_set_color(c_gray)
	draw_roundrect(menu_button_nameX,menu_button_nameY,menu_button_nameX+menu_button_name_width,menu_button_nameY+menu_button_name_height,false)
	
	//	Menu name outline
	draw_set_color(c_black)
	draw_roundrect(menu_button_nameX,menu_button_nameY,menu_button_nameX+menu_button_name_width,menu_button_nameY+menu_button_name_height,true)
	draw_roundrect(menu_button_nameX+1,menu_button_nameY+1,menu_button_nameX+menu_button_name_width-1,menu_button_nameY+menu_button_name_height-1,true)
	
	//	Menu name string
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_shop_menu_name)
	draw_text_outlined(menu_button_nameX+menu_button_name_width/2,menu_button_nameY+menu_button_name_height/2,menu_button_name_string,c_white,c_black)
	
	
	draw_set_font(fnt_shop)
	
	
	//	Draw the current Shop menu items
	
	var _xx = 40
	var _yy = 210
	
	var menu_index = "Nodes"
	switch(menu_index)
	{
		#region Nodes
			case "Nodes":
				if array_height_2d(item_node) < 4 create_node("neetnode","poop",100)
	
				var amount_of_items = array_height_2d(item_node)
				var item_index = 0
				var item_clamp = 4
				amount_of_items = clamp(amount_of_items,0,item_clamp)
				for(var n=item_index;n<amount_of_items;n++) {
					var _node_name = item_node[n, node_name]
					var _node_price = item_node[n, node_price]
		
					draw_set_color(c_gray)
					draw_roundrect(_xx,_yy,_xx+200,_yy+40,false)
					draw_set_color(c_black)
					draw_roundrect(_xx,_yy,_xx+200,_yy+40,true)
					draw_roundrect(_xx+1,_yy+1,_xx+200-1,_yy+40-1,true)
		
					//	Draw name
					draw_set_color(c_white)
					draw_set_halign(fa_right)
					draw_text(_xx+200/2,_yy+40/2,_node_name)
		
					//	Draw price
					draw_text(_xx+200-10,_yy+40/2,string(_node_price))
					_yy += 60
				}
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
	
				var final_yy = 210 + (60*item_clamp)
	
				//	Resize the menu height if its too small
				if final_yy > _menu_height _menu_height = final_yy
			
			break
		#endregion
		
		#region Data
			case "Data":
				
				
				
			break
		#endregion
	}
	
	//	Draw the scrollbar
	var bar_width = 55
	var bar_height = amount_of_items*60-20
	var barX = 250
	var barY = 210
	
	var handle_width = 42
	var handle_height = round(bar_height/amount_of_items)
	var handleX = 256
	var handleY = 210+(item_index*round(bar_height/amount_of_items))
	
	//	Draw bar background
	draw_set_color(c_gray4)
	draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
	
	//	Draw handle background
	draw_set_color(c_gray)
	draw_roundrect(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
	
	//debug_log(string(bar_height))
	//debug_log(string(handle_height))
	
	
	
	
	
	
	
	
	
	////	Drawing the Shop menu background
	//draw_set_color(c_dkgray)
	//draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,false)
	
	////	Drawing the Shop menu outline
	//draw_set_color(c_black)
	//draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,true)
	//draw_roundrect(menuX+1,menuY+1,menuX+menu_width-1,menuY+menu_height-1,true)
	
	////	Drawing the items
	//draw_set_halign(fa_left)
	//draw_set_valign(fa_top)
	//var _x = menuX+item_buffer
	//var _y = menuY+item_buffer
	
	////	Draw wire
	//var _string = "Wire"
	//var default_width = menu_width-item_buffer-item_buffer
	//var name_width = string_width(_string)
	//if name_width > default_width default_width = name_width+item_buffer
	//else if name_width < default_width default_width = name_width	
	//if string_width(_string) > menu_width-item_buffer-item_buffer {
	//	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+default_width,_y+32) {
	//		gui_popup(menuX,_y,menuX+menu_width,_y+32,0,"Use Wire to connect items")
	//		draw_set_color(c_ltgray)
	//	} else {
	//		draw_set_color(c_gray)		
	//	}
	//	draw_roundrect(_x,_y,_x+default_width,_y+32,false)
	//	draw_set_color(c_black)
	//	draw_roundrect(_x,_y,_x+default_width,_y+32,true)
	//} else {
	//	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	//	var difference = abs(_xx - _x)
	//	var buffer = 16
	//	default_width += buffer
	//	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32) {
	//		gui_popup(menuX,_y,menuX+menu_width,_y+32,0,"Use Wire to connect items")
	//		draw_set_color(c_ltgray)	
	//	} else {
	//		draw_set_color(c_gray)		
	//	}
	//	draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,false)
	//	draw_set_color(c_black)
	//	draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,true)	
	//}
	
	//draw_set_color(c_white)
	//draw_set_halign(fa_center)
	//draw_set_valign(fa_middle)
	//var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	//var _yy = _y + 16
	//draw_text(_xx,_yy,_string)
	
	//_y += 32+item_buffer
	
	////	Draw Nodes menu
	//draw_set_color(c_gray5)
	//var _string = ""
	//if nodes_open _string = "- NODES" else _string = "+ NODES"
	
	//draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
	//draw_set_color(c_black)
	//draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,true)
	
	//draw_set_color(c_white)
	//draw_set_halign(fa_center)
	//draw_set_valign(fa_middle)
	//var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	//var _yy = _y + 16
	//draw_text(_xx,_yy,_string)
	
	//_y += 32+item_buffer
	
	//if nodes_open {
	//	for(var n=0;n<array_height_2d(item_node);n++) {
	//		//	Draw node background
	//		var _string = item_node[n, node_name]
	//		var _price = item_node[n, node_price]
	//		var _item_string = item_node[n, node_text]
	//		var default_width = menu_width-item_buffer-item_buffer
	//		var name_width = string_width(_string)
	//		if name_width > default_width default_width = name_width+item_buffer
	//		else if name_width < default_width default_width = name_width
	//		if string_width(_string) > menu_width-item_buffer-item_buffer {
	//			if item_node[n,node_placed] {
	//				draw_set_color(c_gray4)	
	//			} else {
	//				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+default_width,_y+32) {
	//					draw_set_color(c_ltgray)	
	//				} else {
	//					draw_set_color(c_gray)		
	//				}
	//			}
	//			draw_roundrect(_x,_y,_x+default_width,_y+32,false)
	//			draw_set_color(c_black)
	//			draw_roundrect(_x,_y,_x+default_width,_y+32,true)
	//		} else {
	//			var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	//			var difference = abs(_xx - _x)
	//			var buffer = 16
	//			default_width += buffer
				
	//			if item_node[n,node_placed] {
	//				draw_set_color(c_gray4)	
	//			} else {
				
	//				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32) {
	//					var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
	//					gui_popup(array[0],array[1],array[2],array[3],1,_item_string)
					
	//					draw_set_color(c_ltgray)	
	//				} else {
	//					draw_set_color(c_gray)		
	//				}
	//			}
				
	//			draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,false)
	//			draw_set_color(c_black)
	//			draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,true)	
	//		}
			
	//		draw_set_color(c_white)
	//		draw_set_color(c_white)
	//		draw_set_color(c_white)
	//		draw_set_halign(fa_center)
	//		draw_set_valign(fa_middle)
	//		var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	//		var _yy = _y + 16
	//		draw_text(_xx,_yy,_string)
			
	//		if (default_width - menu_width) > 0 menu_width = default_width + 16
			
	//		_y += 32+item_buffer	
	//	}
	//}
	
	////	Draw Data menu
	//draw_set_color(c_gray5)
	//draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
	//draw_set_color(c_black)
	//draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,true)
	//var _string = ""
	//if data_open _string = "- DATA" else _string = "+ DATA"
	//draw_set_color(c_white)
	//draw_set_halign(fa_center)
	//draw_set_valign(fa_middle)
	//var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	//var _yy = _y + 16
	//draw_text(_xx,_yy,_string)
	
	//_y += 32+item_buffer
	
	//if data_open {
	//	for(var d=0;d<array_height_2d(item_data);d++) {
	//		var _string = item_data[d,item_name]
	//		var _price = item_data[d,item_price]
	//		var _item_text = item_data[d,item_text]
	//		var default_width = menu_width-item_buffer-item_buffer
	//		var name_width = string_width(_string)
	//		if name_width > default_width default_width = name_width+item_buffer
	//		else if name_width < default_width default_width = name_width
	//		if string_width(_string) > menu_width-item_buffer-item_buffer {
	//			#region Mouseover check
	//				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x,_y,_x+default_width,_y+32) {
	//					//	Draw data background
	//					if item_data[d,item_placed] {
	//						draw_set_color(c_gray4)	
	//					} else {
	//						var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
	//						gui_popup(array[0],array[1],array[2],array[3],1,_item_text)						
	//						draw_set_color(c_ltgray)
	//					}	
	//				} else {
	//					//	Draw data background
	//					if item_data[d,item_placed] {
	//						draw_set_color(c_gray4)	
	//					} else {
	//						var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
	//						gui_popup(array[0],array[1],array[2],array[3],1,_item_text)							
	//						draw_set_color(c_gray)
	//					}
	//				}
	//			#endregion
	//			draw_roundrect(_x,_y,_x+default_width,_y+32,false)
	//			draw_set_color(c_black)
	//			draw_roundrect(_x,_y,_x+default_width,_y+32,true)
	//		} else {
	//			var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	//			var difference = abs(_xx - _x)
	//			var buffer = 16
	//			default_width += buffer
	//			var _already_placed = item_data[d,item_placed]
				
	//			#region Mouseover check
	//				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32) {
	//					//	Draw data background
	//					if item_data[d,item_placed] {
	//						var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
	//						var array2 = gui_popup(array[0],array[1],array[2],array[3],1,_item_text)
	//						gui_popup(array2[0],array2[1],array2[2],array2[3],1,"Already placed")							
	//						draw_set_color(c_gray4)	
	//					} else {
	//						var array = gui_popup(menuX,_y,menuX+menu_width,_y+32,0,string(_price))
	//						gui_popup(array[0],array[1],array[2],array[3],1,_item_text)
	//						draw_set_color(c_ltgray)
	//					}	
	//				} else {
	//					//	Draw data background
	//					if item_data[d,item_placed] {					
	//						draw_set_color(c_gray4)	
							
	//					} else {
	//						draw_set_color(c_gray)
	//					}
	//				}
	//			#endregion
	//				draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,false)
	//				draw_set_color(c_black)
	//				draw_roundrect(_x+difference-(default_width/2),_y,_x+default_width+difference-(default_width/2),_y+32,true)	
	//			}
			
	//		draw_set_color(c_white)
	//		draw_set_halign(fa_center)
	//		draw_set_valign(fa_middle)
	//		var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	//		var _yy = _y + 16
	//		draw_text(_xx,_yy,_string)
			
	//		if (default_width - menu_width) > 0 menu_width = default_width + 16
			
	//		_y += 32+item_buffer
			
	//	}
	//}
	
	////	Set the menu height
	//menu_height = _y-92

	
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

//	Help text
var _xx = buttonX+button_width+32+128+16
var _yy = buttonY

draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_text(_xx,_yy,"E to rotate item")				_yy += 16
draw_text(_xx,_yy,"Press Home to give $2000")		_yy += 16
var _string = "Press and hold to drag a long wire"
if input.selection > -1 and input.selection.object_index == wire {
	draw_text(_xx,_yy,_string)	_yy += 16
}



//	ALPHA INFO
var _xx = buttonX+button_width+32+128+16+string_width(_string)+16
var _yy = buttonY

draw_text(_xx,_yy,"This game is currently in ALPHA. It is not balanced and will contain bugs")_yy += 20
draw_text(_xx,_yy,"white wires = off-chain; blue wires = on-chain")	_yy += 20
draw_text(_xx,_yy,"Nodes cannot get data from other nodes") _yy += 20
draw_text(_xx,_yy,"Data gets corrupted the more its used. Corruption increases the chance of a misfire") _yy += 20
draw_text(_xx,_yy,"Contracts Price data only needs 1 source to be successful. Decentralize to give more sources") _yy += 20
draw_text(_xx,_yy,"Contracts needs to have 0 misfires to work properly. People don't like apps that don't work") _yy += 20