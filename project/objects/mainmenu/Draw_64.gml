//	Darken the screen if we're in_game
if in_game {
	draw_set_alpha(.5)
	draw_set_color(c_black)
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)	
	
	var width = 512
	var height = 600
	var xx = display_get_gui_width()/2 - width/2
	var yy = display_get_gui_height()/6
	
	draw_set_color(c_gray)
	draw_rectangle(xx,yy,xx+width,yy+height,false)
	draw_set_alpha(1)
	
}

switch(menu)
{
	#region Main Menu
		case menu.main:		
			var _x = display_get_gui_width()/2
			var _y = display_get_gui_height()/2 - (array_height_2d(mainMenu) * 32)
			
			//	Draw logo
			var _yy = _y
			_yy -= 200
			_yy = clamp(_yy,0,_yy)
			draw_set_color(c_white)
			draw_set_font(fnt_header)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_text(_x,_yy,"Smart Contract Builder")
			draw_set_font(-1)
			//draw_sprite(s_logo,0,_x,_y-200)
		
			for(var i=0;i<array_height_2d(mainMenu);i++) {
				var menu_string = mainMenu[i, menu_name]
				var _width = string_width(menu_string)
				var _height = string_height(menu_string)
			
				var buffer = 64
				var box_width = _width + buffer
				var box_height = _height + buffer
				
				draw_set_color(c_black)
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-box_width/2,_y,_x-box_width/2+box_width,_y+box_height) {
					draw_set_alpha(.3)
					if mouse_check_button_pressed(mb_left) {
						switch(i)
						{
							case 0:	//	Play
								camera.camera_mode = camera_mode.free
								app.world_width = 3840
								app.world_height = 3840
								room_goto_next()
							break
							case 1:	//	Tutorials
								menu = menu.tutorials
							break
							case 2:	//	Options
								menu = menu.options
							break
						}
					}
				} else {
					draw_set_alpha(.5)
				}

				draw_roundrect(_x-box_width/2,_y,_x-box_width/2+box_width,_y+box_height,false)
				draw_set_color(c_black)
				draw_roundrect(_x-box_width/2,_y,_x-box_width/2+box_width,_y+box_height,true)
				draw_roundrect(_x-box_width/2+1,_y+1,_x-box_width/2+box_width-1,_y+box_height-1,true)
			
				draw_set_alpha(1)
				draw_set_color(c_white)
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				draw_text(_x,_y+box_height/2,menu_string)
			
				_y += box_height + buffer
			}	
		break
	#endregion
	
	#region Options
		case menu.options:
			
			var _x = display_get_gui_width()/2
			var _y = display_get_gui_height()/2 - ((array_height_2d(options) + array_height_2d(resolutions)) * 32) - (display_get_gui_height()/5)
			
			for(var o=0;o<array_height_2d(options);o++) {
				var option_name = options[o, menu_name]
				var option_submenu = options[o, menu_submenu]
				
				var option_height = string_height(option_name)
				
				var buffer = 64
				
				draw_set_color(c_black)
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				draw_text(_x,_y+option_height/2,option_name)
				
				_y += option_height + buffer
				
				for(var s=0;s<array_height_2d(option_submenu);s++) {
					var submenu_name = option_submenu[s, menu_name]
					
					var submenu_width = string_width(submenu_name)
					var submenu_height = string_height(submenu_name)
					
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-submenu_width/2,_y,_x-submenu_width/2+submenu_width,_y+submenu_height) {
						draw_set_color(c_white)
						if option_name == "Resolution" {
							if mouse_check_button_pressed(mb_left) {
								for(var ss=0;ss<array_height_2d(option_submenu);ss++) {
									resolutions[ss, menu_active] = false	
								}
								resolutions[s, menu_active] = true
								resolution_resize(resolutions[s, menu_data0], resolutions[s, menu_data1])
							}
						}
					} else {
						draw_set_color(c_dkgray)	
					}
					if option_submenu[s ,menu_active] {
						draw_set_color(c_white)	
					}
					draw_set_halign(fa_center)
					draw_set_valign(fa_middle)
					draw_text(_x,_y+submenu_height/2,submenu_name)
					
					_y += submenu_height + buffer
					
				}
				
			}
			
			_y += 128
			
			//	Volume Options
			//	Draw bar rectangle
			var bar_width = 256
			var bar_height = 32
			var barX = _x - bar_width/2
			var barY = _y
			draw_set_color(c_dkgray)
			draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
			
			//	Draw volume amount
			draw_set_color(c_black)
			draw_text(_x,_y-64,"Volume: "+string(soundSystem.current_volume*100)+"%")
			
			//	Draw volume handle
			var segment = round(bar_width / 10)
			var handleX = barX + ((soundSystem.current_volume*10) * segment)
			var handleY = barY
			var handle_width = segment
			var handle_height = 48
			draw_set_color(c_gray)
			draw_circle(handleX+(handle_width/2),handleY+(handle_width/2),handle_width,false)
			
			var xx = barX
			var yy = barY
			for(var i=0;i<=10;i++) {
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx,yy,xx+bar_width,yy+bar_height) and mouse_check_button(mb_left) {
					soundSystem.new_volume = i/10
				}
				xx += segment
			}
			
			_y += 128
			
			//	Back button
			if in_game {
				var _string = "Back to Game"	
			} else var _string = "Back to Main Menu"
			var _string_width = string_width(_string)
			var _string_height = string_height(_string)
			
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-_string_width/2,_y,_x+_string_width/2+_string_width,_y+_string_height) {
				draw_set_color(c_white)	
				
				if mouse_check_button_pressed(mb_left) {
					if in_game {
						instance_destroy()
					} else menu = menu.main
				}	
			} else {
				draw_set_color(c_black)
			}
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_text(_x,_y+_string_height/2,_string)
			
		break
	#endregion
	
	#region Tutorials
		case menu.tutorials:
	
			var _x = display_get_gui_width()/2
			var _y = display_get_gui_height()/2 - (array_height_2d(tutorials) * 32)
		
			for(var i=0;i<array_height_2d(tutorials);i++) {
			
				var menu_string = tutorials[i, tutorial_name]
				var menu_string_width = string_width(menu_string)
				var menu_string_height = string_height(menu_string)
				var buffer = 32
			
				var xx = _x - (menu_string_width/2) + (buffer/2)
			
				draw_set_color(c_black)
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx-buffer,_y-buffer,xx+menu_string_width+buffer,_y+menu_string_height+buffer) {
					draw_set_alpha(.3)	
					
					if mouse_check_button_pressed(mb_left) {	
						camera.camera_mode = camera_mode.free
						app.tutorial = i
						app.world_width = 1920
						app.world_height = 1088			
						room_goto_next()
					}
					
				} else {
					draw_set_alpha(.5)
				}
			
				draw_roundrect(xx-buffer,_y-buffer,xx+menu_string_width+buffer,_y+menu_string_height+buffer,false)
				
				//	Draw name
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				draw_set_color(c_white)
				draw_set_alpha(1)
				draw_text(xx+menu_string_width/2,_y+menu_string_height/2,menu_string)
				
				_y += 128
			}
			draw_set_alpha(1)
			
			//	Back button
			var _string = "Back to Main Menu"
			var _string_width = string_width(_string)
			var _string_height = string_height(_string)
			
			var xx = _x - _string_width/2 + buffer/2
			
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx-_string_width/2,_y,xx+_string_width/2+_string_width,_y+_string_height) {
				draw_set_color(c_white)	
				
				if mouse_check_button_pressed(mb_left) {
					menu = menu.main
				}	
			} else {
				draw_set_color(c_black)
			}
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_text(xx+_string_width/2,_y+_string_height/2,_string)
			
		break
	#endregion
}

//	Version and credential
var version = app.version
var credit = app.me
var total_string = "v"+string(version) + " by " + credit
var _string_width = string_width(total_string)
var _string_height = string_height(total_string)
var _xx = display_get_gui_width() - _string_width - 16
var _yy = display_get_gui_height() - _string_height - 16
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(_xx,_yy,total_string)