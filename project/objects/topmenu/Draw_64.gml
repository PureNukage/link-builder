//live_call()

draw_set_font(fnt_shop)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var buffer = 16
var menuX = 0
var menuY = 0
var menu_string = "Menu"
var menu_width = string_width(menu_string) + (buffer*2)

var dataX = menuX + menu_width
var dataY = menuY
var data_string = "Data"
var data_width = string_width(data_string) + (buffer*2)

var nodesX = dataX + data_width
var nodesY = menuY
var nodes_string = "Nodes"
var nodes_width = string_width(nodes_string) + (buffer*2)

contractsX = nodesX+ nodes_width
contractsY = menuY
var contracts_string = "Contracts"
contracts_width = string_width(contracts_string) + (buffer*2)

#region	menu
if point_in_rectangle(gui_mouse_x,gui_mouse_y,menuX,menuY,menuX+menu_width,menuY+48) {
	draw_set_color(c_ltgray)
	if input.mouse_left_press {
		if instance_exists(mainmenu) instance_destroy(mainmenu)
		else {
			var _menu = instance_create_layer(0,0,"Instances",mainmenu)
			_menu.menu = menu.options
			_menu.in_game = true
		}	
	}
} else {
	draw_set_color(c_dkgray)	
}
if instance_exists(mainmenu) draw_set_color(c_ltgray)

draw_rectangle(menuX,menuY,menuX+menu_width,menuY+48,false)
draw_set_color(c_black)
draw_text(menuX+menu_width/2,menuY+24,menu_string)

#endregion

#region	data

//	button
if point_in_rectangle(gui_mouse_x,gui_mouse_y,dataX,dataY,dataX+data_width,dataY+48) {
	draw_set_color(c_ltgray)
	if input.mouse_left_press {
		data_open = !data_open	
		nodes_open = false
		contracts_open = false
	}
} else {
	draw_set_color(c_dkgray)	
}
if data_open draw_set_color(c_ltgray)
draw_rectangle(dataX,dataY,dataX+data_width,dataY+48,false)
draw_set_color(c_black)
draw_text(dataX+data_width/2,dataY+24,data_string)

//	window
if data_open {
	if input.selection == -1 or (input.selection > -1 and input.selection.states != states.placement) {
		if !instance_exists(mainmenu) {
			var windowX = menuX + 64
			var windowY = menuY + 48 + 64
			var window_width = 600
			var window_height = 436
	
			draw_set_color(c_black)
			draw_roundrect(windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2,false)
			draw_set_color(c_dkgray)
			draw_roundrect(windowX,windowY,windowX+window_width,windowY+window_height,false)
	
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2) {
				data_mouseover = true	
			} else {
				data_mouseover = false	
			}
	
			//	web button
			var web_width = sprite_get_width(s_icon_web) + (buffer*2)
			var webX = windowX+window_width/2 - (web_width/2)
			var webY = windowY + (buffer*2)
	
			draw_set_color(c_black)
			draw_roundrect(webX-2,webY-2,webX+web_width+2,webY+64+2,false)
			if web_button draw_set_color(c_gray) else draw_set_color(c_gray5)
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,webX,webY,webX+web_width,webY+64) {
				draw_set_color(c_gray)
				if input.mouse_left_press {
					draw_set_color(c_ltgray)
					web_button = !web_button	
				}
				if input.doubleclick {
					web_button = true
					price_button = false
				}
			} 
			draw_roundrect(webX,webY,webX+web_width,webY+64,false)
			draw_sprite(s_icon_web,0,webX+web_width/2,webY+33)
	
			//	price data button
			var price_width = sprite_get_width(s_icon_data) + (buffer*2)
			var priceX = webX - buffer - price_width
			var priceY = webY
	
			draw_set_color(c_black)
			draw_roundrect(priceX-2,priceY-2,priceX+price_width+2,priceY+64+2,false)
			if price_button draw_set_color(c_gray) else draw_set_color(c_gray5)
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,priceX,priceY,priceX+price_width,priceY+64) {
				draw_set_color(c_gray)
				if input.mouse_left_press {
					draw_set_color(c_ltgray)
					price_button = !price_button	
				}
				if input.doubleclick {
					price_button = true
					web_button = false
				}
			}
			draw_roundrect(priceX,priceY,priceX+price_width,priceY+64,false)
			draw_sprite(s_icon_data,0,priceX+price_width/2,priceY+33)
			draw_set_color(c_black)
			draw_set_font(fnt_shop_menu_name)
			draw_text(priceX+price_width/2,priceY+42,"$")
			draw_set_font(fnt_shop)
	
			//	payments button TODO
	
			//	owned/unowned/both
			switch(owned_button) {
				case 0:	var String = "All" break
				case 1: var String = "Owned" break
				case 2: var String = "Unowned" break
			}
			var owned_width = string_width(String) + (buffer*2)
			var ownedX = webX + web_width + (buffer*2) + 64
			var ownedY = webY + (64 - string_height(String) - (buffer*2))
			draw_set_color(c_black)
			draw_roundrect(ownedX-2,ownedY-2,ownedX+owned_width+2,ownedY+string_height(String)+(buffer*2)+2,false)
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,ownedX,ownedY,ownedX+owned_width,ownedY+string_height(String)+(buffer*2)) {
				draw_set_color(c_ltgray)
				if input.mouse_left_press {
					owned_button++
					if owned_button > 2 owned_button = 0
				}
			} else {
				draw_set_color(c_gray)
			}
			draw_roundrect(ownedX,ownedY,ownedX+owned_width,ownedY+string_height(String)+(buffer*2),false)
			draw_set_color(c_black)
			draw_text(ownedX+owned_width/2,ownedY+(string_height(String)+buffer*2)/2,String)
	
			//	Draw list 
			//	prelim loop through list
			var amount = 0
			var longest_line = 0
			draw_set_font(fnt_plaque_name)
			for(var d=0;d<array_height_2d(shop.item_data);d++) {
				if shop.item_data[d, item_available] {
					var Filter = shop.item_data[d, item_filter]
					var Purchased = shop.item_data[d, item_purchased]
					var name = shop.item_data[d, item_name]
					var Price = shop.item_data[d, item_price]
					if (Filter == data_filters.pricedata and price_button) or (Filter == data_filters.webdata and web_button) {
						if (owned_button == 0) or (owned_button == 1 and Purchased) or (owned_button == 2 and !Purchased) {
							amount++
							var name_width = string_width(name)
							var price_width = string_width(string(Price))
							var price_width2 = string_width("$$")
							var total_width = name_width + price_width + price_width2 + buffer + (buffer*2) + buffer + buffer
							if total_width > longest_line longest_line = total_width
				
						}
					}	
				}
			}
	
			//	ok time to actually draw it
			var line_width = longest_line
			var line_height = 48
			var lineX = (windowX+window_width-buffer-48) - buffer - line_width
			var lineY = webY + 64 + buffer
	
			var data_clamp = 5
			//var data_index = 0
			var data_amount = 0
	
			for(var d=data_index;d<array_height_2d(shop.item_data);d++) {
				if data_amount < data_clamp and d < array_height_2d(shop.item_data) and shop.item_data[d, item_available] {
					var Filter = shop.item_data[d, item_filter]
					var Purchased = shop.item_data[d, item_purchased]
					var name = shop.item_data[d, item_name]
					var Price = shop.item_data[d, item_price]
					if (Filter == data_filters.pricedata and price_button) or (Filter == data_filters.webdata and web_button) {
						if (owned_button == 0) or (owned_button == 1 and Purchased) or (owned_button == 2 and !Purchased) {
							data_amount++
							draw_set_color(c_black)
							draw_roundrect(lineX-2,lineY-2,lineX+line_width+2,lineY+line_height+2,false)
							if point_in_rectangle(gui_mouse_x,gui_mouse_y,lineX,lineY,lineX+line_width,lineY+line_height) {
								draw_set_color(c_ltgray)
								if input.mouse_left_press {
									if !shop.item_data[d, item_placed] {
										//	Delete the item we're currently placing if there is one 
										if ds_list_size(input.selections) > 0 {
											for(var i=0;i<ds_list_size(input.selections);i++) {
												input.selections[| i].selected = false	
											}
										}
										ds_list_clear(input.selections)
										if instance_exists(c_item) {
											with c_item {
												if states == states.placement {
													instance_destroy()	
												}
											}
										}	
										data_mouseover = false
										data_open = false
										input.grid_moved = true
										input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",data)
										input.selection.selected = true
										input.selection.item_index = d
										input.selection.name = shop.item_data[d, item_name]
										input.selection.portrait = shop.item_data[d, item_portrait]
										if !shop.item_data[d, item_purchased] input.selection.price = shop.item_data[d, item_price]
										else input.selection.price = 0
										input.selection.data_generated = shop.item_data[d, item_data_generated]
										if ds_list_find_index(input.selections,input.selection) == -1 {
											ds_list_add(input.selections,input.selection)	
										}
									} else {
										
										
										
									}
							
								}
							} else {
								draw_set_color(c_gray)
							}
							draw_roundrect(lineX,lineY,lineX+line_width,lineY+line_height,false)
				
							//	draw name
							draw_set_color(c_black)
							draw_set_halign(fa_left)
							draw_text(lineX+buffer,lineY+line_height/2,name)
				
							if !shop.item_data[d, item_purchased] {
								//	draw price
								var PriceX = lineX+line_width-buffer-string_width(string(Price))
								draw_text(PriceX,lineY+line_height/2,string(Price))
				
								//	draw $$
								draw_text_outlined(PriceX-string_width("$$")-buffer,lineY+line_height/2,"$$",c_green,c_black)
							}
				
							lineY += 64
						}
					}	
				}
			}
			draw_set_font(fnt_shop)
			draw_set_halign(fa_center)
	
			//	Scrollbar
			var bar_width = 48
			var bar_height = abs((webY+64+buffer) - (windowY+window_height-buffer))
			//debug_log(string(bar_height))
			var barX = windowX+window_width-buffer-bar_width
			var barY = webY + 64 + buffer
	
			var handle_width = 40
			var handle_height = 48 
			var segments = amount - data_amount 
			var ratio = data_amount / amount
			var handle_height = bar_height * ratio
			var segment_height = (bar_height - handle_height) / segments
			//debug_log(string(segment_height))
			if segments > 0 {
	
				var handleX = barX + ((bar_width-handle_width)/2)
				var handleY = barY + (data_index * segment_height)
	
				//	draw bar
				draw_set_color(c_gray4)
				draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
	
				//	draw handle
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,handleX,handleY,handleX+handle_width,handleY+handle_height) {
					draw_set_color(c_ltgray)
					if input.mouse_left_press {
						data_barclickY1 = gui_mouse_y	
					}
					if input.mouse_left and data_barclickY1 > -1 { 
						data_barclickY2 = gui_mouse_y
						if abs(data_barclickY2 - data_barclickY1) > segment_height {
							if data_barclickY2 - data_barclickY1 > 0 {
								data_index++
								if data_index > segments data_index = segments
							} else {
								data_index--	
								if data_index < 0 data_index = 0
							}
							data_barclickY1 = gui_mouse_y
						}
					}
					if input.mouse_left_release {
						data_barclickY1 = -1
						data_barclickY2 = -1
					}
				} else {
					data_barclickY1 = -1
					data_barclickY2 = -1
					draw_set_color(c_gray)
				}
				draw_roundrect(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
		
				//	Scroll wheel
				if data_mouseover and (input.scroll_down or input.scroll_up) {
					if input.scroll_up {
						data_index--
						if data_index < 0 data_index = 0	
					}
					if input.scroll_down {
						data_index++
						if data_index > segments data_index = segments
					}
				}
			}
		}
	}
	
	
}

#endregion

#region	nodes
//	button
if point_in_rectangle(gui_mouse_x,gui_mouse_y,nodesX,nodesY,nodesX+nodes_width,nodesY+48) {
	draw_set_color(c_ltgray)	
	if input.mouse_left_press {
		nodes_open = !nodes_open
		data_open = false
		contracts_open = false
	}
} else {
	draw_set_color(c_dkgray)	
}
if nodes_open draw_set_color(c_ltgray)
draw_rectangle(nodesX,nodesY,nodesX+nodes_width,nodesY+48,false)
draw_set_color(c_black)
draw_text(nodesX+nodes_width/2,nodesY+24,nodes_string)

//	window

#endregion

#region	contracts
//	button
if point_in_rectangle(gui_mouse_x,gui_mouse_y,contractsX,contractsY,contractsX+contracts_width,contractsY+48) {
	draw_set_color(c_ltgray)
	if input.mouse_left_press {
		contracts_open = !contracts_open
		data_open = false
		nodes_open = false
	}
} else {
	draw_set_color(c_dkgray)
}	
if contracts_open draw_set_color(c_ltgray)
draw_rectangle(contractsX,contractsY,contractsX+contracts_width,contractsY+48,false)
draw_set_color(c_black)
draw_text(contractsX+contracts_width/2,contractsY+24,contracts_string)

//	window

#endregion