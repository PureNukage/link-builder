if live_call() return live_result

var xx = display_get_gui_width() - sprite_get_width(s_alarm) - 16
var yy = contracts.buttonY

var menu_mouseovers = 0
if draw_active {
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx-4,yy-4,xx+sprite_get_width(s_alarm)+4,yy+sprite_get_height(s_alarm)+4) and !instance_exists(mainmenu) {
		button_mouseover = true
		draw_set_color(c_gray)
		menu_mouseovers++
		if !buttonMouseover {
			buttonMouseover = true
			playSoundEffect(choose(snd_hover1, snd_hover2, snd_hover3, snd_hover4))
		}
		if input.mouse_left_press {
			playSoundEffect(snd_click_1)
			if !clickfix {
				messages_open = !messages_open	
				if messages_open {
					shop.exchange_open = false
					personController.hero_menu_open = false
					surface_offsetY = 5000
				}
			}
		
			if messages_open {
				if ds_list_size(previous_messages) > message_clamp {
					message_index = floor(bar_height/round(bar_height / ds_list_size(previous_messages))-1)
				}
				if contracts.button_open {
					contracts.button_open = false	
				}
				if personController.hero_menu_open personController.hero_menu_open = false
			}
		}
	} else {
		button_mouseover = false
		draw_set_color(c_dkgray)
	}
	draw_roundrect(xx-4,yy-4,xx+sprite_get_width(s_alarm)+4,yy+sprite_get_height(s_alarm)+4,false)

	clickfix = false

	draw_sprite(s_alarm,0,xx,yy)
	
	if messages_open {
	
		var width = 400
		var height = 380
		var _xx = xx+sprite_get_width(s_alarm) - width - 32
		var _yy = yy+sprite_get_height(s_alarm)+32
		
		var surface_width = width
		var surface_height = 0
		
		var stringWidth = width-16
		
		var pageX = _xx
		var pageY = _yy
		var page_width = width
		var page_height = height
		
		var window_width = 440
		var window_height = (ds_list_size(previous_messages) * 90)
		window_height = clamp(window_height,0,380)
		
		var buffer = 16
		//	Prelim loop through messages
		for(var mm=0;mm<ds_list_size(previous_messages);mm++) {
			var messageID = previous_messages[| mm]
			var message_string = messageID.text
			var sw = string_width_ext(message_string,string_height(message_string),stringWidth) + buffer
			var sh = string_height(message_string) + buffer
			surface_height += string_height_ext(message_string,sh,stringWidth) + 20			
		}
		
		if surface_height > page_height window_height = clamp(window_height,0,surface_height)
	
		//	Draw window background
		draw_set_color(c_gray4)
		draw_roundrect(_xx-20,_yy-10,_xx+window_width,_yy+window_height,false)
	
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx-20,_yy-10,_xx+window_width,_yy+window_height) {
			messages_mouseover = true
			if input.scroll_up or input.scroll_down {
				surface_offsetY += (input.scroll_down - input.scroll_up)*100
			}
		}
		else messages_mouseover = false
		
		draw_set_font(fnt_shop)
		
		
		if surface_height > page_height {
			var max_offsetY = surface_height - page_height
			surface_offsetY = clamp(surface_offsetY,0,max_offsetY)
		} else {
			surface_offsetY = 0	
		}
	
		if !surface_exists(surface) and surface_height > 0 {
			
			surface = surface_create(surface_width,surface_height)
			
			surface_set_target(surface)
			draw_clear_alpha(c_white,0)
			
			var XX = 0
			var YY = 0
			
			for(var m=0;m<ds_list_size(previous_messages);m++) {
				//if m > message_index-1 and m < message_index + message_clamp {
					//height = 64
					var messageID = previous_messages[| m]
					var message_string = messageID.text
					
					var sw = string_width_ext(message_string,string_height(message_string),stringWidth) + buffer
					var ssh = string_height(message_string) + 8
					var sh = string_height_ext(message_string,string_height(message_string),stringWidth) + buffer
					
					//if string_height_ext(message_string,string_height(message_string),width-20) > 39 {
					//	height += (string_height_ext(message_string,string_height(message_string),width-20) - 39)
					//}
		
					draw_set_color(c_dkgray)
					draw_roundrect(XX-8,YY-8,XX+width-8,YY+sh-8,false)
		
					draw_set_color(c_white)
					draw_set_halign(fa_left)
					draw_set_valign(fa_top)
					draw_text_ext(XX+8,YY+2,message_string,string_height(message_string),stringWidth)
		
					_yy += string_height_ext(message_string,ssh,stringWidth)	
					YY += string_height_ext(message_string,ssh,stringWidth)	+ 20
				//}
		
			}
			surface_reset_target()
		}
		
		if surface_exists(surface) {
			draw_surface_part(surface,0,0+surface_offsetY,width,height,pageX,pageY)
			surface_free(surface)	
		}
		
		if surface_height > page_height {
	
			//	Draw scrollbar
			barX = _xx+window_width
			barY = yy+sprite_get_height(s_alarm)+32
			bar_height = window_height
			//var amount_of_items = ds_list_size(previous_messages)
			//amount_of_items = clamp(amount_of_items,0,message_clamp)
			handleX = _xx+window_width-bar_width+(bar_width/2)
			//handle_height = round(bar_height / ds_list_size(previous_messages))
			//handleY = barY + (message_index * handle_height)
			handle_height = (page_height / surface_height) * bar_height
			handle_height = (page_height/(surface_height-page_height)) * bar_height
			handleY = barY + (surface_offsetY = 0/(surface_height-page_height) * (bar_height-handle_height))
		
			handle_height = page_height/surface_height * bar_height	
			handleY = barY + (surface_offsetY/(surface_height-page_height) * (bar_height-handle_height))
			
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+bar_width,barY+bar_height) {
					
			}
	
			draw_set_color(c_gray)
			draw_roundrect(handleX-6,handleY,handleX+handle_width-6,handleY+handle_height,false)
		}
	
	}
}

if menu_mouseovers == 0 and buttonMouseover {
	buttonMouseover = false	
}