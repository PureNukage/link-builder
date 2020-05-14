if live_call() return live_result

if resources_active {
	////	Value
	draw_set_font(fnt_shop)
	var value_width = string_width(string(value)) + 80
	var value_height = 48
	var valueX = display_get_gui_width()/2-125
	var valueY = 0

	////	MONEY
	var money_width = string_width(string(money)) + 80
	var money_height = value_height
	var moneyX = valueX + value_width + 24
	var moneyY = valueY
	
	////	LINK 
	var link_width = string_width(string(link)) + 80
	var link_height = money_height
	var linkX = moneyX + money_width + 24
	var linkY = moneyY
	
	
	////	ETH
	eth_width = string_width(string(eth)) + 80
	eth_height = link_height
	ethX = linkX + link_width + 24
	ethY = linkY
	
	//	Safe Meter
	var thick = 15
	var safe_width = (ethX+eth_width+thick)-(valueX-thick)
	var safe_height = eth_height + thick
	var safeX = valueX - thick
	var safeY = -4
	
	draw_set_color(c_white)
	draw_roundrect_ext(safeX,safeY,safeX+safe_width,safeY+safe_height,10,10,false)
	
	var alpha = .5
	draw_set_alpha(alpha)
	var total_wealth = money + (eth * shop.eth_price) + (link * shop.link_price)
	if chaosEvents.total_wealth_trigger > -1 and time.minutes >= 4 {
		var percent = total_wealth/chaosEvents.total_wealth_trigger
		
		if total_wealth >= chaosEvents.total_wealth_trigger draw_set_color(c_red)
		else {
			if percent < .75 draw_set_color(c_green)
			else if percent >= .75 and percent < .9 draw_set_color(c_orange)
			else if percent >= 0.9 draw_set_color(c_red)
		}
	} else draw_set_color(c_green)
	draw_roundrect_ext(safeX,safeY,safeX+safe_width,safeY+safe_height,10,10,false)
	draw_set_alpha(1)
	
	////	VALUE
	draw_set_color(c_dkgray)
	draw_rectangle(valueX,valueY,valueX+value_width,valueY+value_height,false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_text(valueX+60,valueY+value_height/2,string(value))

	draw_sprite_ext(s_resource_value_shop,0,valueX+24,valueY+value_height/2,1,1,0,c_white,1)


	////	MONEY
	draw_set_color(c_dkgray)
	draw_rectangle(moneyX,moneyY,moneyX+money_width,moneyY+money_height,false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_text(moneyX+60,moneyY+money_height/2,string(money))

	draw_set_font(fnt_plaque_name)
	if money > 0 var color = c_green else var color = c_red
	draw_text_outlined(moneyX+16,moneyY+money_height/2,string("$$"),color,c_black)
	draw_set_font(fnt_shop)
	
	#region Money list
		var list_clamp = 5
		var time_clamp = 120
		draw_set_font(fnt_plaque_name)
		if !ds_list_empty(money_list) {
			var amount = ds_list_size(money_list)
			var xx = moneyX+money_width/2-money_width/4
			var yy = moneyY+money_height+24
			for(var i=0;i<ds_list_size(money_list);i++) {
				var money_amount = (money_list[| i])*-1
				var money_time = money_list_time[| i]
				var alpha = 0
				var time_diff = time.stream - money_time
				if time_diff > 0 and time_diff < 10				alpha = 1
				else if time_diff >= 10 and time_diff < 20		alpha = .9
				else if time_diff >= 20 and time_diff < 30		alpha = .85
				else if time_diff >= 30 and time_diff < 40		alpha = .75
				else if time_diff >= 40 and time_diff < 50		alpha = .65
				else if time_diff >= 50 and time_diff < 60		alpha = .50
				else if time_diff >= 60 and time_diff < 80		alpha = .40
				else if time_diff >= 80 and time_diff < 100		alpha = .30
				else if time_diff >= 100 and time_diff < 120	alpha = .20
				draw_set_alpha(alpha)
				if money_amount > 0 var color = c_green else var color = c_red
				draw_text_outlined(xx,yy,string(money_amount),color,c_black)
				if (time.stream - money_time) >= time_clamp {
					ds_list_delete(money_list,i)
					ds_list_delete(money_list_time,i)
					i = 100
				}
				yy += 48
			}
		}
		
		
	#endregion
	
	draw_set_alpha(1)
	draw_set_font(fnt_shop)
	
	/////	LINK
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,linkX,linkY,linkX+link_width,linkY+link_height) and !instance_exists(mainmenu)  {
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
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,ethX,ethY,ethX+eth_width,ethY+eth_height) and !instance_exists(mainmenu)  {
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