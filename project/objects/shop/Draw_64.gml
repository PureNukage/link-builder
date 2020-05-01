if live_call() return live_result

#region Wire button

if wire_active {

	var _xx = topmenu.contractsX+topmenu.contracts_width+16
	var _yy = 0

	//	Draw background
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+64,_yy+40) and !instance_exists(mainmenu) {
		button_wire_mouseover = true
		draw_set_color(c_gray)	
		if input.mouse_left_press {
			
			if input.selection_mode != selection_mode.free input.selection_mode = selection_mode.free
			
			if input.selection > -1 {
				for(var i=0;i<ds_list_size(input.selections);i++) {
					input.selections[| i].selected = false	
				}
				ds_list_clear(input.selections)
				input.selection.selected = false
				input.selection = -1
			}
			
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
	draw_rectangle(_xx,_yy,_xx+64,_yy+48,false)

	sprite_set_offset(s_wire_socket,sprite_get_width(s_wire_socket)/2,sprite_get_height(s_wire_socket)/2)
	draw_sprite_ext(s_wire_socket,0,_xx+sprite_get_width(s_wire_socket)/2,_yy+sprite_get_height(s_wire_socket)/2+10,1,1,0,c_sergey_blue,1)

}

#endregion

#region Alt Mode

if instance_exists(c_item) {
	draw_set_font(fnt_shop)
	var _xx = topmenu.contractsX+topmenu.contracts_width+16 + sprite_get_width(s_wire_socket) + 40
	var _yy = 0

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+64,_yy+30) {
		altmode_mouseover = true
		draw_set_color(c_ltgray)
		if input.mouse_left_press {
			game.vision = !game.vision
		}	
	} else {
		altmode_mouseover = false
		if game.vision or game.temp_vision draw_set_color(c_gray)
		else draw_set_color(c_dkgray)
	}
	draw_rectangle(_xx,_yy,_xx+64,_yy+30,false)

	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_text(_xx+64/2,_yy+30/2,"ALT")
}

#endregion

#region Exchange

if exchange_active {

	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	//	Exchange Button
	draw_set_valign(fa_top)
	draw_set_font(fnt_shop)
	var exchangeX = player.ethX + player.eth_width+8
	var exchangeY = player.ethY
	
	var String = "Exchange"
	var sw = string_width(String) + 16
	var sh = string_height(String) + 16
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,exchangeX,exchangeY,exchangeX+sw,exchangeY+sh) {
		draw_set_color(c_ltgray)
		if input.mouse_left_press {
			exchange_open = !exchange_open
			if exchange_open {
				if personController.hero_menu_open personController.hero_menu_open = false
				if textboxController.messages_open textboxController.messages_open = false	
			}
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
		draw_sprite(sprite,0,buytextX+string_width("Buy "+exchange_currency)+5,buytextY-20)
		
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
			logo_spacer = 0
		} else logo_spacer = 4
		draw_sprite_ext(sprite,0,amountX+amount_width+spacer+spacer2-(link_width*.66)+logo_spacer,amountY-14,.66,.66,0,c_white,1)
			
			
		
			
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
			if input.mouse_left_press {
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