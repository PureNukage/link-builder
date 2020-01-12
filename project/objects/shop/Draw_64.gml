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
	
	var _menu_header_width = 274
	var _menu_header_height = 106
	
	var _menu_width = 400
	var _menu_height = 280 - _menu_header_height
	
	draw_set_font(fnt_shop_menu_name)
	var menu_index = "Contracts"
	var menu_button_name_width = 155 //string_width(menu_index) + 16
	//debug_log(string(menu_button_name_width))
	draw_set_font(fnt_shop)
	var menu_button_name_height = 80
	var menu_button_nameX = 127
	var menu_button_nameY = 120

	var menu_button_left_width = 80
	var menu_button_left_height = 80
	var menu_button_leftX = 40
	var menu_button_leftY = 120

	var menu_button_right_width = 80
	var menu_button_right_height = 80
	var menu_button_rightX = menu_button_nameX+menu_button_name_width+6
	var menu_button_rightY = 120
	
	#region Shop Header
	//	Draw the Shop menu header background
	draw_set_color(c_gray5)
	draw_roundrect(menuX,menuY,menuX+_menu_header_width,menuY+_menu_header_height,false)
	
	//	Draw the Shop menu header outline
	draw_set_color(c_black)
	draw_roundrect(menuX,menuY,menuX+_menu_header_width,menuY+_menu_header_height,true)
	draw_roundrect(menuX+1,menuY+1,menuX+_menu_header_width-1,menuY+_menu_header_height-1,true)
	
	#endregion
	
	#region Shop Menu Background
		//	Draw the Shop menu background
		var header_buffer = 12
	
		draw_set_color(c_gray5)
		draw_roundrect(menuX,menuY+_menu_header_height-header_buffer,menuX+_menu_width,menuY+_menu_header_height+_menu_height-header_buffer,false)
	
		draw_set_color(c_black)
		draw_roundrect(menuX,menuY+_menu_header_height-header_buffer,menuX+_menu_width,menuY+_menu_header_height+_menu_height-header_buffer,true)
		draw_roundrect(menuX+1,menuY+1+_menu_header_height-header_buffer,menuX+_menu_width-1,menuY+_menu_height-1+_menu_header_height-header_buffer,true)
	
		draw_set_color(c_gray5)
		draw_roundrect(menuX+2,menuY+2,menuX+_menu_header_width-1,menuY+_menu_header_height+10,false)
	#endregion
	
	#region	Draw the Shop menu left and right buttons
		//	Left button background
		draw_set_color(c_gray)
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
		draw_set_color(c_gray)
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
		draw_text_outlined(menu_button_nameX+menu_button_name_width/2,menu_button_nameY+menu_button_name_height/2,menu_index,c_white,c_black)
	
		draw_set_font(fnt_shop)
	#endregion
	
	
	#region	Draw the current Shop menu items
	
		var _xx = 40
		var _yy = menuY+_menu_header_height-header_buffer+6 //210
	
		var const_bar_width = 55
		var const_handle_width = 42
		
		var icon = -1
		var array = -1
		switch(menu_index)
		{
			case "Data":
				icon = s_resource_link_shop
				array = item_data
			break
			case "Nodes":
				icon = s_resource_link_shop
				array = item_node
			break
			case "Contracts":
				icon = s_resource_value_shop
				array = contracts.contract
			break
		}
	
		var list_spacer = 8
		var name_spacer = 16
		var name_width = 100	//	default
		var icon_width = sprite_get_width(icon)
		var price_spacer = 8
		var price_width = 28
	
		var list_width = (list_spacer*2)+(name_spacer*2)+name_width+icon_width+(price_spacer*2)+price_width
		var list_height = 40
		var price_width = 40
		var icon_width = 40
		
		var amount_of_items = array_height_2d(array)
		var item_index = 0
		var item_clamp = 4
		amount_of_items = clamp(amount_of_items,0,item_clamp)
	
		#region	Lets get our list width (todo: height)
		for(var i=0;i<array_height_2d(array);i++) {
			var _name = array[i, item_name]
			var _price = array[i, item_price]
			var _name_width = string_width(_name)
			//var _string_height = string_height(_name)
			var _price_width = string_width(string(_price))
		
			var this_list_width = (list_spacer*2)+(name_spacer*2)+_name_width+icon_width+(price_spacer*2)+_price_width
		
			if this_list_width > list_width list_width = this_list_width
		
		}
		#endregion
		
		#region	Loop through and draw the list for real this time
		for(var i=0;i<array_height_2d(array);i++) {
			if i > item_index-1 and i < item_index + item_clamp {
				var _item_name = array[i, item_name]
				var _item_price = array[i, item_price]
					
				var name_width = string_width(_item_name)
				//var name_height = string_height(data_name)
				var price_width = string_width(string(_item_price))
					
				draw_set_color(c_gray)
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
				draw_sprite_ext(icon,0,_xx+list_width-(price_width*2)-16,_yy+42/2,1,1,0,c_white,1)
					
				//	Draw price
				draw_text(_xx+_menu_width-116,_yy+40/2,string(_item_price))
				_yy += 60
			}
					
		}
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		#endregion
	
		//var final_yy = menuY+_menu_header_height-header_buffer+6 + (60*item_clamp)
		var final_yy = _yy
	
		//	Resize the menu height if its too small
		if final_yy > menuY+_menu_height _menu_height = menuY+final_yy-header_buffer-_menu_height
		
		draw_set_color(c_yellow)
		draw_rectangle(0,_yy,340,_yy+4,false)
		
		draw_set_color(c_white)
		draw_rectangle(0,menuY+_menu_height,340,menuY+_menu_height+4,false)
		

	
	#endregion
	
	//	Draw the scrollbar
	var bar_width = const_bar_width
	var bar_height = amount_of_items*60-20
	var barX = menuX+_menu_width - bar_width - 6
	var barY = menuY+_menu_header_height-header_buffer+6
	
	var handle_width = const_handle_width
	var handle_height = round(bar_height/(amount_of_items-1))
	var handleX = menuX+_menu_width - handle_width - 12 //256
	var handleY = menuY+_menu_header_height-header_buffer+6  +(item_index*round(bar_height/(amount_of_items-1)))
	
	//	Draw bar background
	draw_set_color(c_gray4)
	draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
	
	//	Draw handle background
	draw_set_color(c_gray)
	draw_roundrect(handleX,handleY,handleX+handle_width,handleY+handle_height,false)

	
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