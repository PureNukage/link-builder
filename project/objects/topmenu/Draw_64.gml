if live_call() return live_result

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
			var window_height = 460
	
			draw_set_color(c_black)
			draw_roundrect(windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2,false)
			draw_set_color(c_dkgray)
			draw_roundrect(windowX,windowY,windowX+window_width,windowY+window_height,false)
			
			//	data name
			draw_set_color(c_black)
			draw_set_font(fnt_shop_menu_name)
			draw_set_halign(fa_left)
			draw_text(windowX+buffer,windowY+26,"Data")
			draw_set_font(fnt_shop)
			draw_set_halign(fa_center)
	
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2) {
				data_mouseover = true	
				menu_mouseover = true
			} else {
				data_mouseover = false	
				menu_mouseover = false
			}
	
			//	web button
			var web_width = sprite_get_width(s_icon_web) + (buffer*2)
			var webX = windowX+window_width/2 - (web_width/2)
			var webY = windowY + (buffer*3)
	
			draw_set_color(c_black)
			draw_roundrect(webX-2,webY-2,webX+web_width+2,webY+64+2,false)
			draw_text(webX+web_width/2,webY-16,"Web APIs")
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,webX,webY,webX+web_width,webY+64) {
				draw_set_color(c_black)
				draw_set_color(c_ltgray)
				if input.mouse_left_press {
					web_button = !web_button	
				}
				if input.doubleclick {
					web_button = true
					price_button = false
				}
			} else {
				if web_button draw_set_color(c_gray) else draw_set_color(c_gray5)
			}
			draw_roundrect(webX,webY,webX+web_width,webY+64,false)
			draw_sprite(s_icon_web,0,webX+web_width/2,webY+33)
	
			//	price data button
			var price_width = sprite_get_width(s_icon_data) + (buffer*2)
			var priceX = webX - buffer - price_width
			var priceY = webY
	
			draw_set_color(c_black)
			draw_roundrect(priceX-2,priceY-2,priceX+price_width+2,priceY+64+2,false)
			draw_text(priceX+price_width/2,priceY-16,"Price Data")
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,priceX,priceY,priceX+price_width,priceY+64) {
				draw_set_color(c_black)
				draw_set_color(c_ltgray)
				if input.mouse_left_press {
					price_button = !price_button	
				}
				if input.doubleclick {
					price_button = true
					web_button = false
				}
			} else {
				if price_button draw_set_color(c_gray) else draw_set_color(c_gray5)	
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
								
								if !plaqueCheck() {
									var X = lineX+line_width+buffer
									var Y = lineY
									plaqueCreate(X,Y,data,d)
								} else if Plaque.index != d {
									instance_destroy(Plaque)	
									var X = lineX+line_width+buffer
									var Y = lineY
									plaqueCreate(X,Y,data,d)
								}
								
								draw_set_color(c_ltgray)
								if input.mouse_left_press {
									if shop.item_data[d, item_object_index] > -1 {
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
										var ID = shop.item_data[d, item_object_index]
										camera_goto(ID.x,ID.y,ID)
										data_mouseover = false
										data_open = false
										
										
									}
							
								}
							} else {
								
								if plaqueCheck() and Plaque.index == d {
									instance_destroy(Plaque)
									Plaque = -1
								}
								
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
if nodes_open {
	if !instance_exists(mainmenu) {

		var window_width = 400
		var window_height = 440
		var windowX = 64
		var windowY = menuY + 64 + 48
	
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX,windowY,windowX+window_width,windowY+window_height) {
			node_mouseover = true	
			menu_mouseover = true
		} else {
			node_mouseover = false	
			menu_mouseover = false
		}
	
		draw_set_color(c_black)
		draw_roundrect(windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2,false)
		draw_set_color(c_dkgray)
		draw_roundrect(windowX,windowY,windowX+window_width,windowY+window_height,false)
	
		//	nodes name
		draw_set_color(c_black)
		draw_set_font(fnt_shop_menu_name)
		draw_text(windowX+window_width/2,windowY+28,"Nodes")
		draw_set_font(fnt_shop)
	
		//	new
		var new_string = "New"
		var new_width = string_width(new_string) + (buffer*2)
		var new_height = string_height(new_string) + (buffer*2)
		var newX = windowX+window_width/2 - new_width - buffer
		var newY = windowY + buffer*3
	
		draw_set_color(c_black)
		draw_roundrect(newX-2,newY-2,newX+new_width+2,newY+new_height+2,false)
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,newX-2,newY-2,newX+new_width+2,newY+new_height+2) or node_new_button {
			draw_set_color(c_ltgray)	
			if input.mouse_left_press {
				node_owned_button = false
				node_new_button = true
			}
		} else {
			draw_set_color(c_gray)
		}
		draw_roundrect(newX,newY,newX+new_width,newY+new_height,false)
		draw_set_color(c_black)
		draw_text(newX+new_width/2,newY+new_height/2,new_string)
	
		//	owned
		var owned_string = "Owned"
		var owned_width = string_width(owned_string) + (buffer*2)
		var owned_height = string_height(owned_string) + (buffer*2)
		var ownedX = newX+new_width+buffer
		var ownedY = newY
	
		draw_set_color(c_black)
		draw_roundrect(ownedX-2,ownedY-2,ownedX+owned_width+2,ownedY+owned_height+2,false)
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,ownedX-2,ownedY-2,ownedX+owned_width+2,ownedY+owned_height+2) or node_owned_button {
			draw_set_color(c_ltgray)	
			if input.mouse_left_press {
				node_owned_button = true
				node_new_button = false
			}
		}
		else {	
			draw_set_color(c_gray)
		}
		draw_roundrect(ownedX,ownedY,ownedX+owned_width,ownedY+owned_height,false)
		draw_set_color(c_black)
		draw_text(ownedX+owned_width/2,ownedY+owned_height/2,owned_string)
	
		//	prelim loop through nodes
		shop.item_node[1, node_available] = true
		shop.item_node[2, node_available] = true
		var amount = 0
		var longest_width = 0
		draw_set_font(fnt_plaque_name)
		for(var n=0;n<array_height_2d(shop.item_node);n++) {
			if shop.item_node[n, node_available] {
				var name = shop.item_node[n, node_name]
				var Purchased = shop.item_node[n, node_purchased]
				var level = shop.item_node[n, node_level]
				if (node_new_button and !Purchased) or (node_owned_button and Purchased) {
					amount++
					var Width = string_width(name) + (buffer*2)
					if Purchased {
						Width += string_width(" "+string(level+1))	
					}
					if Width > longest_width longest_width = Width
				}
			}
		}
	
		//	draw nodes for real
		var list_width = longest_width
		var list_height = 48
		var listX = windowX+(window_width/2) - (list_width/2)
		var listY = newY+new_height+buffer
	
		var node_amount = 0
		var node_clamp = 5
		for(var n=node_index;n<array_height_2d(shop.item_node);n++) {
			if node_amount < node_clamp and shop.item_node[n, node_available] {
				var name = shop.item_node[n, node_name]
				var Purchased = shop.item_node[n, node_purchased]
				var level = shop.item_node[n, node_level]
				if (node_new_button and !Purchased) or (node_owned_button and Purchased) {
					node_amount++
				
					draw_set_color(c_black)
					draw_roundrect(listX-2,listY-2,listX+list_width+2,listY+list_height+2,false)
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,listX-2,listY-2,listX+list_width+2,listY+list_height+2) {
					
						if !plaqueCheck() {
							var X = listX+list_width+buffer
							var Y = listY
							plaqueCreate(X,Y,node,n)
						} else if Plaque.index != n {
							instance_destroy(Plaque)
							var X = listX+list_width+buffer
							var Y = listY
							plaqueCreate(X,Y,node,n)
						}
					
						draw_set_color(c_ltgray)
						if input.mouse_left_press {
							if shop.item_node[n, node_object_index] == -1 {
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
								node_mouseover = false
								nodes_open = false	
								input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",node)
								input.selection.selected = true
								input.selection.item_index = n
								input.selection.name = shop.item_node[n, node_name]
								if !shop.item_node[n, node_purchased] input.selection.price = shop.item_node[n, node_price]
								else input.selection.price = 0
								input.selection.jobruns = shop.item_node[n, node_jobruns]
								input.selection.jobruns_previous = shop.item_node[n, node_jobruns]
								if ds_list_find_index(input.selections,input.selection) == -1 {
									ds_list_add(input.selections,input.selection)	
								}							
							
							} else {
								camera_goto(shop.item_node[n, node_object_index].x,shop.item_node[n,node_object_index].y,shop.item_node[n, node_object_index])
								node_mouseover = false
								nodes_open = false
							}	
						}
					} else {
					
						if plaqueCheck() and Plaque.index == n {
							instance_destroy(Plaque)
							Plaque = -1
						}
					
						draw_set_color(c_gray)	
					}
					draw_roundrect(listX,listY,listX+list_width,listY+list_height,false)
				
					draw_set_color(c_black)
					if Purchased {
						draw_set_halign(fa_left)
						draw_text(listX+8,listY+list_height/2+2,name)
					} else {
						draw_set_halign(fa_center)	
						draw_text(listX+list_width/2,listY+list_height/2+2,name)
					}
				
					if Purchased {
						draw_set_font(fnt_shop_menu_name)
						draw_text_outlined(listX+list_width-24,listY+list_height/2+2,string(level+1),c_sergey_blue,c_black)	
						draw_set_font(fnt_plaque_name)
					}
					draw_set_halign(fa_center)
				
					listY += list_height + buffer
				}
			}
		}
		draw_set_font(fnt_shop)
	
	
		//	scrollbar
		var bar_width = 48
		var bar_height = abs((newY+new_height+buffer) - (windowY+window_height-buffer))
		var barX = windowX+window_width-bar_width-buffer
		var barY = newY+new_height+buffer
	
		var handle_width = 40
		var handle_height = 48
		var segments = amount - node_amount
		var ratio = node_amount / amount
		var handle_height = bar_height * ratio
		var segment_height = (bar_height - handle_height) / segments
	
		if segments > 0 {
			var handleX = barX + ((bar_width-handle_width)/2)
			var handleY = barY + (node_index * segment_height)
	
			draw_set_color(c_gray5)
			draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)

			if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+bar_width,barY+bar_height) {
				draw_set_color(c_ltgray)
				if input.mouse_left_press {
					node_barclickY1 = gui_mouse_y	
				}
				if input.mouse_left { 
					node_barclickY2 = gui_mouse_y
					if abs(node_barclickY2 - node_barclickY1) > segment_height {
						if node_barclickY2 - node_barclickY1 > 0 {
							node_index++
							if node_index > segments node_index = segments
						} else {
							node_index--
							if node_index < 0 node_index = 0
						}
						node_barclickY1 = gui_mouse_y
					}
				}
				if input.mouse_left_release {
					node_barclickY1 = -1
					node_barclickY2 = -1
				}
			}
			 else {	
				node_barclickY1 = -1
				node_barclickY2 = -1
				draw_set_color(c_gray)
			 }
			draw_roundrect(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
		}

		//	Scroll wheel
		if node_mouseover and (input.scroll_down or input.scroll_up) {
			if input.scroll_up {
				node_index--
				if node_index < 0 node_index = 0	
			}
			if input.scroll_down {
				node_index++
				if node_index > segments node_index = segments
			}
		}
	}

}

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

if contracts_open and !instance_exists(mainmenu) {
	
	var window_width = contract_window_width
	var window_height = contract_window_height
	var windowX = 64
	var windowY = menuY+64+buffer*3
	
	draw_set_color(c_black)	
	draw_roundrect(windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2,false)
	draw_set_color(c_dkgray)
	draw_roundrect(windowX,windowY,windowX+window_width,windowY+window_height,false)
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX,windowY,windowX+window_width+16,windowY+window_height+16) {
		contract_mouseover = true	
		menu_mouseover = true
	} else {
		contract_mouseover = false	
		menu_mouseover = false
	}
	
	//if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX+window_width-16,windowY,windowX+window_width+16,windowY+window_height+16) {
	//	if input.mouse_left_press {
	//		contract_window_width_offset = gui_mouse_x
	//		contract_window_width_previous = contract_window_width
	//	}
	//	if input.mouse_left and contract_window_width_offset > -1 {
	//		contract_window_width = contract_window_width_previous + (gui_mouse_x - contract_window_width_offset)
	//		contract_window_width = clamp(contract_window_width,contract_window_width_default)
	//	}
	//	if input.mouse_left_release {
	//		contract_window_width_offset = -1
	//		contract_window_width_previous = -1
	//	}
	//}
	
	var borderY = windowY + 50
	draw_set_color(c_black)
	draw_rectangle(windowX,borderY,windowX+window_width,borderY+1,false)
	
	draw_set_font(fnt_shop_menu_name)
	draw_set_halign(fa_left)
	draw_text(windowX+16,windowY+28,"Contracts")
	
	draw_set_font(fnt_plaque_name)
	var spacer = 64
	
	var value_array = []
	value_array[0,0] = 0
	value_array[0,1] = 0
	value_array[0,2] = 0 
	value_array[1,0] = 500
	value_array[1,1] = 0
	value_array[1,2] = 0
	var value_width = 0
	
	var yy = borderY+2+buffer*4 - surface_offsetY
	for(var v=array_height_2d(value_array)-1;v>-1;v--) {
		var String_width = string_width(string(value_array[v,0]))
		String_width += buffer*2 + sprite_get_width(s_resource_value_shop)+buffer
		if String_width > value_width value_width = String_width
		
		
		if yy > borderY+2 and yy < windowY+window_height-120 {
			draw_text(windowX+buffer,yy,string(value_array[v,0]))
			draw_sprite(s_resource_value_shop,0,windowX+buffer*6,yy)
		}
		
		yy += 64 + spacer

	}
	
	var pageX = windowX+value_width+1
	var pageY = borderY+2
	var page_width = windowX+window_width-140-value_width
	var page_height = windowY+window_height-230
	
	draw_set_color(c_sergey_blue)
	draw_set_alpha(.33)
	draw_rectangle(pageX,pageY,pageX+page_width,pageY+page_height,false)
	draw_set_alpha(1)
	
	var surface_width = 0
	var surface_height = 0
	var surfaceX = pageX+surface_offsetX
	var surfaceY = pageY+surface_offsetY
	
	//	Preliminary loop through contracts
	for(var c=0;c<array_height_2d(contracts.contract);c++) {
		var name = contracts.contract[c, contract_name]
		var price = contracts.contract[c, contract_price]
		var name_width = string_width(name) + buffer*2
		var name_height = string_height(name) + buffer*2	
		
		//	Check this contracts price againts prices in value_array
		for(var v=0;v<array_height_2d(value_array);v++) {
			if price == value_array[v,0] {
				value_array[v,1] += name_width + buffer
				var name_height_ext = name_height + spacer
				if name_height_ext > value_array[v,2] value_array[v,2] = name_height_ext
			}
		}
	}
	
	//	Get surface width and height from value_array
	for(var v=0;v<array_height_2d(value_array);v++) {
		if value_array[v,1] > 0 surface_width += value_array[v,1]
		if value_array[v,2] > 0 surface_height += value_array[v,2] + spacer + buffer*2
	}
	
	//	Create surface
	if !surface_exists(contract_surface) {
		contract_surface = surface_create(surface_width,surface_height)	
		surface_set_target(contract_surface)
		draw_clear_alpha(c_white,0)
		
		var xx = pageX + 32
		var yy = pageY + 32 
		
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		for(var v=array_height_2d(value_array)-1;v>-1;v--) {
			for(var c=0;c<array_height_2d(contracts.contract);c++) {
				if contracts.contract[c, contract_price] == value_array[v,0] {
					var name = contracts.contract[c, contract_name]
					var price = contracts.contract[c, contract_price]
					var name_width = string_width(name) + buffer*2
					var name_height = string_height(name) + buffer*2
					
					draw_set_color(c_black)
					draw_roundrect(xx-2,yy-2,xx+name_width+2,yy+name_height+2,false)

					if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx-surface_offsetX,yy-surface_offsetY,xx+name_width-surface_offsetX,yy+name_height-surface_offsetY) and player.value >= price 
					and point_in_rectangle(gui_mouse_x,gui_mouse_y,pageX,pageY,pageX+page_width,pageY+page_height) {
						//	Plaque check
						if !plaqueCheck() {
								var X = xx+name_width-surface_offsetX+buffer*2
								var Y = yy-surface_offsetY
								plaqueCreate(X,Y,kiosk,c)
						} else if Plaque.index != c {
							instance_destroy(Plaque)
							var X = xx+name_width-surface_offsetX+buffer*2
							var Y = yy-surface_offsetY
							plaqueCreate(X,Y,kiosk,c)
						}
						
						draw_set_color(c_ltgray)	
						if input.mouse_left_press {
							if contracts.contract[c, contract_kiosk] == -1 {
								if plaqueCheck() {
									instance_destroy(Plaque)
									Plaque = -1
								}
								
								
								//	Delete the item we're currently placing if there is one 
								if ds_list_size(input.selections) > 0 {
									for(var i=0;i<ds_list_size(input.selections);i++) {
										if instance_exists(input.selections[| i]) {
											input.selections[| i].selected = false	
										}
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
								contract_mouseover = false
								contracts_open = false
								input.selection = instance_create_layer(mouse_x,mouse_y,"Instances",kiosk)
								input.selection.selected = true
								input.selection.item_index = 3
								input.selection.name = contracts.contract[c, contract_name]
								input.selection.price = contracts.contract[c, contract_price]
								input.selection.smartcontract = c
								input.selection.data_needed = contracts.contract[c, contract_data]	
								input.selection.portrait = contracts.contract[c, contract_portrait]
								var level = contracts.contract[c, contract_level]
								var ports_level = contracts.contract[c, contract_level_ports]
								input.selection.ports_count = ports_level[level]
								if ds_list_find_index(input.selections,input.selection) == -1 {
									ds_list_add(input.selections,input.selection)	
								}	
							} else {
								var Contract = contracts.contract[c, contract_kiosk]
								camera_goto(Contract.x,Contract.y,Contract)
								contract_mouseover = false
								contracts_open = false
							}
						}
					} else {
						
						if plaqueCheck() and Plaque.index == c {
							instance_destroy(Plaque)
							Plaque = -1
						}
						
						draw_set_color(c_dkgray)
						if contracts.contract[c, contract_kiosk] > -1 draw_set_color(c_gray)
					}
					draw_roundrect(xx,yy,xx+name_width,yy+name_height,false)
					
					draw_set_color(c_black)
					if player.value < price {
						var new_name = ""
						for(var l=0;l<string_length(name);l++) {
							new_name += "~"	
						}
						name = new_name
					}
					draw_text(xx+name_width/2,yy+name_height/2,name)
					
					xx += name_width+buffer
				}
			}
			xx = pageX + 32
			yy += name_height + spacer
		}
		
		surface_reset_target()
	}
	
	if surface_exists(contract_surface) {
		draw_surface_part(contract_surface,surfaceX,surfaceY,page_width+1,page_height,pageX,pageY)	
	}
	
	surface_free(contract_surface)
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX+window_width-16,windowY,windowX+window_width+16,windowY+window_height+16) {
		window_set_cursor(cr_size_we)
		if input.mouse_left_press {
			contract_window_width_offset = gui_mouse_x
			contract_window_width_previous = contract_window_width
		}
		if input.mouse_left and contract_window_width_offset > -1 {
			contract_window_width = contract_window_width_previous + (gui_mouse_x - contract_window_width_offset)
			contract_window_width = clamp(contract_window_width,contract_window_width_default,surface_width)
		}
		if input.mouse_left_release {
			contract_window_width_offset = -1
			contract_window_width_previous = -1
			window_set_cursor(cr_default)	
		}
	} else {
		if !input.mouse_left {
			contract_window_width_offset = -1
			contract_window_width_previous = -1
			window_set_cursor(cr_default)	
		}
	}
	if input.mouse_left and contract_window_width_offset > -1 {
		window_set_cursor(cr_size_we)
		contract_window_width = contract_window_width_previous + (gui_mouse_x - contract_window_width_offset)
		contract_window_width = clamp(contract_window_width,contract_window_width_default,surface_width)
	}
	
	//	vertical scrollbar
	draw_set_color(c_black)
	var line1X = windowX+window_width-73
	var line1Y = borderY+1
	draw_rectangle(windowX+window_width-72,borderY+1,windowX+window_width-73,windowY+window_height-64,false)
	
	var bar_width = 40
	var bar_height = abs((windowY+window_height-65)-(borderY+buffer))
	var barX = windowX+window_width-buffer-bar_width
	var barY = borderY+buffer
	
	draw_set_color(c_gray5)
	draw_roundrect_ext(barX,barY,barX+bar_width,barY+bar_height,15,15,false)
	
	var handle_width = 40
	var handle_height = abs(surface_height - bar_height)
	var handleX = windowX+window_width-buffer-bar_width
	var handleY = barY + surface_offsetY
	
	var max_offsetY = bar_height-handle_height
	var segment = bar_height/max_offsetY
	var scroll_speed = 16
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+bar_width,barY+bar_height) and contract_window_width_offset == -1 {
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,handleX,handleY,handleX+handle_width,handleY+handle_height) {
			draw_set_color(c_ltgray)
			if input.mouse_left_press {
				vert_bar_y1 = gui_mouse_y
			}
			if input.mouse_left and vert_bar_y1 > -1 {
				vert_bar_y2 = gui_mouse_y
				if abs(vert_bar_y2 - vert_bar_y1) >= segment {
					surface_offsetY += vert_bar_y2 - vert_bar_y1
					vert_bar_y1 = gui_mouse_y
					surface_offsetY = clamp(surface_offsetY,0,max_offsetY)
				}
			}
		} else {
			draw_set_color(c_gray)
			if input.mouse_left_press {
				for(var s=0;s<max_offsetY;s++) {
					var Y = barY + (s*segment)
					if gui_mouse_y > Y and gui_mouse_y < Y+segment {
						surface_offsetY = s	
					}
				}
			}
		}
	} else {
		draw_set_color(c_gray)	
	}
	draw_roundrect_ext(handleX,handleY,handleX+handle_width,handleY+handle_height,15,30,false)
	
	//	Vertical mouse scroll
	if contract_mouseover and (input.scroll_up or input.scroll_down) {
		if input.scroll_up surface_offsetY -= scroll_speed
		if input.scroll_down surface_offsetY += scroll_speed
		surface_offsetY = clamp(surface_offsetY,0,max_offsetY)
	}
	
	if contract_window_width < surface_width - 100 {
		//	horizontal scrollbar
		draw_set_color(c_black)
		var line2X = windowX
		var line2Y = windowY+window_height-65
		draw_rectangle(windowX,windowY+window_height-64,windowX+window_width-73,windowY+window_height-65,false)
	
		var bar_width = abs((windowX+window_width-73) - (windowX+buffer))
		var bar_height = 48
		var barX = windowX+buffer
		var barY = windowY+window_height-36-buffer*2+10
	
		draw_set_color(c_gray5)
		draw_roundrect_ext(barX,barY,barX+bar_width,barY+bar_height,15,15,false)
	
		var handle_width = abs(surface_width-bar_width)
		var handle_height = 40
		var handleX = barX + surface_offsetX
		var handleY = windowY+window_height - 38 - buffer
	
		var max_offsetX = bar_width-handle_width
		var segment = bar_width/max_offsetX
		var scroll_speed = 16
	
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+bar_width,barY+bar_height) {
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,handleX,handleY,handleX+handle_width,handleY+handle_height) {
				draw_set_color(c_ltgray)
				if input.mouse_left_press {
					hor_bar_x1 = gui_mouse_x
				}
				if input.mouse_left and hor_bar_x1 > -1 {
					hor_bar_x2 = gui_mouse_x
					if abs(hor_bar_x2 - hor_bar_x1) > segment {
						surface_offsetX += hor_bar_x2 - hor_bar_x1
						hor_bar_x1 = gui_mouse_x
						surface_offsetX = clamp(surface_offsetX,0,max_offsetX)
					}
				}
			} else {
				draw_set_color(c_gray)
				if input.mouse_left_press {
					for(var s=0;s<max_offsetX;s++) {
						var X = barX + (s*segment)
						if gui_mouse_x > X and gui_mouse_x < X+segment {
							surface_offsetX = s	
						}
					}	
				}
			}
		} else {
			draw_set_color(c_gray)
		}
		draw_roundrect_ext(handleX,handleY,handleX+handle_width,handleY+handle_height,15,30,false)
	} else {
		if surface_offsetX > 0 surface_offsetX = 0
		
	}
	
	



}

#endregion