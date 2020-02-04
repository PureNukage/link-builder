live_call()

var window_width = 612
var window_height = 264

var topleft_x = display_get_gui_width()/2 - window_width/2
var topleft_y = display_get_gui_height() - window_height
draw_set_color(c_dkgray)

var p_offset = 8
draw_roundrect(topleft_x,topleft_y,topleft_x+window_width,topleft_y+window_height,false)

//	Draw portrait
draw_sprite(s_portrait_linkpal,0,topleft_x+p_offset,topleft_y+p_offset)

//	Draw name
//	background
draw_set_color(c_white)
var name_width = 192
var name_height = 42
var nameX = topleft_x + p_offset + 192 + p_offset
var nameY = topleft_y + p_offset
draw_roundrect_ext(nameX,nameY,nameX+name_width,nameY+name_height,30,30,false)

//	name
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_set_font(fnt_plaque_name)
draw_text(nameX+p_offset,nameY+name_height/2,"LinkPal")

switch(input.selection.object_index) {
	#region Node
		case node:
			//	level
			draw_set_color(c_sergey_blue)
			draw_set_halign(fa_right)
			draw_set_font(fnt_shop_menu_name)
			draw_text(nameX+name_width-p_offset,nameY+name_height/2,"4")

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
			var needed_runs = 2500
			var runs = 932
			var percentage = runs / needed_runs
			var percent_of_bar = floor(bar_width * percentage)
			draw_rectangle(jobrunX+offset,jobrunY+offset,jobrunX+percent_of_bar,jobrunY+bar_height-offset,false)

			//	jobruns progress text
			draw_set_color(c_black)
			var String = string(runs) + " / " + string(needed_runs)
			draw_text(jobrunX+(bar_width-offset)/2,jobrunY+(bar_height)/2,String)
		break
	#endregion
	#region Contracts
		case kiosk:
			//	Draw Contract Info
			//	level
			draw_set_color(c_black)
			draw_set_halign(fa_right)
			draw_set_font(fnt_shop_menu_name)
			draw_text(nameX+name_width-p_offset,nameY+name_height/2,"2")

			//	profit
			draw_set_color(c_white)
			var profitX = nameX
			var profitY = nameY+name_height+p_offset
			draw_roundrect_ext(profitX,profitY,profitX+name_width,profitY+48,25,25,false)

			draw_set_color(c_black)
			draw_set_halign(fa_center)
			var String = "12"
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
			var String = "250"
			draw_text(valueX+name_width/2,valueY+24,String)
			draw_sprite(s_resource_value_shop,0,valueX+name_width/2+48,valueY+24)

			//	reliability
			var relyX = valueX
			var relyY = valueY+48+p_offset
			draw_set_color(c_white)
			draw_roundrect_ext(relyX,relyY,relyX+name_width,relyY+48,25,25,false)
			var reliability = .80
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
			var data_width = 192
			var data_height = 40
			var dataX = nameX+name_width+p_offset+(data_width/2)
			var dataY = nameY+name_height/2
			var String = "Data Required"
			draw_text(dataX,dataY,String)

			//	data required
			var xx = nameX+name_width+p_offset
			var yy = nameY+name_height
			var data_needed = contracts.contract[1,contract_data]
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
				draw_text(xx+name_width/2,yy+name_height/2,String)	
				yy += 48
	
			}
		break
	#endregion
	#region Data
		case data:
		
		break
	#endregion
}


//draw_set_color(c_white)
//var xx = nameX+name_width+p_offset
//var yy = nameY+name_height
//draw_roundrect_ext(xx,yy,xx+data_width,yy+data_height,20,20,false)
//draw_set_color(c_black)
//draw_text(xx+name_width/2,yy+name_height/2,"Email API")