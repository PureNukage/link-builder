var xx = contracts.buttonX - (contracts.button_width + 16)
var yy = contracts.buttonY

if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx-4,yy-4,xx+sprite_get_width(s_alarm)+4,yy+sprite_get_height(s_alarm)+4) {
	messages_mouseover = true
	draw_set_color(c_gray)
	if input.mouse_left_press {
		messages_open = !messages_open	
		
		if messages_open {
			if contracts.button_open {
				contracts.button_open = false	
			}
		}
	}
} else {
	messages_mouseover = false
	draw_set_color(c_dkgray)
}
draw_roundrect(xx-4,yy-4,xx+sprite_get_width(s_alarm)+4,yy+sprite_get_height(s_alarm)+4,false)

draw_sprite(s_alarm,0,xx,yy)

var window_width = 440
var window_height = (ds_list_size(previous_messages) * 90)
window_height = clamp(window_height,0,380)

if messages_open {
	
	var width = 400
	var height = 64
	var _xx = xx+sprite_get_width(s_alarm) - width
	var _yy = yy+sprite_get_height(s_alarm)+8
	
	//	Draw window background
	draw_set_color(c_gray4)
	draw_roundrect(_xx-20,_yy-10,_xx+window_width,_yy+window_height,false)
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx-20,_yy-10,_xx+window_width,_yy+window_height) {
		messages_mouseover = true
		if input.scroll_up or input.scroll_down {
			message_index -= input.scroll_up - input.scroll_down
			var amount_of_items = ds_list_size(previous_messages)
			amount_of_items = clamp(amount_of_items,0,message_clamp)
			message_index = clamp(message_index,0,floor(bar_height/round(bar_height / ds_list_size(previous_messages))-1))	
		}
	}
	else messages_mouseover = false
	
	for(var m=0;m<ds_list_size(previous_messages);m++) {
		if m > message_index-1 and m < message_index + message_clamp {
			height = 64
			var messageID = previous_messages[| m]
			var message_string = messageID.text
			
			if string_height_ext(message_string,string_height(message_string),width-20) > 39 {
				height += (string_height_ext(message_string,string_height(message_string),width-20) - 39)
			}
		
			draw_set_color(c_dkgray)
			draw_roundrect(_xx-8,_yy-8,_xx+width-8,_yy+height-8,false)
		
			draw_set_color(c_white)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			draw_text_ext(_xx+2,_yy+2,message_string,string_height(message_string),width-20)
		
			_yy += height + 8
		}
		
	}	
	
	//	Draw scrollbar
	barX = _xx+window_width
	barY = yy+sprite_get_height(s_alarm)+6
	bar_height = window_height
	var amount_of_items = ds_list_size(previous_messages)
	amount_of_items = clamp(amount_of_items,0,message_clamp)
	handleX = _xx+window_width-bar_width+(bar_width/2)
	handle_height = round(bar_height / ds_list_size(previous_messages))
	handleY = barY + (message_index * handle_height)
	
	draw_set_color(c_gray)
	draw_roundrect(handleX-6,handleY,handleX+handle_width-6,handleY+handle_height,false)
	
}