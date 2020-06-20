if live_call() return live_result

var menu_mouseovers = 0

#region Wire button

if wire_active {

	var _xx = topmenu.contractsX+topmenu.contracts_width+16
	var _yy = 0

	//	Draw background
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+64,_yy+40) and !instance_exists(mainmenu) {
		button_wire_mouseover = true
		draw_set_color(c_gray)
		menu_mouseovers++
		if !buttonMouseover {
			buttonMouseover = true
			playSoundEffect(snd_ingamehover)
		}
		if input.mouse_left_press {
			
			playSoundEffect(snd_click_1)
			
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

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx,_yy,_xx+64,_yy+30) and !instance_exists(mainmenu)  {
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
	var exchangeX = player.ethX + player.eth_width+20
	var exchangeY = player.ethY
	
	var String = "Exchange"
	var sw = string_width(String) + 16
	var sh = string_height(String) + 16
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,exchangeX,exchangeY,exchangeX+sw,exchangeY+sh) and !instance_exists(mainmenu)  {
		menu_mouseovers++
		if !buttonMouseover {
			buttonMouseover = true
			playSoundEffect(snd_ingamehover)
		}
		draw_set_color(c_ltgray)
		if input.mouse_left_press {
			playSoundEffect(snd_click_1)
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
		var windowX = exchangeX - window_width/4
		var windowY = exchangeY + sh + 80
	} else if app.resolution_width == 1920 {
		var windowX = exchangeX + sw + 10
		var windowY = exchangeY 
	}
	if exchange_open and !instance_exists(mainmenu) {
		
		draw_set_color(c_black)
		draw_roundrect(windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2,false)
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2) {
			exchange_mouseover = true
			var old_link_trade = link_trade
			var old_eth_trade = eth_trade
			if input.scroll_up or input.scroll_down {
				if exchange_currency == "LINK" {
					link_trade += input.scroll_up - input.scroll_down
					link_trade = clamp(link_trade,0,50)
				} else {
					eth_trade += input.scroll_up - input.scroll_down
					eth_trade = clamp(eth_trade,0,50)
				}
				if old_link_trade != link_trade or old_eth_trade != eth_trade and !audio_is_playing(snd_money_short) playSoundEffect(snd_money_short)
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
			//if exchange_currency == "LINK" {
			//	draw_set_color(c_yellow) 
			//} else {
			//	draw_set_color(c_ltgray)
			//}
			draw_set_color(c_orange)
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
			//if exchange_currency == "ETH" draw_set_color(c_yellow) else draw_set_color(c_ltgray)
			draw_set_color(c_orange)
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
		//var price_width = string_width("Price")
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
		var bar_width = 110
		var bar_height = 20
		var barX = amountX+amount_width+(spacer*11)
		var barY = priceY-16
		
		var handle_width = (bar_width/50) + 16
		var handle_height = bar_height
		var handleX = barX + ((handle_width-16)*currency_amount)
		var handleY = barY
		
		bar_width += handle_width
		
		var money_amount = 50
		
		var segmentSize = bar_width / money_amount
		
		var extra_space = handle_width/3
		
		var handle_color = c_white
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX-extra_space,barY,barX+bar_width+extra_space,barY+bar_height) {
			var old_link_trade = link_trade
			var old_eth_trade = eth_trade
			if input.mouse_left_press or input.mouse_left {
				handle_color = c_ltgray
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX-extra_space,barY,barX,barY+bar_height) {
					if exchange_currency == "LINK" {
						link_trade = 0
					} else {
						eth_trade = 0
					}	
				} else if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX+bar_width,barY,barX+bar_width+extra_space,barY+bar_height) {
					if exchange_currency == "LINK" {
						link_trade = money_amount
					} else {
						eth_trade = money_amount
					}
				} else {
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
			if old_link_trade != link_trade or old_eth_trade != eth_trade and !audio_is_playing(snd_money_short) playSoundEffect(snd_money_short)
		}
		draw_rectangle(barX,barY,barX+bar_width,barY+bar_height,false)
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,handleX,handleY,handleX+handle_width,handleY+handle_height) and handle_color == c_white {
			handle_color = c_ltgray	
		} else if handle_color == c_white {
			handle_color = c_dkgray
		}
		draw_set_color(handle_color)
		draw_rectangle(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
		
		//	Purchase Button
		draw_set_font(fnt_shop)
		draw_set_halign(fa_middle)
		var purchase_width = string_width("Buy") + spacer + 40
		var purchase_height = string_height("Buy") + spacer
		var purchaseX = windowX+window_width-purchase_width-20
		var purchaseY = windowY+window_height-purchase_height-8
		
		draw_set_color(c_black)
		draw_roundrect(purchaseX-2,purchaseY-2,purchaseX+purchase_width+2,purchaseY+purchase_height+2,false)
		
		draw_set_alpha(.6)
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,purchaseX,purchaseY,purchaseX+purchase_width,purchaseY+purchase_height) {
			draw_set_alpha(.9)
			if currency_amount * currency_price > player.money {
				draw_set_color(c_red)
			} else {
				draw_set_color(c_green)	
			}
			if currency_amount * currency_price > player.money draw_set_color(c_red)
			var amount_of_money = currency_amount * currency_price
			if input.mouse_left_press {
				draw_set_color(c_white)
				resource_changed("$$",amount_of_money,gui_mouse_x,gui_mouse_y+128,true)
				resource_changed(exchange_currency,-currency_amount,gui_mouse_x,gui_mouse_y+256,true)
				playSoundEffect(snd_money)
			}
		} else {
			if currency_amount * currency_price > player.money {
				draw_set_color(c_red)
			} else {
				draw_set_color(c_green)	
			}
		}
		draw_roundrect(purchaseX,purchaseY,purchaseX+purchase_width,purchaseY+purchase_height,false)
		draw_set_alpha(1)
		
		draw_set_color(c_white)
		draw_text(purchaseX+purchase_width/2+1,purchaseY+purchase_height/2,"Buy")
		
	}
	
	
}

#endregion

if buttonMouseover and menu_mouseovers == 0 {
	buttonMouseover = false	
}

draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)