if live_call() return live_result

draw_set_halign(fa_center)
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
var nodes_string = "Oracles"
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
			_menu.menu = menu.in_game
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

if data_active {
	//	button
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,dataX,dataY,dataX+data_width,dataY+48) {
		draw_set_color(c_ltgray)
		if input.mouse_left_press {
			data_open = !data_open	
			nodes_open = false
			contracts_open = false
		}
	} else {
		if data_new > 0 {
			draw_set_color(new_flash.color)
		} else draw_set_color(c_dkgray)	
	}
	if data_open draw_set_color(c_ltgray)
	draw_rectangle(dataX,dataY,dataX+data_width,dataY+48,false)
	draw_set_color(c_black)
	draw_text(dataX+data_width/2,dataY+24,data_string)
}

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
			draw_set_halign(fa_center)
			draw_text(windowX+window_width/2,windowY+26,"Data Sources")
			draw_set_font(fnt_shop)
			draw_set_halign(fa_center)
	
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX-2,windowY-2,windowX+window_width+2,windowY+window_height+2) {
				data_mouseover = true	
				menu_mouseover = true
			} else {
				data_mouseover = false	
				menu_mouseover = false
			}
			
			#region Buttons
				//	web button
				var web_width = sprite_get_width(s_icon_web) + (buffer*2)
				var webX = windowX+window_width/2 - (web_width/2)
				var webY = windowY + (buffer*5)
	
				draw_set_color(c_black)
				draw_roundrect(webX-2,webY-2,webX+web_width+2,webY+64+2,false)
				draw_text(webX+web_width/2,webY-16,"Web APIs")
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,webX,webY,webX+web_width,webY+64) {
					draw_set_color(c_black)
					draw_set_color(c_ltgray)
					if input.mouse_left_press {
						web_button = !web_button
						if surface_exists(data_surface) surface_free(data_surface)
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
						if surface_exists(data_surface) surface_free(data_surface)
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
	
				////	payments button TODO
				
	
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
						if surface_exists(data_surface) surface_free(data_surface)	
						owned_button++
						if owned_button > 2 owned_button = 0
					}
				} else {
					draw_set_color(c_gray)
				}
				draw_roundrect(ownedX,ownedY,ownedX+owned_width,ownedY+string_height(String)+(buffer*2),false)
				draw_set_color(c_black)
				draw_text(ownedX+owned_width/2,ownedY+(string_height(String)+buffer*2)/2,String)
		#endregion
			
			var filtered_list = []
			var amount = 0
			var longest_line = 0
			
			var surface_width = window_width
			var surface_height = 0
			
			draw_set_font(fnt_plaque_name)
			//	Prelim loop through the list
			for(var d=0;d<array_height_2d(shop.item_data);d++) {
				if shop.item_data[d,item_available] {
					var Filter = shop.item_data[d, item_filter]
					var Purchased = shop.item_data[d, item_purchased]
					var name = shop.item_data[d, item_name]
					var Price = shop.item_data[d, item_price]
					if (Filter == data_filters.pricedata and price_button) or (Filter == data_filters.webdata and web_button) {
						if (owned_button == 0) or (owned_button == 1 and Purchased) or (owned_button == 2 and !Purchased) {
							filtered_list[amount] = d
							amount++
							var name_width = string_width(name)
							var price_width = string_width(string(Price))
							var price_width2 = string_width("$$")
							var total_width = name_width + price_width + price_width2 + buffer + buffer*2 + buffer + buffer
							if total_width > longest_line longest_line = total_width
							surface_height += 64
							
						}
					}
				}
			}
			
			var line_width = longest_line
			var line_height = 48
			var lineX = (windowX+window_width-buffer-48) - buffer - line_width
			var lineY = webY + 64 + buffer + 2
			
			var lineX = 64
			var lineY = 4
			
			var XX = 64
			var YY = webY + 64 + buffer + 2-data_surface_offsetY
			
			var pageX = windowX+1
			var pageY = webY + 64 + buffer
			var page_width = surface_width
			var page_height = abs((windowY+window_height)-(webY + 64 + buffer))
			
			if !surface_exists(data_surface) and surface_height > 0 {
				
				data_surface = surface_create(surface_width,surface_height)
				surface_set_target(data_surface)	
				draw_clear_alpha(c_white,0)
				
				
				for(var d=0;d<array_length_1d(filtered_list);d++) {
					var index = filtered_list[d]
					var name = shop.item_data[index, item_name]
					var price = shop.item_data[index, item_price]
					var Filter = shop.item_data[index, item_filter]
					var purchased = shop.item_data[index, item_purchased]
				
					//	Draw line
					draw_set_color(c_black)
					draw_roundrect(lineX-2,lineY-2,lineX+line_width+2,lineY+line_height+2,false)
					
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,pageX,pageY,pageX+page_width,pageY+page_height) {
						if point_in_rectangle(gui_mouse_x,gui_mouse_y,XX-2,YY-2,XX+line_width+2,YY+line_height+2) {
							draw_set_color(c_ltgray)
							
							if shop.item_data[index, item_new] {
								shop.item_data[index, item_new] = false
							}
						
							if input.mouse_left_press {
								if shop.item_data[index, item_object_index] == -1 {
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
									input.selection.item_index = index
									input.selection.name = shop.item_data[index, item_name]
									input.selection.portrait = shop.item_data[index, item_portrait]
									if !shop.item_data[index, item_purchased] input.selection.price = shop.item_data[index, item_price]
									else input.selection.price = 0
									input.selection.data_generated = shop.item_data[index, item_data_generated]
									if ds_list_find_index(input.selections,input.selection) == -1 {
										ds_list_add(input.selections,input.selection)	
									}
								} else {
									var ID = shop.item_data[index, item_object_index]
									camera_goto(ID.x,ID.y,ID)
									data_mouseover = false
									data_open = false
								}
							}
						} else {
							if shop.item_data[index, item_object_index] > -1 draw_set_color(c_gray)
							else {
								if shop.item_data[index, item_new] draw_set_color(new_flash.color)
								else draw_set_color(c_gray4)	
							}
						}
					} else {
						if shop.item_data[index, item_object_index] > -1 draw_set_color(c_gray)
						else {
							if shop.item_data[index, item_new] draw_set_color(new_flash.color)
							else draw_set_color(c_gray4)
						}
					}
					YY += 64
					draw_roundrect(lineX,lineY,lineX+line_width,lineY+line_height,false)
					
				
					//	Draw Data Name and Price
					draw_set_color(c_black)
					draw_set_halign(fa_left)
					draw_text(lineX+buffer,lineY+line_height/2,name)
					
					if !purchased {
						//  Price
						draw_text(lineX+line_width-buffer*4,lineY+line_height/2,price)
						draw_set_color(c_green)
						draw_text_outlined(lineX+line_width-buffer*4-string_width(string(price)),lineY+line_height/2,"$$",c_green,c_black)
					}
				
					//	Draw type of data
					if Filter == data_filters.pricedata var image = s_icon_data else var image = s_icon_web
					draw_sprite_ext(image,0,lineX-buffer*2,lineY+line_height/2+2,.66,.66,0,c_white,1)
					if Filter == data_filters.pricedata {
						draw_set_color(c_black)
						draw_set_halign(fa_center)
						draw_text(lineX-buffer*2,lineY+line_height/2+8,"$")
					
					}
				
					lineY += 64
				}
				surface_reset_target()
			}
			
			var pageX = windowX+1
			var pageY = webY + 64 + buffer
			var page_width = surface_width
			var page_height = abs((windowY+window_height)-(webY + 64 + buffer))
			
			//draw_set_alpha(.33)
			//draw_rectangle(pageX,pageY,pageX+page_width,pageY+page_height,false)
			
			//draw_set_color(c_green)
			//var YY = webY+64+buffer
			//draw_rectangle(64,YY-data_surface_offsetY,64+surface_width,YY-data_surface_offsetY+surface_height,false)
			//draw_set_alpha(1)
			
			if surface_exists(data_surface) {
				draw_surface_part(data_surface,0,0+data_surface_offsetY,page_width+60,page_height,pageX,pageY)
			}
			//if surface_exists(data_surface) surface_free(data_surface)
			//if point_in_rectangle(gui_mouse_x,gui_mouse_y,pageX,pageY,pageX+page_width,pageY+page_height) {
				if surface_exists(data_surface) surface_free(data_surface)	
			//}
			
			if surface_height > page_height {
				if data_mouseover {
					if input.scroll_up or input.scroll_down {
						if input.scroll_up data_surface_offsetY -= 100
						if input.scroll_down data_surface_offsetY += 100
					}
				}
			}
			
			//	Scrollbar
			var bar_width = 48
			var bar_height = (windowY+window_height)-(webY + 64 + buffer)
			var barX = windowX+window_width-62
			var barY = webY+64+buffer
			
			var handle_width = 48
			var handle_height = 48
			var handle_height = (page_height/(surface_height-page_height)) * bar_height
			var handleX = barX+2
			var handleY = barY + (data_surface_offsetY/(surface_height-page_height) * (bar_height-handle_height))
			
			if (surface_height - page_height) < page_height {
				handle_height = page_height/surface_height * bar_height	
				var handleY = barY + (data_surface_offsetY/(surface_height-page_height) * (bar_height-handle_height))
			}
			
			var segment = (data_surface_offsetY/(surface_height-page_height) * (bar_height-handle_height))
			var segments = round(bar_height/segment)
			
			if (surface_height - page_height) < page_height {
			//if surface_height > page_height and handle_height < bar_height {
				data_surface_offsetY = clamp(data_surface_offsetY,0,0)
			} else {
				data_surface_offsetY = clamp(data_surface_offsetY,0,abs(surface_height-page_height))
			}
			
			draw_set_color(c_black)
			draw_set_halign(fa_left)
			
			//	Scrollbar click
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+bar_width,barY+bar_height) {
				if input.mouse_left_press or input.mouse_left {
					var Y = gui_mouse_y
					Y = ((Y - 272) / bar_height)*(surface_height-page_height)
					data_surface_offsetY = Y
				}
			}
			
			if surface_height > page_height and handle_height < bar_height {
			
				draw_set_color(c_gray4)
				draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
			
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,handleX,handleY,handleX+handle_width,handleY+handle_height) 
				or (point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+bar_width,barY+bar_height) and 
				(input.mouse_left_press or input.mouse_left)) {
					draw_set_color(c_ltgray)	
				} else {
					draw_set_color(c_gray)
				}
				draw_roundrect(handleX,handleY,handleX+handle_width,handleY+handle_height,false)
			}
			
			//	Debug
			//draw_set_color(c_black)
			//draw_set_halign(fa_left)
			//var yy = windowY + 120
			//draw_text(windowX+window_width+20,yy,"surface_height: "+string(surface_height)) yy += 24
			//draw_text(windowX+window_width+20,yy,"page_height: "+string(page_height)) yy += 24
			//draw_text(windowX+window_width+20,yy,"bar_height: "+string(bar_height)) yy += 24
			//draw_text(windowX+window_width+20,yy,"handleY: "+string(handleY)) yy += 24
			//draw_text(windowX+window_width+20,yy,"data_surface_offsetY: "+string(data_surface_offsetY)) yy += 24
			//draw_text(windowX+window_width+20,yy,"segment: "+string(segment)) yy += 24
			//draw_text(windowX+window_width+20,yy,"segments: "+string(segments)) yy += 24
	
		}
	}
	
	
}

#endregion

#region	nodes
if nodes_active {
	//	button
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,nodesX,nodesY,nodesX+nodes_width,nodesY+48) {
		draw_set_color(c_ltgray)	
		if input.mouse_left_press {
			nodes_open = !nodes_open
			data_open = false
			contracts_open = false
		}
	} else {
		if node_new_count > 0 {
			draw_set_color(new_flash.color)
		} else draw_set_color(c_dkgray)	
	}
	if nodes_open draw_set_color(c_ltgray)
	draw_rectangle(nodesX,nodesY,nodesX+nodes_width,nodesY+48,false)
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_set_font(fnt_shop)
	draw_text(nodesX+nodes_width/2,nodesY+24,nodes_string)
}

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
		draw_text(windowX+window_width/2,windowY+28,"Oracles")
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
						
						if shop.item_node[n, node_new] shop.item_node[n, node_new] = false
					
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
								input.selection.skillpoints = shop.item_node[n, node_skillpoints]
								input.selection.item_index = n
								input.selection.name = shop.item_node[n, node_name]
								if !shop.item_node[n, node_purchased] input.selection.price = shop.item_node[n, node_price]
								else input.selection.price = 0
								input.selection.jobruns = shop.item_node[n, node_jobruns]
								input.selection.jobruns_previous = shop.item_node[n, node_jobruns]
								if ds_list_find_index(input.selections,input.selection) == -1 {
									ds_list_add(input.selections,input.selection)	
								}
								//	Loop through skills and give node its max_ports
								var Skills = shop.item_node[n, node_skills]
								for(var s=0;s<array_height_2d(Skills);s++) {
									if Skills[s,skill_acquired] {
										switch(Skills[s,skill_type])
										{
											case skills.two_more_ports:
												input.selection.ports_count_max += 2
											break
										}
									}
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
						
						if shop.item_node[n, node_new] draw_set_color(new_flash.color)
						else draw_set_color(c_gray)	
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
if contracts_active { 
	var menu_change = false
	//	button
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,contractsX,contractsY,contractsX+contracts_width,contractsY+48) {
		draw_set_color(c_ltgray)
		if input.mouse_left_press {
			contracts_open = !contracts_open
			data_open = false
			nodes_open = false
			menu_change = true
		}
	} else {
		if contract_new_count > 0 {
			draw_set_color(new_flash.color)
		} else draw_set_color(c_dkgray)	
	}	
	if contracts_open draw_set_color(c_ltgray)
	draw_rectangle(contractsX,contractsY,contractsX+contracts_width,contractsY+48,false)
	draw_set_color(c_black)
	draw_text(contractsX+contracts_width/2,contractsY+24,contracts_string)
}

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
	
	var borderY = windowY + 50
	draw_set_color(c_black)
	draw_rectangle(windowX,borderY,windowX+window_width,borderY+1,false)
	
	draw_set_font(fnt_shop_menu_name)
	draw_set_halign(fa_left)
	draw_text(windowX+16,windowY+28,"Contracts")
	
	#region	Contract type submenus

		draw_set_font(fnt_shop)
		draw_set_halign(fa_center)
		
		//	Utility
		var type_width = 100
		var type_height = 40
		var typeX = windowX+160
		var typeY = windowY+5
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,typeX,typeY,typeX+type_width,typeY+type_height) {
			if contract_types == contract_types.utility draw_set_color(c_ltgray)
			else draw_set_color(c_gray)
			if input.mouse_left_press {
				contract_types = contract_types.utility
				surface_offsetX = 0
				surface_offsetY = 0
				menu_change = true
			}
		} else {
			if contract_types == contract_types.utility draw_set_color(c_gray) 
			else draw_set_color(c_gray4)	
		}
		draw_roundrect(typeX,typeY,typeX+type_width,typeY+type_height,false)
		
		draw_set_color(c_black)
		draw_text(typeX+type_width/2,typeY+type_height/2,"Utility")
		
		//	Hackathon
		var type_width = 100
		var type_height = 40
		var typeX = windowX+window_width-((type_width*3)+(6*3))
		var typeY = windowY+5


		if point_in_rectangle(gui_mouse_x,gui_mouse_y,typeX,typeY,typeX+type_width,typeY+type_height) {
			if contract_types == contract_types.hackathon draw_set_color(c_ltgray)
			else draw_set_color(c_gray)
			if input.mouse_left_press {
				contract_types = contract_types.hackathon
				surface_offsetX = 0
				surface_offsetY = 0
				menu_change = true
			}
		} else {
			if contract_types == contract_types.hackathon draw_set_color(c_gray) 
			else draw_set_color(c_gray4)	
		}
		draw_roundrect(typeX,typeY,typeX+type_width,typeY+type_height,false)
	
		draw_set_color(c_black)
		draw_text(typeX+type_width/2,typeY+type_height/2,"Hackathon")
		
		//	DeFi
		var typeX = windowX+window_width-((type_width*2)+(6*2))
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,typeX,typeY,typeX+type_width,typeY+type_height) {
			if contract_types == contract_types.defi draw_set_color(c_ltgray)
			else draw_set_color(c_gray)
			if input.mouse_left_press {
				contract_types = contract_types.defi
				surface_offsetX = 0
				surface_offsetY = 0
				menu_change = true
			}
		} else {
			if contract_types == contract_types.defi draw_set_color(c_gray) 
			else draw_set_color(c_gray4)	
		}
		draw_roundrect(typeX,typeY,typeX+type_width,typeY+type_height,false)
	
		draw_set_color(c_black)
		draw_text(typeX+type_width/2,typeY+type_height/2,"DeFi")
		
		
		//	Enterprise
		var typeX = windowX+window_width-((type_width*1)+(6*1))
		
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,typeX,typeY,typeX+type_width,typeY+type_height) {
			if contract_types == contract_types.enterprise draw_set_color(c_ltgray)
			else draw_set_color(c_gray)
			if input.mouse_left_press {
				contract_types = contract_types.enterprise
				surface_offsetX = 0
				surface_offsetY = 0
				menu_change = true
			}
		} else {
			if contract_types == contract_types.enterprise draw_set_color(c_gray) 
			else draw_set_color(c_gray4)	
		}
		draw_roundrect(typeX,typeY,typeX+type_width,typeY+type_height,false)
	
		draw_set_color(c_black)
		draw_text(typeX+type_width/2,typeY+type_height/2,"Enterprise")
	
	
	
	
	
	#endregion
	
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_set_font(fnt_plaque_name)
	var spacer = 64
	
	var value_array = []
	value_array[0,0] = 0		//	Price of the Contract in VALUE
	value_array[0,1] = 0		//	string width of the amount
	value_array[0,2] = 0		//	string height of the amount
	value_array[0,3] = false	//	is this price being used for this contract_type2?
	value_array[1,0] = 500
	value_array[1,1] = 0
	value_array[1,2] = 0
	value_array[1,3] = false
	value_array[2,0] = 1000
	value_array[2,1] = 0
	value_array[2,2] = 0
	value_array[2,3] = false
	value_array[3,0] = 1500
	value_array[3,1] = 0
	value_array[3,2] = 0
	value_array[3,3] = false
	value_array[4,0] = 2000
	value_array[4,1] = 0
	value_array[4,2] = 0
	value_array[4,3] = false
	value_array[5,0] = 2500
	value_array[5,1] = 0
	value_array[5,2] = 0
	value_array[5,3] = false
	value_array[6,0] = 3000
	value_array[6,1] = 0
	value_array[6,2] = 0
	value_array[6,3] = false
	value_array[7,0] = 4000
	value_array[7,1] = 0
	value_array[7,2] = 0
	value_array[7,3] = false
	value_array[8,0] = 5500
	value_array[8,1] = 0
	value_array[8,2] = 0
	value_array[8,3] = false
	var value_width = 0
	
	//	Preliminary loop through contracts
	for(var c=0;c<array_height_2d(contracts.contract);c++) {
		var name = contracts.contract[c, contract_name]
		var price = contracts.contract[c, contract_price]
		var name_width = string_width(name) + buffer*10
		var name_height = string_height(name) + buffer*2	
		
		//	Check this contracts price againts prices in value_array
		for(var v=0;v<array_height_2d(value_array);v++) {
			if price == value_array[v,0] and contracts.contract[c, contract_type2] == contract_types {
				if contracts.contract[c, contract_available] and contracts.contract[c, contract_type2] == contract_types {
					value_array[v,3] = true
					value_array[v,1] += name_width + buffer
					var name_height_ext = name_height + 64 + spacer
					if name_height_ext > value_array[v,2] value_array[v,2] = name_height_ext
				}
			}
		}
	}
	
	//	Draw the value prices
	var how_many_values = 0
	var yy = borderY+2+buffer*4 - surface_offsetY
	for(var v=array_height_2d(value_array)-1;v>-1;v--) {
		if value_array[v,3] {
			how_many_values++
			var String_width = string_width(string(value_array[v,0]))
			String_width += buffer*2 + sprite_get_width(s_resource_value_shop)+buffer
			if String_width > value_width value_width = String_width
		
		
			if yy > borderY+20 and yy < windowY+window_height-80 {
				draw_text(windowX+buffer,yy,string(value_array[v,0]))
				draw_sprite(s_resource_value_shop,0,windowX+buffer*6,yy)
			}
			yy += 64 + spacer
		}
		//yy += 64 + spacer
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
	
	//	Get surface width and height from value_array
	for(var v=0;v<array_height_2d(value_array);v++) {
		//if value_array[v,1] > 0 surface_width += value_array[v,1]
		//if value_array[v,2] > 0 surface_height += value_array[v,2] + spacer + buffer*2
		if value_array[v,1] > surface_width surface_width = value_array[v,1]
		if value_array[v,2] > surface_height surface_height = (value_array[v,2]*how_many_values) + spacer
	}
	
	if time.seconds_switch {	
		//debug_log("value_width: "+string(value_width))
		//debug_log("pageX: "+string(pageX))	
		//debug_log("pageY: "+string(pageY))
		//debug_log("page_width: "+string(page_width))
		//debug_log("page_height: "+string(page_height))
		
		//debug_log("surface_width: "+string(surface_width))
		//debug_log("surface_height: "+string(surface_height))
	}
	
	//if surface_width < page_width surface_width = page_width
	if surface_height < page_height surface_height = page_height
	
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
				if contracts.contract[c, contract_price] == value_array[v,0] and contracts.contract[c, contract_available] and contracts.contract[c, contract_type2] == contract_types and value_array[v,3] {
					var name = contracts.contract[c, contract_name]
					var price = contracts.contract[c, contract_price]
					var name_width = string_width(name) + buffer*2
					var name_height = string_height(name) + buffer*2
					
					draw_set_color(c_black)
					draw_roundrect(xx-2,yy-2,xx+name_width+2,yy+name_height+2,false)

					if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx-surface_offsetX,yy-surface_offsetY,xx+name_width-surface_offsetX,yy+name_height-surface_offsetY) and player.value >= price 
					and point_in_rectangle(gui_mouse_x,gui_mouse_y,pageX,pageY,pageX+page_width,pageY+page_height) {
						
						if contracts.contract[c, contract_new] and player.value >= price contracts.contract[c, contract_new] = false
						
						//	Plaque check
						if !plaqueCheck() {
								var X = xx+name_width-surface_offsetX+buffer*2
								var Y = yy-surface_offsetY
								plaqueCreate(X,Y,kiosk,c)
								if X + Plaque.window_width > display_get_gui_width() {
									Plaque.windowX = xx-name_width-surface_offsetX-buffer*2
								}
						} else if Plaque.index != c {
							instance_destroy(Plaque)
							var X = xx+name_width-surface_offsetX+buffer*2
							var Y = yy-surface_offsetY
							plaqueCreate(X,Y,kiosk,c)
							if X + Plaque.window_width > display_get_gui_width() {
								Plaque.windowX = xx-name_width-surface_offsetX-buffer*2
							}
						}
						
						if Plaque > -1 and xx+name_width-surface_offsetX+buffer*2 + Plaque.window_width > display_get_gui_width() {
							Plaque.windowX = xx-name_width-surface_offsetX-buffer*2	
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
						
						if contracts.contract[c, contract_new] and player.value >= price draw_set_color(new_flash.color)
						else {	
							draw_set_color(c_dkgray)
							if contracts.contract[c, contract_kiosk] > -1 draw_set_color(c_gray)
						}
					}
					draw_roundrect(xx,yy,xx+name_width,yy+name_height,false)
					
					draw_set_color(c_black)
					if player.value < price {
						//var new_name = ""
						//for(var l=0;l<string_length(name);l++) {
						//	new_name += "~"	
						//}
						//name = new_name
						name = "LOCKED"
					}
					draw_text(xx+name_width/2,yy+name_height/2,name)
					
					xx += name_width+buffer
				}
			}
			xx = pageX + 32
			if value_array[v,3] yy += name_height + spacer
		}
		
		surface_reset_target()
	}
	
	if surface_exists(contract_surface) {
		draw_surface_part(contract_surface,surfaceX,surfaceY,page_width+1,page_height,pageX,pageY)	
	}
	
	if surface_exists(contract_surface) surface_free(contract_surface)
	
	contract_window_width = clamp(contract_window_width,contract_window_width_default,pageX+surface_width+buffer)
	
	if menu_change {
		contract_window_width = surface_width
		if contract_types == contract_types.hackathon contract_window_width -= 250
	}
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX+window_width-16,windowY,windowX+window_width+16,windowY+window_height+16) {
		window_set_cursor(cr_size_we)
		if input.mouse_left_press {
			contract_window_width_offset = gui_mouse_x
			contract_window_width_previous = contract_window_width
		}
		if input.mouse_left and contract_window_width_offset > -1 {
			contract_window_width = contract_window_width_previous + (gui_mouse_x - contract_window_width_offset)
			contract_window_width = clamp(contract_window_width,contract_window_width_default,pageX+surface_width+buffer)
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
		contract_window_width = clamp(contract_window_width,contract_window_width_default,pageX+surface_width+buffer)
	}
	
	if contract_window_height < surface_height - 100 {
		//	vertical scrollbar
		draw_set_color(c_black)
		//var line1X = windowX+window_width-73
		//var line1Y = borderY+1
		draw_rectangle(windowX+window_width-72,borderY+1,windowX+window_width-73,windowY+window_height-64,false)
	
		var bar_width = 40
		var bar_height = abs((windowY+window_height-65)-(borderY+buffer))
		var barX = windowX+window_width-buffer-bar_width
		var barY = borderY+buffer
	
		draw_set_color(c_gray5)
		draw_roundrect_ext(barX,barY,barX+bar_width,barY+bar_height,15,15,false)
	
		var handle_width = 40
		var handle_height = (abs(surface_height - page_height)/surface_height) * bar_height
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
	}
	
	//	DEBUGGING THE SURFACE AND SURFACE PAGE
	
	//draw_set_color(c_yellow)
	//draw_set_alpha(.33)
	//draw_roundrect(pageX-surface_offsetX,pageY-surface_offsetY,pageX-surface_offsetX+surface_width,pageY-surface_offsetY+surface_height,false)
	
	//draw_set_color(c_red)
	//draw_roundrect(pageX,pageY,pageX+page_width,pageY+page_height,false)
	//draw_set_alpha(1)
	
	if contract_window_width < surface_width - 100 {
		//	horizontal scrollbar
		draw_set_color(c_black)
		//var line2X = windowX
		//var line2Y = windowY+window_height-65
		draw_rectangle(windowX,windowY+window_height-64,windowX+window_width-73,windowY+window_height-65,false)
	
		var bar_width = abs((windowX+window_width-73) - (windowX+buffer))
		var bar_height = 48
		var barX = windowX+buffer
		var barY = windowY+window_height-36-buffer*2+10
	
		draw_set_color(c_gray5)
		draw_roundrect_ext(barX,barY,barX+bar_width,barY+bar_height,15,15,false)
	
		var handle_width = (abs(surface_width-page_width)/surface_width) * bar_width
		var handle_width = (page_width/surface_width) * bar_width
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
				if input.mouse_left_press or input.mouse_left {
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