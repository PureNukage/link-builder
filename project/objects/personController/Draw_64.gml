if live_call() return live_result

var xx = display_get_gui_width() - sprite_get_width(s_alarm) - 16 - 80
var yy = contracts.buttonY

if heromenu_active { 

	if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx,yy-4,xx+64,yy+64) and !instance_exists(mainmenu) {
		draw_set_color(c_gray)
		if input.mouse_left_press {
			hero_menu_open = !hero_menu_open
			if hero_menu_open {
				if textboxController.messages_open textboxController.messages_open = false
				if shop.exchange_open shop.exchange_open = false
			}
		}
	}
	else draw_set_color(c_dkgray)
	draw_roundrect(xx,yy-4,xx+64,yy+64,false)

	var scale = 2.5
	if new_hero > 0 {
		button_color = new_flash.color
	} else button_color = c_dkgray	
	draw_sprite_ext(s_hero_head_icon,0,xx-8,yy,scale,scale,0,button_color,1)

	if hero_menu_open and !instance_exists(mainmenu) {
	
		draw_set_halign(fa_left)
		draw_set_font(fnt_shop_menu_name)
		var surface_height = 0
		#region Prelim loop
			var longest_width = 0
			for(var h=0;h<array_height_2d(heros);h++) {
				var name = heros[h, hero_name]
				var name_width = string_width(name) + 92
				if name_width > longest_width longest_width = name_width
				surface_height += 72
			}
		#endregion
	
		var window_width = longest_width + 128
		var window_height = 400
		var windowX = xx - window_width/1.5
		var windowY = yy + 92
	
		var pageX = windowX + 24
		var pageY = windowY + 24
		var page_width = window_width - 32
		var page_height = window_height - 24
	
		var surface_width = longest_width + 96
	
		draw_set_color(c_dkgray)
		draw_roundrect(windowX,windowY,windowX+window_width,windowY+window_height,false)
	
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,windowX,windowY,windowX+window_width,windowY+window_height) {
			hero_mouseover = true	
		} else hero_mouseover = false

		var XX = 0
		var YY = 0
		var contract_mouseover = -1
		if !surface_exists(hero_surface) {
			hero_surface = surface_create(surface_width,surface_height)
		
			surface_set_target(hero_surface)
			draw_clear_alpha(c_white,0)
		
			var _XX = windowX + 24
			var _YY = windowY + 24
			for(var h=0;h<array_height_2d(heros);h++) {
				var name = heros[h, hero_name]
				var head = heros[h, hero_head]
				var acquired = heros[h, hero_acquired]
				var hidden = heros[h, hero_hidden]
				var new = heros[h, hero_new]
				var condition = heros[h, hero_condition_string]
			
				var color_unlocked = make_color_rgb(134,211,88)
				var color_locked = make_color_rgb(205,81,81)
				var color_new = make_color_rgb(255,241,66)
			
				draw_set_color(c_black)
				draw_roundrect(XX-2,YY-2,XX+longest_width+2,YY+66,false)
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,pageX,pageY,pageX+page_width,pageY+page_height) {
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,_XX-2,_YY-2-hero_surface_offsetY,_XX+longest_width+2,_YY+66-hero_surface_offsetY) {
						if new and !hidden {
							heros[h, hero_new] = false
							hero_newCheck()	
						}
						contract_mouseover = h
						//	DEBUG acquire hero
						if input.mouse_right_press {
							hero_activate(h)	
						}
						draw_set_color(c_ltgray)
					} else {
						if new and !hidden and !acquired  {
							draw_set_color(new_flash.color)
							//draw_set_alpha(.75)
						}
						else {
							if !hidden {
								if acquired draw_set_color(color_unlocked) else draw_set_color(color_locked)
						} else draw_set_color(c_gray)
					}
					}
				} else {
					if new and !hidden and !acquired {
						draw_set_color(new_flash.color)
						//draw_set_alpha(.75)
					}
					else {
						if !hidden {
							if acquired draw_set_color(color_unlocked) else draw_set_color(color_locked)
						} else draw_set_color(c_gray)
					}

				}
				draw_roundrect(XX,YY,XX+longest_width,YY+64,false)
				//draw_set_alpha(1)
		
				//	Hero name
				if hidden name = "LOCKED"
				draw_set_color(c_white)
				draw_text_outlined(XX+longest_width-string_width(name)-16,YY+32,name,c_white,c_black)
		
				//	Hero head sprite
				var scale = 2.5
				if hidden {
					shader_set(shader_black)
					draw_sprite_ext(head,0,XX-12,YY+2,scale,scale,0,c_white,1)
					shader_reset()
				} else draw_sprite_ext(head,0,XX-12,YY+2,scale,scale,0,c_white,1)
		
				YY += 72
				_YY += 72
		
			}
			surface_reset_target()
		}
	
		#region Draw the condition string
		if contract_mouseover > -1 and !heros[contract_mouseover, hero_hidden] {
			var condition = heros[contract_mouseover, hero_condition_string]
			var width = string_width(condition) + 64
			var height = string_height(condition) + 64
			var X = windowX - width - 16
			var Y = windowY
				
			draw_set_color(c_dkgray)
			draw_roundrect(X,Y,X+width,Y+height,false)
				
			draw_set_color(c_white)
			draw_text(X+24,Y+height/2,condition)
		}
		#endregion
	
		if surface_exists(hero_surface) draw_surface_part(hero_surface,0,0+hero_surface_offsetY,page_width,page_height,pageX,pageY)
	
		if surface_exists(hero_surface) surface_free(hero_surface)
	
		hero_surface_offsetY = clamp(hero_surface_offsetY,0,surface_height-page_height)

	
		if hero_mouseover {
			if input.scroll_up or input.scroll_down {
				hero_surface_offsetY += (input.scroll_down - input.scroll_up) * 50
				hero_surface_offsetY = clamp(hero_surface_offsetY,0,surface_height-page_height)
			}
		}
	
		//	Scrollbar
		var bar_width = 64
		var bar_height = window_height
		var barX = windowX+window_width-bar_width
		var barY = windowY
	
		//	Handle
		var handle_width = 48
		var handle_height = (page_height/(surface_height-page_height)) * bar_height
		var handleX = barX + (bar_width-handle_width)/2
		var handleY = barY + (hero_surface_offsetY/(surface_height-page_height) * (bar_height-handle_height))
	
		if (surface_height - page_height) < page_height {
			handle_height = page_height/surface_height * bar_height	
			var handleY = barY + (hero_surface_offsetY/(surface_height-page_height) * (bar_height-handle_height))
		}
	
		//var segment = (hero_surface_offsetY/(surface_height-page_height) * (bar_height-handle_height))
		//var segments = round(bar_height/segment)
	
		//	Scrollbar click
		if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+bar_width,barY+bar_height) {
			if input.mouse_left_press or input.mouse_left {
				var Y = gui_mouse_y
				Y = ((Y - 140) / bar_height)*(surface_height-page_height)
				hero_surface_offsetY = Y
			}
		}
	
		//	DEBUG
		//draw_set_color(c_yellow)
		//draw_set_alpha(.33)
		//draw_rectangle(pageX,pageY,pageX+page_width,pageY+page_height,false)
	
		//draw_set_color(c_green)
		//draw_rectangle(pageX,pageY-hero_surface_offsetY,pageX+surface_width,pageY+surface_height-hero_surface_offsetY,false)
		//draw_set_alpha(1)
	
		//if surface_height > page_height and handle_height < bar_height {
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
		//}
	
	
	}
}