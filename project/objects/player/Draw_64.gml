if live_call() return live_result

if resources_active {
	////	Value
	draw_set_font(fnt_shop)
	var value_width = string_width(string(value)) + 80
	var value_height = 48
	var valueX = display_get_gui_width()/2-150
	var valueY = 0

	draw_set_color(c_dkgray)
	draw_rectangle(valueX,valueY,valueX+value_width,valueY+value_height,false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_text(valueX+60,valueY+value_height/2,string(value))

	draw_sprite_ext(s_resource_value_shop,0,valueX+24,valueY+value_height/2,1,1,0,c_white,1)


	////	Money
	var money_width = string_width(string(money)) + 80
	var money_height = value_height
	var moneyX = valueX + value_width + 24
	var moneyY = valueY

	draw_set_color(c_dkgray)
	draw_rectangle(moneyX,moneyY,moneyX+money_width,moneyY+money_height,false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_text(moneyX+60,moneyY+money_height/2,string(money))

	draw_set_font(fnt_plaque_name)
	if money > 0 var color = c_green else var color = c_red
	draw_text_outlined(moneyX+16,moneyY+money_height/2,string("$$"),color,c_black)
	draw_set_font(fnt_shop)

	/////	LINK
	var link_width = string_width(string(link)) + 80
	var link_height = money_height
	var linkX = moneyX + money_width + 24
	var linkY = moneyY

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,linkX,linkY,linkX+link_width,linkY+link_height) {
		draw_set_color(c_ltgray)
		if !shop.exchange_open or shop.exchange_currency != "LINK" {
			var String = "Open Exchange"
		} else if shop.exchange_open and shop.exchange_currency == "LINK" {
			var String = "Buy LINK"
		}
		var String_width = string_width(String) + 4
		draw_rectangle(linkX,linkY+link_height+8,linkX+String_width,linkY+link_height+8+48,false)
		draw_set_color(c_black)
		draw_text(linkX+2,linkY+link_height+8+24,String)
	
		if input.mouse_left_press {
			if !shop.exchange_open or shop.exchange_currency != "LINK" {
				shop.exchange_open = true
				shop.exchange_currency = "LINK"
			} else if shop.exchange_open and shop.exchange_currency == "LINK" {
				resource_changed("LINK",-shop.link_trade,0,0,false)
				resource_changed("$$",shop.link_price * shop.link_trade,0,0,false)
			}
		}
	
		draw_set_color(c_ltgray)
	} else draw_set_color(c_dkgray)
	draw_rectangle(linkX,linkY,linkX+link_width,linkY+link_height,false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)

	draw_text(linkX+60,linkY+link_height/2,string(link))

	draw_sprite(s_resource_link_shop,0,linkX+8,linkY+4)

	////	ETH
	eth_width = string_width(string(eth)) + 80
	eth_height = link_height
	ethX = linkX + link_width + 24
	ethY = linkY

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,ethX,ethY,ethX+eth_width,ethY+eth_height) {
		draw_set_color(c_ltgray)
		if !shop.exchange_open or shop.exchange_currency != "ETH" {
			var String = "Open Exchange"
		} else if shop.exchange_open and shop.exchange_currency == "ETH" {
			var String = "Buy ETH"
		}
		var String_width = string_width(String) + 4
		draw_rectangle(ethX,ethY+eth_height+8,ethX+String_width,ethY+eth_height+8+48,false)
		draw_set_color(c_black)
		draw_text(ethX+2,ethY+eth_height+8+24,String)
	
		if input.mouse_left_press {
			if !shop.exchange_open or shop.exchange_currency != "ETH" {
				shop.exchange_open = true
				shop.exchange_currency = "ETH"
			} else if shop.exchange_open and shop.exchange_currency == "ETH" {
				resource_changed("ETH",-shop.eth_trade,0,0,false)
				resource_changed("$$",shop.eth_trade * shop.eth_price,0,0,false)
			}
		}
	
		draw_set_color(c_ltgray)	
	} else draw_set_color(c_dkgray)
	draw_rectangle(ethX,ethY,ethX+eth_width,ethY+eth_height,false)

	draw_set_color(c_white)
	draw_text(ethX+60,ethY+eth_height/2,string(eth))

	draw_sprite(s_resource_eth_shop,0,ethX,ethY)
}