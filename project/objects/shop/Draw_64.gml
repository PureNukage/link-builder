if live_call() return live_result

#region Shop Button
//if button_active {
//	//	Drawing the Shop button background
//	draw_set_color(c_dkgray)
//	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

//	//	Drawing the Shop button outline
//	draw_set_color(c_black)
//	draw_roundrect(buttonX+1,buttonY+1,buttonX+button_width-1,buttonY+button_height-1,true)
//	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

//	//	Drawing the Shop button text
//	draw_set_halign(fa_center)
//	draw_set_valign(fa_middle)
//	draw_set_color(c_white)
//	draw_set_font(fnt_shop)
//	draw_text(buttonX+button_width/2,buttonY+button_height/2,button_text)
//	draw_set_font(-1)
//	draw_set_halign(fa_left)
//	draw_set_valign(fa_top)
//}
#endregion 

#region Shop Menu
if menu_open == true {
	
	#region Shop Header
	//	Draw the Shop menu header outline
	draw_set_color(c_black)
	draw_roundrect(menuX-2,menuY-2,menuX+menu_header_width+2,menuY+menu_header_height+2,false)
	
	//	Draw the Shop menu header background
	draw_set_color(c_gray5)
	draw_roundrect(menuX,menuY,menuX+menu_header_width,menuY+menu_header_height,false)
	
	#endregion
	
	#region Shop Menu Background
	
		//	Draw the Shop menu outline
		draw_set_color(c_black)
		draw_roundrect(menuX-2,menuY+menu_header_height-header_buffer-2,menuX+menu_width+2,menuY+menu_header_height+menu_height-header_buffer+2,false)
		
		//	Draw the Shop menu background
		draw_set_color(c_gray5)
		draw_roundrect(menuX,menuY+menu_header_height-header_buffer,menuX+menu_width,menuY+menu_header_height+menu_height-header_buffer,false)
	
		draw_set_color(c_gray5)
		draw_roundrect(menuX+2,menuY+2,menuX+menu_header_width-1,menuY+menu_header_height+10,false)
	#endregion
	
	#region	Draw the Shop menu left and right buttons
		
		//	Left button outline
		draw_set_color(c_black)
		draw_roundrect(menu_button_leftX-2,menu_button_leftY-2,menu_button_leftX+menu_button_left_width+2,menu_button_leftY+menu_button_left_height+2,false)

		//	Left button background
		if menu_button_left_mouseover {
			draw_set_color(c_ltgray)
		} else draw_set_color(c_gray)
		draw_roundrect(menu_button_leftX,menu_button_leftY,menu_button_leftX+menu_button_left_width,menu_button_leftY+menu_button_left_height,false)
	
		//	Left button Arrow
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_shop_menu_name)
		draw_text_outlined(menu_button_leftX+menu_button_left_width/2,menu_button_leftY+menu_button_left_height/2,"<",c_white,c_black)
		draw_set_font(fnt_shop)
	
		//	Right button outline
		draw_set_color(c_black)
		draw_roundrect(menu_button_rightX-2,menu_button_rightY-2,menu_button_rightX+menu_button_right_width+2,menu_button_rightY+menu_button_right_height+2,false)
		
		//	Right button background
		if menu_button_right_mouseover {
			draw_set_color(c_ltgray)	
		} else draw_set_color(c_gray)
		draw_roundrect(menu_button_rightX,menu_button_rightY,menu_button_rightX+menu_button_right_width,menu_button_rightY+menu_button_right_height,false)
	
		//	Right button Arrow
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_shop_menu_name)
		draw_text_outlined(menu_button_rightX+menu_button_right_width/2,menu_button_rightY+menu_button_right_height/2,">",c_white,c_black)
		draw_set_font(fnt_shop)
		
	#endregion
	
	
	#region	Draw the current Shop menu name stuff
		//	Menu name outline
		draw_set_color(c_black)
		draw_roundrect(menu_button_nameX-2,menu_button_nameY-2,menu_button_nameX+menu_button_name_width+2,menu_button_nameY+menu_button_name_height+2,false)
	
		//	Menu name background
		draw_set_color(c_gray)
		draw_roundrect(menu_button_nameX,menu_button_nameY,menu_button_nameX+menu_button_name_width,menu_button_nameY+menu_button_name_height,false)
	
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
		
		var items = 0
		for(var i=item_index;i<array_height_2d(array);i++) {
			if i < array_height_2d(array) {
				if array[i, item_available] and items < item_clamp {			
			
					//	Draw the contract info
					//if menu_index_string == "Contracts" and item_mouseover == i {
					//	draw_contract_info(menuX+menu_width+8,menuY+menu_header_height-header_buffer,item_mouseover,true)
					//}
				
					var good = true
					//	Only show unpurchased contracts
					if menu_index_string == "Contracts" and array[i, contract_kiosk] > -1 {
						good = false
					}
					if good {
						items++
						var _item_name = array[i, item_name]
						var _item_price = array[i, item_price]
	
						//var name_width = string_width(_item_name)
						//var name_height = string_height(data_name)
						var price_width = string_width(string(_item_price))
					
						//	Draw line outline
						draw_set_color(c_black)
						draw_roundrect(_xx-2,_yy-2,_xx+list_width+2,_yy+42,false)
				
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
						
						//	Check if we have enough currency
						if menu_index_string == "Contracts" and player.value < _item_price and app.tutorial == -1 {
							draw_set_color(c_dkgray)
						} else if (menu_index_string == "Data" or menu_index_string = "Nodes") and player.money < _item_price and app.tutorial == -1 {
							draw_set_color(c_dkgray)
						}
				
					
						//	Draw line background
						draw_roundrect(_xx,_yy,_xx+list_width,_yy+list_height,false)
					
						//	Draw name
						draw_set_color(c_white)
						draw_set_halign(fa_left)
						draw_text(_xx+name_spacer,_yy+40/2,_item_name)
						
						if app.tutorial == -1 and (!array[i, item_purchased] or menu_index_string == "Contracts") {
							//	Draw icon
							sprite_set_offset(icon,sprite_get_width(icon)/2,sprite_get_height(icon)/2)
							draw_sprite_ext(icon,0,_xx+list_width-(price_width)-32,_yy+42/2,1,1,0,c_white,1)
					
							//	Draw price
							draw_set_halign(fa_right)
							draw_text(_xx+menu_width-116,_yy+40/2,string(_item_price))
						}
						_yy += 60
					}
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

if wire_active {

	var _xx = topmenu.contractsX+topmenu.contracts_width+16
	var _yy = 0

	//	Draw background
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+64,_yy+32) and !instance_exists(mainmenu) {
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

	sprite_set_offset(s_wire_socket,sprite_get_width(s_wire_socket)/2,sprite_get_height(s_wire_socket)/2)
	draw_sprite_ext(s_wire_socket,0,_xx+sprite_get_width(s_wire_socket)/2,_yy+sprite_get_height(s_wire_socket)/2,1,1,0,c_sergey_blue,1)

}

#endregion

#region Resources

if resources_active {

	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)

	var _xx = display_get_gui_width()/2 + 128
	var _yy = buttonY

	var spacer = 1.2
	var _width_base = 128
	var _height = 64

	var linkX = display_get_gui_width()/2 + 128
	var linkY = buttonY
	var link_width = 128
	//var link_height = 64

	var moneyX = linkX - (link_width * spacer)
	var moneyY = buttonY
	var money_width = 128
	//var value_height = 64

	var valueX = moneyX
	var valueY = -1
	var value_width = 128

	var ethX = 90
	var ethY = buttonY
	var eth_width = 128
	//var eth_height = 64

	//	LINK
	if string_width(string(player.link)) > 36 {
		link_width = _width_base + (string_width(string(player.link)) - 36)
	} else link_width = _width_base

	linkX = _xx - link_width/2

	draw_set_color(c_black)
	draw_roundrect(linkX-2,_yy-2,linkX+link_width+2,_yy+66,false)

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,linkX,_yy,linkX+link_width,_yy+64) {
		link_mouseover = true
		draw_set_font(fnt_shop)
		var amount_of_money = link_trade * link_price
		//var _string = string(amount_of_money) + " $$ / " + string(link_trade) + " LINK"
		var _string = "Used to call Data sources"
		gui_popup(linkX,_yy,linkX+link_width,_yy+64,1,_string)
		draw_set_color(c_gray)		
		if input.mouse_left_press and player.money >= amount_of_money and amount_of_money > 0 and exchange_open and exchange_currency == "LINK" {
			resource_changed("$$",amount_of_money,gui_mouse_x,gui_mouse_y+128,true)
			resource_changed("LINK",-link_trade,gui_mouse_x,gui_mouse_y+256,true)
		} else if input.mouse_left_press and (!exchange_open or exchange_currency != "LINK") {
			exchange_open = true
			exchange_currency = "LINK"
		}
		if input.mouse_right_press {
			resource_changed("LINK",-100,gui_mouse_x,gui_mouse_y+128,true)	
		}
		if input.scroll_up or input.scroll_down {
			link_trade += input.scroll_up - input.scroll_down
			link_trade = clamp(link_trade,0,50)
		}
	} else {
		link_mouseover = false
		draw_set_color(c_dkgray)
	}
	draw_roundrect(linkX,_yy,linkX+link_width,_yy+64,false)

	draw_set_halign(fa_left)
	draw_set_color(c_white)
	draw_set_font(fnt_shop)
	draw_text(_xx,_yy+_height/2,string(player.link))

	sprite_set_offset(s_resource_link_shop,sprite_get_width(s_resource_link_shop)/2,sprite_get_height(s_resource_link_shop)/2)
	draw_sprite(s_resource_link_shop,0,_xx-32,_yy+32)

	//	MONEY

	if string_width(string(player.money)) > 36 {
		var money_width = _width_base + (string_width(string(player.money)) - 36)
	} else money_width = _width_base

	moneyX = linkX - (link_width * spacer)

	draw_set_color(c_black)
	draw_roundrect(moneyX-2,_yy-2,moneyX+money_width+2,_yy+_height+2,false)

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,moneyX,_yy,moneyX+money_width,_yy+_height) {
		gui_popup(moneyX,_yy,moneyX+money_width,_yy+_height,1,"Used to purchase LINK and ETH")
		draw_set_color(c_gray)
		
		if input.mouse_right_press {
			resource_changed("$$",-100,gui_mouse_x,gui_mouse_y+128,true)	
		}
	} else {
		draw_set_color(c_dkgray)	
	}

	draw_roundrect(moneyX,_yy,moneyX+money_width,_yy+_height,false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_font(fnt_shop)
	draw_text(moneyX+money_width/2,_yy+_height/2,string(player.money))

	sprite_set_offset(s_resource_money,sprite_get_width(s_resource_money)/2,sprite_get_height(s_resource_money)/2)
	draw_sprite_ext(s_resource_money,0,moneyX+28,_yy+32,1,1,0,c_white,1)

	//	VALUE

	if string_width(string(player.value)) > 36 {
		var value_width = _width_base + (string_width(string(player.value))- 36)
	} else value_width = _width_base

	valueX = moneyX - (money_width * spacer)

	draw_set_color(c_black)
	draw_roundrect(valueX-2,_yy-2,valueX+value_width+2,_yy+_height+2,false)

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,valueX,_yy,valueX+value_width,_yy+_height) {
		gui_popup(valueX,_yy,valueX+value_width,_yy+_height,1,"Total value of the space")
		draw_set_color(c_gray)		
		if input.mouse_right_press {
			resource_changed("VALUE",-100,gui_mouse_x,gui_mouse_y+128,true)	
		}
	} else {
		draw_set_color(c_dkgray)	
	}
	draw_roundrect(valueX,_yy,valueX+value_width,_yy+_height,false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_font(fnt_shop)
	draw_text(valueX+value_width/2,_yy+_height/2,string(player.value))

	sprite_set_offset(s_resource_value_shop,sprite_get_width(s_resource_value_shop)/2,sprite_get_height(s_resource_value_shop)/2)
	draw_sprite_ext(s_resource_value_shop,0,valueX+28,_yy+32,1,1,0,c_white,1)

	//	ETH

	if string_width(string(player.eth)) > 36 {
		var eth_width = _width_base + (string_width(string(player.eth)) - 36)
	} else eth_width = _width_base

	ethX = linkX + (link_width*spacer)

	draw_set_color(c_black)
	draw_roundrect(ethX-2,_yy-2,ethX+eth_width+2,_yy+_height+2,false)

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,ethX,_yy,ethX+eth_width,_yy+_height) {
		eth_mouseover = true
		var amount_of_money = eth_trade * eth_price
		//var _string = string(amount_of_money) + " $$ / " + string(eth_trade) + " ETH"
		var _string = "Used when calling Data sources and Contracts"
		gui_popup(ethX,_yy,ethX+eth_width,_yy+_height,1,_string)
		draw_set_color(c_gray)		
		if input.mouse_left_press and player.money >= amount_of_money and amount_of_money > 0  and exchange_open and exchange_currency == "ETH" {
			resource_changed("$$",amount_of_money,gui_mouse_x,gui_mouse_y+128,true)
			resource_changed("ETH",-eth_trade,gui_mouse_x,gui_mouse_y+256,true)
		} else if input.mouse_left_press and (!exchange_open or exchange_currency != "ETH") {
			exchange_open = true
			exchange_currency = "ETH"
		}
		if input.mouse_right_press {
			resource_changed("ETH",-100,gui_mouse_x,gui_mouse_y+128,true)	
		}
		if input.scroll_up or input.scroll_down {
			eth_trade += input.scroll_up - input.scroll_down
			eth_trade = clamp(eth_trade,0,50)
		}
	} else {
		eth_mouseover = false
		draw_set_color(c_dkgray)
	}
	draw_roundrect(ethX,_yy,ethX+eth_width,_yy+_height,false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_font(fnt_shop)
	draw_text(ethX+eth_width/2,_yy+_height/2,string(player.eth))

	sprite_set_offset(s_resource_eth_shop,sprite_get_width(s_resource_eth_shop)/2,sprite_get_height(s_resource_eth_shop)/2)
	draw_sprite_ext(s_resource_eth_shop,0,ethX+32,_yy+32,1,1,0,c_white,1)
	
	//	Exchange Button
	var exchangeX = ethX + (eth_width*spacer)
	var exchangeY = ethY
	
	var String = "Exchange"
	var sw = string_width(String) + 16
	var sh = string_height(String) + 16
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,exchangeX,exchangeY,exchangeX+sw,exchangeY+sh) {
		draw_set_color(c_ltgray)
		if input.mouse_left_press {
			exchange_open = !exchange_open	
		}
	} else if exchange_open draw_set_color(c_gray) else draw_set_color(c_dkgray)
	draw_roundrect(exchangeX,exchangeY,exchangeX+sw,exchangeY+sh,false)
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	draw_set_color(c_black)
	draw_text(exchangeX+sw/2,exchangeY+sh/2,String)
	
	//	Exchange
	var window_width = 320
	var window_height = 120
	if app.resolution_width == 1280 {
		var windowX = exchangeX - window_width/5
		var windowY = exchangeY + sh + 48
	} else if app.resolution_width == 1920 {
		var windowX = exchangeX + sw + 10
		var windowY = exchangeY 
	}
	if exchange_open {
		
		draw_set_color(c_black)
		draw_roundrect(windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2,false)
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2) {
			exchange_mouseover = true
			if input.scroll_up or input.scroll_down {
				if exchange_currency == "LINK" {
					link_trade += input.scroll_up - input.scroll_down
					link_trade = clamp(link_trade,0,50)
				} else {
					eth_trade += input.scroll_up - input.scroll_down
					eth_trade = clamp(eth_trade,0,50)
				}
			}
		} else exchange_mouseover = false
		
		draw_set_color(c_ltgray)
		draw_roundrect(windowX,windowY,windowX+window_width,windowY+window_height,false)
		
		#region LINK and ETH buttons
		
		var button_width = 40
		var button_height = 25
		var spacer = 8
		var XX = windowX + window_width - (button_width*2) - (spacer*2)
		var YY = windowY + 6
		
		draw_set_color(c_dkgray)
		draw_rectangle(XX-2,YY-2,XX+button_width+2,YY+button_height+2,false)
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,XX,YY,XX+button_width,YY+button_height) {
			if exchange_currency == "LINK" draw_set_color(c_yellow) else draw_set_color(c_ltgray)
			if input.mouse_left_press {
				exchange_currency = "LINK"
			}
		} else if exchange_currency == "LINK" draw_set_color(c_yellow) else draw_set_color(c_ltgray)
		draw_rectangle(XX,YY,XX+button_width,YY+button_height,false)
		
		draw_set_color(c_black)
		draw_text(XX+button_width/2,YY+button_height/2,"LINK")
		
		XX += button_width + spacer
		
		draw_set_color(c_dkgray)
		draw_rectangle(XX-2,YY-2,XX+button_width+2,YY+button_height+2,false)
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,XX,YY,XX+button_width,YY+button_height) {
			if exchange_currency == "ETH" draw_set_color(c_yellow) else draw_set_color(c_ltgray)
			if input.mouse_left_press {
				exchange_currency = "ETH"
			}
		} else if exchange_currency == "ETH" draw_set_color(c_yellow) else draw_set_color(c_ltgray)
		draw_rectangle(XX,YY,XX+button_width,YY+button_height,false)
		
		draw_set_color(c_black)
		draw_text(XX+button_width/2,YY+button_height/2,"ETH")
		
		
		
		#endregion
		draw_set_halign(fa_left)
		
		var spacer = 8
		
		var buytextX = windowX + 16
		var buytextY = windowY + window_height - 95
		draw_text(buytextX,buytextY,"Buy "+exchange_currency)
		
		var priceX = buytextX
		var priceY = buytextY + string_height("Buy") + spacer*3
		draw_text(priceX,priceY,"Price")
		var price_width = string_width("Price")
		//draw_set_font(fnt_shop_menu_name)
		
		//	Draw LINK or ETH logo
		var sprite = -1
		if exchange_currency == "LINK" {
			sprite = s_resource_link_shop
		} else {
			sprite = s_resource_eth_shop	
		}
		draw_sprite(sprite,0,buytextX+string_width("Buy "+exchange_currency)+30,buytextY)
		
		draw_set_font(fnt_shop)
		var amountX = buytextX
		var amountY = priceY + string_height("Price") + spacer
		draw_text(amountX,amountY,"Amount")
		var amount_width = string_width("Amount")
		draw_set_font(fnt_shop_menu_name)
		
		if exchange_currency == "LINK" {
			var currency_price = link_price
			var currency_amount = link_trade
		} else {
			var currency_price = eth_price
			var currency_amount = eth_trade	
		}
		
		//	Draw vars
		var spacer2 = 20
		draw_text(amountX+amount_width+spacer+spacer2,priceY,string(currency_price*currency_amount))
		draw_text(amountX+amount_width+spacer+spacer2,amountY,string(currency_amount))
		
		draw_set_font(fnt_shop)
		var Price_width = string_width("$$")
		draw_text_outlined(amountX+amount_width+spacer+spacer2-Price_width-6,priceY,"$$",c_green,c_black)
		
		var link_width = sprite_get_width(sprite)
		var logo_spacer = -1
		if exchange_currency == "LINK" {
			logo_spacer = 12	
		} else logo_spacer = 18
		draw_sprite_ext(sprite,0,amountX+amount_width+spacer+spacer2-(link_width*.66)+logo_spacer,amountY,.66,.66,0,c_white,1)
			
			
		
			
		draw_set_color(c_black)

		//	Scrollbar
		var bar_width = 120
		var bar_height = 20
		var barX = amountX+amount_width+(spacer*11)
		var barY = priceY-16
		
		var handle_width = (bar_width/50) + 16
		var handle_height = bar_height
		var handleX = barX + ((handle_width-16)*currency_amount)
		var handleY = barY
		
		bar_width += handle_width
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+bar_width,barY+bar_height) {
			if input.mouse_left_press or input.mouse_left {
				for(var s=0;s<51;s++) {
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX+(s*(handle_width-16)),barY,barX+(s*(handle_width-16))+handle_width-16,barY+bar_height) {
						if exchange_currency == "LINK" {
							link_trade = s
						} else {
							eth_trade = s
						}
					}
				}
			}
		}
		draw_rectangle(barX,barY,barX+bar_width,barY+bar_height,false)
		
		draw_set_color(c_gray)
		draw_rectangle(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
		
		//	Purchase Button
		draw_set_font(fnt_shop)
		draw_set_halign(fa_middle)
		var purchase_width = string_width("Buy") + spacer + 40
		var purchase_height = string_height("Buy") + spacer
		var purchaseX = windowX+window_width-purchase_width-20
		var purchaseY = windowY+window_height-purchase_height-4
		
		draw_set_color(c_black)
		draw_roundrect(purchaseX-2,purchaseY-2,purchaseX+purchase_width+2,purchaseY+purchase_height+2,false)
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,purchaseX,purchaseY,purchaseX+purchase_width,purchaseY+purchase_height) {
			draw_set_color(c_green)
			if currency_amount * currency_price > player.money draw_set_color(c_red)
			var amount_of_money = currency_amount * currency_price
			if input.mouse_left_press and player.money >= amount_of_money and amount_of_money > 0 {
				resource_changed("$$",amount_of_money,gui_mouse_x,gui_mouse_y+128,true)
				resource_changed(exchange_currency,-currency_amount,gui_mouse_x,gui_mouse_y+256,true)
			}
		} else {
			draw_set_color(c_green)
			if currency_amount * currency_price > player.money draw_set_color(c_red)
		}
		draw_roundrect(purchaseX,purchaseY,purchaseX+purchase_width,purchaseY+purchase_height,false)
		
		draw_set_color(c_black)
		draw_text(purchaseX+purchase_width/2+1,purchaseY+purchase_height/2,"Buy")
		
	}
	
	
}


#endregion

draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)