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
	
	#region Shop Header
	//	Draw the Shop menu header background
	draw_set_color(c_gray5)
	draw_roundrect(menuX,menuY,menuX+menu_header_width,menuY+menu_header_height,false)
	
	//	Draw the Shop menu header outline
	draw_set_color(c_black)
	draw_roundrect(menuX,menuY,menuX+menu_header_width,menuY+menu_header_height,true)
	draw_roundrect(menuX+1,menuY+1,menuX+menu_header_width-1,menuY+menu_header_height-1,true)
	
	#endregion
	
	#region Shop Menu Background
		//	Draw the Shop menu background
	
		draw_set_color(c_gray5)
		draw_roundrect(menuX,menuY+menu_header_height-header_buffer,menuX+menu_width,menuY+menu_header_height+menu_height-header_buffer,false)
	
		draw_set_color(c_black)
		draw_roundrect(menuX,menuY+menu_header_height-header_buffer,menuX+menu_width,menuY+menu_header_height+menu_height-header_buffer,true)
		draw_roundrect(menuX+1,menuY+1+menu_header_height-header_buffer,menuX+menu_width-1,menuY+menu_height-1+menu_header_height-header_buffer,true)
	
		draw_set_color(c_gray5)
		draw_roundrect(menuX+2,menuY+2,menuX+menu_header_width-1,menuY+menu_header_height+10,false)
	#endregion
	
	#region	Draw the Shop menu left and right buttons
		//	Left button background
		if menu_button_left_mouseover {
			draw_set_color(c_ltgray)
		} else draw_set_color(c_gray)
		draw_roundrect(menu_button_leftX,menu_button_leftY,menu_button_leftX+menu_button_left_width,menu_button_leftY+menu_button_left_height,false)
	
		//	Left button outline
		draw_set_color(c_black)
		draw_roundrect(menu_button_leftX,menu_button_leftY,menu_button_leftX+menu_button_left_width,menu_button_leftY+menu_button_left_height,true)
		draw_roundrect(menu_button_leftX-1,menu_button_leftY+1,menu_button_leftX+menu_button_left_width-1,menu_button_leftY+menu_button_left_height-1,true)
	
		//	Left button Arrow
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_shop_menu_name)
		draw_text_outlined(menu_button_leftX+menu_button_left_width/2,menu_button_leftY+menu_button_left_height/2,"<",c_white,c_black)
		draw_set_font(fnt_shop)
	
		//	Right button background
		if menu_button_right_mouseover {
			draw_set_color(c_ltgray)	
		} else draw_set_color(c_gray)
		draw_roundrect(menu_button_rightX,menu_button_rightY,menu_button_rightX+menu_button_right_width,menu_button_rightY+menu_button_right_height,false)
	
		//	Right button outline
		draw_set_color(c_black)
		draw_roundrect(menu_button_rightX,menu_button_rightY,menu_button_rightX+menu_button_right_width,menu_button_rightY+menu_button_right_height,true)
		draw_roundrect(menu_button_rightX+1,menu_button_rightY+1,menu_button_rightX+menu_button_right_width-1,menu_button_rightY+menu_button_right_height-1,true)
	
		//	Right button Arrow
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_shop_menu_name)
		draw_text_outlined(menu_button_rightX+menu_button_right_width/2,menu_button_rightY+menu_button_right_height/2,">",c_white,c_black)
		draw_set_font(fnt_shop)
	#endregion
	
	
	#region	Draw the current Shop menu name stuff
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
		draw_text_outlined(menu_button_nameX+menu_button_name_width/2,menu_button_nameY+menu_button_name_height/2,menu_index_string,c_white,c_black)
	
		draw_set_font(fnt_shop)
	#endregion
	
	
	#region	Draw the current Shop menu items
	
		var _xx = 40
		var _yy = menuY+menu_header_height-header_buffer+6 //210
		
		for(var i=0;i<array_height_2d(array);i++) {
			if i > item_index-1 and i < item_index + item_clamp {
				
				var good = true
				//	Only show unpurchased contracts
				if menu_index_string == "Contracts" and array[i, contract_purchased] {
					good = false
				}
				if good {
					var _item_name = array[i, item_name]
					var _item_price = array[i, item_price]
					
					//var name_width = string_width(_item_name)
					//var name_height = string_height(data_name)
					var price_width = string_width(string(_item_price))
				
					if item_mouseover == i {
						draw_set_color(c_ltgray)	
					} else draw_set_color(c_gray)
				
					#region Check if its placed
					if array == item_data or array == item_node {
						if array[i, item_placed] {
							draw_set_color(c_dkgray)		
						}
					}
					#endregion
				
				
					draw_roundrect(_xx,_yy,_xx+list_width,_yy+list_height,false)
					
					draw_set_color(c_black)
					draw_roundrect(_xx,_yy,_xx+list_width,_yy+40,true)
					draw_roundrect(_xx+1,_yy+1,_xx+list_width-1,_yy+40-1,true)
					
					//	Draw name
					draw_set_color(c_white)
					draw_set_halign(fa_left)
					draw_text(_xx+name_spacer,_yy+40/2,_item_name)
						
					//	Draw icon
					sprite_set_offset(icon,sprite_get_width(icon)/2,sprite_get_height(icon)/2)
					draw_sprite_ext(icon,0,_xx+list_width-(price_width)-32,_yy+42/2,1,1,0,c_white,1)
					
					//	Draw price
					draw_set_halign(fa_right)
					draw_text(_xx+menu_width-116,_yy+40/2,string(_item_price))
					_yy += 60
				}
			}
					
		}
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		
		menu_width = max(list_width + (bar_width*2), menu_button_name_width + menu_button_left_width + menu_button_right_width + 32)
	
	#endregion
	
	#region	Draw the scrollbar	
		
		if amount_of_items > 2 {
			//	Draw bar background
			barX = menuX+menu_width - bar_width - 6
			handleX = menuX+menu_width - handle_width - 12 //256
	
			draw_set_color(c_gray4)
			draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
	
			//	Draw handle background
			if handle_mouseover {
				draw_set_color(c_ltgray)
			} else draw_set_color(c_gray)
			draw_roundrect(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
		}
	
	#endregion

	
}	
#endregion

#region Wire button

var _xx = buttonX+button_width+64
var _yy = buttonY

//	Draw background
if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+64,_yy+32) {
	button_wire_mouseover = true
	draw_set_color(c_gray)	
	if input.mouse_left_press {
		input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",wire)
		input.selection.selected = true
		if ds_list_find_index(input.selections,input.selection) == -1 {
			ds_list_add(input.selections,input.selection)	
		}
	}
} else {
	draw_set_color(c_dkgray)
	button_wire_mouseover = false	
}
draw_roundrect(_xx,_yy,_xx+64,_yy+32,false)

//	Draw outline

//	Draw text
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_set_font(-1)
draw_text(_xx+32,_yy+16,"Wire")


#endregion

#region Resources

#endregion

#region Points

//var _xx = buttonX+button_width+32
//var _yy = buttonY

////	Draw background
//draw_set_color(c_dkgray)
//draw_roundrect(_xx,_yy,_xx+128,_yy+64,false)

////	Draw outline
//draw_set_color(c_black)
//draw_roundrect(_xx,_yy,_xx+128,_yy+64,true)
//draw_roundrect(_xx+1,_yy+1,_xx+128-1,_yy+64-1,true)

////	Draw points
//draw_set_halign(fa_center)
//draw_set_valign(fa_middle)
//draw_set_color(c_white)
//draw_text(_xx+128/2,_yy+32,string(player.points))

#endregion

//	Help text
var _xx = buttonX+button_width+32+128+16
var _yy = buttonY

draw_set_font(-1)
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