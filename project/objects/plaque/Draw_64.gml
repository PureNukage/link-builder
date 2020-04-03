if live_call() return live_result

if (input.selection > -1 and instance_exists(input.selection) and input.selection.object_index != wire) or mode == mode.on {
	
	var window_width_adjusted = 0
	//var window_height_adjusted = 0
	
	if mode == mode.off {
		windowX = display_get_gui_width()/2 - window_width/2
		windowY = display_get_gui_height() - window_height
	} else {
			
	}
	draw_set_color(c_dkgray)

	var p_offset = 8
	draw_roundrect(windowX,windowY,windowX+window_width,windowY+window_height,false)
	draw_set_valign(fa_middle)
	
	//	Draw portrait
	if mode != mode.on {
		var Portrait = input.selection.portrait
	} else {
		switch(object_type) {
			case kiosk: var Portrait = contracts.contract[index, contract_portrait] break
			case data: var Portrait = shop.item_data[index, item_portrait] break
			case node: var Portrait = shop.node_portrait break
		}
	}
	draw_sprite(Portrait,0,windowX+p_offset,windowY+p_offset)
	
	window_width_adjusted = p_offset + 192 + p_offset

	//	Draw name
	//	background
	draw_set_color(c_white)
	draw_set_font(fnt_plaque_name)
	if mode != mode.on {
		if input.selection.object_index == node var name = shop.item_node[input.selection.item_index, node_name]
		if input.selection.object_index == kiosk var name = contracts.contract[input.selection.smartcontract, contract_name]
		if input.selection.object_index == data var name = shop.item_data[input.selection.item_index, item_name]
	} else {
		switch(object_type) {
			case kiosk: var name = contracts.contract[index, contract_name] break
			case data: var name = shop.item_data[index, item_name] break
			case node: var name = shop.item_node[index, node_name] break
		}
	}
	var name_buffer = 12
	var name_width_adjusted = string_width(name) + name_buffer
	var name_height = 42
	var nameX = windowX + p_offset + 192 + p_offset
	var nameY = windowY + p_offset
	//	for node and contracts, factor in the level into the name bar width
	if mode == mode.on or input.selection.object_index == node or input.selection.object_index == kiosk {
		//name_width += 48	
		name_width_adjusted += 48
	}
	draw_roundrect_ext(nameX,nameY,nameX+name_width,nameY+name_height,30,30,false)

	//	name
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_text(nameX+p_offset,nameY+name_height/2,name)
	
	window_width_adjusted += name_width

	if index == -1 {
		switch(input.selection.object_index) {
			#region Node
				case node:
					//	level
					draw_set_color(c_sergey_blue)
					draw_set_halign(fa_right)
					draw_set_font(fnt_shop_menu_name)
					var level = shop.item_node[input.selection.item_index, node_level]
					draw_text(nameX+name_width-p_offset,nameY+name_height/2,string(level+1))

					//	jobruns
					draw_set_color(c_ltgray)
					draw_set_font(fnt_plaque_name)
					draw_set_halign(fa_center)
					draw_text(nameX+name_width/2,nameY+name_height+20,"Jobruns")

					//	jobruns bar
					draw_set_color(c_black)
					var jobrunX = nameX 
					var jobrunY = nameY+name_height+20+16
					var bar_width = name_width
					var bar_height = 64
					draw_rectangle(jobrunX,jobrunY,jobrunX+bar_width,jobrunY+bar_height,false)
					draw_set_color(c_white)
					var offset = 3
					draw_rectangle(jobrunX+offset,jobrunY+offset,jobrunX+bar_width-offset,jobrunY+bar_height-offset,false)

					//	jobruns progress
					draw_set_color(c_sergey_blue)
					var needed_runs_db = shop.item_node[input.selection.item_index, node_levels]
					if level+1 >= array_length_1d(needed_runs_db) {
						var needed_runs = needed_runs_db[level]	
					} else {
						var needed_runs = needed_runs_db[level+1]
					}
					var previous_runs = needed_runs_db[level]
					var runs = shop.item_node[input.selection.item_index, node_jobruns]
					var real_runs = runs - previous_runs
					var real_needed_runs = needed_runs - previous_runs
					var percentage = real_runs / real_needed_runs
					var percent_of_bar = floor(bar_width * percentage)
					if runs > 0 {
						draw_rectangle(jobrunX+offset,jobrunY+offset,jobrunX+percent_of_bar,jobrunY+bar_height-offset,false)
					}

					//	jobruns progress text
					draw_set_color(c_black)
					var String = string(runs) + " / " + string(needed_runs)
					draw_text(jobrunX+(bar_width-offset)/2,jobrunY+(bar_height)/2,String)
					
					//	levels button
					var String = "Skills"
					var level_width = bar_width
					var level_height = bar_height/2
					var levelX = jobrunX
					var levelY = jobrunY+bar_height+8
					
					draw_set_color(c_black)
					draw_roundrect(levelX-2,levelY-2,levelX+level_width+2,levelY+level_height+2,false)
					
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,levelX-2,levelY-2,levelX+level_width+2,levelY+level_height+2) {
						draw_set_color(c_ltgray)
						if input.mouse_left_press {
							node_level_open = !node_level_open
							if input.selection_mode == selection_mode.port_placement input.selection_mode = selection_mode.free
						}
					} else {
						if node_level_open {
							draw_set_color(c_ltgray)	
						} else {
							draw_set_color(c_gray)
						}
					}
					draw_roundrect(levelX,levelY,levelX+level_width,levelY+level_height,false)
					
					draw_set_color(c_black)
					draw_set_valign(fa_middle)
					draw_text(levelX+level_width/2,levelY+level_height/2+1,String)
					
					#region Node Level
						if node_level_open {
							
							var level_window_width = 400
							var level_window_height = 300
							var level_windowX = windowX
							var level_windowY = windowY - level_window_height - 8
							
							draw_set_color(c_dkgray)
							draw_roundrect(level_windowX,level_windowY,level_windowX+level_window_width,level_windowY+level_window_height,false)
							
							if point_in_rectangle(gui_mouse_x,gui_mouse_y,level_windowX,level_windowY,level_windowX+level_window_width,level_windowY+level_window_height) {
								node_level_mouseover = true	
							} else {
								node_level_mouseover = false	
							}
						
							var scale = .66
							var center_x = level_windowX+level_window_width/2
							var center_y = level_windowY+level_window_height/2
							var XX = -1
							var YY = -1
							var Width = -1
							var Height = -1
							var skill_index = -1
							var skill_purchased = -1
							for(var i=0;i<6;i++) {
								switch(i) {
									case 0:	
										var xx = center_x
										var yy = center_y - (sprite_get_height(s_linkcube)*scale)/2 + 38
									break
									case 1:
										var xx = center_x + (sprite_get_width(s_linkcube)*scale)/2 - 48
										var yy = center_y - 38
									break
									case 2:
										var xx = center_x + (sprite_get_width(s_linkcube)*scale)/2 - 48
										var yy = center_y + 38
									break
									case 3:
										var xx = center_x
										var yy = center_y + (sprite_get_height(s_linkcube)*scale)/2 - 38
									break
									case 4:
										var xx = center_x - (sprite_get_width(s_linkcube)*scale)/2 + 48
										var yy = center_y + 38
									break
									case 5:
										var xx = center_x - (sprite_get_width(s_linkcube)*scale)/2 + 48
										var yy = center_y - 38
									break
								}
								
								var node_array = shop.item_node[input.selection.item_index, node_skills]
								var radius = skill_array[i,0]
								var acquired = node_array[i,skill_acquired]
								if acquired {
									draw_set_color(c_orange)	
								} else {
									draw_set_color(c_white)
								}
								draw_circle(xx,yy,radius,false)
								
								var lerp_amt = 0.09
								if point_in_circle(gui_mouse_x,gui_mouse_y,xx,yy,radius) {
									skill_array[i,0] = lerp(skill_array[i,0],36,lerp_amt)
									
									Width = string_width(node_array[i,skill_text])
									Height = string_height(node_array[i,skill_text])
									XX = gui_mouse_x
									YY = gui_mouse_y - Height - 8
									
									var skill_index = i
									
									if input.mouse_left_press and input.selection.skillpoints > 0 {
										if skill_index == 0 {
											if !node_array[i,skill_acquired] {
												node_array[i,skill_acquired] = true
												shop.item_node[input.selection.item_index,node_skills] = node_array
												input.selection.skillpoints--
												shop.item_node[input.selection.item_index, node_skillpoints] = input.selection.skillpoints
												skill_purchased = node_array[i,skill_type]
											}
										} else {
											if node_array[skill_index-1,skill_acquired] and !node_array[skill_index,skill_acquired] {
												node_array[skill_index,skill_acquired] = true
												shop.item_node[input.selection.item_index,node_skills] = node_array
												input.selection.skillpoints--	
												shop.item_node[input.selection.item_index, node_skillpoints] = input.selection.skillpoints
												skill_purchased = node_array[i,skill_type]
											}
										}
									}
									
								} else {
									skill_array[i,0] = lerp(skill_array[i,0],24,lerp_amt)
								}
				
							}
							
							if skill_purchased > -1 {
								switch(skill_purchased)
								{
									case skills.two_more_ports:
										input.selection.ports_count_max += 2
									break
								}
							}
							
							draw_sprite_ext(s_linkcube,0,center_x,center_y,scale,scale,0,c_white,1)
							
							//	Draw the skill text
							if skill_index > -1 {
								draw_set_color(c_gray)
								draw_rectangle(XX,YY,XX+Width,YY+Height,false) 
									
								draw_set_color(c_black)
								draw_text(XX+Width/2,YY+Height/2,node_array[skill_index,skill_text])	
							}
							
							draw_set_color(c_black)
							draw_set_halign(fa_left)
							draw_set_valign(fa_top)
							draw_text(level_windowX+10,level_windowY+10,input.selection.name)
							
							draw_text(level_windowX+10,level_windowY+45,"Level: "+string(level+1))
							
							draw_set_color(c_white)
							var String = "Points: "+string(input.selection.skillpoints)
							draw_text(level_windowX+level_window_width-8-string_width(String),level_windowY+8,String)
							
							
						}	
					#endregion
					
					//	Ports button
					var String = "Ports"
					var ports_width = bar_width
					var ports_height = bar_height/2
					var portsX = levelX
					var portsY = levelY + (bar_height/2) + 8
					
					draw_set_color(c_black)
					draw_roundrect(portsX-2,portsY-2,portsX+ports_width+2,portsY+ports_height+2,false)
					
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,portsX-2,portsY-2,portsX+ports_width+2,portsY+ports_height+2) {
						draw_set_color(c_ltgray)
						if input.mouse_left_press {
							if input.selection_mode == selection_mode.port_placement {
								input.selection_mode = selection_mode.free	
							} else {
								input.selection_mode = selection_mode.port_placement
							}
							if node_level_open node_level_open = false
						}
					} else {
						draw_set_color(c_gray)	
					}
					if input.selection_mode == selection_mode.port_placement draw_set_color(c_ltgray)
					draw_roundrect(portsX,portsY,portsX+ports_width,portsY+ports_height,false)
					
					draw_set_color(c_black)
					draw_set_halign(fa_center)
					draw_set_valign(fa_middle)
					draw_text(portsX+ports_width/2,portsY+ports_height/2+1,String)
					
					//	Draw Ports
					if input.selection_mode == selection_mode.port_placement {
						var p_width = 260
						var p_height = 60
						var pX = windowX
						var pY = windowY - p_height - 8
					
						draw_set_color(c_dkgray)
						draw_roundrect(pX,pY,pX+p_width,pY+p_height,false)
					
						var max_ports = input.selection.ports_count_max
						var used_ports = input.selection.ports_count
						var available_ports = max_ports - used_ports
						var ports_string = "Ports: "+string(used_ports)+"/"+string(max_ports)
						draw_set_color(c_white)						
						draw_set_halign(fa_left)
						draw_text(pX+12,pY+p_height/2,ports_string)
						
						draw_text(pX+36+string_width(ports_string),pY+p_height/2,"Free: "+string(available_ports))
						
					}
				
					//	data held
					//	get data held width
					draw_set_halign(fa_center)
					draw_set_valign(fa_middle)
					var default_data_width = 192
					var data_buffer = 12
					var data_width_adjusted = 0
					for(var d=0;d<ds_list_size(input.selection.data_held);d++) {
						var data_name = shop.item_data[input.selection.data_held[| d], item_name]
						var String_width = string_width(data_name)
						if String_width + data_buffer > data_width_adjusted {
							data_width_adjusted = String_width + data_buffer
						}
					}
					if ds_list_empty(input.selection.data_held) {
						if data_width_adjusted != default_data_width data_width = default_data_width
					} else {
						if data_width_adjusted != data_width data_width = data_width_adjusted 	
					}
				
					//	Draw data header
					draw_set_color(c_ltgray)
					var dataX = nameX+name_width+p_offset+(data_width/2)
					var dataY = nameY+name_height/2
					draw_text(dataX,dataY,"Data")
				
					if !ds_list_empty(input.selection.data_held) {
						var xx = nameX+name_width+p_offset
						var yy = nameY+name_height
						for(var d=0;d<ds_list_size(input.selection.data_held);d++) {
							draw_set_color(c_white)
							draw_roundrect_ext(xx,yy,xx+data_width,yy+48,30,30,false)
						
							var data_name = shop.item_data[input.selection.data_held[| d], item_name]
							draw_set_color(c_black)
							draw_text(dataX,yy+24,data_name)
							yy += 64
						}
				
					} else {
						draw_text(dataX,dataY+80,"No data")
					
					}	
				
					window_width_adjusted += data_width
					window_width_adjusted += p_offset		
				
				break
			#endregion
			#region Contracts
				case kiosk:
					//	Draw Contract Info
					//	level
					draw_set_color(c_black)
					draw_set_halign(fa_right)
					draw_set_font(fnt_shop_menu_name)
					var level = contracts.contract[input.selection.smartcontract, contract_level]
					draw_text(nameX+name_width-p_offset,nameY+name_height/2,string(level+1))
				
					var Smartcontract = input.selection.smartcontract
					var link_fee = contracts.contract[Smartcontract, contract_linkfee]
					var gas_fee = contracts.contract[Smartcontract, contract_gasfee_total]
					var base_reward = contracts.contract[Smartcontract, contract_reward]
					var link_fee_usd = link_fee * shop.link_price
					var gas_fee_usd = gas_fee * shop.eth_price
					var profit = base_reward - link_fee_usd - gas_fee_usd
				
					var value = contracts.contract[Smartcontract, contract_value]
					var Conditions = contracts.contract[Smartcontract, contract_conditions]
				
					var reliability = contracts.contract[Smartcontract, contract_reliability] / 100

					//	Profit
					var profitX = nameX
					var profitY = nameY+name_height+p_offset
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,profitX,profitY,profitX+name_width,profitY+48) {
						var String_width = string_width("+ "+string(base_reward)+" $$ base reward")
						var width = String_width + (p_offset*2)
						var lines = 6
						var height = (52*lines)
						var X = windowX
						var Y = windowY - height - p_offset
						
						draw_set_color(c_dkgray)
						draw_roundrect(X,Y,X+width,Y+height,false) 
						
						draw_set_color(c_white)
						draw_set_halign(fa_center)
						
						var yy = Y + 48
						
						var String = "+ "+string(base_reward)+" $$ base reward"
						draw_text(X+width/2,yy,String)
						yy += 48
						
						var String = "- " + string(gas_fee) + " ETH"
						draw_text(X+width/2,yy,String)
						yy += 48
						
						var String = "- " + string(link_fee) + " LINK"
						draw_text(X+width/2,yy,String)
						yy += 48
						
						var String = "- " + string(link_fee_usd + gas_fee_usd) + " $$ spent total"
						draw_text(X+width/2,yy,String)
						yy += 48
						yy += 48
						
						var String = "+ " + string(profit) + " $$ profit"
						draw_text(X+width/2,yy,String)
						yy += 48
						
						
						draw_set_color(c_ltgray)
					} else {
						draw_set_color(c_white)	
					}
					
					draw_roundrect_ext(profitX,profitY,profitX+name_width,profitY+48,25,25,false)
				
					draw_set_color(c_black)
					draw_set_halign(fa_center)
					var String = string(profit)
					draw_text(profitX+name_width/2,profitY+24,String)
					draw_set_color(c_green)
					var String = "$$"
					draw_text(profitX+name_width/2+48,profitY+24,String)


					//	value
					var valueX = profitX
					var valueY = profitY+48+p_offset
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,valueX,valueY,valueX+name_width,valueY+48) {		
						draw_set_color(c_white)
						var largest_string = 0
						var largest_value = 0
						for(var c=0;c<array_height_2d(Conditions);c++) {
							var Condition_string = Conditions[c, condition_string]
							if string_width(Condition_string) > largest_string largest_string = string_width(Condition_string)
							var Condition_amount = Conditions[c, condition_value]
							if string_width(string(Condition_amount)) > largest_value largest_value = string_width(string(Condition_amount))
						}
						var Sprite_width = sprite_get_width(s_resource_value_shop)
						var width = p_offset + largest_string + p_offset + 24 + p_offset + largest_value + p_offset + Sprite_width + p_offset
						var height = (48+p_offset) * array_height_2d(Conditions)
						var X = windowX
						var Y = windowY - height - p_offset
						draw_set_color(c_dkgray)
						draw_roundrect(X,Y,X+width,Y+height,false)
						
						var xx = X + p_offset 
						var yy = Y + (p_offset*3)
						draw_set_halign(fa_center)
						for(var c=0;c<array_height_2d(Conditions);c++) {
							var Condition_string = Conditions[c, condition_string]
							var Condition_amount = Conditions[c, condition_value]
							
							draw_set_color(c_white)
							var stringX = xx + (largest_string/2)
							draw_text(stringX,yy,Condition_string)
							
							var activeX = xx + largest_string + p_offset + 12
							if Conditions[c, condition_met] var active = "P" else var active = "O"
							if Conditions[c, condition_met] draw_set_color(c_green) else draw_set_color(c_red)
							draw_set_font(fnt_wingdings) 
							draw_text(activeX,yy,active)
							draw_set_font(fnt_shop_menu_name)
							
							draw_set_color(c_white)
							var ValueX = activeX + 12 + p_offset + (largest_value/2)
							draw_text(ValueX,yy,string(Condition_amount))
							
							var spriteX = ValueX + (largest_value/2) + p_offset + (Sprite_width/2)
							draw_sprite(s_resource_value_shop,0,spriteX,yy)
							
							yy += 64
						}
						draw_set_color(c_ltgray)
					} else {
						draw_set_color(c_white)	
					}
					draw_roundrect_ext(valueX,valueY,valueX+name_width,valueY+48,25,25,false)
					draw_set_color(c_black)
					var String = string(value)
					draw_text(valueX+name_width/2,valueY+24,String)
					draw_sprite(s_resource_value_shop,0,valueX+name_width/2+48,valueY+24)

					//	reliability
					var relyX = valueX
					var relyY = valueY+48+p_offset
					draw_set_color(c_white)
					draw_roundrect_ext(relyX,relyY,relyX+name_width,relyY+48,25,25,false)
					var rely_pixels = floor(name_width * reliability)
					if reliability > .79 {
						draw_set_color(c_green)	
					} else if reliability > .49 and reliability < .80 {
						draw_set_color(c_orange)	
					} else if reliability < .50 {
						draw_set_color(c_red)	
					}
					draw_set_alpha(.50)
					draw_roundrect_ext(relyX,relyY,relyX+rely_pixels,relyY+48,25,25,false)
					draw_set_alpha(1)
					draw_set_color(c_black)
					var String = string(reliability*100)
					draw_text(relyX+name_width/2,relyY+24,String)
					draw_text(relyX+name_width/2+48,relyY+24,"%")

					//	data
					draw_set_font(fnt_plaque_name)
					draw_set_color(c_ltgray)
					draw_set_halign(fa_center)
					//	get data held width
					var default_data_width = 192
					var data_buffer = 12
					var data_width_adjusted = 0
					var data_height = 40
					var data_needed = input.selection.data_needed
					for(var d=0;d<array_height_2d(data_needed);d++) {
						var data_name = shop.item_data[data_needed[d,0], item_name]
						var String_width = string_width(data_name)
						if String_width + data_buffer > default_data_width {
							data_width_adjusted = String_width+data_buffer	
						}
					}
					if data_width_adjusted > default_data_width data_width = data_width_adjusted else data_width = default_data_width
				
				
					var dataX = nameX+name_width+p_offset+(data_width/2)
					var dataY = nameY+name_height/2
					var String = "Data Required"
					draw_text(dataX,dataY,String)

					//	data required
					var xx = nameX+name_width+p_offset
					var yy = nameY+name_height
					//var data_needed = contracts.contract[Smartcontract,contract_data]
					for(var d=0;d<array_height_2d(data_needed);d++) {
						draw_set_color(c_white)
						draw_roundrect_ext(xx,yy,xx+data_width,yy+data_height,20,20,false)
						if data_needed[d,1] {
							draw_set_color(c_green)	
						} else {
							draw_set_color(c_red)	
						}
						draw_set_alpha(.33)
						draw_roundrect_ext(xx,yy,xx+data_width,yy+data_height,20,20,false)
						draw_set_alpha(1)
						draw_set_color(c_black)
						var String = shop.item_data[data_needed[d,0], item_name]
						if is_price(String) {
							var new_string = is_price(String,true)
							String = new_string
						}
						draw_text(xx+data_width/2,yy+name_height/2,String)	
						yy += 48
	
					}
					window_width_adjusted += data_width
					window_width_adjusted += p_offset
				
				break
			#endregion
			#region Data
				case data:
					//	corruption
					var corruptionX = nameX
					var corruptionY = nameY + name_height + p_offset
					draw_set_color(c_white)
					draw_roundrect_ext(corruptionX,corruptionY,corruptionX+name_width,corruptionY+64,30,30,false)
					//	corruption level
					var corruption = shop.item_data[input.selection.data_generated, item_corruption]
					var corruption_pixel = floor(name_width * corruption/100)
					draw_set_color(c_maroon)
					draw_set_alpha(.80)
					draw_roundrect_ext(corruptionX,corruptionY,corruptionX+corruption_pixel,corruptionY+64,30,30,false)
					draw_set_alpha(1)
					draw_set_color(c_black)
					draw_set_halign(fa_center)
					draw_text(corruptionX+name_width/2,corruptionY+32,string(corruption)+"% Corruption")
				
					//	edge case for small name_widths; check if the corruption width is larger than name_width
					//var corruption_buffer = 23
					if (string_width(string(corruption)+"% Corruption") + name_buffer) > name_width_adjusted {
						name_width_adjusted = string_width(string(corruption)+"% Corruption") + name_buffer
					}				

					//	calls
					var callsY = corruptionY + 64 + p_offset
					var calls = shop.item_data[input.selection.data_generated, item_calls]
					draw_set_color(c_white)
					draw_roundrect_ext(corruptionX,callsY,corruptionX+name_width,callsY+48,30,30,false)
					draw_set_color(c_black)
					draw_text(corruptionX+name_width/2,callsY+24,string(calls)+" Calls")
				break
			#endregion
		}
	} 

	else {
		switch(object_type) {
			case kiosk:
			#region Draw Contract
				//	Draw Contract Info
				//	level
				draw_set_color(c_black)
				draw_set_halign(fa_right)
				draw_set_font(fnt_shop_menu_name)
				var level = contracts.contract[index, contract_level]
				draw_text(nameX+name_width-p_offset,nameY+name_height/2,string(level+1))

				//	profit
				draw_set_color(c_white)
				var profitX = nameX
				var profitY = nameY+name_height+p_offset
				draw_roundrect_ext(profitX,profitY,profitX+name_width,profitY+48,25,25,false)
				
				var Smartcontract = index
				var link_fee = contracts.contract[Smartcontract, contract_linkfee]
				var gas_fee = contracts.contract[Smartcontract, contract_gasfee_total]
				var base_reward = contracts.contract[Smartcontract, contract_reward]
				var link_fee_usd = link_fee * shop.link_price
				var gas_fee_usd = gas_fee * shop.eth_price
				var profit = base_reward - link_fee_usd - gas_fee_usd
				
				var value = contracts.contract[Smartcontract, contract_value]
				var Conditions = contracts.contract[Smartcontract, contract_conditions]
				
				var reliability = contracts.contract[Smartcontract, contract_reliability] / 100

				draw_set_color(c_black)
				draw_set_halign(fa_center)
				var String = string(profit)
				draw_text(profitX+name_width/2,profitY+24,String)
				draw_set_color(c_green)
				var String = "$$"
				draw_text(profitX+name_width/2+48,profitY+24,String)


				//	value
				var valueX = profitX
				var valueY = profitY+48+p_offset
				draw_set_color(c_white)
				draw_roundrect_ext(valueX,valueY,valueX+name_width,valueY+48,25,25,false)
				draw_set_color(c_black)
				var String = string(value)
				draw_text(valueX+name_width/2,valueY+24,String)
				draw_sprite(s_resource_value_shop,0,valueX+name_width/2+48,valueY+24)

				//	reliability
				var relyX = valueX
				var relyY = valueY+48+p_offset
				draw_set_color(c_white)
				draw_roundrect_ext(relyX,relyY,relyX+name_width,relyY+48,25,25,false)
				//var reliability = .80
				var rely_pixels = floor(name_width * reliability)
				if reliability > .79 {
					draw_set_color(c_green)	
				} else if reliability > .49 and reliability < .80 {
					draw_set_color(c_orange)	
				} else if reliability < .50 {
					draw_set_color(c_red)	
				}
				draw_set_alpha(.50)
				draw_roundrect_ext(relyX,relyY,relyX+rely_pixels,relyY+48,25,25,false)
				draw_set_alpha(1)
				draw_set_color(c_black)
				var String = string(reliability*100)
				draw_text(relyX+name_width/2,relyY+24,String)
				draw_text(relyX+name_width/2+48,relyY+24,"%")

				//	data
				draw_set_font(fnt_plaque_name)
				draw_set_color(c_ltgray)
				draw_set_halign(fa_center)
				//	get data held width
				var default_data_width = 192
				var data_buffer = 12
				var data_width_adjusted = 0
				var data_height = 40
				if contracts.contract[index, contract_kiosk] > -1 {
					var data_needed = contracts.contract[index, contract_kiosk].data_needed	
				} else {
					var data_needed = contracts.contract[index, contract_data]
				}
				for(var d=0;d<array_height_2d(data_needed);d++) {
					var data_name = shop.item_data[data_needed[d,0], item_name]
					var String_width = string_width(data_name)
					if String_width + data_buffer > data_width_adjusted {
						data_width_adjusted = String_width+data_buffer	
					}
				}
				if data_width_adjusted > default_data_width data_width = data_width_adjusted
				
				var dataX = nameX+name_width+p_offset+(data_width/2)
				var dataY = nameY+name_height/2
				var String = "Data Required"
				draw_text(dataX,dataY,String)

				//	data required
				var xx = nameX+name_width+p_offset
				var yy = nameY+name_height
				//var data_needed = contracts.contract[Smartcontract,contract_data]
				for(var d=0;d<array_height_2d(data_needed);d++) {
					draw_set_color(c_white)
					draw_roundrect_ext(xx,yy,xx+data_width,yy+data_height,20,20,false)
					if data_needed[d,1] {
						draw_set_color(c_green)	
					} else {
						draw_set_color(c_red)	
					}
					draw_set_alpha(.33)
					draw_roundrect_ext(xx,yy,xx+data_width,yy+data_height,20,20,false)
					draw_set_alpha(1)
					draw_set_color(c_black)
					var String = shop.item_data[data_needed[d,0], item_name]
					if is_price(String) {
						var new_string = is_price(String,true)
						String = new_string
					}
					draw_text(xx+data_width/2,yy+name_height/2,String)	
					yy += 48
	
				}
				window_width_adjusted += data_width
				window_width_adjusted += p_offset	
			#endregion
			break
			case data:
			#region Draw Data
				//	corruption
				var corruptionX = nameX
				var corruptionY = nameY + name_height + p_offset
				draw_set_color(c_white)
				draw_roundrect_ext(corruptionX,corruptionY,corruptionX+name_width,corruptionY+64,30,30,false)
				//	corruption level
				var corruption = shop.item_data[index, item_corruption]
				var corruption_pixel = floor(name_width * corruption/100)
				draw_set_color(c_maroon)
				draw_set_alpha(.80)
				draw_roundrect_ext(corruptionX,corruptionY,corruptionX+corruption_pixel,corruptionY+64,30,30,false)
				draw_set_alpha(1)
				draw_set_color(c_black)
				draw_set_halign(fa_center)
				draw_text(corruptionX+name_width/2,corruptionY+32,string(corruption)+"% Corruption")
				
				//	edge case for small name_widths; check if the corruption width is larger than name_width
				//var corruption_buffer = 23
				if (string_width(string(corruption)+"% Corruption") + name_buffer) > name_width_adjusted {
					name_width_adjusted = string_width(string(corruption)+"% Corruption") + name_buffer
				}				

				//	calls
				var callsY = corruptionY + 64 + p_offset
				var calls = shop.item_data[index, item_calls]
				draw_set_color(c_white)
				draw_roundrect_ext(corruptionX,callsY,corruptionX+name_width,callsY+48,30,30,false)
				draw_set_color(c_black)
				draw_text(corruptionX+name_width/2,callsY+24,string(calls)+" Calls")
			#endregion
			break
			case node:
			#region Draw Node
				//	level
				draw_set_color(c_sergey_blue)
				draw_set_halign(fa_right)
				draw_set_font(fnt_shop_menu_name)
				var level = shop.item_node[index, node_level]
				draw_text(nameX+name_width-p_offset,nameY+name_height/2,string(level+1))

				//	jobruns
				draw_set_color(c_ltgray)
				draw_set_font(fnt_plaque_name)
				draw_set_halign(fa_center)
				draw_text(nameX+name_width/2,nameY+name_height+20,"Jobruns")

				//	jobruns bar
				draw_set_color(c_black)
				var jobrunX = nameX 
				var jobrunY = nameY+name_height+20+16
				var bar_width = name_width
				var bar_height = 64
				draw_rectangle(jobrunX,jobrunY,jobrunX+bar_width,jobrunY+bar_height,false)
				draw_set_color(c_white)
				var offset = 3
				draw_rectangle(jobrunX+offset,jobrunY+offset,jobrunX+bar_width-offset,jobrunY+bar_height-offset,false)

				//	jobruns progress
				draw_set_color(c_sergey_blue)
				var needed_runs_db = shop.item_node[index, node_levels]
				if level+1 >= array_length_1d(needed_runs_db) {
					var needed_runs = needed_runs_db[level]	
				} else {
					var needed_runs = needed_runs_db[level+1]
				}
				var previous_runs = needed_runs_db[level]
				var runs = shop.item_node[index, node_jobruns]
				var real_runs = runs - previous_runs
				var real_needed_runs = needed_runs - previous_runs
				var percentage = real_runs / real_needed_runs
				var percent_of_bar = floor(bar_width * percentage)
				if runs > 0 {
					draw_rectangle(jobrunX+offset,jobrunY+offset,jobrunX+percent_of_bar,jobrunY+bar_height-offset,false)
				}

				//	jobruns progress text
				draw_set_color(c_black)
				var String = string(runs) + " / " + string(needed_runs)
				draw_text(jobrunX+(bar_width-offset)/2,jobrunY+(bar_height)/2,String)
				
				//	data held
				//	get data held width
				if shop.item_node[index, node_object_index] > -1 and instance_exists(shop.item_node[index, node_object_index]) {
					var object = shop.item_node[index, node_object_index]
					var default_data_width = 192
					var data_buffer = 12
					var data_width_adjusted = 0
					for(var d=0;d<ds_list_size(object.data_held);d++) {
						var data_name = shop.item_data[object.data_held[| d], item_name]
						var String_width = string_width(data_name)
						if String_width + data_buffer > data_width_adjusted {
							data_width_adjusted = String_width + data_buffer
						}
					}
					if ds_list_empty(object.data_held) {
						if data_width_adjusted != default_data_width data_width = default_data_width
					} else {
						if data_width_adjusted != data_width data_width = data_width_adjusted 	
					}
				
					//	Draw data header
					draw_set_color(c_ltgray)
					var dataX = nameX+name_width+p_offset+(data_width/2)
					var dataY = nameY+name_height/2
					draw_text(dataX,dataY,"Data")
				
					if !ds_list_empty(object.data_held) {
						var xx = nameX+name_width+p_offset
						var yy = nameY+name_height
						for(var d=0;d<ds_list_size(object.data_held);d++) {
							draw_set_color(c_white)
							draw_roundrect_ext(xx,yy,xx+data_width,yy+48,30,30,false)
						
							var data_name = shop.item_data[object.data_held[| d], item_name]
							draw_set_color(c_black)
							draw_text(dataX,yy+24,data_name)
							yy += 64
						}
				
					} else {
						draw_text(dataX,dataY+80,"No data")
					
					}
				
					window_width_adjusted += data_width
					window_width_adjusted += p_offset	
				}
					
			#endregion
			break
		}
	}

	
	window_width_adjusted += p_offset	
	if window_width_adjusted != window_width window_width = window_width_adjusted
	
	if name_width_adjusted != name_width name_width = name_width_adjusted
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX,windowY,windowX+window_width,windowY+window_height) {
		window_mouseover = true	
		if input.selection > -1 and input.selection.states == states.placement {
			with input.selection placeable = is_placeable()	
		}
	} else {
		window_mouseover = false	
	}
	
	////	Adjust if a UI plaque and not fully on screen
	//if windowX+window_width > display_get_gui_width() {
	//	windowX -= display_get_gui_width() - windowX+window_width	
	//}
	
	
}