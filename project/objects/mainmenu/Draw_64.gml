//if live_call() return live_result

//	Darken the screen if we're in_game
if in_game {
	draw_set_alpha(.5)
	draw_set_color(c_black)
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)	
	
	var width = 600
	var height = 700
	var xx = display_get_gui_width()/2 - width/2
	var yy = display_get_gui_height()/6
	
	if app.resolution_height == 720 yy -= 100
	
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
			
			clickDelay = 5
			
			if audio_is_playing(snd_dialogue_1_3) audio_stop_sound(snd_dialogue_1_3)
			
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
			
			if app.resolution_height == 720 and os_browser == browser_not_a_browser _y -= 120
		
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
								menu = menu.play
								ini_open(working_directory + "savedgame.ini")
								savedgame = ini_read_real("General","Saved Game",0)
								Time = ini_read_string("General","Saved Game Time",0)
								ini_close()
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
			
			if os_browser == browser_not_a_browser {		
				var menu_string = "Quit Game"
				var _width = string_width(menu_string)
				var _height = string_height(menu_string)
			
				var buffer = 64
				var box_width = _width + buffer
				var box_height = _height + buffer
				draw_set_color(c_black)
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-box_width/2,_y,_x-box_width/2+box_width,_y+box_height) {
					draw_set_alpha(.3)
					if mouse_check_button_pressed(mb_left) {
						game_end()	
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
			}
			
			////	Credits
			
			var testString = "test"
			var height = string_height(testString)
			
			var spacer = 4
			
			var xx = 16
			var yy = display_get_gui_height()-((height+spacer)*3)
			
			yy += spacer
			
			draw_set_halign(fa_left)
			draw_set_valign(fa_bottom)
			
			draw_text(xx,yy,"created by " + app.me)					yy += height+spacer
			
			draw_text(xx,yy,"music by wombocombo, kharsus")		yy += height+spacer
			
			draw_text(xx,yy,"thanks to my testers: kharsus, palatine, halcyonfields, Leo_the_Potato")
			
			
		break
	#endregion
	
	#region Options
		case menu.options:
		
		if clickDelay <= 0 {
			
			var _x = display_get_gui_width()/2
			var _y = display_get_gui_height()/2 - ((array_height_2d(options) + array_height_2d(resolutions)) * 32) - (display_get_gui_height()/5) - 64
			
			_y += 32
			
			for(var o=0;o<array_height_2d(options);o++) {
				var option_name = options[o, menu_name]
				var option_submenu = options[o, menu_submenu]
				
				var option_height = string_height(option_name)
				
				var buffer = 32
				
				draw_set_color(c_black)
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				draw_set_font(fnt_shop)
				
				//if os_browser == browser_not_a_browser {
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
				
				//}
			}
			
			////	Fullscreen
			if os_browser == browser_not_a_browser {
				var fullscreen = window_get_fullscreen()
				var e = []
				e[0] = "False"
				e[1] = "True"
				var String = "Fullscreen: " + e[fullscreen]
				var String_width = string_width(String)
				var barX = _x - String_width/2
				var barY = _y
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX,barY,barX+String_width,barY+64) {
					draw_set_color(c_white)	
					if mouse_check_button_pressed(mb_left) {
						window_set_fullscreen(!fullscreen)

					}
				} else {
					draw_set_color(c_black)	
				}
				draw_text(_x,_y+32,String)
			
				_y += 192
			} else {
				_y += 96	
			}
			
			
			
			////	Volume Options
			//	Draw bar rectangle
			var bar_width = 256
			var bar_height = 32
			var barX = _x - bar_width/2
			var barY = _y - 24
			draw_set_color(c_dkgray)
			draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
			
			//	Draw volume amount
			draw_set_color(c_black)
			draw_text(_x,_y-48,"Music: "+string(soundSystem.current_volume*100)+"%")
			
			//	Draw volume handle
			var segment = round(bar_width / 10)
			var handleX = barX-segment + ((soundSystem.current_volume*10) * segment)
			var handleY = barY
			var handle_width = segment
			//var handle_height = 48
			draw_set_color(c_gray)
			draw_circle(handleX+(handle_width/2),handleY+(handle_width/2),handle_width,false)
			
			var xx = barX-segment
			var yy = barY
			for(var i=0;i<=10;i++) {
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx,yy,barX+bar_width,yy+bar_height) and mouse_check_button(mb_left) {
					soundSystem.new_volume = i/10
				}
				xx += segment
			}
			
			_y += 128
			
			////	Dialogue Volume Options
			//	Draw bar rectangle
			var bar_width = 256
			var bar_height = 32
			var barX = _x - bar_width/2
			var barY = _y - 24
			draw_set_color(c_dkgray)
			draw_roundrect(barX,barY,barX+bar_width,barY+bar_height,false)
			
			//	Draw volume amount
			draw_set_color(c_black)
			draw_text(_x,_y-48,"Tutorial Audio: "+string(soundSystem.current_dialogue_volume*100)+"%")
			
			//	Draw volume handle
			var segment = round(bar_width / 10)
			var handleX = barX-segment + ((soundSystem.current_dialogue_volume*10) * segment)
			var handleY = barY
			var handle_width = segment
			//var handle_height = 48
			draw_set_color(c_gray)
			draw_circle(handleX+(handle_width/2),handleY+(handle_width/2),handle_width,false)
			
			var xx = barX-segment
			var yy = barY
			for(var i=0;i<=10;i++) {
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx,yy,barX+bar_width,yy+bar_height) and mouse_check_button(mb_left) {
					soundSystem.new_dialogue_volume = i/10
					if audio_is_playing(snd_dialogue_1_3) audio_sound_gain(snd_dialogue_1_3,soundSystem.new_dialogue_volume,0)
				}
				xx += segment
			}
			
			//	allow the player to play a dialogue sound to test the audio
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,barX+bar_width+92,barY-4,barX+bar_width+92+28,barY+32) {
				draw_sprite_ext(s_audio,0,barX+bar_width+92,barY-4,.66,.66,0,c_white,1)
				if mouse_check_button_pressed(mb_left) {
					if audio_is_playing(snd_dialogue_1_3) audio_stop_sound(snd_dialogue_1_3)
					audio_play_sound(snd_dialogue_1_3,0,false)
					audio_sound_gain(snd_dialogue_1_3,soundSystem.current_dialogue_volume,0)
				}	
			} else {
				draw_sprite_ext(s_audio_off,0,barX+bar_width+92,barY-4,.66,.66,0,c_white,1)
			}	
			
			_y += 128
			
			//	Back button
			//if in_game {
			//	var _string = "Back to Game"	
			//} else var _string = "Back to Main Menu"
			var _string = "Back"
			var _string_width = string_width(_string)
			var _string_height = string_height(_string)
			
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-_string_width/2,_y,_x+_string_width/2+_string_width,_y+_string_height) {
				draw_set_color(c_white)	
				
				if mouse_check_button_pressed(mb_left) {
					if in_game {
						//instance_destroy()
						menu = menu.in_game
					} else menu = menu.main
				}	
			} else {
				draw_set_color(c_black)
			}
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_text(_x,_y+_string_height/2,_string)
			
			_y += 64
		} 
		else clickDelay--
			
		break
	#endregion
	
	#region Tutorials
		case menu.tutorials:
	
			var _x = display_get_gui_width()/2
			var _y = display_get_gui_height()/2 - (array_height_2d(tutorials) * 32)
			var buffer = 32
		
			for(var i=0;i<array_height_2d(tutorials);i++) {
				if tutorials[i, tutorial_selected] {
			
					var menu_string = tutorials[i, tutorial_name]
					var menu_string_width = string_width(menu_string)
					var menu_string_height = string_height(menu_string)
			
					var xx = _x - (menu_string_width/2) + (buffer/2)
			
					draw_set_color(c_black)
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx-buffer,_y-buffer,xx+menu_string_width+buffer,_y+menu_string_height+buffer) {
						draw_set_alpha(.3)	
					
						if mouse_check_button_pressed(mb_left) {	
							camera.camera_mode = camera_mode.free
							app.tutorial = i
							app.world_width = 1920
							app.world_height = 1088		
							var String = string(i)
							var String = menu_string
							ga_addProgressionEvent(GA_PROGRESSIONSTATUS_START, "Tutorial", String)
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
	
	#region In Game
		case menu.in_game:
			
			var _x = display_get_gui_width()/2
			var _y = display_get_gui_height()/2 - ((array_height_2d(options) + array_height_2d(resolutions)) * 32) - (display_get_gui_height()/5)
			
			_y += 64
			
			draw_set_font(fnt_shop)
			draw_set_valign(fa_top)
			draw_set_halign(fa_center)
			
			if app.tutorial == -1 {
				if !game.game_over {
					var String = "Save Game"
					var String_width = string_width(String)
					var String_height = string_height(String)
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-String_width/2,_y,_x+String_width/2+String_width,_y+String_height) {
						draw_set_color(c_white)	
						if input.mouse_left_press {
							save_game()	
							create_textbox("Game has been saved...",-1,60)
						}
					} else draw_set_color(c_black)
					draw_text(_x,_y,String)
			
					_y += 96
				}
				
				ini_open(working_directory + "savedgame.ini")
				var Savedgame = ini_read_real("General","Saved Game",0)
				ini_close()
			
				if Savedgame {
					var String = "Load Game"
					var String_width = string_width(String)
					var String_height = string_height(String)
					if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-String_width/2,_y,_x+String_width/2+String_width,_y+String_height) {
						draw_set_color(c_white)	
						if input.mouse_left_press {
							input.f9 = true
						}
					} else draw_set_color(c_black)
					draw_text(_x,_y,String)
			
					_y += 96
				}
			} else {
				_y += 192
			}
			
			var String = "Options"
			var String_width = string_width(String)
			var String_height = string_height(String)
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-String_width/2,_y,_x+String_width/2+String_width,_y+String_height) {
				draw_set_color(c_white)	
				if input.mouse_left_press {
					menu = menu.options
				}
			} else draw_set_color(c_black)
			draw_text(_x,_y,String)
			
			_y += 96
			
			//	Back to Main Menu
			if in_game {
				var _string = "EXIT to Main Menu (WARNING: will lose current game session)"
				var xx = _x - string_width(_string)/2
				
				if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-string_width(_string)/2,_y,_x+string_width(_string)/2+string_width(_string),_y+string_height(_string)) {
					draw_set_color(c_white)
					if mouse_check_button_pressed(mb_left) {
						if app.tutorial > -1 ga_addProgressionEvent(GA_PROGRESSIONSTATUS_FAIL, "Tutorial", tutorials[app.tutorial, tutorial_name])
						back_to_mainmenu()	
					}
				} else {
					draw_set_color(c_black)	
				}
				
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				draw_text(_x,_y+string_height(_string)/2,_string)
			}
			
			
			
			
			
			
		break
	#endregion
	
	#region Play
		case menu.play:
			
			var _x = display_get_gui_width()/2
			var _y = display_get_gui_height()/2 - (array_height_2d(mainMenu) * 32)
			
			var menu_string = "New Game"
			var _width = string_width(menu_string)
			var _height = string_height(menu_string)
			
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			
			var buffer = 64
			var box_width = _width + buffer
			var box_height = _height + buffer
			
			draw_set_color(c_black)
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-box_width/2,_y,_x-box_width/2+box_width,_y+box_height) { 
				draw_set_alpha(.3)
				if mouse_check_button_pressed(mb_left) {
					app.new_game = true	
					camera.camera_mode = camera_mode.free
					app.tutorials = -1
					app.world_width = 2560
					app.world_height = 2048
					app.data_corruption = mode.on		
					
					////	GAME ANALYTICS Progression game start
					ga_addProgressionEvent(GA_PROGRESSIONSTATUS_START, "Game")
					
					room_goto_next()
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
			draw_text(_x,_y+box_height/2,menu_string)
			
			_y += box_height + buffer
			
			var menu_string = "Load Game"
			var _width = string_width(menu_string)
			var _height = string_height(menu_string)
			
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			
			var buffer = 64
			var box_width = _width + buffer
			var box_height = _height + buffer
			
			if savedgame {
				draw_set_color(c_black)
			} else {
				draw_set_color(c_gray)	
			}
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-box_width/2,_y,_x-box_width/2+box_width,_y+box_height) { 
				if savedgame and app.platform == "windows" {
					if loadgamescreenshot = -1 loadgamescreenshot = sprite_add("Saved Game Screenshot",0,false,0,0,0)
					
					if app.resolution_width = 1280 {
						var scale = .20
						var width = sprite_get_width(loadgamescreenshot) * scale
						var xx = display_get_gui_width()/2 - width/2
						var yy = 20
					} else {
						var scale = .3
						var width = sprite_get_width(loadgamescreenshot) * scale
						var xx = display_get_gui_width()/2 - width/2
						var yy = 50
					}
					draw_sprite_ext(loadgamescreenshot,0,xx,yy,scale,scale,0,c_white,1)
					
					if is_string(Time) {
						var XX = display_get_gui_width()/2
						if app.resolution_width == 1920 var YY = display_get_gui_height()/2 - 150
						else var YY = display_get_gui_height()/2-110
						draw_text(XX,YY,Time)	
					}
				}
				draw_set_alpha(.3)
				if mouse_check_button_pressed(mb_left) and savedgame {
					app.new_game = false
					camera.camera_mode = camera_mode.free
					app.tutorials = -1
					app.world_width = 2560
					app.world_height = 2048
					app.data_corruption = mode.on		
					app.load_game_please = true
					room_goto_next()
				}
			} else {
				draw_set_alpha(.5)	
				if loadgamescreenshot > -1 {
					sprite_delete(loadgamescreenshot)
					loadgamescreenshot = -1
				}	
			}
			draw_roundrect(_x-box_width/2,_y,_x-box_width/2+box_width,_y+box_height,false)
			draw_set_color(c_black)
			draw_roundrect(_x-box_width/2,_y,_x-box_width/2+box_width,_y+box_height,true)
			draw_roundrect(_x-box_width/2+1,_y+1,_x-box_width/2+box_width-1,_y+box_height-1,true)
			draw_set_alpha(1)
			
			draw_set_color(c_white)
			draw_text(_x,_y+box_height/2,menu_string)
			
			_y += box_height + buffer
			
			if point_in_rectangle(gui_mouse_x,gui_mouse_y,_x-14,_y-14,_x+14,_y+14) {
				draw_set_color(c_white)
				if mouse_check_button_pressed(mb_left) {
					menu = menu.main	
				}
			} else {
				draw_set_color(c_black)	
			}
			draw_text(_x,_y,"Back")
			
			//	Escape
			if keyboard_check_pressed(vk_escape) {
				menu = menu.main	
			}	
			
		break
	#endregion
}

draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_shop)
//	Playing on html5? Try fullscreening
if os_browser != browser_not_a_browser and !in_game {
	var String = "Try fullscreen!"
	var String_width = string_width(String)
	var String_height = string_height(String)
	var _xx = display_get_gui_width() - String_width - 48
	var _yy = display_get_gui_height() - String_height - 48
	draw_text(_xx,_yy,String)
}

//	Version and credential
//var version = app.version
var credit = app.me
if in_game {
	var total_string = "v"+ version + " by " + credit
} else {
	var total_string = "v" + version	
}
var _string_width = string_width(total_string)
var _string_height = string_height(total_string)
var _xx = display_get_gui_width() - _string_width - 48
var _yy = display_get_gui_height() - _string_height - 16
draw_text(_xx,_yy,total_string)